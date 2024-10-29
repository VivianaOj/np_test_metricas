using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nop.Core;
using Nop.Core.Domain.Common;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Localization;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Core.Domain.Shipping;
using Nop.Core.Http.Extensions;
using Nop.Services.Common;
using Nop.Services.Configuration;
using Nop.Services.Customers;
using Nop.Services.Directory;
using Nop.Services.Localization;
using Nop.Services.Logging;
using Nop.Services.Messages;
using Nop.Services.Orders;
using Nop.Services.Payments;
using Nop.Services.Shipping;
using Nop.Web.Extensions;
using Nop.Web.Factories;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Mvc.Filters;
using Nop.Web.Framework.Security;
using Nop.Web.Models.Checkout;
using System;
using System.Collections.Generic;
using System.Linq;
using Nop.Services.Catalog;
using Newtonsoft.Json;
using Address = Nop.Core.Domain.Common.Address;
using Nop.Services.Invoices;
using Nop.Core.Domain.Invoices;
using Nop.Services.NN;
using Nop.Core.Domain.NN;

namespace Nop.Web.Controllers
{
    [HttpsRequirement(SslRequirement.Yes)]
    public partial class CheckoutController : BasePublicController
    {
        #region Fields

        private readonly AddressSettings _addressSettings;
        private readonly CustomerSettings _customerSettings;
        private readonly IAddressAttributeParser _addressAttributeParser;
        private readonly IAddressService _addressService;
        private readonly ICheckoutModelFactory _checkoutModelFactory;
        private readonly ICountryService _countryService;
        private readonly ICustomerService _customerService;
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly ILocalizationService _localizationService;
        private readonly ILogger _logger;
        private readonly IOrderProcessingService _orderProcessingService;
        private readonly IOrderService _orderService;
        private readonly IPaymentPluginManager _paymentPluginManager;
        private readonly IPaymentService _paymentService;
        private readonly IShippingService _shippingService;
        private readonly IShoppingCartService _shoppingCartService;
        private readonly IStateProvinceService _stateProvinceService;
        private readonly IStoreContext _storeContext;
        private readonly IWebHelper _webHelper;
        private readonly IWorkContext _workContext;
        private readonly ISettingService _settingService;
        private readonly IDeliveryRoutesService _deliveryRoutesService;
        private readonly ICompanyService _companyService;
        private readonly OrderSettings _orderSettings;
        private readonly PaymentSettings _paymentSettings;
        private readonly RewardPointsSettings _rewardPointsSettings;
        private readonly ShippingSettings _shippingSettings;
        private readonly IWorkflowMessageService _workflowMessageService;
        private readonly LocalizationSettings _localizationSettings;
        private readonly CommonSettings _commonSettings;
        private readonly IZipCodeService _zipCodeService;
        private readonly ICustomerAuthorizeNetService _customerAuthorizeNetService;
        private readonly IProductAttributeFormatter _productAttributeFormatter;
        private readonly IInvoiceService _invoiceService;
        private readonly IFreigthQuoteService _freigthQuoteService;
        private readonly ICustomerRegistrationService _customerRegistrationService;
        private readonly ICompanyService _companyServices;

        private IPendingDataToSyncService _pendingDataToSyncService;
        #endregion

        #region Ctor

        public CheckoutController(AddressSettings addressSettings,
            IProductAttributeFormatter productAttributeFormatter,
            CustomerSettings customerSettings,
            IAddressAttributeParser addressAttributeParser,
            IAddressService addressService,
            ICheckoutModelFactory checkoutModelFactory,
            ICountryService countryService,
            ICustomerService customerService,
            IGenericAttributeService genericAttributeService,
            ILocalizationService localizationService,
            ILogger logger,
            IOrderProcessingService orderProcessingService,
            IOrderService orderService,
            IPaymentPluginManager paymentPluginManager,
            IPaymentService paymentService,
            IShippingService shippingService,
            IShoppingCartService shoppingCartService,
            IStateProvinceService stateProvinceService,
            IStoreContext storeContext,
            IWebHelper webHelper,
            IWorkContext workContext,
            ISettingService settingService,
            IWorkflowMessageService workflowMessageService,
            IDeliveryRoutesService deliveryRoutesService,
            ICompanyService companyService,
            IZipCodeService zipCodeService,
             OrderSettings orderSettings,
            PaymentSettings paymentSettings,
            RewardPointsSettings rewardPointsSettings,
            LocalizationSettings localizationSettings,
            ShippingSettings shippingSettings,
            CommonSettings commonSettings, ICustomerAuthorizeNetService customerAuthorizeNetService, IInvoiceService invoiceService, IFreigthQuoteService freigthQuoteService,
            ICustomerRegistrationService customerRegistrationService, IPendingDataToSyncService pendingDataToSyncService, ICompanyService companyServices)
        {
            _addressSettings = addressSettings;
            _productAttributeFormatter = productAttributeFormatter;
            _customerSettings = customerSettings;
            _addressAttributeParser = addressAttributeParser;
            _addressService = addressService;
            _checkoutModelFactory = checkoutModelFactory;
            _countryService = countryService;
            _customerService = customerService;
            _genericAttributeService = genericAttributeService;
            _localizationService = localizationService;
            _logger = logger;
            _orderProcessingService = orderProcessingService;
            _orderService = orderService;
            _paymentPluginManager = paymentPluginManager;
            _paymentService = paymentService;
            _shippingService = shippingService;
            _shoppingCartService = shoppingCartService;
            _stateProvinceService = stateProvinceService;
            _storeContext = storeContext;
            _webHelper = webHelper;
            _workContext = workContext;
            _orderSettings = orderSettings;
            _paymentSettings = paymentSettings;
            _rewardPointsSettings = rewardPointsSettings;
            _shippingSettings = shippingSettings;
            _settingService = settingService;
            _workflowMessageService = workflowMessageService;
            _localizationSettings = localizationSettings;
            _deliveryRoutesService = deliveryRoutesService;
            _companyService = companyService;
            _zipCodeService = zipCodeService;
            _commonSettings = commonSettings;
            _customerAuthorizeNetService = customerAuthorizeNetService;
            _invoiceService = invoiceService;
            _freigthQuoteService = freigthQuoteService;
            _customerRegistrationService = customerRegistrationService;
            _pendingDataToSyncService = pendingDataToSyncService;
            _companyServices = companyServices;
        }

        #endregion

        #region Utilities

        protected virtual bool IsMinimumOrderPlacementIntervalValid(Customer customer)
        {
            //prevent 2 orders being placed within an X seconds time frame
            if (_orderSettings.MinimumOrderPlacementInterval == 0)
                return true;

            var lastOrder = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id,
                customerId: _workContext.CurrentCustomer.Id, pageSize: 1)
                .FirstOrDefault();
            if (lastOrder == null)
                return true;

            var interval = DateTime.UtcNow - lastOrder.CreatedOnUtc;
            return interval.TotalSeconds > _orderSettings.MinimumOrderPlacementInterval;
        }

        /// <summary>
        /// Generate an order GUID
        /// </summary>
        /// <param name="processPaymentRequest">Process payment request</param>
        protected virtual void GenerateOrderGuid(ProcessPaymentRequest processPaymentRequest)
        {
            if (processPaymentRequest == null)
                return;

            //we should use the same GUID for multiple payment attempts
            //this way a payment gateway can prevent security issues such as credit card brute-force attacks
            //in order to avoid any possible limitations by payment gateway we reset GUID periodically
            var previousPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");
            if (_paymentSettings.RegenerateOrderGuidInterval > 0 &&
                previousPaymentRequest != null &&
                previousPaymentRequest.OrderGuidGeneratedOnUtc.HasValue)
            {
                var interval = DateTime.UtcNow - previousPaymentRequest.OrderGuidGeneratedOnUtc.Value;
                if (interval.TotalSeconds < _paymentSettings.RegenerateOrderGuidInterval)
                {
                    processPaymentRequest.OrderGuid = previousPaymentRequest.OrderGuid;
                    processPaymentRequest.OrderGuidGeneratedOnUtc = previousPaymentRequest.OrderGuidGeneratedOnUtc;
                }
            }

            if (processPaymentRequest.OrderGuid == Guid.Empty)
            {
                processPaymentRequest.OrderGuid = Guid.NewGuid();
                processPaymentRequest.OrderGuidGeneratedOnUtc = DateTime.UtcNow;
            }
        }

        #endregion

        #region Methods (common)

        public virtual IActionResult Index()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            var downloadableProductsRequireRegistration =
                _customerSettings.RequireRegistrationForDownloadableProducts && cart.Any(sci => sci.Product.IsDownload);

            if (_workContext.CurrentCustomer.IsGuest() && (!_orderSettings.AnonymousCheckoutAllowed || downloadableProductsRequireRegistration))
                return Challenge();

            //if we have only "button" payment methods available (displayed onthe shopping cart page, not during checkout),
            //then we should allow standard checkout
            //all payment methods (do not filter by country here as it could be not specified yet)
            var paymentMethods = _paymentPluginManager
                .LoadActivePlugins(_workContext.CurrentCustomer, _storeContext.CurrentStore.Id)
                .Where(pm => !pm.HidePaymentMethod(cart)).ToList();

            //payment methods displayed during checkout (not with "Button" type)
            var nonButtonPaymentMethods = paymentMethods
                .Where(pm => pm.PaymentMethodType != PaymentMethodType.Button)
                .ToList();

            //"button" payment methods(*displayed on the shopping cart page)
            var buttonPaymentMethods = paymentMethods
                .Where(pm => pm.PaymentMethodType == PaymentMethodType.Button)
                .ToList();

            if (!nonButtonPaymentMethods.Any() && buttonPaymentMethods.Any())
                return RedirectToRoute("ShoppingCart");

            //reset checkout data
            _customerService.ResetCheckoutData(_workContext.CurrentCustomer, _storeContext.CurrentStore.Id);

