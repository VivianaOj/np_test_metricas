using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nop.Core;
using Nop.Core.Domain.Catalog;
using Nop.Core.Domain.Common;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Core.Domain.Shipping;
using Nop.Core.Domain.Tax;
using Nop.Core.Domain.Vendors;
using Nop.Services.Catalog;
using Nop.Services.Configuration;
using Nop.Services.Customers;
using Nop.Services.Directory;
using Nop.Services.Helpers;
using Nop.Services.Invoices;
using Nop.Services.Localization;
using Nop.Services.Media;
using Nop.Services.Orders;
using Nop.Services.Payments;
using Nop.Services.Seo;
using Nop.Services.Shipping;
using Nop.Services.Shipping.NNBoxGenerator;
using Nop.Services.Vendors;
using Nop.Web.Models.Common;
using Nop.Web.Models.Order;
using static Nop.Web.Models.Order.ShipmentDetailsModel;

namespace Nop.Web.Factories
{
    /// <summary>
    /// Represents the order model factory
    /// </summary>
    public partial class OrderModelFactory : IOrderModelFactory
    {
        #region Fields

        private readonly AddressSettings _addressSettings;
        private readonly CatalogSettings _catalogSettings;
        private readonly IAddressModelFactory _addressModelFactory;
        private readonly ICountryService _countryService;
        private readonly ICurrencyService _currencyService;
        private readonly IDateTimeHelper _dateTimeHelper;
        private readonly IDownloadService _downloadService;
        private readonly ILocalizationService _localizationService;
        private readonly IOrderProcessingService _orderProcessingService;
        private readonly IOrderService _orderService;
        private readonly IOrderTotalCalculationService _orderTotalCalculationService;
        private readonly IPaymentPluginManager _paymentPluginManager;
        private readonly IPaymentService _paymentService;
        private readonly IPriceFormatter _priceFormatter;
        private readonly IProductService _productService;
        private readonly IRewardPointService _rewardPointService;
        private readonly IShipmentService _shipmentService;
        private readonly IStoreContext _storeContext;
        private readonly IUrlRecordService _urlRecordService;
        private readonly IVendorService _vendorService;
        private readonly IWorkContext _workContext;
        private readonly OrderSettings _orderSettings;
        private readonly PdfSettings _pdfSettings;
        private readonly RewardPointsSettings _rewardPointsSettings;
        private readonly ShippingSettings _shippingSettings;
        private readonly TaxSettings _taxSettings;
        private readonly VendorSettings _vendorSettings;
        private readonly IInvoiceService _invoiceService;
        private readonly IPictureService _pictureService;
        private readonly ICompanyService _companyServices;
        private readonly IShippingService _shippingServices;
        private readonly IBoxesGeneratorServices _boxPackingService;
        private readonly ISettingService _settingService;

        #endregion

        #region Ctor

        public OrderModelFactory(AddressSettings addressSettings,
            CatalogSettings catalogSettings,
            IAddressModelFactory addressModelFactory,
            ICountryService countryService,
            ICurrencyService currencyService,
            IDateTimeHelper dateTimeHelper,
            IDownloadService downloadService,
            ILocalizationService localizationService,
            IOrderProcessingService orderProcessingService,
            IOrderService orderService,
            IOrderTotalCalculationService orderTotalCalculationService,
            IPaymentPluginManager paymentPluginManager,
            IPaymentService paymentService,
            IPriceFormatter priceFormatter,
            IProductService productService,
            IRewardPointService rewardPointService,
            IShipmentService shipmentService,
            IStoreContext storeContext,
            IUrlRecordService urlRecordService,
            IVendorService vendorService,
            IWorkContext workContext,
            OrderSettings orderSettings,
            PdfSettings pdfSettings,
            RewardPointsSettings rewardPointsSettings,
            ShippingSettings shippingSettings,
            TaxSettings taxSettings,
            VendorSettings vendorSettings,
            IInvoiceService invoiceService, IPictureService pictureService, ICompanyService companyServices,
            IShippingService shippingServices, IBoxesGeneratorServices boxPackingService, ISettingService settingService)
        {
            _addressSettings = addressSettings;
            _catalogSettings = catalogSettings;
            _addressModelFactory = addressModelFactory;
            _countryService = countryService;
            _currencyService = currencyService;
            _dateTimeHelper = dateTimeHelper;
            _downloadService = downloadService;
            _localizationService = localizationService;
            _orderProcessingService = orderProcessingService;
            _orderService = orderService;
            _orderTotalCalculationService = orderTotalCalculationService;
            _paymentPluginManager = paymentPluginManager;
            _paymentService = paymentService;
            _priceFormatter = priceFormatter;
            _productService = productService;
            _rewardPointService = rewardPointService;
            _shipmentService = shipmentService;
            _storeContext = storeContext;
            _urlRecordService = urlRecordService;
            _vendorService = vendorService;
            _workContext = workContext;
            _orderSettings = orderSettings;
            _pdfSettings = pdfSettings;
            _rewardPointsSettings = rewardPointsSettings;
            _shippingSettings = shippingSettings;
            _taxSettings = taxSettings;
            _vendorSettings = vendorSettings;
            _invoiceService = invoiceService;
            _pictureService = pictureService;
            _companyServices = companyServices;
            _shippingServices = shippingServices;
            _boxPackingService = boxPackingService;
            _settingService = settingService;
        }

        #endregion

        #region Methods