            //validation (cart)
            var checkoutAttributesXml = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                NopCustomerDefaults.CheckoutAttributes, _storeContext.CurrentStore.Id);

            var scWarnings = _shoppingCartService.GetShoppingCartWarnings(cart, checkoutAttributesXml, true);
            if (scWarnings.Any())
                return RedirectToRoute("ShoppingCart");

            //validation (each shopping cart item)
            foreach (var sci in cart)
            {
                var sciWarnings = _shoppingCartService.GetShoppingCartItemWarnings(_workContext.CurrentCustomer,
                    sci.ShoppingCartType,
                    sci.Product,
                    sci.StoreId,
                    sci.AttributesXml,
                    sci.CustomerEnteredPrice,
                    sci.RentalStartDateUtc,
                    sci.RentalEndDateUtc,
                    sci.Quantity,
                    false,
                    sci.Id);
                if (sciWarnings.Any())
                    return RedirectToRoute("ShoppingCart");
            }

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            return RedirectToRoute("CheckoutBillingAddress");
        }

        public virtual IActionResult Completed(int? orderId)
        {
            //validation
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            Order order = null;
            if (orderId.HasValue)
            {
                //load order by identifier (if provided)
                order = _orderService.GetOrderById(orderId.Value);
            }

            if (order == null)
            {
                order = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id,
                customerId: _workContext.CurrentCustomer.Id, pageSize: 1)
                    .FirstOrDefault();
            }

            if (order == null || order.Deleted || (_workContext.CurrentCustomer.Id != order.CustomerId && (_workContext.WorkingCompany == null || _workContext.WorkingCompany.Id != order.CompanyId)))
            {
                return RedirectToRoute("Homepage");
            }

            //disable "order completed" page?
            if (_orderSettings.DisableOrderCompletedPage)
            {
                return RedirectToRoute("OrderDetails", new { orderId = order.Id });
            }

            //model
            var model = _checkoutModelFactory.PrepareCheckoutCompletedModel(order);
            return View(model);
        }

        #endregion

        #region Methods (multistep checkout)

        public virtual IActionResult BillingAddress(IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //model
            var model = _checkoutModelFactory.PrepareBillingAddressModel(cart, prePopulateNewAddressWithCustomerFields: true);

            //check whether "billing address" step is enabled
            if (_orderSettings.DisableBillingAddressCheckoutStep && model.ExistingAddresses.Any())
            {
                if (model.ExistingAddresses.Any())
                {
                    //choose the first one
                    return SelectBillingAddress(model.ExistingAddresses.First().Id);
                }

                TryValidateModel(model);
                TryValidateModel(model.BillingNewAddress);
                return NewBillingAddress(model, form);
            }

            return View(model);
        }

        public virtual IActionResult SelectBillingAddress(int addressId, bool shipToSameAddress = false)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == addressId);
            if (address == null)
                return RedirectToRoute("CheckoutBillingAddress");

            _workContext.CurrentCustomer.BillingAddress = address;
            _customerService.UpdateCustomer(_workContext.CurrentCustomer);

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            //ship to the same address?
            //by default Shipping is available if the country is not specified
            var shippingAllowed = _addressSettings.CountryEnabled ? address.Country?.AllowsShipping ?? false : true;
            if (_shippingSettings.ShipToSameAddress && shipToSameAddress && _shoppingCartService.ShoppingCartRequiresShipping(cart) && shippingAllowed)
            {
                _workContext.CurrentCustomer.ShippingAddress = _workContext.CurrentCustomer.BillingAddress;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                //reset selected shipping method (in case if "pick up in store" was selected)
                _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
                _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);
                //limitation - "Ship to the same address" doesn't properly work in "pick up in store only" case (when no shipping plugins are available) 
                return RedirectToRoute("CheckoutShippingMethod");
            }

            return RedirectToRoute("CheckoutShippingAddress");
        }

        [HttpPost, ActionName("BillingAddress")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult NewBillingAddress(CheckoutBillingAddressModel model, IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //custom address attributes
            var customAttributes = _addressAttributeParser.ParseCustomAddressAttributes(form);
            var customAttributeWarnings = _addressAttributeParser.GetAttributeWarnings(customAttributes);
            foreach (var error in customAttributeWarnings)
            {
                ModelState.AddModelError("", error);
            }

            var newAddress = model.BillingNewAddress;

            if (ModelState.IsValid)
            {
                //try to find an address with the same values (don't duplicate records)
                var address = _addressService.FindAddress(_workContext.CurrentCustomer.Addresses.ToList(),
                    newAddress.FirstName, newAddress.LastName, newAddress.PhoneNumber,
                    newAddress.Email, newAddress.FaxNumber, newAddress.Company,
                    newAddress.Address1, newAddress.Address2, newAddress.City,
                    newAddress.County, newAddress.StateProvinceId, newAddress.ZipPostalCode,
                    newAddress.CountryId, customAttributes);
                if (address == null)
                {
                    //address is not found. let's create a new one
                    address = newAddress.ToEntity();
                    address.CustomAttributes = customAttributes;
                    address.CreatedOnUtc = DateTime.UtcNow;
                    //some validation
                    if (address.CountryId == 0)
                        address.CountryId = null;
                    if (address.StateProvinceId == 0)
                        address.StateProvinceId = null;
                    //_workContext.CurrentCustomer.Addresses.Add(address);
                    _workContext.CurrentCustomer.CustomerAddressMappings.Add(new CustomerAddressMapping { Address = address });
                }

                _workContext.CurrentCustomer.BillingAddress = address;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                //ship to the same address?
                if (_shippingSettings.ShipToSameAddress && model.ShipToSameAddress && _shoppingCartService.ShoppingCartRequiresShipping(cart))
                {
                    _workContext.CurrentCustomer.ShippingAddress = _workContext.CurrentCustomer.BillingAddress;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                    //reset selected shipping method (in case if "pick up in store" was selected)
                    _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
                    _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);
                    //limitation - "Ship to the same address" doesn't properly work in "pick up in store only" case (when no shipping plugins are available) 
                    return RedirectToRoute("CheckoutShippingMethod");
                }

                return RedirectToRoute("CheckoutShippingAddress");
            }

            //If we got this far, something failed, redisplay form
            model = _checkoutModelFactory.PrepareBillingAddressModel(cart,
                selectedCountryId: newAddress.CountryId,
                overrideAttributesXml: customAttributes);
            return View(model);
        }

        public virtual IActionResult ShippingAddress()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
            {
                _workContext.CurrentCustomer.ShippingAddress = null;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                return RedirectToRoute("CheckoutShippingMethod");
            }

            //model
            var model = _checkoutModelFactory.PrepareShippingAddressModel(prePopulateNewAddressWithCustomerFields: true);

            return View(model);
        }

        public virtual IActionResult SelectShippingAddress(int addressId)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == addressId);
            if (address == null)
                return RedirectToRoute("CheckoutShippingAddress");

            _workContext.CurrentCustomer.ShippingAddress = address;
            _customerService.UpdateCustomer(_workContext.CurrentCustomer);

            if (_shippingSettings.AllowPickupInStore)
            {
                //set value indicating that "pick up in store" option has not been chosen
                _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);
            }

            return RedirectToRoute("CheckoutShippingMethod");
        }

        [HttpPost, ActionName("ShippingAddress")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult NewShippingAddress(CheckoutShippingAddressModel model, IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
            {
                _workContext.CurrentCustomer.ShippingAddress = null;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                return RedirectToRoute("CheckoutShippingMethod");
            }

            //pickup point
            if (_shippingSettings.AllowPickupInStore)
            {
                if (model.PickupInStore)
                {
                    //no shipping address selected
                    _workContext.CurrentCustomer.ShippingAddress = null;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                    var pickupPoint = form["pickup-points-id"].ToString().Split(new[] { "___" }, StringSplitOptions.None);
                    var pickupPoints = _shippingService.GetPickupPoints(_workContext.CurrentCustomer.BillingAddress,
                        _workContext.CurrentCustomer, pickupPoint[1], _storeContext.CurrentStore.Id).PickupPoints.ToList();
                    var selectedPoint = pickupPoints.FirstOrDefault(x => x.Id.Equals(pickupPoint[0]));
                    if (selectedPoint == null)
                        return RedirectToRoute("CheckoutShippingAddress");

                    var pickUpInStoreShippingOption = new ShippingOption
                    {
                        Name = string.Format(_localizationService.GetResource("Checkout.PickupPoints.Name"), selectedPoint.Name),
                        Rate = selectedPoint.PickupFee,
                        Description = selectedPoint.Description,
                        ShippingRateComputationMethodSystemName = selectedPoint.ProviderSystemName
                    };

                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, pickUpInStoreShippingOption, _storeContext.CurrentStore.Id);
                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, selectedPoint, _storeContext.CurrentStore.Id);

                    return RedirectToRoute("CheckoutPaymentMethod");
                }

                //set value indicating that "pick up in store" option has not been chosen
                _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);
            }

            //custom address attributes
            var customAttributes = _addressAttributeParser.ParseCustomAddressAttributes(form);
            var customAttributeWarnings = _addressAttributeParser.GetAttributeWarnings(customAttributes);
            foreach (var error in customAttributeWarnings)
            {
                ModelState.AddModelError("", error);
            }

            var newAddress = model.ShippingNewAddress;

            if (ModelState.IsValid)
            {
                //try to find an address with the same values (don't duplicate records)
                var address = _addressService.FindAddress(_workContext.CurrentCustomer.Addresses.ToList(),
                    newAddress.FirstName, newAddress.LastName, newAddress.PhoneNumber,
                    newAddress.Email, newAddress.FaxNumber, newAddress.Company,
                    newAddress.Address1, newAddress.Address2, newAddress.City,
                    newAddress.County, newAddress.StateProvinceId, newAddress.ZipPostalCode,
                    newAddress.CountryId, customAttributes);
                if (address == null)
                {
                    address = newAddress.ToEntity();
                    address.CustomAttributes = customAttributes;
                    address.CreatedOnUtc = DateTime.UtcNow;
                    //some validation
                    if (address.CountryId == 0)
                        address.CountryId = null;
                    if (address.StateProvinceId == 0)
                        address.StateProvinceId = null;
                    //_workContext.CurrentCustomer.Addresses.Add(address);
                    _workContext.CurrentCustomer.CustomerAddressMappings.Add(new CustomerAddressMapping { Address = address });
                }
                _workContext.CurrentCustomer.ShippingAddress = address;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                return RedirectToRoute("CheckoutShippingMethod");
            }

            //If we got this far, something failed, redisplay form
            model = _checkoutModelFactory.PrepareShippingAddressModel(
                selectedCountryId: newAddress.CountryId,
                overrideAttributesXml: customAttributes);


            return View(model);
        }

        public virtual IActionResult ShippingMethod()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
            {
                _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
                return RedirectToRoute("CheckoutPaymentMethod");
            }

            //model
            var model = _checkoutModelFactory.PrepareShippingMethodModel(cart, _workContext.CurrentCustomer.ShippingAddress);

            if (_shippingSettings.BypassShippingMethodSelectionIfOnlyOne &&
                model.ShippingMethods.Count == 1)
            {
                //if we have only one shipping method, then a customer doesn't have to choose a shipping method
                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedShippingOptionAttribute,
                    model.ShippingMethods.First().ShippingOption,
                    _storeContext.CurrentStore.Id);

                return RedirectToRoute("CheckoutPaymentMethod");
            }

            return View(model);
        }

        [HttpPost, ActionName("ShippingMethod")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult SelectShippingMethod(string shippingoption)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
            {
                _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
                return RedirectToRoute("CheckoutPaymentMethod");
            }

            //parse selected method 
            if (string.IsNullOrEmpty(shippingoption))
                return ShippingMethod();
            var splittedOption = shippingoption.Split(new[] { "___" }, StringSplitOptions.RemoveEmptyEntries);
            if (splittedOption.Length != 2)
                return ShippingMethod();
            var selectedName = splittedOption[0];
            var shippingRateComputationMethodSystemName = splittedOption[1];

            //find it
            //performance optimization. try cache first
            var shippingOptions = _genericAttributeService.GetAttribute<List<ShippingOption>>(_workContext.CurrentCustomer,
                NopCustomerDefaults.OfferedShippingOptionsAttribute, _storeContext.CurrentStore.Id);
            if (shippingOptions == null || !shippingOptions.Any())
            {
                //not found? let's load them using shipping service
                shippingOptions = _shippingService.GetShippingOptions(cart, _workContext.CurrentCustomer.ShippingAddress,
                    _workContext.CurrentCustomer, shippingRateComputationMethodSystemName, _storeContext.CurrentStore.Id).ShippingOptions.ToList();
            }
            else
            {
                //loaded cached results. let's filter result by a chosen shipping rate computation method
                shippingOptions = shippingOptions.Where(so => so.ShippingRateComputationMethodSystemName.Equals(shippingRateComputationMethodSystemName, StringComparison.InvariantCultureIgnoreCase))
                    .ToList();
            }

            var shippingOption = shippingOptions
                .Find(so => !string.IsNullOrEmpty(so.Name) && so.Name.Equals(selectedName, StringComparison.InvariantCultureIgnoreCase));
            if (shippingOption == null)
                return ShippingMethod();

            //save
            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, shippingOption, _storeContext.CurrentStore.Id);

            return RedirectToRoute("CheckoutPaymentMethod");
        }

        public virtual IActionResult PaymentMethod()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //Check whether payment workflow is required
            //we ignore reward points during cart total calculation
            var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart, false);
            if (!isPaymentWorkflowRequired)
            {
                _genericAttributeService.SaveAttribute<string>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute, null, _storeContext.CurrentStore.Id);
                return RedirectToRoute("CheckoutPaymentInfo");
            }

            //filter by country
            var filterByCountryId = 0;
            if (_addressSettings.CountryEnabled &&
                _workContext.CurrentCustomer.BillingAddress != null &&
                _workContext.CurrentCustomer.BillingAddress.Country != null)
            {
                filterByCountryId = _workContext.CurrentCustomer.BillingAddress.Country.Id;
            }

            //model
            var paymentMethodModel = _checkoutModelFactory.PreparePaymentMethodModel(cart, filterByCountryId);

            if (_paymentSettings.BypassPaymentMethodSelectionIfOnlyOne &&
                paymentMethodModel.PaymentMethods.Count == 1 && !paymentMethodModel.DisplayRewardPoints)
            {
                //if we have only one payment method and reward points are disabled or the current customer doesn't have any reward points
                //so customer doesn't have to choose a payment method

                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute,
                    paymentMethodModel.PaymentMethods[0].PaymentMethodSystemName,
                    _storeContext.CurrentStore.Id);
                return RedirectToRoute("CheckoutPaymentInfo");
            }

            return View(paymentMethodModel);
        }

        [HttpPost, ActionName("PaymentMethod")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult SelectPaymentMethod(string paymentmethod, CheckoutPaymentMethodModel model)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //reward points
            if (_rewardPointsSettings.Enabled)
            {
                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                    NopCustomerDefaults.UseRewardPointsDuringCheckoutAttribute, model.UseRewardPoints,
                    _storeContext.CurrentStore.Id);
            }

            //Check whether payment workflow is required
            var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart);
            if (!isPaymentWorkflowRequired)
            {
                _genericAttributeService.SaveAttribute<string>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute, null, _storeContext.CurrentStore.Id);
                return RedirectToRoute("CheckoutPaymentInfo");
            }
            //payment method 
            if (string.IsNullOrEmpty(paymentmethod))
                return PaymentMethod();

            if (!_paymentPluginManager.IsPluginActive(paymentmethod, _workContext.CurrentCustomer, _storeContext.CurrentStore.Id))
                return PaymentMethod();

            //save
            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, paymentmethod, _storeContext.CurrentStore.Id);

            return RedirectToRoute("CheckoutPaymentInfo");
        }

        public virtual IActionResult PaymentInfo()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //Check whether payment workflow is required
            var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart);
            if (!isPaymentWorkflowRequired)
            {
                return RedirectToRoute("CheckoutConfirm");
            }

            //load payment method
            var paymentMethodSystemName = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return RedirectToRoute("CheckoutPaymentMethod");

            //Check whether payment info should be skipped
            if (paymentMethod.SkipPaymentInfo ||
                (paymentMethod.PaymentMethodType == PaymentMethodType.Redirection && _paymentSettings.SkipPaymentInfoStepForRedirectionPaymentMethods))
            {
                //skip payment info page
                var paymentInfo = new ProcessPaymentRequest();

                //session save
                HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);

                return RedirectToRoute("CheckoutConfirm");
            }

            //model
            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            return View(model);
        }

        [HttpPost, ActionName("PaymentInfo")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult EnterPaymentInfo(IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //Check whether payment workflow is required
            var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart);
            if (!isPaymentWorkflowRequired)
            {
                return RedirectToRoute("CheckoutConfirm");
            }

            //load payment method
            var paymentMethodSystemName = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return RedirectToRoute("CheckoutPaymentMethod");

            var warnings = paymentMethod.ValidatePaymentForm(form);
            foreach (var warning in warnings)
                ModelState.AddModelError("", warning);
            if (ModelState.IsValid)
            {
                //get payment info
                var paymentInfo = paymentMethod.GetPaymentInfo(form);
                //set previous order GUID (if exists)
                GenerateOrderGuid(paymentInfo);

                //session save
                HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);
                return RedirectToRoute("CheckoutConfirm");
            }

            //If we got this far, something failed, redisplay form
            //model
            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            return View(model);
        }

        public virtual IActionResult Confirm()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //model
            var model = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
            return View(model);
        }

        [HttpPost, ActionName("Confirm")]
        public virtual IActionResult ConfirmOrder()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("CheckoutOnePage");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //model
            var model = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
            try
            {
                //prevent 2 orders being placed within an X seconds time frame
                if (!IsMinimumOrderPlacementIntervalValid(_workContext.CurrentCustomer))
                    throw new Exception(_localizationService.GetResource("Checkout.MinOrderPlacementInterval"));

                //place order
                var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");
                if (processPaymentRequest == null)
                {
                    //Check whether payment workflow is required
                    if (_orderProcessingService.IsPaymentWorkflowRequired(cart))
                        return RedirectToRoute("CheckoutPaymentInfo");

                    processPaymentRequest = new ProcessPaymentRequest();
                }
                GenerateOrderGuid(processPaymentRequest);
                processPaymentRequest.StoreId = _storeContext.CurrentStore.Id;
                processPaymentRequest.CustomerId = _workContext.CurrentCustomer.Id;
                processPaymentRequest.PaymentMethodSystemName = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
                HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", processPaymentRequest);
                var placeOrderResult = _orderProcessingService.PlaceOrder(processPaymentRequest);
                if (placeOrderResult.Success)
                {
                    HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", null);
                    var postProcessPaymentRequest = new PostProcessPaymentRequest
                    {
                        Order = placeOrderResult.PlacedOrder
                    };
                    _paymentService.PostProcessPayment(postProcessPaymentRequest);


                   

                    if (_webHelper.IsRequestBeingRedirected || _webHelper.IsPostBeingDone)
                    {
                        //redirection or POST has been done in PostProcessPayment
                        return Content("Redirected");
                    }

                    return RedirectToRoute("CheckoutCompleted", new { orderId = placeOrderResult.PlacedOrder.Id });
                }

                foreach (var error in placeOrderResult.Errors)
                    model.Warnings.Add(error);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc);
                model.Warnings.Add(exc.Message);
            }

            //If we got this far, something failed, redisplay form
            return View(model);
        }

        #endregion

        #region Methods (one page checkout)

        protected virtual JsonResult OpcLoadStepAfterShippingAddress(IList<ShoppingCartItem> cart)
        {
            int lenAddress = 0;
            var shippingMethodModel = _checkoutModelFactory.PrepareShippingMethodModel(cart, _workContext.CurrentCustomer.ShippingAddress);
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                    lenAddress = _workContext.WorkingCompany.Addresses.Where(r=>r.Active==false).Count();
            }
            else
                lenAddress = _workContext.CurrentCustomer.Addresses.Count();

            if (_shippingSettings.BypassShippingMethodSelectionIfOnlyOne &&
                shippingMethodModel.ShippingMethods.Count == 1)
            {
                //if we have only one shipping method, then a customer doesn't have to choose a shipping method
                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedShippingOptionAttribute,
                    shippingMethodModel.ShippingMethods.First().ShippingOption,
                    _storeContext.CurrentStore.Id);

                //load next step
                return OpcLoadStepAfterShippingMethod(cart);
            }

            return Json(new
            {
                len_address = lenAddress,
                update_section = new UpdateSectionJsonModel
                {
                    name = "shipping-method",
                    html = RenderPartialViewToString("OpcShippingMethods", shippingMethodModel) //aqui bugs 1 alejo
                },
                goto_section = "shipping_method"
            });
        }

        protected virtual JsonResult OpcLoadStepAfterShippingMethod(IList<ShoppingCartItem> cart)
        {
            //Check whether payment workflow is required
            //we ignore reward points during cart total calculation
            var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart, false);
            if (isPaymentWorkflowRequired)
            {
                //filter by country
                var filterByCountryId = 0;
                if (_addressSettings.CountryEnabled &&
                    _workContext.CurrentCustomer.BillingAddress != null &&
                    _workContext.CurrentCustomer.BillingAddress.Country != null)
                {
                    filterByCountryId = _workContext.CurrentCustomer.BillingAddress.Country.Id;
                }

                //payment is required
                var paymentMethodModel = _checkoutModelFactory.PreparePaymentMethodModel(cart, filterByCountryId);

                if (_workContext.CurrentCustomer.IsGuest())
                    paymentMethodModel.IsGuest = true;

                if (_workContext.CurrentCustomer.Parent == 0)
                    paymentMethodModel.WebAccount = true;
                else
                {
                    if (_workContext.CurrentCustomer.Companies.Any())
                    {
                        if (_workContext.WorkingCompany != null)
                        {
                            if (string.IsNullOrEmpty(_workContext.WorkingCompany.Terms) || _workContext.WorkingCompany.BillingTerms == "Due on receipt" || Convert.ToInt32(_workContext.WorkingCompany.BillingTerms) == 4)
                                paymentMethodModel.ShowPayLater = false;
                            else
                                paymentMethodModel.ShowPayLater = true;

                        }
                    }
                }

                if (_paymentSettings.BypassPaymentMethodSelectionIfOnlyOne &&
                    paymentMethodModel.PaymentMethods.Count == 1 && !paymentMethodModel.DisplayRewardPoints)
                {
                    //if we have only one payment method and reward points are disabled or the current customer doesn't have any reward points
                    //so customer doesn't have to choose a payment method

                    var selectedPaymentMethodSystemName = paymentMethodModel.PaymentMethods[0].PaymentMethodSystemName;
                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                        NopCustomerDefaults.SelectedPaymentMethodAttribute,
                        selectedPaymentMethodSystemName, _storeContext.CurrentStore.Id);

                    var paymentMethodInst = _paymentPluginManager
                        .LoadPluginBySystemName(selectedPaymentMethodSystemName, _workContext.CurrentCustomer, _storeContext.CurrentStore.Id);
                    if (!_paymentPluginManager.IsPluginActive(paymentMethodInst))
                        throw new Exception("Selected payment method can't be parsed");

                    return OpcLoadStepAfterPaymentMethod(paymentMethodInst, cart);
                }

                //customer have to choose a payment method
                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "payment-method",
                        html = RenderPartialViewToString("OpcPaymentMethods", paymentMethodModel)
                    },
                    goto_section = "payment_method"
                });
            }

            //payment is not required
            _genericAttributeService.SaveAttribute<string>(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, null, _storeContext.CurrentStore.Id);

            var confirmOrderModel = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
            return Json(new
            {
                update_section = new UpdateSectionJsonModel
                {
                    name = "confirm-order",
                    html = RenderPartialViewToString("OpcConfirmOrder", confirmOrderModel)
                },
                goto_section = "confirm_order"
            });
        }

        protected virtual JsonResult OpcLoadStepAfterPaymentMethod(IPaymentMethod paymentMethod, IList<ShoppingCartItem> cart)
        {
            if (paymentMethod.SkipPaymentInfo ||
                (paymentMethod.PaymentMethodType == PaymentMethodType.Redirection && _paymentSettings.SkipPaymentInfoStepForRedirectionPaymentMethods))
            {
                //skip payment info page
                var paymentInfo = new ProcessPaymentRequest();

                //session save
                HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);

                var confirmOrderModel = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "confirm-order",
                        html = RenderPartialViewToString("OpcConfirmOrder", confirmOrderModel)
                    },
                    goto_section = "confirm_order"
                });
            }

            //return payment info page
            var paymenInfoModel = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            paymenInfoModel.IsGuest = _workContext.CurrentCustomer.IsGuest();
            if (!paymenInfoModel.IsGuest)
            {
                GetCreditCardSaved(paymenInfoModel);

            }

            return Json(new
            {
                update_section = new UpdateSectionJsonModel
                {
                    name = "payment-info",
                    html = RenderPartialViewToString("OpcPaymentInfo", paymenInfoModel)
                },
                goto_section = "payment_info"
            });
        }

        public virtual IActionResult OnePageCheckout()
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

            if (!cart.Any())
                return RedirectToRoute("ShoppingCart");

            if (!_orderSettings.OnePageCheckoutEnabled)
                return RedirectToRoute("Checkout");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            var model = _checkoutModelFactory.PrepareOnePageCheckoutModel(cart);

            //Reset field BillingAddress
            model.BillingAddress.BillingNewAddress.Id = 0;
            model.BillingAddress.BillingNewAddress.FirstName = "";
            model.BillingAddress.BillingNewAddress.LastName = "";
            model.BillingAddress.BillingNewAddress.Email = "";
            model.BillingAddress.BillingNewAddress.Company = "";
            model.BillingAddress.BillingNewAddress.City = "";
            model.BillingAddress.BillingNewAddress.ZipPostalCode = "";
            model.BillingAddress.BillingNewAddress.Address1 = "";
            model.BillingAddress.BillingNewAddress.Address2 = "";
            model.BillingAddress.BillingNewAddress.Address2 = "";
            model.BillingAddress.BillingNewAddress.CountryId = 0;

            model.BillingAddress.BillingNewAddress.StateProvinceId = 0;

            // model.BillingAddress
            model.ShowNNDelivery = VerifyDeliveryOptionNyN();
            model.BillingAddress.IsGuest = _workContext.CurrentCustomer.IsGuest();

            if (!_workContext.CurrentCustomer.IsGuest())
            {
                if(_workContext.WorkingCompany!=null)
                    model.PONumberReq = _workContext.WorkingCompany.PONumberReq;
            }
           


            return View(model);
        }

        public virtual IActionResult OpcSaveBilling(CheckoutBillingAddressModel model, IFormCollection form)
        {
            try
            {
                int lenAdrress = 0;
                bool validPnr = true;
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                int.TryParse(form["billing_address_id"], out var billingAddressId);

                HttpContext.Session.SetString("ShipToSameAddress", model.ShipToSameAddress.ToString());

                model.IsGuest = _workContext.CurrentCustomer.IsGuest();

                if (billingAddressId > 0)
                {
                    ////existing address
                    //var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == billingAddressId)
                    //    ?? throw new Exception("Address can't be loaded");

                    var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == billingAddressId);

                    if (_workContext.CurrentCustomer.Companies.Any())
                    {
                        if (_workContext.WorkingCompany != null)
                        {
                            address = _workContext.WorkingCompany.Addresses.FirstOrDefault(a => a.Id == billingAddressId);
                        }
                    }

                    _workContext.CurrentCustomer.BillingAddress = address;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                    var PoNumberValid = form["PoNumber"];

                    if (string.IsNullOrEmpty(PoNumberValid))
                    {
                        //IsPOMandatory
                        if (_workContext.WorkingCompany != null)
                        {
                            if(_workContext.WorkingCompany.PONumberReq)
                            {
                                //newAddress.ValidZipCode = true;
                                //ModelState.AddModelError(_workContext.WorkingCompany.Id.ToString(), "Invalid PO Number is Mandatory"); //throw new Exception("Zip Code invalid");
                                //ModelState.AddModelError("ErrorAddressPO", "PO Number is mandatory"); //throw new Exception("Zip Code invalid");

                                ////validate model
                                //if (!ModelState.IsValid)
                                //{
                                //    //model is not valid. redisplay the form with errors
                                //    var billingAddressModel = model.BillingNewAddress;

                                //    //billingAddressModel.NewAddressPreselected = true;
                                //    //billingAddressModel.BillingNewAddress.ValidPONumber = false;
                                //    lenAdrress = 1;

                                //    return Json(new
                                //    {
                                //        len_adrress = address,
                                //        update_section = new UpdateSectionJsonModel
                                //        {
                                //            name = "billing",
                                //            html = RenderPartialViewToString("OpcBillingAddress", billingAddressModel)
                                //        },
                                //        wrong_billing_address = true,
                                //    });
                                //}
                            }
                        }
                    }


                }
                else
                {

                    //new address
                    var newAddress = model.BillingNewAddress;
                    //newAddress.Active = true;
                    //custom address attributes
                    var customAttributes = _addressAttributeParser.ParseCustomAddressAttributes(form);
                    var customAttributeWarnings = _addressAttributeParser.GetAttributeWarnings(customAttributes);

                    foreach (var error in customAttributeWarnings)
                    {
                        ModelState.AddModelError("", error);
                    }
                    ModelState.Remove("BillingNewAddress.IsBilling");
                    ModelState.Remove("BillingNewAddress.IsShipping");

                    if (!string.IsNullOrEmpty(newAddress.ZipPostalCode))
                    {
                        Address ValidAdd = new Address();
                        ValidAdd.City= newAddress.City;

                        if (newAddress.CountryId.HasValue)
                            ValidAdd.Country = _countryService.GetCountryById(newAddress.CountryId.Value);
                        if (newAddress.StateProvinceId.HasValue)
                            ValidAdd.StateProvince = _stateProvinceService.GetStateProvinceById(newAddress.StateProvinceId.Value);

                        ValidAdd.ZipPostalCode = newAddress.ZipPostalCode;
                        ValidAdd.Address1 = newAddress.Address1;

                        var validAddress = _zipCodeService.GetAddressValidation(ValidAdd);

                        if (!validAddress.IsValid)
                        {
                            newAddress.ValidZipCode = true;
                            ModelState.AddModelError(newAddress.ZipPostalCode, "Invalid Zip Code"); //throw new Exception("Zip Code invalid");
                            ModelState.AddModelError("ErrorAddressZipcode", "Invalid Zip Code"); //throw new Exception("Zip Code invalid");

							//  ModelState.AddModelError("", "Invalid Zip Code "); //throw new Exception("Zip Code invalid");
						}
						else
                        {
                                newAddress.ValidZipCode = false;
                            if (model.BillingNewAddress.PopupOpen)
                            {
                                if (validAddress.CandidateAddress.Count() > 0)
                                {
                                    ViewBag.isPopup = true;
                                    ViewBag.isBillingSaved = true;
                                    ViewBag.MyAccount = false;
                                    ModelState.AddModelError("MoreCandidateAddress", "CandidateAddress");
                                    ViewBag.CandidateAddress = JsonConvert.SerializeObject(validAddress.CandidateAddress, new Newtonsoft.Json.JsonSerializerSettings
                                    {
                                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                                    });
                                }
                            }
                        }

                        ////IsPOMandatory
                        if (_workContext.WorkingCompany != null)
                        {
                            if (_workContext.WorkingCompany.PONumberReq)
                            {
                                var PoNumberValid = form["PoNumber"];

                                if (string.IsNullOrEmpty(PoNumberValid))
                                {
                                    //newAddress.ValidZipCode = true;
                                    ModelState.AddModelError(newAddress.Address1, "Invalid PO Number is Mandatory"); //throw new Exception("Zip Code invalid");
                                    ModelState.AddModelError("ErrorAddressPO", "PO Number is mandatory"); //throw new Exception("Zip Code invalid");
                                }
                            }
                        }

                    }
                    if (_workContext.CurrentCustomer.IsGuest())
                    {
                        if(string.IsNullOrEmpty(newAddress.PhoneNumber))
                            ModelState.AddModelError("", "");
                    }

                    if (!string.IsNullOrEmpty(newAddress.PhoneNumber) && newAddress.PhoneNumber.Count()<10)
                        ModelState.AddModelError("", "");

                    //validate model
                    if (!ModelState.IsValid)
                    {
                        //model is not valid. redisplay the form with errors
                        var billingAddressModel = _checkoutModelFactory.PrepareBillingAddressModel(cart,
                            selectedCountryId: newAddress.CountryId,
                            overrideAttributesXml: customAttributes);

                        billingAddressModel.NewAddressPreselected = true;
                        billingAddressModel.BillingNewAddress.ValidZipCode = newAddress.ValidZipCode;
                        lenAdrress = billingAddressModel.ExistingAddresses.Count();

                        //IsPOMandatory
                        if (_workContext.WorkingCompany != null)
                        {
                            if (_workContext.WorkingCompany.PONumberReq)
                            {
                                var PoNumberInfo = form["PoNumber"];

                                if (string.IsNullOrEmpty(PoNumberInfo))
                                {
                                    billingAddressModel.BillingNewAddress.ValidPONumber = true;
                                    //ModelState.AddModelError(newAddress.Address1, "Invalid PO Number is Mandatory"); //throw new Exception("Zip Code invalid");
                                    // ModelState.AddModelError("ErrorAddressPO", "PO Number is mandatory"); //throw new Exception("Zip Code invalid");


                                }
                            }
                        }

                       
                        if (!string.IsNullOrEmpty(newAddress.PhoneNumber) && newAddress.PhoneNumber.Length < 10 && newAddress.PhoneNumber.Length > 0)
                            billingAddressModel.BillingNewAddress.ValidLengthPhoneNumber = true;

                        return Json(new
                        {
                            len_adrress = lenAdrress,
                            update_section = new UpdateSectionJsonModel
                            {
                                name = "billing",
                                html = RenderPartialViewToString("OpcBillingAddress", billingAddressModel)
                            },
                            wrong_billing_address = true,
                        });
                    }


                    //try to find an address with the same values (don't duplicate records)
                    var address = _addressService.FindAddress(_workContext.CurrentCustomer.Addresses.ToList(),
                        newAddress.FirstName, newAddress.LastName, newAddress.PhoneNumber,
                        newAddress.Email, newAddress.FaxNumber, newAddress.Company,
                        newAddress.Address1, newAddress.Address2, newAddress.City,
                        newAddress.County, newAddress.StateProvinceId, newAddress.ZipPostalCode,
                        newAddress.CountryId, customAttributes);

                   
                    if (address == null)
                    {
                        //address is not found. let's create a new one
                        address = newAddress.ToEntity();
                        address.Residential = newAddress.Residential;
                        //address.Active = true;
                        address.CustomAttributes = customAttributes;
                        address.CreatedOnUtc = DateTime.UtcNow;


                        //some validation
                        if (address.CountryId == 0)
                            address.CountryId = null;
                        if (address.StateProvinceId == 0)
                            address.StateProvinceId = null;
                        if (address.CountryId.HasValue && address.CountryId.Value > 0)
                        {
                            address.Country = _countryService.GetCountryById(address.CountryId.Value);
                        }
                        //_workContext.CurrentCustomer.Addresses.Add(address);

                        _workContext.CurrentCustomer.CustomerAddressMappings.Add(new CustomerAddressMapping { Address = address });

                        if (_workContext.CurrentCustomer.Companies.Any())
                        {
                            if (_workContext.WorkingCompany != null)
                            {
                                CompanyAddresses companyAddresses = new CompanyAddresses();
                                address.Active = false;
                                companyAddresses.Address = address;
                                companyAddresses.Company = _workContext.WorkingCompany;
                                companyAddresses.DeliveryRoute = false;
                                companyAddresses.IsBilling = true;
                                companyAddresses.DeliveryRouteId = "0";

                                _companyService.InsertCompanyAddressMapping(companyAddresses);
                                _workContext.WorkingCompany.Addresses.Add(address);
                                _companyService.UpdateCompany(_workContext.WorkingCompany);
                            }
                        }

                    }

                    _workContext.CurrentCustomer.BillingAddress = address;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                }
                
                    var PoNumber = form["PoNumber"];

                if (!string.IsNullOrEmpty(PoNumber))
                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.PoNumberAttribute, PoNumber);
                

                if (_shoppingCartService.ShoppingCartRequiresShipping(cart))
                {
                    //shipping is required
                    var address = _workContext.CurrentCustomer.BillingAddress;
                  
                    //by default Shipping is available if the country is not specified
                    var shippingAllowed = _addressSettings.CountryEnabled ? address.Country?.AllowsShipping ?? false : true;
                    if (_shippingSettings.ShipToSameAddress && model.ShipToSameAddress && shippingAllowed)
                    {
                        //ship to the same address

                        _workContext.CurrentCustomer.ShippingAddress = address;
                        _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                        //reset selected shipping method (in case if "pick up in store" was selected)
                        _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
                        _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);

                        var saveaddresstomyaccount =(bool) model.BillingNewAddress?.Saveaddresstomyaccount;

                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.Saveaddresstomyaccount + "_" + address.Id, saveaddresstomyaccount.ToString());

                        var saveBilling = (bool)model.BillingNewAddress?.IsDefaultBilling;

                        if (saveaddresstomyaccount && saveBilling)
                            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultBilling + "_" + address.Id, model.BillingNewAddress?.IsDefaultBilling.ToString());


                        if (_shippingSettings.ShipToSameAddress && model.ShipToSameAddress)
						{
                            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultBilling + "_" + address.Id, saveaddresstomyaccount.ToString());
                            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.ShipToSameAddress + "_" + address.Id, true.ToString());

                        }

                        return OpcLoadStepAfterShippingAddress(cart);
                    }

                    var saveaddresstomyaccount2 =(bool) model.BillingNewAddress?.Saveaddresstomyaccount;

                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.Saveaddresstomyaccount + "_" + address.Id, saveaddresstomyaccount2.ToString());

                    var saveBilling2 = (bool)model.BillingNewAddress?.IsDefaultBilling;

                    if (saveaddresstomyaccount2 && saveBilling2)
                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultBilling + "_" + address.Id, model.BillingNewAddress?.IsDefaultBilling.ToString());




                    if (_shippingSettings.ShipToSameAddress && model.ShipToSameAddress)
					{
                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultBilling + "_" + address.Id, saveaddresstomyaccount2.ToString());
                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.ShipToSameAddress + "_" + address.Id, true.ToString());

                    }
                    //limitation - "Ship to the same address" doesn't properly work in "pick up in store only" case (when no shipping plugins are available) 
                    //return OpcLoadStepAfterShippingAddress(cart);

                    ////do not ship to the same address
                    var shippingAddressModel = _checkoutModelFactory.PrepareShippingAddressModel(prePopulateNewAddressWithCustomerFields: true);
                    shippingAddressModel.PickupInStoreOnly = model.ShipToSameAddress;

                    //Reset field  ShippingAddress.
                    shippingAddressModel.ShippingNewAddress.FirstName = "";
                    shippingAddressModel.ShippingNewAddress.Id = 0;
                    shippingAddressModel.ShippingNewAddress.LastName = "";
                    shippingAddressModel.ShippingNewAddress.Email = "";
                    shippingAddressModel.ShippingNewAddress.Company = "";
                    shippingAddressModel.ShippingNewAddress.City = "";
                    shippingAddressModel.ShippingNewAddress.ZipPostalCode = "";
                    shippingAddressModel.ShippingNewAddress.Address1 = "";
                    shippingAddressModel.ShippingNewAddress.Address2 = "";
                    shippingAddressModel.ShippingNewAddress.CountryId = 0;
                    shippingAddressModel.ShippingNewAddress.StateProvinceId = 0;
                    shippingAddressModel.ShippingNewAddress.Residential = false;
                    lenAdrress = shippingAddressModel.ExistingAddresses.Count();
                    return Json(new
                    {
                        len_adrress = lenAdrress,
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "shipping",
                            html = RenderPartialViewToString("OpcShippingAddress", shippingAddressModel)
                        },
                        goto_section = "shipping"
                    });
                }

                //shipping is not required
                _workContext.CurrentCustomer.ShippingAddress = null;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                _genericAttributeService.SaveAttribute<ShippingOption>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, null, _storeContext.CurrentStore.Id);
               
                //load next step
                return OpcLoadStepAfterShippingMethod(cart);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        public virtual IActionResult OpcSaveShipping(CheckoutShippingAddressModel model, IFormCollection form)
        {
            try
            {
                int lenAdrress = 0;
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
                    throw new Exception("Shipping is not required");

               
                int.TryParse(form["shipping_address_id"], out var shippingAddressId);
                model.IsGuest = _workContext.CurrentCustomer.IsGuest();

                if (shippingAddressId > 0)
                {
                    var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == shippingAddressId);

                    if (_workContext.CurrentCustomer.Companies.Any())
                    {
                        if (_workContext.WorkingCompany != null)
                        {
                            address = _workContext.WorkingCompany.Addresses.FirstOrDefault(a => a.Id == shippingAddressId);
                        }
                    }

                    _workContext.CurrentCustomer.ShippingAddress = address;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                }
                else
                {
                    //new address
                    var newAddress = model.ShippingNewAddress;

                    //custom address attributes
                    var customAttributes = _addressAttributeParser.ParseCustomAddressAttributes(form);
                    var customAttributeWarnings = _addressAttributeParser.GetAttributeWarnings(customAttributes);
                    foreach (var error in customAttributeWarnings)
                    {
                        ModelState.AddModelError("", error);
                    }

                    ModelState.Remove("ShippingNewAddress.IsBilling");
                    ModelState.Remove("ShippingNewAddress.IsShipping");

                    var ErrorZipCode = 0;
                    if (!string.IsNullOrEmpty(newAddress.ZipPostalCode))
                    {
                        Address ValidAdd = new Address();
                        ValidAdd.City = newAddress.City;

                        if (newAddress.CountryId.HasValue)
                            ValidAdd.Country = _countryService.GetCountryById(newAddress.CountryId.Value);
                        if (newAddress.StateProvinceId.HasValue)
                            ValidAdd.StateProvince = _stateProvinceService.GetStateProvinceById(newAddress.StateProvinceId.Value);

                        ValidAdd.ZipPostalCode = newAddress.ZipPostalCode;
                        ValidAdd.Address1 = newAddress.Address1;
                        var validAddress = _zipCodeService.GetAddressValidation(ValidAdd);


                        if (!validAddress.IsValid)
                        {
                            newAddress.ValidZipCode = true;
                            ErrorZipCode++;
                            ModelState.AddModelError("ShippingNewAddress_ZipPostalCode-error", "Invalid Zip Code"); //throw new Exception("Zip Code invalid");
                        }
                        else
                        {
                            newAddress.ValidZipCode = false;
                            if (validAddress.CandidateAddress.Count() > 0)
                            {

                                ViewBag.isPopup = true;
                                ViewBag.isShippingSaved = true;
                                ViewBag.MyAccount = false;
                                ModelState.AddModelError("MoreCandidateAddress", "CandidateAddress");
                                ViewBag.CandidateAddress = JsonConvert.SerializeObject(validAddress.CandidateAddress, new Newtonsoft.Json.JsonSerializerSettings
                                {
                                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                                });
                            }
                        }
                    }

                    if (_workContext.CurrentCustomer.IsGuest())
                    {
                        if (string.IsNullOrEmpty(newAddress.PhoneNumber))
                            ModelState.AddModelError("", "");
                    }
                    //validate model
                    if (!ModelState.IsValid)
                    {
                        //model is not valid. redisplay the form with errors
                        var shippingAddressModel = _checkoutModelFactory.PrepareShippingAddressModel(
                            selectedCountryId: newAddress.CountryId,
                            overrideAttributesXml: customAttributes);
                        


                        shippingAddressModel.NewAddressPreselected = true;
                        shippingAddressModel.ShippingNewAddress.ValidZipCode = newAddress.ValidZipCode;
                        lenAdrress = shippingAddressModel.ExistingAddresses.Count();

                        var shipToSameAddress = HttpContext.Session.Get("ShipToSameAddress") != null ? HttpContext.Session.GetString("ShipToSameAddress") : string.Empty;
                        shippingAddressModel.PickupInStoreOnly = string.IsNullOrEmpty(shipToSameAddress) ? false : Convert.ToBoolean(shipToSameAddress); // model.ShipToSameAddressHidden;
                        shippingAddressModel.ShippingNewAddress.ValidZipCode = newAddress.ValidZipCode;

                        var saveShippingaddresstomyaccount = (bool)model.ShippingNewAddress?.Saveaddresstomyaccount;

                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SaveShippingaddress + "_" + shippingAddressModel.ShippingNewAddress.Id, saveShippingaddresstomyaccount.ToString());


                        var saveShipping = (bool)model.ShippingNewAddress?.IsDefaultShipping;

                        if (saveShippingaddresstomyaccount && saveShipping)
                            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultShipping + "_" + shippingAddressModel.ShippingNewAddress.Id, saveShipping.ToString());



                        if (saveShippingaddresstomyaccount && saveShipping)
                            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultShipping + "_" + shippingAddressModel.ShippingNewAddress.Id, model.ShippingNewAddress?.IsDefaultShipping.ToString());


                        return Json(new
                        {
                            len_adrress = lenAdrress,
                            lenAdrress = shippingAddressModel.ExistingAddresses.Count(),
                            update_section = new UpdateSectionJsonModel
                            {
                                name = "shipping",
                                html = RenderPartialViewToString("OpcShippingAddress", shippingAddressModel)
                            },
                            wrong_billing_address = true,
                        });
                    }


                    //try to find an address with the same values (don't duplicate records)
                    var address = _addressService.FindAddress(_workContext.CurrentCustomer.Addresses.ToList(),
                        newAddress.FirstName, newAddress.LastName, newAddress.PhoneNumber,
                        newAddress.Email, newAddress.FaxNumber, newAddress.Company,
                        newAddress.Address1, newAddress.Address2, newAddress.City,
                        newAddress.County, newAddress.StateProvinceId, newAddress.ZipPostalCode,
                        newAddress.CountryId, customAttributes);


                    if (address == null)
                    {
                        address = newAddress.ToEntity();
                        address.CustomAttributes = customAttributes;
                        address.CreatedOnUtc = DateTime.UtcNow;
                        address.Residential = newAddress.Residential;
                        //little hack here (TODO: find a better solution)
                        //EF does not load navigation properties for newly created entities (such as this "Address").
                        //we have to load them manually 
                        //otherwise, "Country" property of "Address" entity will be null in shipping rate computation methods
                        if (address.CountryId.HasValue)
                            address.Country = _countryService.GetCountryById(address.CountryId.Value);
                        if (address.StateProvinceId.HasValue)
                            address.StateProvince = _stateProvinceService.GetStateProvinceById(address.StateProvinceId.Value);

                        //other null validations
                        if (address.CountryId == 0)
                            address.CountryId = null;
                        if (address.StateProvinceId == 0)
                            address.StateProvinceId = null;
                        //_workContext.CurrentCustomer.Addresses.Add(address);
                        _workContext.CurrentCustomer.CustomerAddressMappings.Add(new CustomerAddressMapping { Address = address });

                        if (_workContext.CurrentCustomer.Companies.Any())
                        {
                            if (_workContext.WorkingCompany != null)
                            {
                                CompanyAddresses companyAddresses = new CompanyAddresses();
                                address.Active = false;
                                companyAddresses.Address = address;
                                companyAddresses.Company = _workContext.WorkingCompany;
                                companyAddresses.DeliveryRoute = false;
                                companyAddresses.IsShipping = true;
                                companyAddresses.DeliveryRouteId = "0";
                                _companyService.InsertCompanyAddressMapping(companyAddresses);
                                _workContext.WorkingCompany.Addresses.Add(address);
                                _companyService.UpdateCompany(_workContext.WorkingCompany);
                            }
                        }
                    }
                    _workContext.CurrentCustomer.ShippingAddress = address;
                    _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                    var saveaddresstomyaccount = (bool)model.ShippingNewAddress?.Saveaddresstomyaccount;
                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SaveShippingaddress + "_" + address.Id, saveaddresstomyaccount.ToString());

                   var saveShippingAddress = (bool)model.ShippingNewAddress?.IsDefaultShipping;

					if (saveaddresstomyaccount && saveShippingAddress)
						_genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.IsDefaultShipping + "_" + address.Id, model.ShippingNewAddress?.IsDefaultShipping.ToString());

				}


                return OpcLoadStepAfterShippingAddress(cart);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }


        /// <summary>
        /// Delete edited address
        /// </summary>
        /// <param name="addressId"></param>
        /// <param name="opc"></param>
        /// <returns>
        /// A task that represents the asynchronous operation
        /// The task result contains the 
        /// </returns>
        public virtual IActionResult DeleteEditAddress(int addressId, bool opc = false)
        {
            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id); if (!cart.Any())
                throw new Exception("Your cart is empty");


            var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == addressId)
                       ?? throw new Exception("Address can't be loaded");
            if (address != null)
            {
                _customerService.RemoveCustomerAddress(_workContext.CurrentCustomer, address);
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);
                _addressService.DeleteAddress(address);
            }

            if (!opc)
            {
                return Json(new
                {
                    redirect = Url.RouteUrl("CheckoutBillingAddress")
                });
            }

            var billingAddressModel = _checkoutModelFactory.PrepareBillingAddressModel(cart);
            return Json(new
            {
                update_section = new UpdateSectionJsonModel
                {
                    name = "billing",
                    html = RenderPartialViewToString("OpcBillingAddress", billingAddressModel)
                }
            });
        }


        /// <summary>
        /// Get specified Address by addresId
        /// </summary>
        /// <param name="addressId"></param>
        /// <returns>
        /// A task that represents the asynchronous operation
        /// The task result contains the 
        /// </returns>
        public virtual IActionResult GetAddressById(int addressId, int isLimit = 0)
        {
            if (isLimit != 0)
            {
                addressId = _workContext.CurrentCustomer.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;
            }
            var address = _customerService.GetCustomerAddress((_workContext.CurrentCustomer).Id, addressId)
                 ?? throw new Exception("Address can't be loaded");

            if (address == null)
                throw new ArgumentNullException(nameof(address));

            var json = JsonConvert.SerializeObject(address, Formatting.Indented,
                new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });

            return Content(json, "application/json");
        }


        /// <summary>
        /// Save edited address
        /// </summary>
        /// <param name="model"></param>
        /// <param name="opc"></param>
        /// <returns></returns>
        [IgnoreAntiforgeryToken]
        public virtual IActionResult SaveEditAddress(CheckoutBillingAddressModel model, IFormCollection form, bool opc = false)
        {
            try
            {
                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id); if (!cart.Any())
                    throw new Exception("Your cart is empty");

                var customer = _workContext.CurrentCustomer;

                //find address (ensure that it belongs to the current customer)
                var address = _customerService.GetCustomerAddress(customer.Id, model.BillingNewAddress.Id);
                if (address == null)
                    throw new Exception("Address can't be loaded");


                var customAttributes = _addressAttributeParser.ParseCustomAddressAttributes(form);

                ModelState.Remove("BillingNewAddress.IsBilling");
                ModelState.Remove("BillingNewAddress.IsShipping");
                ModelState.Remove("BillingNewAddress.Residential");

                if (!string.IsNullOrEmpty(model.BillingNewAddress.ZipPostalCode))
                {
                    Address ValidAdd2 = new Address();
                    ValidAdd2.City = model.BillingNewAddress.City;

                    if (model.BillingNewAddress.CountryId.HasValue)
                        ValidAdd2.Country = _countryService.GetCountryById(model.BillingNewAddress.CountryId.Value);
                    if (model.BillingNewAddress.StateProvinceId.HasValue)
                        ValidAdd2.StateProvince = _stateProvinceService.GetStateProvinceById(model.BillingNewAddress.StateProvinceId.Value);

                    ValidAdd2.ZipPostalCode = model.BillingNewAddress.ZipPostalCode;

                    var validAddress2 = _zipCodeService.GetAddressValidation(ValidAdd2);


                    if (!validAddress2.IsValid)
                    {
                        model.BillingNewAddress.ValidZipCode = true;
                        ModelState.AddModelError(model.BillingNewAddress.ZipPostalCode, "Invalid Zip Code"); //throw new Exception("Zip Code invalid");
                        ModelState.AddModelError("ErrorAddressZipcode", "Invalid Zip Code"); //throw new Exception("Zip Code invalid");

                        //  ModelState.AddModelError("", "Invalid Zip Code "); //throw new Exception("Zip Code invalid");
                    }
                    else
                        model.BillingNewAddress.ValidZipCode = false;
                }
                var ValidPhone = true;
                if (_workContext.CurrentCustomer.IsGuest())
                {
                    if (string.IsNullOrEmpty(model.BillingNewAddress.PhoneNumber))
                    {
                        ValidPhone = false;
                        ModelState.AddModelError("PhoneNumberValidate", "Phone number is required");
                    }
                }
                //validate model
                if (!ModelState.IsValid)
                {
                    //model is not valid. redisplay the form with errors
                    var AddressModel = _checkoutModelFactory.PrepareBillingAddressModel(cart,
                        selectedCountryId: address.CountryId,
                        overrideAttributesXml: customAttributes);

                    AddressModel.NewAddressPreselected = true;
                    return Json(new
                    {
                        error=1,
                        selected_id = model.BillingNewAddress.Id,
                        ValidPhone= ValidPhone,
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "billing",
                            html = RenderPartialViewToString("OpcBillingAddress", AddressModel)
                        },
                        wrong_billing_address = true,
                    });
                }

                Address ValidAdd = new Address();
                ValidAdd.City = model.BillingNewAddress.City;

                if (model.BillingNewAddress.CountryId.HasValue)
                    ValidAdd.Country = _countryService.GetCountryById(model.BillingNewAddress.CountryId.Value);
                if (model.BillingNewAddress.StateProvinceId.HasValue)
                    ValidAdd.StateProvince = _stateProvinceService.GetStateProvinceById(model.BillingNewAddress.StateProvinceId.Value);

                ValidAdd.ZipPostalCode = model.BillingNewAddress.ZipPostalCode;

                var validAddress = _zipCodeService.GetAddressValidation(ValidAdd);

                if (!validAddress.IsValid)
                {
                    //model.val = true;
                    //ModelState.AddModelError("ShippingNewAddress_ZipPostalCode-error", "Invalid Zip Code"); //throw new Exception("Zip Code invalid");
                    throw new Exception("ZipCodeInvalid");
                }

                address = model.BillingNewAddress.ToEntity(address);
                _addressService.UpdateAddress(address);

                (_workContext.CurrentCustomer).BillingAddressId = address.Id;
                _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                if (!opc)
                {
                    return Json(new
                    {
                        redirect = Url.RouteUrl("CheckoutBillingAddress")
                    });
                }

                var billingAddressModel = _checkoutModelFactory.PrepareBillingAddressModel(cart,
                    address.CountryId);
                    
                return Json(new
                {
                    selected_id = model.BillingNewAddress.Id,
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "billing",
                        html = RenderPartialViewToString("OpcBillingAddress", billingAddressModel)
                    }
                });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        public virtual IActionResult OpcSaveShippingMethod(string shippingoption, IFormCollection form)
        {
            try
            {
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                if (!_shoppingCartService.ShoppingCartRequiresShipping(cart))
                    throw new Exception("Shipping is not required");

                //parse selected method 
                if (string.IsNullOrEmpty(shippingoption))
                    throw new Exception("Selected shipping method can't be parsed");

                //pickup point
                if (_shippingSettings.AllowPickupInStore)
                {
                    if (form["PickupInStore"] == "true")
                    {
                        //no shipping address selected
                        _workContext.CurrentCustomer.ShippingAddress = null;
                        _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                        var pickupPoint = form["pickup-points-id"].ToString().Split(new[] { "___" }, StringSplitOptions.None);
                        var PickupPersonNote = form["pickupPersonNote"].ToString();
                        var pickupPoints = _shippingService.GetPickupPoints(_workContext.CurrentCustomer.BillingAddress,
                            _workContext.CurrentCustomer, pickupPoint[1], _storeContext.CurrentStore.Id).PickupPoints.ToList();
                        var selectedPoint = pickupPoints.FirstOrDefault(x => x.Id.Equals(pickupPoint[0]));
                        if (selectedPoint == null)
                            throw new Exception("Pickup point is not allowed");

                        var pickUpInStoreShippingOption = new ShippingOption
                        {
                            Name = string.Format(_localizationService.GetResource("Checkout.PickupPoints.Name"), selectedPoint.Name),
                            Rate = selectedPoint.PickupFee,
                            Description = selectedPoint.Description,
                            ShippingRateComputationMethodSystemName = selectedPoint.ProviderSystemName,
                            PickupPersonNote = PickupPersonNote
                        };
                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, pickUpInStoreShippingOption, _storeContext.CurrentStore.Id);
                        _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, selectedPoint, _storeContext.CurrentStore.Id);

                        //load next step
                        return OpcLoadStepAfterShippingMethod(cart);
                    }

                    //set value indicating that "pick up in store" option has not been chosen
                    _genericAttributeService.SaveAttribute<PickupPoint>(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedPickupPointAttribute, null, _storeContext.CurrentStore.Id);
                }

                var splittedOption = shippingoption.Split(new[] { "___" }, StringSplitOptions.RemoveEmptyEntries);
                if (splittedOption.Length != 2 && !(splittedOption.Length == 3 && splittedOption[1] == "Shipping.NNDelivery"))
                {
                    throw new FormatException("Selected shipping method cannot be parsed.");
                }


                var selectedName = splittedOption[0];
                var shippingRateComputationMethodSystemName = splittedOption[1];
                
                //find it
                //performance optimization. try cache first
                var shippingOptions = _genericAttributeService.GetAttribute<List<ShippingOption>>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.OfferedShippingOptionsAttribute, _storeContext.CurrentStore.Id);
                if (shippingOptions == null || !shippingOptions.Any())
                {
                    //not found? let's load them using shipping service
                    shippingOptions = _shippingService.GetShippingOptions(cart, _workContext.CurrentCustomer.ShippingAddress,
                        _workContext.CurrentCustomer, shippingRateComputationMethodSystemName, _storeContext.CurrentStore.Id).ShippingOptions.ToList();
                }
                else
                {
                    //loaded cached results. let's filter result by a chosen shipping rate computation method
                    shippingOptions = shippingOptions.Where(so => so.ShippingRateComputationMethodSystemName.Equals(shippingRateComputationMethodSystemName, StringComparison.InvariantCultureIgnoreCase))
                        .ToList();
                }
                var shippingOption = shippingOptions
                    .Find(so => !string.IsNullOrEmpty(so.Name) && so.Name.Equals(selectedName, StringComparison.InvariantCultureIgnoreCase));
                if (shippingOption == null)
                    throw new Exception("Selected shipping method can't be loaded");

                // NN Delivery change name to ShippingRateComputationMethodSystemName
                if (shippingRateComputationMethodSystemName == "Shipping.NNDelivery")
                {
                    shippingOption = shippingOptions
                    .Find(so => !string.IsNullOrEmpty(so.ShippingRateComputationMethodSystemName) && so.ShippingRateComputationMethodSystemName.Equals(shippingRateComputationMethodSystemName, StringComparison.InvariantCultureIgnoreCase));
                    if (shippingOption == null)
                        throw new Exception("Selected shipping method can't be loaded");
                }

                // NN Delivery set default shipping address
                if (shippingRateComputationMethodSystemName== "Shipping.NNDelivery")
				{

					if (splittedOption.Count()>2 && !string.IsNullOrEmpty(splittedOption[2]))
					{
                        var shippingDeliveryId = Convert.ToInt32(splittedOption[2]);


                        int addressId = Convert.ToInt32(splittedOption[2].ToString());
                        //var selectedAddress = _addressService.GetAddressById(addressId);
                        if(_shippingSettings.ShipToSameAddress)
						{
                            _workContext.CurrentCustomer.BillingAddressId = addressId;
                            _workContext.CurrentCustomer.ShippingAddressId = addressId;
						}
						else
						{
                            _workContext.CurrentCustomer.ShippingAddressId = addressId;
                        }
                        _customerService.UpdateCustomer(_workContext.CurrentCustomer);

                        shippingOption = shippingOptions.Find(so => !string.IsNullOrEmpty(so.ShippingRateComputationMethodSystemName) && so.AddressId == shippingDeliveryId);

                    }
                }

                //save
                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer, NopCustomerDefaults.SelectedShippingOptionAttribute, shippingOption, _storeContext.CurrentStore.Id);

                //load next step
                return OpcLoadStepAfterShippingMethod(cart);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        public virtual IActionResult OpcSavePaymentMethod(string paymentmethod, CheckoutPaymentMethodModel model)
        {
            try
            {
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                //payment method 
                if (string.IsNullOrEmpty(paymentmethod))
                    throw new Exception("Selected payment method can't be parsed");

                //reward points
                if (_rewardPointsSettings.Enabled)
                {
                    _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                        NopCustomerDefaults.UseRewardPointsDuringCheckoutAttribute, model.UseRewardPoints,
                        _storeContext.CurrentStore.Id);
                }

                //Check whether payment workflow is required
                var isPaymentWorkflowRequired = _orderProcessingService.IsPaymentWorkflowRequired(cart);
                if (!isPaymentWorkflowRequired)
                {
                    //payment is not required
                    _genericAttributeService.SaveAttribute<string>(_workContext.CurrentCustomer,
                        NopCustomerDefaults.SelectedPaymentMethodAttribute, null, _storeContext.CurrentStore.Id);

                    var confirmOrderModel = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
                    return Json(new
                    {
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "confirm-order",
                            html = RenderPartialViewToString("OpcConfirmOrder", confirmOrderModel)
                        },
                        goto_section = "confirm_order"
                    });
                }

                var paymentMethodInst = _paymentPluginManager
                    .LoadPluginBySystemName(paymentmethod, _workContext.CurrentCustomer, _storeContext.CurrentStore.Id);
                if (!_paymentPluginManager.IsPluginActive(paymentMethodInst))
                    throw new Exception("Selected payment method can't be parsed");

                //save
                _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute, paymentmethod, _storeContext.CurrentStore.Id);

                return OpcLoadStepAfterPaymentMethod(paymentMethodInst, cart);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        public virtual IActionResult OpcSavePaymentInfo(IFormCollection form)
        {
            try
            {
                string warnignsShow = "";
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                var paymentMethodSystemName = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                    NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
                var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName)
                    ?? throw new Exception("Payment method is not selected");

                var customerProfileInfo = new CustomerPaymentProfile();
                if (!string.IsNullOrEmpty(form["group1[]"]) && form["group1[]"].ToString() != "AddNewCard" && form["group1[]"].ToString() != "on")
                {
                    customerProfileInfo = _customerAuthorizeNetService.GetPaymentProfile(form["group1[]"], _workContext.CurrentCustomer.Id);

                    if (customerProfileInfo.CustomerProfileId == null)
                    {
                        customerProfileInfo = _customerAuthorizeNetService.GetProfileByProfileId(form["group1[]"], _workContext.CurrentCustomer.Id);
                        if (customerProfileInfo.CustomerProfileId == null)
                            ModelState.AddModelError("", "Error");

                    }
                }
                else
                {
                    var warnings = paymentMethod.ValidatePaymentForm(form);
                    foreach (var warning in warnings)
                    {
                        ModelState.AddModelError("", warning);

                        warnignsShow = warning;
                    }
                }

                if (ModelState.IsValid)
                {
                    var paymentInfo = new ProcessPaymentRequest();

                    //get payment info
                    if (!string.IsNullOrEmpty(form["CardNumber"]))
                        paymentInfo = paymentMethod.GetPaymentInfo(form);

                    if (customerProfileInfo.CustomerProfileId != null)
                    {
                        paymentInfo.paymentProfileId = customerProfileInfo.CustomerPaymentProfileList;
                        paymentInfo.customerProfileId = customerProfileInfo.CustomerProfileId;
                    }
                    if (form["shippingoptionSaveCard"].ToString() == "on")
                        paymentInfo.SaveCard = true;


                    //set previous order GUID (if exists)
                    GenerateOrderGuid(paymentInfo);

                    //session save
                    HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);


                    //place order

                    var confirmOrderModel = _checkoutModelFactory.PrepareConfirmOrderModel(cart);
                    return Json(new
                    {
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "confirm-order",
                            html = RenderPartialViewToString("OpcConfirmOrder", confirmOrderModel)
                        },
                        goto_section = "confirm_order"
                    });
                }


                //If we got this far, something failed, redisplay form
                var paymenInfoModel = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
                paymenInfoModel.IsGuest = _workContext.CurrentCustomer.IsGuest();
                GetCreditCardSaved(paymenInfoModel);
                paymenInfoModel.ErrorMessage = warnignsShow;

                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "payment-info",
                        html = RenderPartialViewToString("OpcPaymentInfo", paymenInfoModel)
                    }
                });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        private void GetCreditCardSaved(CheckoutPaymentInfoModel paymenInfoModel)
        {
            try
            {


                GetCustomerPaymentProfileRequestModel getPayment = new GetCustomerPaymentProfileRequestModel();
                string TransactionKey = _settingService.GetSetting("authorizenetpaymentsettings.transactionkey").Value;
                string LoginId = _settingService.GetSetting("authorizenetpaymentsettings.loginid").Value;
                CustomerPaymentProfile cutProf = _customerAuthorizeNetService.GetProfileByCustomerId(_workContext.CurrentCustomer.Id);
                if (cutProf != null)
                {
                    getPayment.getCustomerProfileRequest = new GetCustomerPaymentProfileModel();
                    getPayment.getCustomerProfileRequest.merchantAuthentication = new MerchantAuthenticationModel();
                    getPayment.getCustomerProfileRequest.merchantAuthentication.name = LoginId;
                    getPayment.getCustomerProfileRequest.merchantAuthentication.transactionKey = TransactionKey;
                    getPayment.getCustomerProfileRequest.customerProfileId = cutProf.CustomerProfileId;
                    getPayment.getCustomerProfileRequest.includeIssuerInfo = "true";
                    paymenInfoModel.PaymentsCards = _customerAuthorizeNetService.GetCustomerPaymentProfile(getPayment);
                }
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
            }
        }

        public virtual IActionResult OpcConfirmOrder()
        {
            try
            {
                //validation
                if (_orderSettings.CheckoutDisabled)
                    throw new Exception(_localizationService.GetResource("Checkout.Disabled"));

                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    throw new Exception("Your cart is empty");

                if (!_orderSettings.OnePageCheckoutEnabled)
                    throw new Exception("One page checkout is disabled");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    throw new Exception("Anonymous checkout is not allowed");

                //prevent 2 orders being placed within an X seconds time frame
                if (!IsMinimumOrderPlacementIntervalValid(_workContext.CurrentCustomer))
                    throw new Exception(_localizationService.GetResource("Checkout.MinOrderPlacementInterval"));

                //place order
                var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");

                if (processPaymentRequest == null)
                {
                    //Check whether payment workflow is required
                    if (_orderProcessingService.IsPaymentWorkflowRequired(cart))
                    {
                        throw new Exception("Payment information is not entered");
                    }

                    processPaymentRequest = new ProcessPaymentRequest();
                }
                if(processPaymentRequest.customerProfileId!=null)
                {
                    var GetAddressPaymentProfile = _customerAuthorizeNetService.GetPaymentProfileByProfile(processPaymentRequest.customerProfileId?.ToString(), processPaymentRequest.paymentProfileId?.ToString(), _workContext.CurrentCustomer.Id);

                    if (GetAddressPaymentProfile != null)
                        processPaymentRequest.AddressCustomerProfileId = GetAddressPaymentProfile.BillingAddressId;

                }
                GenerateOrderGuid(processPaymentRequest);
                processPaymentRequest.StoreId = _storeContext.CurrentStore.Id;
                processPaymentRequest.CustomerId = _workContext.CurrentCustomer.Id;
                processPaymentRequest.PaymentMethodSystemName = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
                HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", processPaymentRequest);
                var placeOrderResult = _orderProcessingService.PlaceOrder(processPaymentRequest);
                if (placeOrderResult.Success)
                {
                    HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", null);
                    var postProcessPaymentRequest = new PostProcessPaymentRequest
                    {
                        Order = placeOrderResult.PlacedOrder
                    };

                    var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(placeOrderResult.PlacedOrder.PaymentMethodSystemName);
                    if (paymentMethod == null)
                        //payment method could be null if order total is 0
                        //success
                        return Json(new { success = 1 });

                    if (paymentMethod.PaymentMethodType == PaymentMethodType.Redirection)
                    {
                        //Redirection will not work because it's AJAX request.
                        //That's why we don't process it here (we redirect a user to another page where he'll be redirected)

                        //redirect
                        return Json(new
                        {
                            redirect = $"{_webHelper.GetStoreLocation()}checkout/OpcCompleteRedirectionPayment"
                        });
                    }

                    if (_workContext.CurrentCustomer.Companies.Any())
                    {
                        if (_workContext.WorkingCompany != null)
                        {
                            var Address = _workContext.WorkingCompany.Addresses.Where(r => r.NetsuitId == 0);

                            foreach (var item in Address)
                            {
                                item.Active = true;
                            } 

                            _companyService.UpdateCompany(_workContext.WorkingCompany);
                           // _workContext.WorkingCompany.Addresses.Remove(address);
                           // _companyService.UpdateCompany(_workContext.WorkingCompany);
                        }
                    }


                    _paymentService.PostProcessPayment(postProcessPaymentRequest);


                    //Active NN Box Generator
                    _shippingService.ValidBoxSelector(placeOrderResult.PlacedOrder);

                    try
                    {
                        var GetPendingDataToSync = _pendingDataToSyncService.GetPendingInvocesDataToSync(Convert.ToInt32(placeOrderResult.PlacedOrder.Id), ImporterIdentifierType.OrderSendNetsuite);

                        if (GetPendingDataToSync != null)
                        {
                            GetPendingDataToSync.Synchronized = false;
                            GetPendingDataToSync.UpdateDate = DateTime.Now;
                            _pendingDataToSyncService.UpdatetPendingDataToSync(GetPendingDataToSync);
                        }
                        else
                        {
                            var items = new PendingDataToSync();
                            items.IdItem = Convert.ToInt32(placeOrderResult.PlacedOrder.Id);
                            items.Synchronized = false;
                            items.Type = (int)ImporterIdentifierType.OrderSendNetsuite;
                            items.UpdateDate = DateTime.Now;
                            _pendingDataToSyncService.InsertPendingDataToSync(items);
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.Warning("Confirm Order Checkout proccess GetPendingInvocesDataToSync(): " + placeOrderResult.PlacedOrder.Id, ex);
                    }


                    //success
                    return Json(new { success = 1 });
                }

                //error
                var confirmOrderModel = new CheckoutConfirmModel();
                foreach (var error in placeOrderResult.Errors)
                    confirmOrderModel.Warnings.Add(error);

                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "confirm-order",
                        html = RenderPartialViewToString("OpcConfirmOrder", confirmOrderModel)
                    },
                    goto_section = "confirm_order"
                });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Json(new { error = 1, message = exc.Message });
            }
        }

        public virtual IActionResult OpcCompleteRedirectionPayment()
        {
            try
            {
                //validation
                if (!_orderSettings.OnePageCheckoutEnabled)
                    return RedirectToRoute("Homepage");

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    return Challenge();

                //get the order
                var order = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id,
                customerId: _workContext.CurrentCustomer.Id, pageSize: 1)
                    .FirstOrDefault();
                if (order == null)
                    return RedirectToRoute("Homepage");

                var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(order.PaymentMethodSystemName);
                if (paymentMethod == null)
                    return RedirectToRoute("Homepage");
                if (paymentMethod.PaymentMethodType != PaymentMethodType.Redirection)
                    return RedirectToRoute("Homepage");

                //ensure that order has been just placed
                if ((DateTime.UtcNow - order.CreatedOnUtc).TotalMinutes > 3)
                    return RedirectToRoute("Homepage");

                //Redirection will not work on one page checkout page because it's AJAX request.
                //That's why we process it here
                var postProcessPaymentRequest = new PostProcessPaymentRequest
                {
                    Order = order
                };

                _paymentService.PostProcessPayment(postProcessPaymentRequest);

                if (_webHelper.IsRequestBeingRedirected || _webHelper.IsPostBeingDone)
                {
                    //redirection or POST has been done in PostProcessPayment
                    return Content("Redirected");
                }

                //if no redirection has been done (to a third-party payment page)
                //theoretically it's not possible
                return RedirectToRoute("CheckoutCompleted", new { orderId = order.Id });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Content(exc.Message);
            }
        }

        public virtual IActionResult FindAddress(int addressId, string typeAdress = "Billing")
        {
            var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);
            //if (!cart.Any())
            //    throw new Exception("Your cart is empty");
            if (!cart.Any()) ;

            var address = _workContext.CurrentCustomer.Addresses.FirstOrDefault(a => a.Id == addressId);

            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    address = _workContext.WorkingCompany.Addresses.FirstOrDefault(a => a.Id == addressId);
                    if (address == null)
                    {
                        if (typeAdress == "shipping" && addressId == 0)
                        {
                            address = _workContext.CurrentCustomer.ShippingAddress;
                        }
                    }

                }
            }

            if (address == null)
            {
                var model = new CheckoutBillingAddressModel();
                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "billing",
                        html = RenderPartialViewToString("_CreateOrUpdateAddressCustomers", model.BillingNewAddress)
                    }
                });

            }
            if (typeAdress == "Billing")
            {
                var billingAddressModel = _checkoutModelFactory.PrepareBillingAddressModel(cart,
                        selectedCountryId: address.CountryId);
                if (address != null)
                {
                    billingAddressModel.BillingNewAddress.FirstName = address.FirstName;
                    billingAddressModel.BillingNewAddress.LastName = address.LastName;
                    billingAddressModel.BillingNewAddress.Email = address.Email;
                    billingAddressModel.BillingNewAddress.Company = address.Company;
                    billingAddressModel.BillingNewAddress.CountryId = address.CountryId;
                    billingAddressModel.BillingNewAddress.StateProvinceId = address.StateProvinceId;
                    billingAddressModel.BillingNewAddress.City = address.City;
                    billingAddressModel.BillingNewAddress.ZipPostalCode = address.ZipPostalCode;
                    billingAddressModel.BillingNewAddress.Address1 = address.Address1;
                    billingAddressModel.BillingNewAddress.Address2 = address.Address2;
                    billingAddressModel.BillingNewAddress.PhoneNumber = address.PhoneNumber;
                    billingAddressModel.BillingNewAddress.Residential = address.Residential;

                    //billingAddressModel.BillingNewAddress.DeliveryRouteName = "";
                    //if (_workContext.WorkingCompany!=null && _workContext.WorkingCompany?.Id != 0)
                    //{
                    //    var companyAddress = _companyServices.GetAllCompanyAddressMappingsById(Convert.ToInt32(_workContext.WorkingCompany.Id));
                    //    if (companyAddress != null)
                    //    {
                    //        var addressNN = companyAddress.Where(r => r.AddressId == addressId).FirstOrDefault();

                    //        if (addressNN != null)
                    //            billingAddressModel.BillingNewAddress.DeliveryRouteName = addressNN.DeliveryRouteName;
                    //    }
                    //}
                }

                return Json(new
                {
                    update_section = new UpdateSectionJsonModel
                    {
                        name = "billing",
                        html = RenderPartialViewToString("_CreateOrUpdateAddressCustomers", billingAddressModel.BillingNewAddress)
                    }
                });

            }
            else
            {
                var shippingAddressModel = _checkoutModelFactory.PrepareShippingAddressModel(prePopulateNewAddressWithCustomerFields: true, selectedCountryId: address.CountryId);


                if (address != null)
                {
                    shippingAddressModel.ShippingNewAddress.FirstName = address.FirstName;
                    shippingAddressModel.ShippingNewAddress.LastName = address.LastName;
                    shippingAddressModel.ShippingNewAddress.Email = address.Email;
                    shippingAddressModel.ShippingNewAddress.Company = address.Company;
                    shippingAddressModel.ShippingNewAddress.CountryId = address.CountryId;
                    shippingAddressModel.ShippingNewAddress.StateProvinceId = address.StateProvinceId;
                    shippingAddressModel.ShippingNewAddress.City = address.City;
                    shippingAddressModel.ShippingNewAddress.ZipPostalCode = address.ZipPostalCode;
                    shippingAddressModel.ShippingNewAddress.Address1 = address.Address1;
                    shippingAddressModel.ShippingNewAddress.Address2 = address.Address2;
                    shippingAddressModel.ShippingNewAddress.PhoneNumber = address.PhoneNumber;
                    shippingAddressModel.ShippingNewAddress.Residential = address.Residential;

                    //shippingAddressModel.ShippingNewAddress.DeliveryRouteName = "";
                    //if (_workContext.WorkingCompany != null &&  _workContext.WorkingCompany?.Id != 0)
                    //{
                    //    var companyAddress = _companyServices.GetAllCompanyAddressMappingsById(Convert.ToInt32(_workContext.WorkingCompany.Id));
                    //    if (companyAddress != null)
                    //    {
                    //        var addressNN = companyAddress.Where(r => r.AddressId == addressId).FirstOrDefault();

                    //        if (addressNN != null)
                    //            shippingAddressModel.ShippingNewAddress.DeliveryRouteName = addressNN.DeliveryRouteName;
                    //    }
                    //}
                }

                if (typeAdress == "shipping" && addressId == 0)
                {
                    return Json(new
                    {
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "shipping",
                            html = RenderPartialViewToString("_CreateOrUpdateAddress", shippingAddressModel.ShippingNewAddress)
                        }
                    });
                }
                else
                {
                    return Json(new
                    {
                        update_section = new UpdateSectionJsonModel
                        {
                            name = "shipping",
                            html = RenderPartialViewToString("_CreateOrUpdateAddressCustomers", shippingAddressModel.ShippingNewAddress)
                        }
                    });
                }

               

            }

        }

        #endregion

        #region Methods Retry Payment

        public virtual IActionResult StartRetryPaymentMethod(int orderId)
        {
            if (orderId == 0)
                throw new ArgumentException("orderId");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            var order = _orderService.GetOrderById(orderId);

            if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                return Challenge();

            if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
                return Challenge();

            string paymentmethod = _paymentSettings.DefaultPaymentMethod;

            if (string.IsNullOrEmpty(paymentmethod))
                return Challenge();

            if (!_paymentPluginManager.IsPluginActive(paymentmethod, _workContext.CurrentCustomer, _storeContext.CurrentStore.Id))
                return Challenge();

            //save
            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                NopCustomerDefaults.SelectedPaymentMethodAttribute, paymentmethod, _storeContext.CurrentStore.Id);

            _genericAttributeService.SaveAttribute(_workContext.CurrentCustomer,
                NopCustomerDefaults.OrderToBepaid, orderId, _storeContext.CurrentStore.Id);

            return RedirectToAction("RetryPaymentInfo");
        }

        public virtual IActionResult RetryPaymentInfo()
        {
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //load payment method
            var paymentMethodSystemName = _paymentSettings.DefaultPaymentMethod;
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return Challenge();

            int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
                NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            if (orderId == 0)
                return Challenge();

            var order = _orderService.GetOrderById(orderId);

            if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                return Challenge();

            if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
                return Challenge();

            var WorkingCompanyId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = _workContext.WorkingCompany.Id;
                }
            }

            if (WorkingCompanyId != order.CompanyId)
                return RedirectToRoute("CustomerOrders");

            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            GetCreditCardSaved(model);

            return View(model);
        }

        [HttpPost, ActionName("RetryPaymentInfo")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult EnterRetryPaymentInfo(IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //load payment method
            var paymentMethodSystemName = "Payments.AuthorizeNet";//_genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                                                                  //NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return RedirectToRoute("CheckoutPaymentMethod");

            int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
                NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            if (orderId == 0)
                return Challenge();

            var order = _orderService.GetOrderById(orderId);

            if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                return Challenge();

            if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
                return Challenge();

            var customerProfileInfo = new CustomerPaymentProfile();
            if (!string.IsNullOrEmpty(form["group1[]"]) && form["group1[]"].ToString() != "AddNewCard")
            {
                customerProfileInfo = _customerAuthorizeNetService.GetPaymentProfile(form["group1[]"], _workContext.CurrentCustomer.Id);

                if (customerProfileInfo.CustomerProfileId == null)
                {
                    customerProfileInfo = _customerAuthorizeNetService.GetProfileByProfileId(form["group1[]"], _workContext.CurrentCustomer.Id);
                    if (customerProfileInfo.CustomerProfileId == null)
                        ModelState.AddModelError("", "Error");

                }
            }
            else
            {
                var warnings = paymentMethod.ValidatePaymentForm(form);
                foreach (var warning in warnings)
                    ModelState.AddModelError("", warning);
            }

            if (ModelState.IsValid)
            {
                //get payment info
                var paymentInfo = paymentMethod.GetPaymentInfo(form);
                if (customerProfileInfo.CustomerProfileId != null)
                {
                    paymentInfo.paymentProfileId = customerProfileInfo.CustomerPaymentProfileList;
                    paymentInfo.customerProfileId = customerProfileInfo.CustomerProfileId;
                }
                if (form["shippingoptionSaveCard"].ToString() == "on")
                    paymentInfo.SaveCard = true;

                //session save
                HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);
                return RedirectToRoute("RetryPaymentConfirm");
            }

            //If we got this far, something failed, redisplay form
            //model
            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            GetCreditCardSaved(model);

            return View(model);
        }


        public virtual IActionResult RetryPaymentConfirm()
        {
            //validation
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
                NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            if (orderId == 0)
                return Challenge();

            var order = _orderService.GetOrderById(orderId);

            if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                return Challenge();

            if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
                return Challenge();

            //model
            var model = new CheckoutConfirmModel
            {
                //terms of service
                TermsOfServiceOnOrderConfirmPage = _orderSettings.TermsOfServiceOnOrderConfirmPage,
                TermsOfServicePopup = _commonSettings.PopupForTermsOfServiceLinks
            };

            return View(model);
        }

        [HttpPost, ActionName("RetryPaymentConfirm")]
        public virtual IActionResult RetryPaymentConfirmOrder()
        {
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
                NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            if (orderId == 0)
                return Challenge();

            var order = _orderService.GetOrderById(orderId);

            if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                return Challenge();

            if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
                return Challenge();

            //model
            var model = new CheckoutConfirmModel
            {
                //terms of service
                TermsOfServiceOnOrderConfirmPage = _orderSettings.TermsOfServiceOnOrderConfirmPage,
                TermsOfServicePopup = _commonSettings.PopupForTermsOfServiceLinks
            };

            try
            {
                //prevent 2 orders being placed within an X seconds time frame
                if (!IsMinimumOrderPlacementIntervalValid(_workContext.CurrentCustomer))
                    throw new Exception(_localizationService.GetResource("Checkout.MinOrderPlacementInterval"));

                //place order
                var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");
                if (processPaymentRequest == null)
                    processPaymentRequest = new ProcessPaymentRequest();

                GenerateOrderGuid(processPaymentRequest);
                processPaymentRequest.StoreId = _storeContext.CurrentStore.Id;
                processPaymentRequest.CustomerId = _workContext.CurrentCustomer.Id;
                processPaymentRequest.PaymentMethodSystemName = _paymentSettings.DefaultPaymentMethod;
                processPaymentRequest.OrderGuid = order.OrderGuid;
                processPaymentRequest.OrderTotal = order.OrderTotal;
                processPaymentRequest.InitialOrderId = order.Id;

                HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", processPaymentRequest);
                var placeOrderResult = _orderProcessingService.RetryPlaceOrder(processPaymentRequest);
                if (placeOrderResult.Success)
                {
                    HttpContext.Session.Set<ProcessPaymentRequest>("OrderPaymentInfo", null);
                    var postProcessPaymentRequest = new PostProcessPaymentRequest
                    {
                        Order = placeOrderResult.PlacedOrder
                    };
                    _paymentService.PostProcessPayment(postProcessPaymentRequest);


                    //Invoices 
                    var invoiceList = _orderService.GetInvoiceByOrderId(Convert.ToInt32(order.Id));

                    if (invoiceList.Count > 0)
                    {
                        foreach (var x in invoiceList)
                        {
                            var invoice = _orderService.GetInvoiceById(Convert.ToInt32(x.Id));

                            if (invoice != null)
                            {
                                invoice.PaymentStatusId = (int)PaymentStatus.Paid;

                                invoice.CardType = string.Empty;
                                invoice.CardName = string.Empty;
                                invoice.CardNumber = string.Empty;
                                invoice.MaskedCreditCardNumber = string.Empty;
                                invoice.CardCvv2 = string.Empty;
                                invoice.CardExpirationMonth = string.Empty;
                                invoice.CardExpirationYear = string.Empty;
                                invoice.PaymentMethodSystemName = processPaymentRequest.PaymentMethodSystemName;
                                invoice.AmountDue = 0;
                                _invoiceService.UpdateOrder(invoice);
                            }
                        }

                       // CreateTransactionInvoice(invoiceList, order.Id, order.OrderTotal);
                    }

                    if (_webHelper.IsRequestBeingRedirected || _webHelper.IsPostBeingDone)
                    {
                        //redirection or POST has been done in PostProcessPayment
                        return Content("Redirected");
                    }

                    return RedirectToRoute("CheckoutCompleted", new { orderId = placeOrderResult.PlacedOrder.Id });
                }

                foreach (var error in placeOrderResult.Errors)
                    model.Warnings.Add(error);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc);
                model.Warnings.Add(exc.Message);
            }

            //If we got this far, something failed, redisplay form
            return View(model);
        }

        #endregion

        #region NewMethods N&N

        public bool VerifyDeliveryOptionNyN()
        {
            bool flag = false;
            int CustomerId = _workContext.CurrentCustomer.Id;
            List<CustomerCustomerRoleMapping> CustomerRol = new List<CustomerCustomerRoleMapping>();
            CustomerRol = _customerService.GetCustomerCustomerOrleById(CustomerId);
            if (CustomerRol.Count >= 1)
            {
                var query = CustomerRol.FirstOrDefault(x => x.CustomerRoleId == 6);
                if (query != null)
                {
                    flag = true;
                }


            }

            return flag;

        }

        public bool VerifyRequestFreighOption(Address address, int TotalAmounth)
        {
            try
            {
                bool flag = false;
                List<DeliveryRoutes> placesAmounth = new List<DeliveryRoutes>();
                //Verify places and amounth
                placesAmounth = _deliveryRoutesService.GetDeliveryRoute();
                foreach (var item in placesAmounth)
                {
                    if (address.City == item.Name)
                    {
                        if (TotalAmounth == item.Minimum)
                        {
                            flag = true;
                        }
                    }
                }
                return flag;

            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return false;
            }
        }

        public bool VerifyBillMyAcount(Address address)
        {
            try
            {
                bool Flag = false;
                int NetsuitId = _workContext.CurrentCustomer.NetsuitId;
                List<Company> companies = new List<Company>();
                companies = _companyService.GetCompanyByNetSuiteId(NetsuitId);
                foreach (var item in companies)
                {
                    if (address.Company == item.CompanyName)
                    {
                        if (address.Address1 == item.DefaultAddress)
                        {
                            if (Convert.ToInt32(item.BillingTerms) == 4 || item.BillingTerms == null)
                            {
                                Flag = true;
                            }
                        }
                    }
                }
                return Flag;

            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return false;
            }
        }

        [HttpPost]
        public virtual IActionResult SendEmailFreightQuote(string email, string ResidentialAddress, string TractorAccessible, string trailerEnterExit, 
            string StandardDock, string AppointmentDelivery, string StandardReceiving, string phoneNumber)
        {
            try
            {
                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    return RedirectToRoute("ShoppingCart");

                var order = new Order();
                order.StoreId = _storeContext.CurrentStore.Id;
                order.CustomerId = _workContext.CurrentCustomer.Id;

                order.BillingAddress = new Address();
                order.BillingAddress = _workContext.CurrentCustomer.BillingAddress;
                if (_workContext.CurrentCustomer.IsGuest())
                    order.BillingAddress.PhoneNumber = _workContext.CurrentCustomer.BillingAddress.PhoneNumber;
                else
                    order.BillingAddress.PhoneNumber = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.PhoneAttribute);

                order.BillingAddress.Company = string.IsNullOrEmpty(order.BillingAddress.Company) ?
                    _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.CompanyAttribute) :
                    order.BillingAddress.Company;

                order.ShippingAddress = new Address();
                order.ShippingAddress = _workContext.CurrentCustomer.ShippingAddress;

                if (_workContext.CurrentCustomer.IsGuest())
                    order.ShippingAddress.PhoneNumber = _workContext.CurrentCustomer.ShippingAddress.PhoneNumber;
                else
                    order.ShippingAddress.PhoneNumber = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.PhoneAttribute);

                order.ShippingAddress.Company = string.IsNullOrEmpty(order.ShippingAddress.Company) ?
                    _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.CompanyAttribute) :
                    order.ShippingAddress.Company;

                order.CurrencyRate = 1;
                order.CustomerCurrencyCode = _workContext.WorkingCurrency.CurrencyCode;

                foreach (var item in cart)
                {
                    if (item.Product.DiscountProductMappings.Any())
                    {
                        var discountMapping = item.Product.DiscountProductMappings.FirstOrDefault();
                        order.OrderDiscount += discountMapping.Discount.DiscountAmount;
                    }

                    order.OrderItems.Add(new OrderItem
                    {
                        UnitPriceInclTax = item.Product.Price,
                        UnitPriceExclTax = item.Product.Price,
                        PriceInclTax = item.Product.Price * item.Quantity - (item.Quantity * order.OrderDiscount),
                        PriceExclTax = item.Product.Price * item.Quantity - (item.Quantity * order.OrderDiscount),
                        Product = item.Product,
                        ProductId = item.ProductId,
                        Quantity = item.Quantity,
                        AttributesXml = item.AttributesXml,
                        AttributeDescription = _productAttributeFormatter.FormatAttributes(item.Product, item.AttributesXml, item.Customer)
                    });
                }


                order.OrderSubtotalInclTax = order.OrderItems.Sum(x => x.PriceInclTax);
                order.OrderSubtotalExclTax = order.OrderItems.Sum(x => x.PriceExclTax);

                InsertFreightQuote(ResidentialAddress, TractorAccessible, trailerEnterExit, StandardDock, AppointmentDelivery, StandardReceiving, cart, order, email, phoneNumber);
                
                //  notifications Sends Freigh Quote message to a Nop Admin
                var result = _workflowMessageService.SendEmailFreightQuote(order, cart, _localizationSettings.DefaultAdminLanguageId, ResidentialAddress, TractorAccessible, trailerEnterExit,
             StandardDock, AppointmentDelivery, StandardReceiving,  email, phoneNumber);



                return Json(new { Result = result });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Content(exc.Message);
            }
        }

        private void InsertFreightQuote(string ResidentialAddress, string TractorAccessible, string trailerEnterExit, string StandardDock, string AppointmentDelivery, string StandardReceiving, IList<ShoppingCartItem> cart, Order order, string email, string phoneNumber)
        {
            FreightQuote freightQuote = new FreightQuote();
            try
            {
                freightQuote.Name = order.BillingAddress.FirstName + " " + order.BillingAddress.LastName;
               
                if (phoneNumber != null)
                    freightQuote.Phone = phoneNumber;
                else
                    freightQuote.Phone = order.BillingAddress.PhoneNumber;

                if (phoneNumber != null)
                    freightQuote.Email = email;
                else
                    freightQuote.Email = order.BillingAddress.Email;


                freightQuote.RequestDate = DateTime.Now;
                freightQuote.BillingAddress_Id = order.BillingAddress.Id;
                freightQuote.Shippng_Address_Id = order.ShippingAddress.Id;
                freightQuote.Infomation = " Residential Address: " + ResidentialAddress + ", Tractor Accessible: " + TractorAccessible + ", trailerEnterExit: " + trailerEnterExit + ", StandardDock: " +
                                          StandardDock + ", AppointmentDelivery: " + AppointmentDelivery + ", StandardReceiving: " + StandardReceiving;
                string items = "";
                foreach (var item in cart)
                {
                    items += item.Product.Name + ", Qty: " + item.Quantity + "," + " $" + item.Product.Price.ToString("0.00") + ",";
                }

                freightQuote.Items = items;
                freightQuote.TotalAmount = order.OrderSubtotalInclTax;

                _freigthQuoteService.InsertFreightQuote(freightQuote);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
            }
        }

        [HttpPost]
        public virtual IActionResult SendEmailOrderCompletedWasPaid(string email)
        {
            try
            {
                var cart = _shoppingCartService.GetShoppingCart(_workContext.CurrentCustomer, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id);

                if (!cart.Any())
                    return RedirectToRoute("Home");

                var order = new Order();
                order.StoreId = _storeContext.CurrentStore.Id;
                order.CustomerId = _workContext.CurrentCustomer.Id;

                order.BillingAddress = new Address();
                order.BillingAddress = _workContext.CurrentCustomer.BillingAddress;
                if (_workContext.CurrentCustomer.IsGuest())
                    order.BillingAddress.PhoneNumber = _workContext.CurrentCustomer.BillingAddress.PhoneNumber;
                else
                    order.BillingAddress.PhoneNumber = _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.PhoneAttribute);

                order.BillingAddress.Company = string.IsNullOrEmpty(order.BillingAddress.Company) ?
                    _genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer, NopCustomerDefaults.CompanyAttribute) :
                    order.BillingAddress.Company;
                order.CurrencyRate = 1;
                order.CustomerCurrencyCode = _workContext.WorkingCurrency.CurrencyCode;

                foreach (var item in cart)
                {
                    if (item.Product.DiscountProductMappings.Any())
                    {
                        var discountMapping = item.Product.DiscountProductMappings.FirstOrDefault();
                        order.OrderDiscount += discountMapping.Discount.DiscountAmount;
                    }

                    order.OrderItems.Add(new OrderItem
                    {
                        UnitPriceInclTax = item.Product.Price,
                        UnitPriceExclTax = item.Product.Price,
                        PriceInclTax = item.Product.Price * item.Quantity - (item.Quantity * order.OrderDiscount),
                        PriceExclTax = item.Product.Price * item.Quantity - (item.Quantity * order.OrderDiscount),
                        Product = item.Product,
                        ProductId = item.ProductId,
                        Quantity = item.Quantity
                    });
                }


                order.OrderSubtotalInclTax = order.OrderItems.Sum(x => x.PriceInclTax);
                order.OrderSubtotalExclTax = order.OrderItems.Sum(x => x.PriceExclTax);
                //order.OrderTotal = 0;
                //order.OrderShippingInclTax = 0;
                //order.OrderSubTotalDiscountInclTax = 0;
                //  notifications Sends Freigh Quote message to a Nop Admin
                var result = _workflowMessageService.SendEmailFreightQuote(order, cart, _localizationSettings.DefaultAdminLanguageId,null, null, null, null, null, null,null,null);

                return Json(new { Result = result });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Content(exc.Message);
            }
        }

        private void CreateTransactionInvoice(List<Invoice> invoice, int orderId, decimal total)
        {
            try
            {
                var InvoiceTransaction = new Nop.Core.Domain.Invoice.InvoiceTransaction();
                InvoiceTransaction.ValuePay = total;
                InvoiceTransaction.TotalCreditCardPay = orderId;
                InvoiceTransaction.CustomerDepositeApply = "";
                InvoiceTransaction.InvoiceApply = JsonConvert.SerializeObject(invoice);
                InvoiceTransaction.CreatedDate = DateTime.Now;
                _invoiceService.InsertInvoiceTransaction(InvoiceTransaction);
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc);
            }
        }

        [HttpPost]
        public virtual IActionResult ValidEmailCustomer(string email)
        {
            try
            {
                bool IsAccountCustomer = false;
                bool IsNewAccount = false;
                if (_workContext.CurrentCustomer.IsGuest())
                {
                    var validEmail = _customerService.GetCustomerByEmail(email);
                    if (validEmail != null)
                    {
                        if (validEmail.NetsuitId != 0)
                        {
                            IsAccountCustomer = true;

                            var customerExist = _customerRegistrationService.ValidateEmailExist(email);
                            if (customerExist != null)
                            {
                                // Validate if Password exist
                                var customerPasswordExist = _customerService.GetCurrentPassword(customerExist.Id);

                                // Netsuit Exist 
                                if (customerExist.NetsuitId != 0)
                                {
                                    // Exist Password
                                    if (customerPasswordExist == null)
                                    {
                                        IsNewAccount = true;
                                    }
                                }
                            }
                        }
                    }
                }
                    return Json(new { Result = IsAccountCustomer, newAccount= IsNewAccount });
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc, _workContext.CurrentCustomer);
                return Content(exc.Message);
            }
        }

        
        #endregion
    }
}