        /// <summary>
        /// Prepare the customer order list model
        /// </summary>
        /// <returns>Customer order list model</returns>
        public virtual CustomerOrderListModel PrepareCustomerOrderListModel()
        {
            var model = new CustomerOrderListModel();
            List<Company> ChildCompanies = new List<Company>();
          

            IList <Order> orders = new List<Order>();
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    var CompanyInfoInfo = _workContext.CurrentCustomer.CompanyCustomerMappings.Where(r => r.DefaultCompany == true && r.Active).FirstOrDefault();
                    var CompanyInfo = _workContext.WorkingCompany.Id;
                    var NetsuiteId = _workContext.WorkingCompany.NetsuiteId;

                    if (CompanyInfoInfo != null)
                    {
                        CompanyInfo = CompanyInfoInfo.CompanyId;
                        NetsuiteId = CompanyInfoInfo.Company.NetsuiteId;
                    }
                    orders = _orderService.OverriddenSearchOrders(storeId: _storeContext.CurrentStore.Id, 0, customerId: _workContext.CurrentCustomer.Id, companyId: CompanyInfo, getCompanyOrdersAssociatedToCustomer: true);

                    ChildCompanies = _companyServices.GetCompanyChildByParentId(Convert.ToInt32(NetsuiteId)).ToList();
                    
                    if (ChildCompanies.Count > 0) 
                        model.ChildList.Add(new SelectListItem(string.Empty, string.Empty));

                    foreach (var item in ChildCompanies)
                    {
                        model.ChildList.Add(new SelectListItem(item.CompanyName, item.Id.ToString()));

                        foreach (var x in item.CompanyCustomerMappings)
                        {
                          var  ordersChild = _orderService.OverriddenSearchOrdersParent(storeId: _storeContext.CurrentStore.Id, 0, customerId: x.CustomerId, companyId: x.CompanyId, getCompanyOrdersAssociatedToCustomer: true);
                            
                            foreach (var y in ordersChild)
                            {
                                if(!orders.Contains(y))
                                    orders.Add(y);
                            }
                        }
                    }

                }
            }
            else
            {
                orders = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id, customerId: _workContext.CurrentCustomer.Id);
            }

            


            foreach (var order in orders)
            {
                //var CompanyId = 0;
                //if (order.CompanyId != null)
                //    CompanyId = Convert.ToInt32(order.CompanyId);

                //var invoice = _invoiceService.GetInvoicesByCustomerOrderId(CompanyId, order.Id);
                //var invoiceId = "0";
                //if (invoice != null)
                //    invoiceId = invoice.InvoiceNo;


                var invoiceNum = "";
                var invoice = _invoiceService.GetInvoicesByCustomerOrderId(order.CustomerId, order.Id);

                if (invoice == null)
                    invoice = _invoiceService.GetInvoicesByCustomerOrderId(Convert.ToInt32(order.CompanyId), order.Id);

                if (invoice == null)
                {
                    if (order.CompanyId != null && order.CompanyId != 6633)
                    {
                        var CompanyId = _companyServices.GetCompanyById(Convert.ToInt32(order.CompanyId));
                        if(CompanyId!=null)
                            invoice = _invoiceService.GetInvoicesByCustomerOrderId(Convert.ToInt32(CompanyId.NetsuiteId), order.Id);
                    }
                }

                if (invoice != null)
                    invoiceNum = invoice.InvoiceNo;

                model.AccountCustomer = _workContext.CurrentCustomer.NetsuitId != 0;
                var shippingMethod = order.ShippingMethod;

                if (order.ShippingMethod == "Customer Pick Up" || order.ShippingMethod.Contains("customer_pickup"))
                {
                    if (order.PickupAddress?.Address1 == _localizationService.GetResource("atlanta.office.address"))
                    {
                        shippingMethod = "Pickup at " + _localizationService.GetResource("atlanta.office");
                    }
                    if (order.PickupAddress?.Address1 == _localizationService.GetResource("cincinnati.office.address"))
                    {
                        shippingMethod = "Pickup at " + _localizationService.GetResource("cincinnati.office");
                    }
                    if (order.PickupAddress?.Address1 == _localizationService.GetResource("nashville.office.address"))
                    {
                        shippingMethod = "Pickup at " + _localizationService.GetResource("nashville.office");
                    }
                }
                var orderModel = new CustomerOrderListModel.OrderDetailsModel
                {
                    Id = order.Id,
                    CreatedOn = _dateTimeHelper.ConvertToUserTime(order.CreatedOnUtc, DateTimeKind.Utc),
                    OrderStatusEnum = order.OrderStatus,
                    OrderStatus = _localizationService.GetLocalizedEnum(order.OrderStatus),
                    PaymentStatus = _localizationService.GetLocalizedEnum(order.PaymentStatus),
                    ShippingStatus = _localizationService.GetLocalizedEnum(order.ShippingStatus),
                    IsReturnRequestAllowed = _orderProcessingService.IsReturnRequestAllowed(order),
                    CustomOrderNumber = order.CustomOrderNumber,
                    TransId = order.tranId,
                    OrderProducts = order.OrderItems.Count,
                    InvoiceNumber = invoiceNum,
                    CustomerEmail = order.Customer.Email,
                    CompanyId = order.CompanyId.ToString(),
                    PONumber = order.PO?.ToString(),
                    CompanyName = _companyServices.GetCompanyById(Convert.ToInt32(order.CompanyId))?.CompanyName,
                    ShippingMethod = shippingMethod,
                    NNDeliveryDate = order.NNDeliveryDate
                };

                var orderTotalInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderTotal, order.CurrencyRate);
                // orderModel.OrderTotal = _priceFormatter.FormatPrice(orderTotalInCustomerCurrency, true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage);
               
                //orderModel.OrderTotal = orderTotalInCustomerCurrency.ToString("G15");
                var total2 = Math.Truncate(orderTotalInCustomerCurrency * 100) / 100;

                orderModel.OrderTotal = total2.ToString();

                model.Orders.Add(orderModel);

                // InvoiceOrder
                var invoicerOrder = _invoiceService.GetInvoicesByCustomerOrderId(_workContext.CurrentCustomer.Id, order.Id);
                if (invoicerOrder != null)
                {
                    order.CustomOrderNumber = invoicerOrder.InvoiceNo;
                }

                // Shipping Status
                var shipments = _shipmentService.GetShipmentByOrderId(order.Id);

                if (shipments.Count > 0)
                {
                    //prepare model
                    orderModel.ShipmentDetails = PrepareShipmentDetailsModel(shipments.FirstOrDefault(), false);

                    if (orderModel.ShipmentDetails != null)
                    {
                        orderModel.ShippingStatus = string.IsNullOrEmpty(orderModel.ShippingStatus) ? ShippingStatus.NotYetShipped.ToString() : orderModel.ShippingStatus;

                        var shipmentStatusEvents = orderModel.ShipmentDetails.ShipmentStatusEvents.FirstOrDefault();
                        if (shipmentStatusEvents != null)
                        {
                            orderModel.ShippingStatus = GetShippingEvent(shipmentStatusEvents.EventName);
                        }
                    }
                }

            }

            var recurringPayments = _orderService.SearchRecurringPayments(_storeContext.CurrentStore.Id,
                _workContext.CurrentCustomer.Id);

            foreach (var recurringPayment in recurringPayments)
            {
                var recurringPaymentModel = new CustomerOrderListModel.RecurringOrderModel
                {
                    Id = recurringPayment.Id,
                    StartDate = _dateTimeHelper.ConvertToUserTime(recurringPayment.StartDateUtc, DateTimeKind.Utc).ToString(),
                    CycleInfo = $"{recurringPayment.CycleLength} {_localizationService.GetLocalizedEnum(recurringPayment.CyclePeriod)}",
                    NextPayment = recurringPayment.NextPaymentDate.HasValue ? _dateTimeHelper.ConvertToUserTime(recurringPayment.NextPaymentDate.Value, DateTimeKind.Utc).ToString() : "",
                    TotalCycles = recurringPayment.TotalCycles,
                    CyclesRemaining = recurringPayment.CyclesRemaining,
                    InitialOrderId = recurringPayment.InitialOrder.Id,
                    InitialOrderNumber = recurringPayment.InitialOrder.CustomOrderNumber,
                    CanCancel = _orderProcessingService.CanCancelRecurringPayment(_workContext.CurrentCustomer, recurringPayment),
                    CanRetryLastPayment = _orderProcessingService.CanRetryLastRecurringPayment(_workContext.CurrentCustomer, recurringPayment)
                };

                model.RecurringOrders.Add(recurringPaymentModel);
            }


            // PaymentStatusList
            model.PaymentStatusList.Add(new SelectListItem(string.Empty, string.Empty));

            if (_workContext.CurrentCustomer.NetsuitId == 0)
            {
                model.PaymentStatusList.Add(new SelectListItem("Paid", PaymentStatus.Paid.ToString()));
            }
            else
            {
                model.PaymentStatusList.Add(new SelectListItem("Paid", PaymentStatus.Paid.ToString()));
                model.PaymentStatusList.Add(new SelectListItem("UnPaid", PaymentStatus.Pending.ToString()));
            }

            // OrderStatusList
            model.OrderStatusList.Add(new SelectListItem(string.Empty, string.Empty));
            model.OrderStatusList.Add(new SelectListItem("Order Processing", OrderStatus.Pending.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Order Confirmed - Pending fulfillment", OrderStatus.Processing.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Order Confirmed - Billing/Partially Fulfilled", OrderStatus.BillingPartiallyFulfilled.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Order Confirmed - Pending Billing/Partially Fulfilled", OrderStatus.PartiallyFulfilled.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Order Confirmed - Partially Fulfilled", OrderStatus.PendingPartiallyFulfilled.ToString()));

            //model.OrderStatusList.Add(new SelectListItem("Ready for pickup", OrderStatus.ReadyPickup.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Ready for delivery", OrderStatus.ReadyDelivery.ToString()));
            //model.OrderStatusList.Add(new SelectListItem("Ready for UPS pickup", OrderStatus.ReadyUps.ToString()));
            model.OrderStatusList.Add(new SelectListItem(OrderStatus.Complete.ToString(), OrderStatus.Complete.ToString()));

            if (_workContext.CurrentCustomer.NetsuitId != 0)
            {
                model.OrderStatusList.Add(new SelectListItem("Completed and Billed", OrderStatus.CompletedBilled.ToString()));
                //model.OrderStatusList.Add(new SelectListItem("Close", OrderStatus.Closed.ToString()));

            }
            model.OrderStatusList.Add(new SelectListItem(OrderStatus.Cancelled.ToString(), OrderStatus.Cancelled.ToString()));

            return model;
        }

        /// <summary>
        /// Prepare the order details model
        /// </summary>
        /// <param name="order">Order</param>
        /// <returns>Order details model</returns>
        public virtual OrderDetailsModel PrepareOrderDetailsModel(Order order)
        {
            if (order == null)
                throw new ArgumentNullException(nameof(order));
            
            var invoiceNum = "";
            var invoice = _invoiceService.GetInvoicesByCustomerOrderId(order.CustomerId, order.Id);

            if(invoice==null)
                invoice = _invoiceService.GetInvoicesByCustomerOrderId(Convert.ToInt32(order.CompanyId), order.Id);

            if (invoice == null)
            {
                if (order.CompanyId != null && order.CompanyId!= 6633)
                {
                    var CompanyId = _companyServices.GetCompanyById(Convert.ToInt32(order.CompanyId));
                    invoice = _invoiceService.GetInvoicesByCustomerOrderId(Convert.ToInt32(CompanyId.NetsuiteId), order.Id);
                }
            }

            if (invoice != null)
                invoiceNum = invoice.InvoiceNo;

             var model = new OrderDetailsModel
            {
                Id = order.Id,
                CreatedOn = _dateTimeHelper.ConvertToUserTime(order.CreatedOnUtc, DateTimeKind.Utc),
                OrderStatus = _localizationService.GetLocalizedEnum(order.OrderStatus),
                IsReOrderAllowed = _orderSettings.IsReOrderAllowed,
                IsReturnRequestAllowed = _orderProcessingService.IsReturnRequestAllowed(order),
                PdfInvoiceDisabled = _pdfSettings.DisablePdfInvoicesForPendingOrders && order.OrderStatus == OrderStatus.Pending,
                CustomOrderNumber = order.CustomOrderNumber,
                TransId = order.tranId,
                InvoiceNumber= invoiceNum,

                //WebAccount Validation
                IsGuest = _workContext.CurrentCustomer.NetsuitId == 0,

                //shipping info
                ShippingStatus = _localizationService.GetLocalizedEnum(order.ShippingStatus)
            };

            if (order.ShippingStatus != ShippingStatus.ShippingNotRequired)
            {
                model.IsShippable = true;
                model.PickupInStore = order.PickupInStore;
                if (!order.PickupInStore)
                {
                    _addressModelFactory.PrepareAddressModel(model.ShippingAddress,
                        address: order.ShippingAddress,
                        excludeProperties: false,
                        addressSettings: _addressSettings);
                }
                else
                    if (order.PickupAddress != null)
                    model.PickupAddress = new AddressModel
                    {
                        Address1 = order.PickupAddress.Address1,
                        City = order.PickupAddress.City,
                        County = order.PickupAddress.County,
                        CountryName = order.PickupAddress.Country != null ? order.PickupAddress.Country.Name : string.Empty,
                        ZipPostalCode = order.PickupAddress.ZipPostalCode
                    };
                model.ShippingMethod = order.ShippingMethod;
                model.NNDeliveryDate = order.NNDeliveryDate;

                //shipments (only already shipped)
                var shipments2 = order.Shipments.Where(x => x.ShippedDateUtc.HasValue).OrderBy(x => x.CreatedOnUtc).ToList();
                
                foreach (var shipment in shipments2)
                {
                    var shipmentModel = new OrderDetailsModel.ShipmentBriefModel
                    {
                        Id = shipment.Id,
                        TrackingNumber = shipment.TrackingNumber,
                    };
                    if (shipment.ShippedDateUtc.HasValue)
                        shipmentModel.ShippedDate = _dateTimeHelper.ConvertToUserTime(shipment.ShippedDateUtc.Value, DateTimeKind.Utc);
                    if (shipment.DeliveryDateUtc.HasValue)
                        shipmentModel.DeliveryDate = _dateTimeHelper.ConvertToUserTime(shipment.DeliveryDateUtc.Value, DateTimeKind.Utc);
                    model.Shipments.Add(shipmentModel);
                }
            }

            //billing info
            _addressModelFactory.PrepareAddressModel(model.BillingAddress,
                address: order.BillingAddress,
                excludeProperties: false,
                addressSettings: _addressSettings);

            //Shipping info
            _addressModelFactory.PrepareAddressModel(model.ShippingAddress,
                address: order.ShippingAddress,
                excludeProperties: false,
                addressSettings: _addressSettings);
            //VAT number
            model.VatNumber = order.VatNumber;

            //payment method
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(order.PaymentMethodSystemName);
            model.PaymentMethod = paymentMethod != null ? _localizationService.GetLocalizedFriendlyName(paymentMethod, _workContext.WorkingLanguage.Id) : order.PaymentMethodSystemName;
            model.PaymentMethodStatus = _localizationService.GetLocalizedEnum(order.PaymentStatus);
            model.PaymentStatus = order.PaymentStatus;
            model.CanRePostProcessPayment = _paymentService.CanRePostProcessPayment(order);
            //custom values
            model.CustomValues = _paymentService.DeserializeCustomValues(order);

            //order subtotal
            if (order.CustomerTaxDisplayType == TaxDisplayType.IncludingTax && !_taxSettings.ForceTaxExclusionFromOrderSubtotal)
            {
                //including tax

                //order subtotal
                var orderSubtotalInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderSubtotalInclTax, order.CurrencyRate);
                // model.OrderSubtotal = _priceFormatter.FormatPrice(orderSubtotalInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);

                model.OrderSubtotal = orderSubtotalInclTaxInCustomerCurrency.ToString("G15");

                //var total2 = Math.Truncate(order.OrderSubtotalInclTax * 100) / 100;
                //model.OrderTotal = total2.ToString();

                //discount (applied to order subtotal)
                var orderSubTotalDiscountInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderSubTotalDiscountInclTax, order.CurrencyRate);
                if (orderSubTotalDiscountInclTaxInCustomerCurrency > decimal.Zero)
                    model.OrderSubTotalDiscount = _priceFormatter.FormatPrice(-orderSubTotalDiscountInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);
            }
            else
            {
                //excluding tax

                //order subtotal
                var orderSubtotalExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderSubtotalExclTax, order.CurrencyRate);
                //model.OrderSubtotal = _priceFormatter.FormatPrice(orderSubtotalExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);
                
                model.OrderSubtotal = orderSubtotalExclTaxInCustomerCurrency.ToString("G15");
                //var total2 = Math.Truncate(order.OrderSubtotalExclTax * 100) / 100;
                //model.OrderSubtotal = total2.ToString();


                // model.OrderSubtotal = orderSubtotalExclTaxInCustomerCurrency.ToString("0.00");
                //discount (applied to order subtotal)
                var orderSubTotalDiscountExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderSubTotalDiscountExclTax, order.CurrencyRate);
                if (orderSubTotalDiscountExclTaxInCustomerCurrency > decimal.Zero)
                    model.OrderSubTotalDiscount = _priceFormatter.FormatPrice(-orderSubTotalDiscountExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);
            }

            if (order.CustomerTaxDisplayType == TaxDisplayType.IncludingTax)
            {
                //including tax

                //order shipping
                var orderShippingInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderShippingInclTax, order.CurrencyRate);
                model.OrderShipping = _priceFormatter.FormatShippingPrice(orderShippingInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);
                //payment method additional fee
                var paymentMethodAdditionalFeeInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.PaymentMethodAdditionalFeeInclTax, order.CurrencyRate);
                if (paymentMethodAdditionalFeeInclTaxInCustomerCurrency > decimal.Zero)
                    model.PaymentMethodAdditionalFee = _priceFormatter.FormatPaymentMethodAdditionalFee(paymentMethodAdditionalFeeInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);
            }
            else
            {
                //excluding tax

                //order shipping
                var orderShippingExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderShippingExclTax, order.CurrencyRate);
                model.OrderShipping = _priceFormatter.FormatShippingPrice(orderShippingExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);
                //payment method additional fee
                var paymentMethodAdditionalFeeExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.PaymentMethodAdditionalFeeExclTax, order.CurrencyRate);
                if (paymentMethodAdditionalFeeExclTaxInCustomerCurrency > decimal.Zero)
                    model.PaymentMethodAdditionalFee = _priceFormatter.FormatPaymentMethodAdditionalFee(paymentMethodAdditionalFeeExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);
            }

            //tax
            var displayTax = true;
            var displayTaxRates = true;
            if (_taxSettings.HideTaxInOrderSummary && order.CustomerTaxDisplayType == TaxDisplayType.IncludingTax)
            {
                displayTax = false;
                displayTaxRates = false;
            }
            else
            {
                if (order.OrderTax == 0 && _taxSettings.HideZeroTax)
                {
                    displayTax = false;
                    displayTaxRates = false;
                }
                else
                {
                    var taxRates = _orderService.ParseTaxRates(order, order.TaxRates);
                    displayTaxRates = _taxSettings.DisplayTaxRates && taxRates.Any();
                    displayTax = !displayTaxRates;

                    var orderTaxInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderTax, order.CurrencyRate);
                    //TODO pass languageId to _priceFormatter.FormatPrice
                    model.Tax = _priceFormatter.FormatPrice(orderTaxInCustomerCurrency, true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage);

                    foreach (var tr in taxRates)
                    {
                        model.TaxRates.Add(new OrderDetailsModel.TaxRate
                        {
                            Rate = _priceFormatter.FormatTaxRate(tr.Key),
                            //TODO pass languageId to _priceFormatter.FormatPrice
                            Value = _priceFormatter.FormatPrice(_currencyService.ConvertCurrency(tr.Value, order.CurrencyRate), true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage),
                        });
                    }
                }
            }
            model.DisplayTaxRates = displayTaxRates;
            model.DisplayTax = displayTax;
            model.DisplayTaxShippingInfo = _catalogSettings.DisplayTaxShippingInfoOrderDetailsPage;
            model.PricesIncludeTax = order.CustomerTaxDisplayType == TaxDisplayType.IncludingTax;

            //discount (applied to order total)
            var orderDiscountInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderDiscount, order.CurrencyRate);
            model.OrderTotalDiscount = _priceFormatter.FormatPrice(-orderDiscountInCustomerCurrency, true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage);
            //if (orderDiscountInCustomerCurrency > decimal.Zero)

            //gift cards
            foreach (var gcuh in order.GiftCardUsageHistory)
            {
                model.GiftCards.Add(new OrderDetailsModel.GiftCard
                {
                    CouponCode = gcuh.GiftCard.GiftCardCouponCode,
                    Amount = _priceFormatter.FormatPrice(-(_currencyService.ConvertCurrency(gcuh.UsedValue, order.CurrencyRate)), true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage),
                });
            }

            //reward points           
            if (order.RedeemedRewardPointsEntry != null)
            {
                model.RedeemedRewardPoints = -order.RedeemedRewardPointsEntry.Points;
                model.RedeemedRewardPointsAmount = _priceFormatter.FormatPrice(-(_currencyService.ConvertCurrency(order.RedeemedRewardPointsEntry.UsedAmount, order.CurrencyRate)), true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage);
            }

            //total
            var orderTotalInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderTotal, order.CurrencyRate);
           
            //model.OrderTotal = _priceFormatter.FormatPrice(orderTotalInCustomerCurrency, true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage);
            model.OrderTotal = orderTotalInCustomerCurrency.ToString("G15");
           
            //var total = Math.Truncate(order.OrderTotal * 100) / 100;
            //model.OrderTotal = total.ToString();

            //checkout attributes
            model.CheckoutAttributeInfo = order.CheckoutAttributeDescription;

            //order notes
            foreach (var orderNote in order.OrderNotes
                .Where(on => on.DisplayToCustomer)
                .OrderByDescending(on => on.CreatedOnUtc)
                .ToList())
            {
                model.OrderNotes.Add(new OrderDetailsModel.OrderNote
                {
                    Id = orderNote.Id,
                    HasDownload = orderNote.DownloadId > 0,
                    Note = _orderService.FormatOrderNoteText(orderNote),
                    CreatedOn = _dateTimeHelper.ConvertToUserTime(orderNote.CreatedOnUtc, DateTimeKind.Utc)
                });
            }

            //purchased products
            model.ShowSku = _catalogSettings.ShowSkuOnProductDetailsPage;
            model.ShowVendorName = _vendorSettings.ShowVendorOnOrderDetailsPage;

            var orderItems = order.OrderItems;

            var vendors = _vendorSettings.ShowVendorOnOrderDetailsPage ? _vendorService.GetVendorsByIds(orderItems.Select(item => item.Product.VendorId).ToArray()) : new List<Vendor>();

            foreach (var orderItem in orderItems)
            {
                var orderItemPicture = _pictureService.GetProductPicture(orderItem.Product, orderItem.AttributesXml);
                var PictureThumbnailUrl = _pictureService.GetPictureUrl(orderItemPicture, 100);


                var orderItemModel = new OrderDetailsModel.OrderItemModel
                {
                    Id = orderItem.Id,
                    OrderItemGuid = orderItem.OrderItemGuid,
                    Sku = _productService.FormatSku(orderItem.Product, orderItem.AttributesXml),
                    VendorName = vendors.FirstOrDefault(v => v.Id == orderItem.Product.VendorId)?.Name ?? string.Empty,
                    ProductId = orderItem.Product.Id,
                    ProductName = _localizationService.GetLocalized(orderItem.Product, x => x.Name),
                    ProductSeName = _urlRecordService.GetSeName(orderItem.Product),
                    Quantity = orderItem.Quantity,
                    AttributeInfo = orderItem.AttributeDescription,
                    picture = PictureThumbnailUrl,
                    Published = orderItem.Product.Published,
                    Discount = orderItem.DiscountAmountExclTax
                };
                //rental info
                if (orderItem.Product.IsRental)
                {
                    var rentalStartDate = orderItem.RentalStartDateUtc.HasValue
                        ? _productService.FormatRentalDate(orderItem.Product, orderItem.RentalStartDateUtc.Value) : "";
                    var rentalEndDate = orderItem.RentalEndDateUtc.HasValue
                        ? _productService.FormatRentalDate(orderItem.Product, orderItem.RentalEndDateUtc.Value) : "";
                    orderItemModel.RentalInfo = string.Format(_localizationService.GetResource("Order.Rental.FormattedDate"),
                        rentalStartDate, rentalEndDate);
                }
                model.Items.Add(orderItemModel);

                //unit price, subtotal
                if (order.CustomerTaxDisplayType == TaxDisplayType.IncludingTax)
                {
                    //including tax
                    var unitPriceInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(orderItem.UnitPriceInclTax, order.CurrencyRate);
                    orderItemModel.UnitPrice = _priceFormatter.FormatPrice(unitPriceInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);

                    var priceInclTaxInCustomerCurrency = _currencyService.ConvertCurrency(orderItem.PriceInclTax, order.CurrencyRate);
                    orderItemModel.SubTotal = _priceFormatter.FormatPrice(priceInclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, true);
                }
                else
                {
                    //excluding tax
                    var unitPriceExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(orderItem.UnitPriceExclTax, order.CurrencyRate);
                    orderItemModel.UnitPrice = _priceFormatter.FormatPrice(unitPriceExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);

                    var priceExclTaxInCustomerCurrency = _currencyService.ConvertCurrency(orderItem.PriceExclTax, order.CurrencyRate);
                    orderItemModel.SubTotal = _priceFormatter.FormatPrice(priceExclTaxInCustomerCurrency, true, order.CustomerCurrencyCode, _workContext.WorkingLanguage, false);
                }

                //downloadable products
                if (_downloadService.IsDownloadAllowed(orderItem))
                    orderItemModel.DownloadId = orderItem.Product.DownloadId;
                if (_downloadService.IsLicenseDownloadAllowed(orderItem))
                    orderItemModel.LicenseId = orderItem.LicenseDownloadId.HasValue ? orderItem.LicenseDownloadId.Value : 0;
            }

            // InvoiceOrder
            var invoicerOrder = _invoiceService.GetInvoicesByCustomerOrderId(_workContext.CurrentCustomer.Id, order.Id);
            if (invoicerOrder != null)
            {
                model.CustomOrderNumber = invoicerOrder.InvoiceNo;
            }

            // Shipping Status
            var shipments = _shipmentService.GetShipmentByOrderId(order.Id);

            if (shipments.Count > 0)
            {
                //prepare model
                model.ShipmentDetails = PrepareShipmentDetailsModel(shipments.FirstOrDefault(), false);

                if (model.ShipmentDetails != null)
                {
                    model.ShippingStatus = string.IsNullOrEmpty(model.ShippingStatus) ? ShippingStatus.NotYetShipped.ToString() : model.ShippingStatus;

                    var shipmentStatusEvents = model.ShipmentDetails.ShipmentStatusEvents.FirstOrDefault();
                    if (shipmentStatusEvents != null)
                    {
                        model.ShippingStatus = GetShippingEvent(shipmentStatusEvents.EventName);
                    }
                }
            }


            //NN Box Generator
            var GetBoxGenerator = _shippingServices.GetBoxByOrder(order.Id, order.CustomerId);
            
            foreach (var item in GetBoxGenerator)
            {
                var BoxInfo = new BSBox();

                if (item.Container != null)
                    if (item.Container?.ID != 0)
                        BoxInfo = _shippingServices.GetBoxById(item.Container.ID);

                var BoxContentWeight = item.PercentItemWeightPacked + BoxInfo.WeigthBox;
                var Products = new List<ItemProductSummary>();

                if (item.IsAsShip)
                {
                    var productBox =  _boxPackingService.GetBSItemPackList(item.Id);
                    var ProductsGroup = productBox.GroupBy(r => r.ProductId);

                    foreach (var prod in ProductsGroup)
                    {
                        var product = _productService.GetProductById(prod.Key);
                        if (product != null)
                        {
                            var ProductItem = new ItemProductSummary();
                            ProductItem.Id = product.Id;
                            ProductItem.ProductName = product.Name;
                            ProductItem.Sku = product.Sku;
                            ProductItem.Quantity = prod.Count();
                            ProductItem.Weight = product.Weight;
                            Products.Add(ProductItem);
                        }
                    }
                    //var product = _productServices.GetProductById(BoxGenerator.Id);

                }
                else
                {
                    var ProductsGroup = item.PackedItems.GroupBy(r => r.ID);

                    foreach (var r in ProductsGroup)
                    {
                        var product = _productService.GetProductById(r.Key);
                        if (product != null)
                        {
                            var ProductItem = new ItemProductSummary();
                            ProductItem.Id = product.Id;
                            ProductItem.ProductName = product.Name;
                            ProductItem.Sku = product.Sku;
                            ProductItem.Quantity = r.Count();
                            ProductItem.Weight = product.Weight;
                            Products.Add(ProductItem);
                        }
                    }

                }

                var BoxSize = BoxInfo?.Height + " in x " + BoxInfo?.Width + "in x " + BoxInfo?.Length + " in ";
                
                if (item.IsAsShip)
                {
                    BoxSize= item.Container.Height + " in x " + item.Container.Width + " in x " + item.Container.Length + " in ";
                }
                

                var DetailBox = new OrderDetailsModel.BoxGenerator {
                    BoxName = BoxInfo?.Name,
                    BoxSize = BoxSize,
                    BoxTotalWeight = Math.Round(item.PercentItemWeightPacked).ToString(),
                    BoxContentWeight = Math.Round(BoxContentWeight).ToString(),
                    OwnBox = item.IsAsShip,
                    items = Products
                };

                model.BoxGeneratorList.Add(DetailBox);
            }
            
            return model;
        }

        /// <summary>
        /// Prepare the shipment details model
        /// </summary>
        /// <param name="shipment">Shipment</param>
        /// <returns>Shipment details model</returns>
        public virtual ShipmentDetailsModel PrepareShipmentDetailsModel(Shipment shipment, bool prepareOrderDetails = true)
        {
            if (shipment == null)
                throw new ArgumentNullException(nameof(shipment));

            var order = shipment.Order;
            if (order == null)
                throw new Exception("order cannot be loaded");
            var model = new ShipmentDetailsModel
            {
                Id = shipment.Id
            };
            if (shipment.ShippedDateUtc.HasValue)
                model.ShippedDate = _dateTimeHelper.ConvertToUserTime(shipment.ShippedDateUtc.Value, DateTimeKind.Utc);
            if (shipment.DeliveryDateUtc.HasValue)
                model.DeliveryDate = _dateTimeHelper.ConvertToUserTime(shipment.DeliveryDateUtc.Value, DateTimeKind.Utc);

            //tracking number and shipment information
            if (!string.IsNullOrEmpty(shipment.TrackingNumber))
            {
                model.TrackingNumber = shipment.TrackingNumber;

                var shipmentTracker = _shipmentService.GetShipmentTracker(shipment);
                if (shipmentTracker != null)
                {
                    model.TrackingNumberUrl = shipmentTracker.GetUrl(shipment.TrackingNumber);
                    var shipmentStatusEventsEvent = shipmentTracker.GetShipmentEvents(shipment.TrackingNumber).FirstOrDefault();
                    var deliveryDetails = shipmentTracker.GetDeliveryDetails(shipment.TrackingNumber).Where(x => x.Type.Code == "02" || x.Type.Code == "03").FirstOrDefault();

                    if (shipmentStatusEventsEvent != null)
                    {
                        model.ShipmentStatusEvents.Add(new ShipmentStatusEventModel
                        {
                            Country = shipmentStatusEventsEvent.CountryCode,
                            Date = shipmentStatusEventsEvent.Date,
                            EventName = shipmentStatusEventsEvent.EventName,
                            Location = shipmentStatusEventsEvent.Location
                        });
                    }

                    if (deliveryDetails != null && !string.IsNullOrEmpty(deliveryDetails.Date))
                    {
                        var date = DateTime.ParseExact(deliveryDetails.Date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None);

                        if (date!=null)
                            model.DeliveryDateEstimate = date.ToString("D");
                    }

                    if (_shippingSettings.DisplayShipmentEventsToCustomers)
                    {
                        var shipmentEvents = shipmentTracker.GetShipmentEvents(shipment.TrackingNumber);
                        if (shipmentEvents != null)
                            foreach (var shipmentEvent in shipmentEvents)
                            {
                                var shipmentStatusEventModel = new ShipmentDetailsModel.ShipmentStatusEventModel();
                                var shipmentEventCountry = _countryService.GetCountryByTwoLetterIsoCode(shipmentEvent.CountryCode);
                                shipmentStatusEventModel.Country = shipmentEventCountry != null
                                    ? _localizationService.GetLocalized(shipmentEventCountry, x => x.Name) : shipmentEvent.CountryCode;
                                shipmentStatusEventModel.Date = shipmentEvent.Date;
                                shipmentStatusEventModel.EventName = shipmentEvent.EventName;
                                shipmentStatusEventModel.Location = shipmentEvent.Location;
                                model.ShipmentStatusEvents.Add(shipmentStatusEventModel);
                            }
                    }
                }
            }

            //products in this shipment
            model.ShowSku = _catalogSettings.ShowSkuOnProductDetailsPage;
            foreach (var shipmentItem in shipment.ShipmentItems)
            {
                var orderItem = _orderService.GetOrderItemById(shipmentItem.OrderItemId);
                if (orderItem == null)
                    continue;

                var shipmentItemModel = new ShipmentDetailsModel.ShipmentItemModel
                {
                    Id = shipmentItem.Id,
                    Sku = _productService.FormatSku(orderItem.Product, orderItem.AttributesXml),
                    ProductId = orderItem.Product.Id,
                    ProductName = _localizationService.GetLocalized(orderItem.Product, x => x.Name),
                    ProductSeName = _urlRecordService.GetSeName(orderItem.Product),
                    AttributeInfo = orderItem.AttributeDescription,
                    QuantityOrdered = orderItem.Quantity,
                    QuantityShipped = shipmentItem.Quantity,
                };
                //rental info
                if (orderItem.Product.IsRental)
                {
                    var rentalStartDate = orderItem.RentalStartDateUtc.HasValue
                        ? _productService.FormatRentalDate(orderItem.Product, orderItem.RentalStartDateUtc.Value) : "";
                    var rentalEndDate = orderItem.RentalEndDateUtc.HasValue
                        ? _productService.FormatRentalDate(orderItem.Product, orderItem.RentalEndDateUtc.Value) : "";
                    shipmentItemModel.RentalInfo = string.Format(_localizationService.GetResource("Order.Rental.FormattedDate"),
                        rentalStartDate, rentalEndDate);
                }
                model.Items.Add(shipmentItemModel);
            }

            //order details model
            if (prepareOrderDetails)
            {
                model.Order = PrepareOrderDetailsModel(order);
            }

            return model;
        }

        /// <summary>
        /// Prepare the customer reward points model
        /// </summary>
        /// <param name="page">Number of items page; pass null to load the first page</param>
        /// <returns>Customer reward points model</returns>
        public virtual CustomerRewardPointsModel PrepareCustomerRewardPoints(int? page)
        {
            //get reward points history
            var customer = _workContext.CurrentCustomer;
            var store = _storeContext.CurrentStore;
            var pageSize = _rewardPointsSettings.PageSize;
            var rewardPoints = _rewardPointService.GetRewardPointsHistory(customer.Id, store.Id, true, pageIndex: --page ?? 0, pageSize: pageSize);

            //prepare model
            var model = new CustomerRewardPointsModel();
            model.RewardPoints = rewardPoints.Select(historyEntry =>
            {
                var activatingDate = _dateTimeHelper.ConvertToUserTime(historyEntry.CreatedOnUtc, DateTimeKind.Utc);
                return new CustomerRewardPointsModel.RewardPointsHistoryModel
                {
                    Points = historyEntry.Points,
                    PointsBalance = historyEntry.PointsBalance.HasValue ? historyEntry.PointsBalance.ToString()
                        : string.Format(_localizationService.GetResource("RewardPoints.ActivatedLater"), activatingDate),
                    Message = historyEntry.Message,
                    CreatedOn = activatingDate,
                    EndDate = !historyEntry.EndDateUtc.HasValue ? null :
                        (DateTime?)_dateTimeHelper.ConvertToUserTime(historyEntry.EndDateUtc.Value, DateTimeKind.Utc)
                };
            }).ToList();

            model.PagerModel = new PagerModel
            {
                PageSize = rewardPoints.PageSize,
                TotalRecords = rewardPoints.TotalCount,
                PageIndex = rewardPoints.PageIndex,
                ShowTotalSummary = true,
                RouteActionName = "CustomerRewardPointsPaged",
                UseRouteLinks = true,
                RouteValues = new RewardPointsRouteValues { pageNumber = page ?? 0 }
            };

            //current amount/balance
            var rewardPointsBalance = _rewardPointService.GetRewardPointsBalance(customer.Id, _storeContext.CurrentStore.Id);
            var rewardPointsAmountBase = _orderTotalCalculationService.ConvertRewardPointsToAmount(rewardPointsBalance);
            var rewardPointsAmount = _currencyService.ConvertFromPrimaryStoreCurrency(rewardPointsAmountBase, _workContext.WorkingCurrency);
            model.RewardPointsBalance = rewardPointsBalance;
            model.RewardPointsAmount = _priceFormatter.FormatPrice(rewardPointsAmount, true, false);

            //minimum amount/balance
            var minimumRewardPointsBalance = _rewardPointsSettings.MinimumRewardPointsToUse;
            var minimumRewardPointsAmountBase = _orderTotalCalculationService.ConvertRewardPointsToAmount(minimumRewardPointsBalance);
            var minimumRewardPointsAmount = _currencyService.ConvertFromPrimaryStoreCurrency(minimumRewardPointsAmountBase, _workContext.WorkingCurrency);
            model.MinimumRewardPointsBalance = minimumRewardPointsBalance;
            model.MinimumRewardPointsAmount = _priceFormatter.FormatPrice(minimumRewardPointsAmount, true, false);

            return model;
        }

        private string GetShippingEvent(string shippingEvent)
        {
            TextInfo trackEvent = new CultureInfo("en-US", false).TextInfo;
            var shippingStatus = shippingEvent.Replace("plugins.shipping.tracker.", string.Empty);
            return trackEvent.ToTitleCase(shippingStatus);
        }


        #endregion
    }
}