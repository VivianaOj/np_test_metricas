using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using Nop.Core;
using Nop.Core.Domain.Common;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Invoice;
using Nop.Core.Domain.Invoices;
using Nop.Core.Domain.NN;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Core.Http.Extensions;
using Nop.Services.Common;
using Nop.Services.Configuration;
using Nop.Services.Customers;
using Nop.Services.Directory;
using Nop.Services.Invoices;
using Nop.Services.Localization;
using Nop.Services.Logging;
using Nop.Services.Messages;
using Nop.Services.NN;
using Nop.Services.Orders;
using Nop.Services.Payments;
using Nop.Services.Shipping;
using Nop.Web.Factories;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Mvc.Filters;
using Nop.Web.Framework.Security;
using Nop.Web.Models.Checkout;
using Nop.Web.Models.Customer;
using Nop.Web.Models.Order;


namespace Nop.Web.Controllers
{
    public partial class OrderController : BasePublicController
    {
        #region Fields

        private readonly IOrderModelFactory _orderModelFactory;
        private readonly IOrderProcessingService _orderProcessingService;
        private readonly IOrderService _orderService;
        private readonly IPaymentService _paymentService;
        private readonly IPdfService _pdfService;
        private readonly IShipmentService _shipmentService;
        private readonly IWebHelper _webHelper;
        private readonly IWorkContext _workContext;
        private readonly RewardPointsSettings _rewardPointsSettings;
        private readonly IInvoiceService _invoiceService;
        private readonly ICompanyService _companyService;
        private readonly OrderSettings _orderSettings;
        private readonly PaymentSettings _paymentSettings;
        private readonly IPaymentPluginManager _paymentPluginManager;
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly ICheckoutModelFactory _checkoutModelFactory;
        private readonly ISettingService _settingService;
        private readonly ICustomerAuthorizeNetService _customerAuthorizeNetService;
        private readonly IStoreContext _storeContext;
        private readonly ILogger _logger;
        private readonly IStateProvinceService _stateProvinceService;
        private readonly ICountryService _countryService;
        private readonly ICustomerAccountCreditApplyService _creditApply;
        private readonly IInvoicePaymentService _InvoicePayment;
        private readonly ILocalizationService _localizationService;
        private readonly IWorkflowMessageService _workflowMessageService;
        private readonly IAddressService _addressService;
        private IPendingDataToSyncService _pendingDataToSyncService;

        #endregion

        #region Ctor

        public OrderController(IOrderModelFactory orderModelFactory,
            IOrderProcessingService orderProcessingService,
            IOrderService orderService,
            IPaymentService paymentService,
            IPdfService pdfService,
            IShipmentService shipmentService,
            IWebHelper webHelper,
            IWorkContext workContext,
            ILogger logger,
            IStoreContext storeContext,
            ICustomerAccountCreditApplyService creditApply,
             IInvoicePaymentService InvoicePayment,
            RewardPointsSettings rewardPointsSettings,
             IStateProvinceService stateProvinceService,
             ICountryService countryService,
             IAddressService addressService,
             ILocalizationService localizationService, IWorkflowMessageService workflowMessageService,
            IInvoiceService invoiceService, ICompanyService companyService, OrderSettings orderSettings,
            PaymentSettings paymentSettings, IPaymentPluginManager paymentPluginManager, IGenericAttributeService genericAttributeService
            , ICheckoutModelFactory checkoutModelFactory, ISettingService settingService, ICustomerAuthorizeNetService customerAuthorizeNetService,
            IPendingDataToSyncService pendingDataToSyncService)
        {
            _countryService = countryService;
            _stateProvinceService = stateProvinceService;
            _orderModelFactory = orderModelFactory;
            _orderProcessingService = orderProcessingService;
            _orderService = orderService;
            _paymentService = paymentService;
            _pdfService = pdfService;
            _shipmentService = shipmentService;
            _webHelper = webHelper;
            _workContext = workContext;
            _rewardPointsSettings = rewardPointsSettings;
            _invoiceService = invoiceService;
            _companyService = companyService;
            _orderSettings = orderSettings;
            _paymentSettings = paymentSettings;
            _paymentPluginManager = paymentPluginManager;
            _genericAttributeService = genericAttributeService;
            _checkoutModelFactory = checkoutModelFactory;
            _settingService = settingService;
            _customerAuthorizeNetService = customerAuthorizeNetService;
            _storeContext = storeContext;
            _logger = logger;
            _creditApply = creditApply;
            _InvoicePayment = InvoicePayment;
            _localizationService = localizationService;
            _workflowMessageService = workflowMessageService;
            _addressService = addressService;
            _pendingDataToSyncService = pendingDataToSyncService;

        }

        #endregion

        #region Methods

        //My account / Orders
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult CheckOrder(CustomerOrderListModel model)
        {
            if (_workContext.CurrentCustomer.IsRegistered())
                return RedirectToRoute("CustomerOrders");

            //  var model = _orderModelFactory.PrepareCustomerOrderListModel();


            model.IsGuest = _workContext.CurrentCustomer.NetsuitId == 0;

            return View(model);
        }

        [HttpPost, ActionName("CheckOrder")]
        [PublicAntiForgery]
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult CheckOrder(IFormCollection form)
        {
            CustomerOrderListModel order = new CustomerOrderListModel();
            if (_workContext.CurrentCustomer.IsRegistered())
                return RedirectToRoute("CustomerOrders");

            if (string.IsNullOrEmpty(form["CustomerEmail"]))
                order.WarningMessages = "Invalid Email";

            if (string.IsNullOrEmpty(form["order"]))
                order.WarningMessages = "Invalid order";

            var model = _orderService.GetOrderByEmail(form["CustomerEmail"], form["order"]);
            if (model.Count > 0)
            {
                var orderDetail = _orderModelFactory.PrepareOrderDetailsModel(model.FirstOrDefault());

                return View("Details", orderDetail);
            }
            else
            {
                order.WarningMessages = "OrdenNoFound";
                return RedirectToRoute("CheckOrder", order);
            }

        }


        //My account / Orders
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult CustomerOrders()
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return RedirectToRoute("CheckOrder");

            var model = _orderModelFactory.PrepareCustomerOrderListModel();

            foreach (var order in model.Orders)
            {
                order.CustomOrderNumber = string.IsNullOrEmpty(order.CustomOrderNumber) ? "Pending for generate" : order.CustomOrderNumber;
                var invoicerOrder = _invoiceService.GetInvoicesByCustomerOrderId(_workContext.CurrentCustomer.Id, order.Id);
                if (invoicerOrder != null)
                {
                    order.CustomOrderNumber = invoicerOrder.InvoiceNo;
                }
            }

            var WorkingCompanyId = 0;

            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = Convert.ToInt32(_workContext.WorkingCompany.Id);
                }
            }

            if (_workContext.CurrentCustomer.NetsuitId != 0)
            {
                var invoices = _invoiceService.GetInvoicesByCompanyId(WorkingCompanyId).ToList();

                foreach (var item in invoices)
                {
                    CustomerOrderListModel.InvoiceCompanyList companyInvoice = new CustomerOrderListModel.InvoiceCompanyList();
                    var Company = new Company();
                    Company = _companyService.GetCompanyByNetSuiteId(item.CompanyId).FirstOrDefault();

                    if (Company == null)
                        Company = _companyService.GetCompanyById(Convert.ToInt32(item.CompanyId));

                    companyInvoice.Invoice = item;
                    companyInvoice.Company = Company;
                    model.InvoiceList.Add(companyInvoice);
                }

            }

            model.IsGuest = _workContext.CurrentCustomer.NetsuitId == 0;

            return View(model);
        }

        [HttpPost, ActionName("CustomerOrders")]
        [PublicAntiForgery]
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult CustomerOrders(CustomerOrderListModel customerOderListModel)
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return RedirectToRoute("CheckOrder");

            var model = _orderModelFactory.PrepareCustomerOrderListModel();

            if (customerOderListModel.OrdersFilter.PaymentStatus != null)
            {
                model.Orders = model.Orders
                .Where(x => x.PaymentStatus == customerOderListModel.OrdersFilter.PaymentStatus)
                .ToList();
            }

            if (customerOderListModel.OrdersFilter.OrderStatus != null)
            {
                model.Orders = model.Orders
                .Where(x => x.OrderStatusEnum.ToString() == customerOderListModel.OrdersFilter.OrderStatus)
                .ToList();
            }

            if (customerOderListModel.OrdersFilter.CustomOrderNumber != null)
            {
                model.Orders = model.Orders
                .Where(x => x.CustomOrderNumber.Contains(customerOderListModel.OrdersFilter.CustomOrderNumber) ||
                (x.TransId != null && x.TransId.Contains(customerOderListModel.OrdersFilter.CustomOrderNumber)))
                .ToList();
            }

            if (customerOderListModel.OrdersFilter.CompanyId != null)
            {
                model.Orders = model.Orders
                .Where(x => x.CompanyId.Contains(customerOderListModel.OrdersFilter.CompanyId))
                .ToList();
            }

            return View(model);
        }

        [HttpPost, ActionName("CustomerOrders")]
        [PublicAntiForgery]
        [FormValueRequired("repost-payment-standard")]
        public virtual IActionResult RetryPayment(int orderId)
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return Challenge();

            return RedirectToRoute("RetryPayment", new { orderId = orderId });
        }

        //My account / Orders / Cancel recurring order
        [HttpPost, ActionName("CustomerOrders")]
        [PublicAntiForgery]
        [FormValueRequired(FormValueRequirement.StartsWith, "cancelRecurringPayment")]
        public virtual IActionResult CancelRecurringPayment(IFormCollection form)
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return Challenge();

            //get recurring payment identifier
            var recurringPaymentId = 0;
            foreach (var formValue in form.Keys)
                if (formValue.StartsWith("cancelRecurringPayment", StringComparison.InvariantCultureIgnoreCase))
                    recurringPaymentId = Convert.ToInt32(formValue.Substring("cancelRecurringPayment".Length));

            var recurringPayment = _orderService.GetRecurringPaymentById(recurringPaymentId);
            if (recurringPayment == null)
            {
                return RedirectToRoute("CustomerOrders");
            }

            if (_orderProcessingService.CanCancelRecurringPayment(_workContext.CurrentCustomer, recurringPayment))
            {
                var errors = _orderProcessingService.CancelRecurringPayment(recurringPayment);

                var model = _orderModelFactory.PrepareCustomerOrderListModel();
                model.RecurringPaymentErrors = errors;

                return View(model);
            }

            return RedirectToRoute("CustomerOrders");
        }

        //My account / Orders / Retry last recurring order
        [HttpPost, ActionName("CustomerOrders")]
        [PublicAntiForgery]
        [FormValueRequired(FormValueRequirement.StartsWith, "retryLastPayment")]
        public virtual IActionResult RetryLastRecurringPayment(IFormCollection form)
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return Challenge();

            //get recurring payment identifier
            var recurringPaymentId = 0;
            if (!form.Keys.Any(formValue => formValue.StartsWith("retryLastPayment", StringComparison.InvariantCultureIgnoreCase) &&
                int.TryParse(formValue.Substring(formValue.IndexOf('_') + 1), out recurringPaymentId)))
            {
                return RedirectToRoute("CustomerOrders");
            }

            var recurringPayment = _orderService.GetRecurringPaymentById(recurringPaymentId);
            if (recurringPayment == null)
                return RedirectToRoute("CustomerOrders");

            if (!_orderProcessingService.CanRetryLastRecurringPayment(_workContext.CurrentCustomer, recurringPayment))
                return RedirectToRoute("CustomerOrders");

            var errors = _orderProcessingService.ProcessNextRecurringPayment(recurringPayment);
            var model = _orderModelFactory.PrepareCustomerOrderListModel();
            model.RecurringPaymentErrors = errors.ToList();

            return View(model);
        }

        //My account / Reward points
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult CustomerRewardPoints(int? pageNumber)
        {
            if (!_workContext.CurrentCustomer.IsRegistered())
                return Challenge();

            if (!_rewardPointsSettings.Enabled)
                return RedirectToRoute("CustomerInfo");

            var model = _orderModelFactory.PrepareCustomerRewardPoints(pageNumber);
            return View(model);
        }

        //My account / Order details page
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult Details(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            var WorkingCompanyId = 0;
            bool orderIsChild = false;
            var NetsuiteId = 0;

            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = _workContext.WorkingCompany.Id;
                    NetsuiteId = Convert.ToInt32(_workContext.WorkingCompany.NetsuiteId);
                }
            }

            var ChildCompanies = _companyService.GetCompanyChildByParentId(NetsuiteId).ToList();

            foreach (var item in ChildCompanies)
            {
                if (item.Id == order.CompanyId)
                    orderIsChild = true;
            }
            //foreach (var companyItem in _workContext.CurrentCustomer.Companies)
            //{
            //    if (companyItem.Id == order.CompanyId)
            //        orderIsChild = true;
            //}

            if (!orderIsChild)
            {
                if (order == null || order.Deleted || (_workContext.CurrentCustomer.Id != order.CustomerId && (WorkingCompanyId != order.CompanyId)))
                    return Challenge();
            }


            var company = 0;
            if (order.CompanyId != null)
                company = Convert.ToInt32(order.CompanyId);

            if (!orderIsChild)
            {
                if ((WorkingCompanyId != company) && (company != 6633))
                    return RedirectToRoute("CustomerOrders");
            }


            var model = _orderModelFactory.PrepareOrderDetailsModel(order);

            return View(model);
        }

        //My account / Order details page / Print
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult PrintOrderDetails(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
                return Challenge();

            var model = _orderModelFactory.PrepareOrderDetailsModel(order);
            model.PrintMode = true;

            return View("Details", model);
        }

        //My account / Order details page / PDF invoice
        public virtual IActionResult GetPdfInvoice(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            if (order == null || order.Deleted) // || _workContext.CurrentCustomer.Id != order.CustomerId
                return Challenge();

            var orders = new List<Order>();
            orders.Add(order);
            byte[] bytes;
            using (var stream = new MemoryStream())
            {
                _pdfService.PrintOrdersToPdf(stream, orders, _workContext.WorkingLanguage.Id);
                bytes = stream.ToArray();
            }
            return File(bytes, MimeTypes.ApplicationPdf, $"order_{order.Id}.pdf");
        }

        //My account / Order details page / re-order
        public virtual IActionResult ReOrder(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            //if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
            //    return Challenge();

            var WorkingCompanyId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = _workContext.WorkingCompany.Id;
                }
            }

            if (order == null || order.Deleted || (_workContext.CurrentCustomer.Id != order.CustomerId && (WorkingCompanyId != order.CompanyId)))
                return Challenge();

            _orderProcessingService.ReOrder(order);
            return RedirectToRoute("ShoppingCart");
        }

        //My account / Order details page / Complete payment
        [HttpPost, ActionName("Details")]
        [PublicAntiForgery]
        [FormValueRequired("repost-payment")]
        public virtual IActionResult RePostPayment(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
                return Challenge();

            if (!_paymentService.CanRePostProcessPayment(order))
                return RedirectToRoute("OrderDetails", new { orderId = orderId });

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
            return RedirectToRoute("OrderDetails", new { orderId = orderId });
        }

        //My account / Order details page / Complete payment
        [HttpPost, ActionName("Details")]
        [PublicAntiForgery]
        [FormValueRequired("repost-payment-standard")]
        public virtual IActionResult ReTryPayment(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
                return Challenge();

            if (!_paymentService.CanRePostProcessPayment(order))
                return RedirectToRoute("OrderDetails", new { orderId = orderId });

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
            return RedirectToRoute("RetryPayment", new { orderId = orderId });
        }


        //My account / Order details page / Shipment details page
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult ShipmentDetails(int shipmentId)
        {
            var shipment = _shipmentService.GetShipmentById(shipmentId);
            if (shipment == null)
                return Challenge();

            var order = shipment.Order;
            if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
                return Challenge();

            var model = _orderModelFactory.PrepareShipmentDetailsModel(shipment);
            return View(model);
        }

        [HttpPost]
        public IActionResult OrderListToPay(string orderByPay)
        {
            OrderPaymentModel orderList = new OrderPaymentModel();
            List<string> tokens = orderByPay.Split(',').ToList();

            if (tokens.Count > 0)
            {

                foreach (var item in tokens)
                {
                    var order = _orderService.GetOrderById(Int32.Parse(item.ToString()));

                    if (order != null)
                    {
                        var company = new Company();

                        if (order.CompanyId != null)
                            company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));

                        var orderDetailModel = new OrderDetailsModel
                        {
                            Id = order.Id,
                            company = company.CompanyName,
                            InvoiceNumber = null,
                            OrderTotalPayList = order.OrderTotal,
                            CreatedOn = order.CreatedOnUtc,
                            PONumber = order.PO,
                            OrderItems = order.OrderItems.ToList(),
                            OrderShippingInclTax = order.OrderShippingInclTax

                        };
                        orderList.OrderDetailsModel.Add(orderDetailModel);
                    }

                }
            }

            return View(orderList);
        }

        public IActionResult OrderListToPay()
        {
            return RedirectToRoute("CheckOrder");
        }

        [HttpPost]
        public IActionResult InvoiceListToPay(string orderByPay)
        {
            InvoicePaymentModel orderList = new InvoicePaymentModel();

            var WorkingCompanyIdNetsuite = 0;
            var WorkingCompanyId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyIdNetsuite = Convert.ToInt32(_workContext.WorkingCompany.NetsuiteId);
                    WorkingCompanyId = Convert.ToInt32(_workContext.WorkingCompany.Id);
                }
            }

            var order = _orderService.GetOpenInvoice(WorkingCompanyId);

            if (_workContext.WorkingCompany.Parent_Id == 0)
            {
                var getParentChild = _companyService.GetCompanyChildByParentId(WorkingCompanyIdNetsuite);

                foreach (var x in getParentChild)
                {
                    var ChildInvoice = _orderService.GetOpenInvoice(Convert.ToInt32(x.Id));

                    foreach (var item in ChildInvoice)
                    {
                        if (item.PaymentStatusId != 30)
                        {
                            var company = new Company();

                            if (item.CompanyId != null)
                                company = _companyService.GetCompanyById(Convert.ToInt32(item.CompanyId));

                            if (company == null)
                                company = _companyService.GetCompanyByNetSuiteId(item.CompanyId).FirstOrDefault();

                            var orderDetailModel = new OrderDetailsModel
                            {
                                Id = item.Id,
                                company = company?.CompanyName,
                                InvoiceNumber = item.InvoiceNo,
                                OrderTotalPayList = item.Total,
                                foreignamountunpaid = item.foreignamountunpaid,
                                OrderStatus = item.StatusName,
                                AmountDue = item.AmountDue
                            };
                            orderList.OrderDetailsModel.Add(orderDetailModel);
                        }
                    }
                }
            }

            if (order.Count() > 0)
            {
                foreach (var item in order)
                {
                    if (item.PaymentStatusId != 30)
                    {

                        var company = new Company();
                        if (item.CompanyId != 0)
                            company = _companyService.GetCompanyById(Convert.ToInt32(item.CompanyId));
                        
                        if (company == null)
                            company = _companyService.GetCompanyByNetSuiteId(item.CompanyId).FirstOrDefault();

                        var orderItems = new List<OrderItem>();

                        if (item.SaleOrderId != 0)
                        {
                            orderItems = _orderService.GetOrderItemByOrderId(item.SaleOrderId).ToList();
                        }
                        var orderDetailModel = new OrderDetailsModel
                        {
                            Id = item.Id,
                            company = company?.CompanyName,
                            InvoiceNumber = item.InvoiceNo,
                            OrderTotalPayList = item.Total,
                            foreignamountunpaid = item.foreignamountunpaid,
                            OrderStatus = item.StatusName,
                            AmountDue = item.AmountDue,
                            OrderItems= orderItems
                        };
                        orderList.OrderDetailsModel.Add(orderDetailModel);
                    }
                }
            }
            return View(orderList);
        }





        public IActionResult InvoiceListToPay()
        {
            return RedirectToAction("Invoice", "Order");
        }

        public IActionResult OrderListToPayConfirm()
        {
            //validation
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();


            OrderPaymentModel orderList = new OrderPaymentModel();

            var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");
            if (processPaymentRequest != null)
            {

                List<string> tokens = processPaymentRequest.orders.Split(',').ToList();

                if (tokens.Count > 0)
                {
                    List<OrderConfirmModel> OrderConfirmList = new List<OrderConfirmModel>();
                    foreach (var item in tokens)
                    {
                        var order = _orderService.GetOrderById(Int32.Parse(item.ToString()));
                        var company = new Company();

                        if (order.CompanyId != null)
                            company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));



                        var orderDetailModel = new OrderDetailsModel
                        {
                            Id = order.Id,
                            company = company.CompanyName,
                            InvoiceNumber = null,
                            OrderTotalPayList = order.OrderTotal,
                            CreatedOn = order.CreatedOnUtc,
                            PONumber = order.PO,
                            OrderItems = order.OrderItems.ToList(),
                            OrderShippingInclTax = order.OrderShippingInclTax

                        };
                        var OrderConfirmModel = new OrderConfirmModel
                        {
                            Id = order.Id,
                            company = company.CompanyName,
                            InvoiceNumber = null,
                            OrderTotalPayList = order.OrderTotal,
                            CreatedOn = order.CreatedOnUtc,
                            PONumber = order.PO,
                            OrderShippingInclTax = order.OrderShippingInclTax,
                            Email = order.BillingAddress?.Email,
                            Name = order.BillingAddress?.FirstName + " " + order.BillingAddress?.LastName,
                            Address1 = order.BillingAddress?.Address1,
                            StateProvinceName = order.BillingAddress?.StateProvince?.Abbreviation,
                            ZipPostalCode = order.BillingAddress?.ZipPostalCode

                        };
                        OrderConfirmList.Add(OrderConfirmModel);


                        orderList.OrderDetailsModel.Add(orderDetailModel);
                    }
                    HttpContext.Session.Set("OrderConfirmModel", OrderConfirmList);
                }

            }
            else
            {
                return RedirectToRoute("CheckOrder");
            }

            //int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            //if (orderId == 0)
            //    return Challenge();

            //var order = _orderService.GetOrderById(orderId);

            //if (order == null || order.PaymentStatus != PaymentStatus.Pending)
            //    return Challenge();

            //if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
            //    return Challenge();

            //model
            var model = new CheckoutConfirmModel
            {
                OrderPaymentModel = orderList
                //terms of service
                //TermsOfServiceOnOrderConfirmPage = _orderSettings.TermsOfServiceOnOrderConfirmPage,
                // TermsOfServicePopup = _commonSettings.PopupForTermsOfServiceLinks
            };

            return View(model);

        }

        public IActionResult OrderListToPayStepPay()
        {
            return RedirectToRoute("CheckOrder");
        }

        [HttpPost]
        public IActionResult OrderListToPayStepPay(string orderByPay)
        {
            if (orderByPay == null)
                return Challenge();

            OrderPaymentModel orderList = new OrderPaymentModel();
            List<string> tokens = orderByPay.Split(',').ToList();

            if (tokens.Count > 0)
            {

                foreach (var item in tokens)
                {
                    var order = _orderService.GetOrderById(Int32.Parse(item.ToString()));
                    var company = new Company();

                    if (order.CompanyId != null)
                        company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));

                    var orderDetailModel = new OrderDetailsModel
                    {
                        Id = order.Id,
                        company = company.CompanyName,
                        InvoiceNumber = null,
                        OrderTotalPayList = order.OrderTotal,
                        CreatedOn = order.CreatedOnUtc,
                        PONumber = order.PO,
                        OrderItems = order.OrderItems.ToList(),
                        OrderShippingInclTax = order.OrderShippingInclTax

                    };
                    orderList.OrderDetailsModel.Add(orderDetailModel);
                }
            }

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            //load payment method
            var paymentMethodSystemName = _paymentSettings.DefaultPaymentMethod;
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return Challenge();

            //int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            //if (orderId == 0)
            //    return Challenge();

            // var order = _orderService.GetOrderById(orderId);

            //if (order == null || order.PaymentStatus != PaymentStatus.Pending)
            //    return Challenge();

            //if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
            //    return Challenge();

            //var WorkingCompanyId = 0;
            //if (_workContext.CurrentCustomer.Companies.Any())
            //{
            //    if (_workContext.WorkingCompany != null)
            //    {
            //        WorkingCompanyId = _workContext.WorkingCompany.Id;
            //    }
            //}

            //if (WorkingCompanyId != order.CompanyId)
            //    return RedirectToRoute("CustomerOrders");

            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            GetCreditCardSaved(model);

            orderList.CheckoutPaymentInfoModel = model;

            return View(orderList);
        }

        [HttpPost]
        public IActionResult InvoiceListToPayStepPay(string objectJson)
        {
            if (!string.IsNullOrEmpty(objectJson))
            {
                InvoiceModel myDeserializedClass = JsonConvert.DeserializeObject<InvoiceModel>(objectJson);

                if (objectJson == null)
                    return Challenge();

                OrderPaymentModel orderList = new OrderPaymentModel();
                List<string> tokens = objectJson.Split(',').ToList();

                decimal partialPayment = 0;

                if (myDeserializedClass.invoicesToPay.Count > 0)
                {

                    foreach (var item in myDeserializedClass.invoicesToPay)
                    {
                        if (!string.IsNullOrEmpty(item.OrderId))
                        {
                            var order = _orderService.GetInvoiceById(Int32.Parse(item.OrderId.ToString()));
                            var company = new Company();

                            //if (order.CompanyId != 0)
                            //    company = _companyService.GetCompanyByNetSuiteId(Convert.ToInt32(order.CompanyId)).FirstOrDefault();

                            //if (company == null)
                            //    company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));

                            if (order.CompanyId != null)
                                company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));

                            if (item.ValuePay == "NaN")
                                item.ValuePay = "0";
                            var orderDetailModel = new OrderDetailsModel
                            {
                                Id = order.Id,
                                company = company?.CompanyName,
                                InvoiceNumber = order.InvoiceNo,
                                OrderTotalPayList = order.Total,
                                foreignamountunpaid = order.foreignamountunpaid,
                                OrderStatus = order.StatusName,
                                OrderInvoiceId = order.SaleOrderId,
                                ValuePayInv = Convert.ToDecimal(item.ValuePay),

                            };
                            orderList.OrderDetailsModel.Add(orderDetailModel);

                            partialPayment += Convert.ToDecimal(item.ValuePay.ToString());
                        }
                    }
                }

                if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                    return Challenge();

                //load payment method
                var paymentMethodSystemName = _paymentSettings.DefaultPaymentMethod;
                var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
                if (paymentMethod == null)
                    return Challenge();

                var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
                GetCreditCardSaved(model);

                orderList.CheckoutPaymentInfoModel = model;

                var netsuiteId = 0;
                var ParentId = 0;
                if (_workContext.CurrentCustomer.Companies.Any())
                {
                    if (_workContext.WorkingCompany != null)
                    {
                        netsuiteId = Convert.ToInt32(_workContext.WorkingCompany?.NetsuiteId);
                        ParentId = Convert.ToInt32(_workContext.WorkingCompany?.Parent_Id);
                    }
                }

                var getCreditApplyCreditMemo = _creditApply.GetCustomerAccountCredit(netsuiteId);

                if (getCreditApplyCreditMemo.Count > 0)
                {
                    orderList.applyaccountcreditCreditMemo = getCreditApplyCreditMemo.Where(r => r.Type == 1).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 1).Sum(r => r.TotalApply);
                    orderList.applyaccountcreditDeposite = getCreditApplyCreditMemo.Where(r => r.Type == 2).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 2).Sum(r => r.TotalApply);
                    orderList.applyaccountcreditPayment = getCreditApplyCreditMemo.Where(r => r.Type == 3).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 3).Sum(r => r.TotalApply);

                    orderList.CreditMemos = getCreditApplyCreditMemo.Where(r => r.Type == 1 && r.AccountCredit - r.TotalApply != 0).ToList();
                    orderList.CustomerDeposite = getCreditApplyCreditMemo.Where(r => r.Type == 2 && r.AccountCredit - r.TotalApply != 0).ToList();
                    orderList.CustomerPayments = getCreditApplyCreditMemo.Where(r => r.Type == 3 && r.AccountCredit - r.TotalApply != 0).ToList();
                }
                else
                {
                    var getCreditApplyCreditMemoParent = _creditApply.GetCustomerAccountCredit(ParentId);
                    orderList.applyaccountcreditCreditMemo = getCreditApplyCreditMemoParent.Where(r => r.Type == 1).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 1).Sum(r => r.TotalApply);
                    orderList.applyaccountcreditDeposite = getCreditApplyCreditMemoParent.Where(r => r.Type == 2).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 2).Sum(r => r.TotalApply);
                    orderList.applyaccountcreditPayment = getCreditApplyCreditMemoParent.Where(r => r.Type == 3).Sum(r => r.AccountCredit) - getCreditApplyCreditMemo.Where(r => r.Type == 3).Sum(r => r.TotalApply);

                    orderList.CreditMemos = getCreditApplyCreditMemoParent.Where(r => r.Type == 1 && r.AccountCredit - r.TotalApply != 0).ToList();
                    orderList.CustomerDeposite = getCreditApplyCreditMemoParent.Where(r => r.Type == 2 && r.AccountCredit - r.TotalApply != 0).ToList();
                    orderList.CustomerPayments = getCreditApplyCreditMemoParent.Where(r => r.Type == 3 && r.AccountCredit - r.TotalApply != 0).ToList();
                }


                orderList.partialPayment = partialPayment;

                orderList.CustomerPaymentInfoModel = new CustomerPaymentInfoModel();
                //countries and states
                #region Countries and states


                //orderList.AvailableCountries.Add(new SelectListItem { Text = _localizationService.GetResource("Address.SelectCountry"), Value = "0" });
                var countryDefault = _countryService.GetAllCountries(_workContext.WorkingLanguage.Id).Where(r => r.Id == 1);


                foreach (var c in countryDefault)
                {
                    orderList.AvailableCountries.Add(new SelectListItem
                    {
                        Text = _localizationService.GetLocalized(c, x => x.Name),
                        Value = c.Id.ToString(),
                        Selected = true
                    });

                    orderList.CountryId = c.Id;
                }


                //states
                var states = _stateProvinceService.GetStateProvincesByCountryId(orderList.CountryId, _workContext.WorkingLanguage.Id).ToList();
                if (states.Any())
                {
                    orderList.AvailableStates.Add(new SelectListItem { Text = _localizationService.GetResource("Address.SelectState"), Value = "0" });

                    foreach (var s in states)
                    {
                        orderList.AvailableStates.Add(new SelectListItem { Text = _localizationService.GetLocalized(s, x => x.Name), Value = s.Id.ToString(), Selected = (s.Id == orderList.StateProvinceId) });
                    }
                }
                else
                {
                    var anyCountrySelected = orderList.AvailableCountries.Any(x => x.Selected);

                    orderList.AvailableStates.Add(new SelectListItem
                    {
                        Text = _localizationService.GetResource(anyCountrySelected ? "Address.OtherNonUS" : "Address.SelectState"),
                        Value = "0"
                    });
                }
                #endregion

                #region Billing Address

                var CompFor = _workContext.WorkingCompany;
                var totalAddress = 0;
                var companyAddresses = CompFor.CompanyAddressMappings.Where(r => r.Address.Active == false);
                List<Address> companyOthersCustomer = new List<Address>();
                var sameBillingShipping = false;

                var AddressList = new List<CompanyAddresses>();

                foreach (var item in companyAddresses)
                {
                    if (!AddressList.Select(a => a.Address.NetsuitId).Contains(item.Address.NetsuitId))
                        AddressList.Add(item);
                }

                foreach (var item in AddressList)
                {
                    var isAssigned = false;
                    Address AsignedAccount = new Address();
                    if (item.IsBilling && !sameBillingShipping)
                    {
                        AsignedAccount = _addressService.GetAddressById(item.AddressId);
                        if (AsignedAccount.NetsuitId != 0)
                        {
                            orderList.CustomerPaymentInfoModel.BillingAddresList.Add(AsignedAccount);
                            totalAddress++;
                            isAssigned = true;
                        }
                    }
                    if (item.IsShipping && !sameBillingShipping)
                    {
                        if (!item.IsBilling  && item.IsShipping )
                        {
                            AsignedAccount = _addressService.GetAddressById(item.AddressId);

                            if (AsignedAccount.NetsuitId != 0)
                            {
                                orderList.CustomerPaymentInfoModel.BillingAddresList.Add(AsignedAccount);
                                totalAddress++;
                                isAssigned = true;
                            }
                        }
                            
                    }

                    if (item.IsBilling != false && item.IsShipping != false)
                    {
                        if (item.IsBilling && item.IsShipping)
                        {
                            totalAddress = 1;
                            sameBillingShipping = true;
                        }
                    }

                    if (!isAssigned)
                    {
                        AsignedAccount = _addressService.GetAddressById(item.AddressId);
                        if (AsignedAccount.NetsuitId != 0)
                        {
                            orderList.CustomerPaymentInfoModel.BillingAddresList.Add(AsignedAccount);
                            totalAddress++;
                        }
                    }


                }

                //var address = _workContext.CurrentCustomer.Addresses.Where(r => r.Active);
                //if (address.Count() > 0)
                //{
                //    orderList.CustomerPaymentInfoModel.BillingAddresList = new List<Address>();
                //    foreach (var item in address)
                //    {
                //        orderList.CustomerPaymentInfoModel.BillingAddresList.Add(item);
                //    }
                //}
                //else
                //{
                //    var addressBilling = _workContext.CurrentCustomer.BillingAddressId;
                //        address = _workContext.CurrentCustomer.Addresses.Where(r => r.Id == addressBilling);
                //        orderList.CustomerPaymentInfoModel.BillingAddresList = new List<Address>();
                //        foreach (var item in address)
                //        {
                //            orderList.CustomerPaymentInfoModel.BillingAddresList.Add(item);
                //        }
                //}

                #endregion
                orderList.objectJson = objectJson;
                return View(orderList);
            }
            else
            {
                return RedirectToRoute("Invoice");
            }

        }
        public IActionResult orderListToPayStepFinish()
        {
            var OrderPaymentModel = HttpContext.Session.Get<List<OrderConfirmModel>>("OrderConfirmModel");

            return View(OrderPaymentModel);
        }

        public IActionResult InvoiceListToPayStepPay()
        {
            return RedirectToAction("Invoice", "Order");
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

                _logger.Warning(exc.Message, exc);
            }

        }

        [HttpPost, ActionName("OrderListToPayStepPay")]
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

            int orderId = 0;
            //_genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            //if (orderId == 0)
            //    return Challenge();

            var order = _orderService.GetOrderById(0);

            //if (order == null || order.PaymentStatus != PaymentStatus.Pending)
            //    return Challenge();

            //if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
            //    return Challenge();

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

                if (!string.IsNullOrEmpty(form["Order"]))
                {
                    paymentInfo.orders = form["Order"].ToString();
                }
                //session save
                HttpContext.Session.Set("OrderPaymentInfo", paymentInfo);
                return RedirectToRoute("OrderListToPayConfirm");
            }

            //If we got this far, something failed, redisplay form
            //model
            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            GetCreditCardSaved(model);

            return View(model);
        }


        [HttpPost, ActionName("OrderListToPayConfirm")]
        public virtual IActionResult OrderListToPayConfirm(string orderByPay)
        {
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("OrderPaymentInfo");
            if (processPaymentRequest == null)
                processPaymentRequest = new ProcessPaymentRequest();

            //int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            //if (orderId == 0)
            //    return Challenge();

            OrderPaymentModel orderList = new OrderPaymentModel();
            List<string> tokens = processPaymentRequest.orders.Split(',').ToList();

            if (tokens.Count > 0)
            {

                foreach (var item in tokens)
                {
                    var order = _orderService.GetOrderById(Int32.Parse(item.ToString()));

                    if (order != null)
                    {
                        if (order == null || order.PaymentStatus != PaymentStatus.Pending)
                            return Challenge();

                        //model
                        var model = new CheckoutConfirmModel
                        {
                            //terms of service
                            // TermsOfServiceOnOrderConfirmPage = _orderSettings.TermsOfServiceOnOrderConfirmPage,
                            //TermsOfServicePopup = _commonSettings.PopupForTermsOfServiceLinks
                        };

                        try
                        {
                            //    //prevent 2 orders being placed within an X seconds time frame
                            //    if (!IsMinimumOrderPlacementIntervalValid(_workContext.CurrentCustomer))
                            //        throw new Exception(_localizationService.GetResource("Checkout.MinOrderPlacementInterval"));

                            //place order
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
                                }

                                if (_webHelper.IsRequestBeingRedirected || _webHelper.IsPostBeingDone)
                                {
                                    //redirection or POST has been done in PostProcessPayment
                                    return Content("Redirected");
                                }

                                //return RedirectToRoute("CheckoutCompleted", new { orderId = placeOrderResult.PlacedOrder.Id });
                            }

                            foreach (var error in placeOrderResult.Errors)
                                model.Warnings.Add(error);
                        }
                        catch (Exception exc)
                        {
                            _logger.Warning(exc.Message, exc);
                            model.Warnings.Add(exc.Message);
                        }
                    }
                }

                return RedirectToRoute("OrderListToPayStepFinish");
            }


            ////If we got this far, something failed, redisplay form
            return View(new CheckoutConfirmModel());
        }

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

        //My account / Orders
        [HttpsRequirement(SslRequirement.Yes)]
        public virtual IActionResult Invoice(CustomerOrderListModel model)
        {
            if (_workContext.CurrentCustomer.IsGuest())
                return RedirectToRoute("CustomerOrders");

            //  var model = _orderModelFactory.PrepareCustomerOrderListModel();


            model.IsGuest = _workContext.CurrentCustomer.NetsuitId == 0;
            model.AccountCustomer = _workContext.CurrentCustomer.NetsuitId != 0;

            var WorkingCompanyId = 0;
            var NetsuiteId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = Convert.ToInt32(_workContext.WorkingCompany.Id);
                    NetsuiteId = Convert.ToInt32(_workContext.WorkingCompany.NetsuiteId);
                }
            }

            if (_workContext.CurrentCustomer.NetsuitId != 0)
            {
                var invoices = _invoiceService.GetInvoicesByCompanyId(WorkingCompanyId).ToList();

                if (model.OrdersFilter?.PaymentStatus != null)
                {
                    if (model.OrdersFilter.PaymentStatus == "Paid")
                    {
                        invoices = invoices
                       .Where(x => x.PaymentStatusId == 30)
                       .ToList();
                    }
                    if (model.OrdersFilter.PaymentStatus == "Pending")
                    {
                        invoices = invoices
                       .Where(x => x.PaymentStatusId == 0)
                       .ToList();
                    }

                    if (model.OrdersFilter.PaymentStatus == "PartialPay")
                    {
                        invoices = invoices
                       .Where(x => x.PaymentStatusId == 60)
                       .ToList();
                    }
                }

                if (model.OrdersFilter?.OrderStatus != null)
                {
                    if (model.OrdersFilter?.OrderStatus == "Pending")
                    {
                        invoices = invoices
                        .Where(x => !x.StatusPaymentNP && (x.PaymentStatusId == 30 || x.PaymentStatusId == 60))
                        .ToList();
                    }

                    if (model.OrdersFilter?.OrderStatus == "Complete")
                    {
                        invoices = invoices
                        .Where(x => x.StatusPaymentNP && (x.PaymentStatusId == 30 || x.PaymentStatusId == 60))
                        .ToList();
                    }

                }

                if (model.OrdersFilter?.CustomOrderNumber != null)
                {
                    invoices = invoices
                    .Where(x => x.InvoiceNo.Contains(model.OrdersFilter.CustomOrderNumber)).ToList();
                }

                if (model.OrdersFilter?.CompanyId != null)
                {
                    invoices = invoices
                   .Where(x => x.CompanyId.ToString().Contains(model.OrdersFilter.CompanyId))
                   .ToList();
                }


                foreach (var item in invoices)
                {
                    CustomerOrderListModel.InvoiceCompanyList companyInvoice = new CustomerOrderListModel.InvoiceCompanyList();

                    companyInvoice.Invoice = item;
                    companyInvoice.Company = _companyService.GetCompanyById(item.CompanyId);
                    if (item.SaleOrderId != 0)
                    {
                        var Order = _orderService.GetOrderById(item.SaleOrderId);

                        companyInvoice.OrderDetail = _orderModelFactory.PrepareOrderDetailsModel(Order);
                    }

                    model.InvoiceList.Add(companyInvoice);
                }


                


            }
            var ChildCompanies = _companyService.GetCompanyChildByParentId(NetsuiteId).ToList();
            
            if(ChildCompanies.Count>0)
                model.ChildList.Add(new SelectListItem(string.Empty, string.Empty));

            foreach (var x in ChildCompanies)
            {
                model.ChildList.Add(new SelectListItem(x.CompanyName, x.Id.ToString()));


                var invoices = _invoiceService.GetInvoicesByCompanyId(x.Id).ToList();

                foreach (var item in invoices)
                {
                    CustomerOrderListModel.InvoiceCompanyList companyInvoice = new CustomerOrderListModel.InvoiceCompanyList();

                    companyInvoice.Invoice = item;
                    companyInvoice.Company = _companyService.GetCompanyById(item.CompanyId);
                    if (item.SaleOrderId != 0)
                    {
                        var Order = _orderService.GetOrderById(item.SaleOrderId);

                        companyInvoice.OrderDetail = _orderModelFactory.PrepareOrderDetailsModel(Order);
                    }
                    model.InvoiceList.Add(companyInvoice);
                }
            }

            if (model.OrdersFilter?.CompanyId != null)
            {
                model.InvoiceList = model.InvoiceList
               .Where(x => x.Company.Id.ToString().Contains(model.OrdersFilter.CompanyId))
               .ToList();
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
                model.PaymentStatusList.Add(new SelectListItem("Partially Paid ", PaymentStatus.PartialPay.ToString()));
            }

            // OrderStatusList
            model.OrderStatusList.Add(new SelectListItem(string.Empty, string.Empty));
            model.OrderStatusList.Add(new SelectListItem("Approved by NN", OrderStatus.Complete.ToString()));
            model.OrderStatusList.Add(new SelectListItem("Pending for approval", OrderStatus.Pending.ToString()));


            //if (_workContext.CurrentCustomer.NetsuitId != 0)
            //{
            //    model.OrderStatusList.Add(new SelectListItem("Completed and Billed", OrderStatus.CompletedBilled.ToString()));
            //    //model.OrderStatusList.Add(new SelectListItem("Close", OrderStatus.Closed.ToString()));

            //}
            //model.OrderStatusList.Add(new SelectListItem(OrderStatus.Cancelled.ToString(), OrderStatus.Cancelled.ToString()));


            return View(model);
        }

        [HttpPost, ActionName("InvoiceListToPayStepPay")]
        [FormValueRequired("nextstep")]
        public virtual IActionResult EnterInvoicePaymentInfo(IFormCollection form)
        {
            //validation
            if (_orderSettings.CheckoutDisabled)
                return RedirectToRoute("ShoppingCart");

            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            HttpContext.Session.Set<PlaceOrderResult>("ErrorPayment", null);
            //Validation partial payment
            var creditmemo = form["creditmemo"];
            var customerDeposite = form["CustomerDeposite"];
            var customerPayment = form["CustomerPayment"];
            //Final values
            var creditMemoApplied = form["creditMemoValue"];
            var customerDepositeApplied = form["creditDepositeValue"];
            var customerPaymentApplied = form["creditPaymentValue"];
            //Total discount with credits
            var discountApply = form["discountApply"];
            //Total pay with credit card 
            var creditCardApply = form["creditCardApply"];
            //List of types used in discount value
            var allCredit = form["allCredit"];
            var listType = form["listType"];
            var listTypeMemo = form["listTypeMemo"];
            var listTypeDeposite = form["listTypeDeposite"];
            var listTypePayment = form["listTypePayment"];
            var val = Convert.ToDecimal(form["val"]);

            var creditCardNumber = form["CardNumber"];

            //load payment method
            var paymentMethodSystemName = "Payments.AuthorizeNet";//_genericAttributeService.GetAttribute<string>(_workContext.CurrentCustomer,
                                                                  //NopCustomerDefaults.SelectedPaymentMethodAttribute, _storeContext.CurrentStore.Id);
            var paymentMethod = _paymentPluginManager.LoadPluginBySystemName(paymentMethodSystemName);
            if (paymentMethod == null)
                return RedirectToRoute("CheckoutPaymentMethod");

            var WorkingCompanyId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = Convert.ToInt32(_workContext.WorkingCompany.NetsuiteId);
                }
            }

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
                if (!string.IsNullOrEmpty(form["group1[]"]) && form["group1[]"].ToString() != "AddNewCard")
                {
                    var warnings = paymentMethod.ValidatePaymentForm(form);
                    foreach (var warning in warnings)
                        ModelState.AddModelError("", warning);
                }

            }

            if (ModelState.IsValid)
            {
                var paymentInfo = new ProcessPaymentRequest();

                if (!string.IsNullOrEmpty(creditCardNumber) && !string.IsNullOrEmpty(form["CardholderName"]))
                    paymentInfo  = paymentMethod.GetPaymentInfo(form);

                //get payment info
                if (customerProfileInfo.CustomerProfileId != null)
                {
                    paymentInfo.paymentProfileId = customerProfileInfo.CustomerPaymentProfileList;
                    paymentInfo.customerProfileId = customerProfileInfo.CustomerProfileId;
                }
                if (form["shippingoptionSaveCard"].ToString() == "on")
                    paymentInfo.SaveCard = true;

                if (!string.IsNullOrEmpty(form["Order"]))
                {
                    paymentInfo.orders = form["Order"].ToString();
                }

                if (form["ApplyAccountCreditMemo"].ToString() != null)
                {
                    paymentInfo.ApplyAccountCreditMemo = Convert.ToDecimal(form["creditmemo"]);
                }
                if (form["ApplyAccountCustomerDeposite"].ToString() != null)
                {
                    paymentInfo.ApplyAccountCustomerDeposite = Convert.ToDecimal(form["creditmemo"]);
                }
                if (form["ApplyAccountCustomerPayment"].ToString() != null)
                {
                    paymentInfo.ApplyAccountCustomerPayment = Convert.ToDecimal(form["CustomerPayment "]);
                }

                var NewAddress = form["AddNewAddress"];
                var NewAddressMobile = form["AddNewAddressMobile"];
                var address = new Address();

                if (NewAddress == "on" || NewAddressMobile == "on")
                {
                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.Address1"]))
                        address.Address1 = form["CustomerPaymentInfoModel.Address1"].ToString();
                    else
                        address.Address1 = form["Address1"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.City"]))
                        address.City = form["CustomerPaymentInfoModel.City"].ToString();
                    else
                        address.City = form["City"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.StateProvinceId"]))
                        address.StateProvinceId = Convert.ToInt32(form["CustomerPaymentInfoModel.StateProvinceId"]);
                    else
                        address.StateProvinceId = Convert.ToInt32(form["StateProvinceId"]);

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.ZipPostalCode"]))
                        address.ZipPostalCode = form["CustomerPaymentInfoModel.ZipPostalCode"].ToString();
                    else
                        address.ZipPostalCode = form["ZipPostalCode"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.CountryId"]))
                        address.CountryId = Convert.ToInt32(form["CustomerPaymentInfoModel.CountryId"]);
                    else
                        address.CountryId = Convert.ToInt32(form["CountryId"]);

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.FirstName"]))
                        address.FirstName = form["CustomerPaymentInfoModel.FirstName"].ToString();
                    else
                        address.FirstName = form["FirstName"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.LastName"]))
                        address.LastName = form["CustomerPaymentInfoModel.LastName"].ToString();
                    else
                        address.LastName = form["LastName"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.Email"]))
                        address.Email = form["CustomerPaymentInfoModel.Email"].ToString();
                    else
                        address.Email = form["Email"].ToString();

                    if (!string.IsNullOrEmpty(form["CustomerPaymentInfoModel.Phone"]))
                        address.PhoneNumber = form["CustomerPaymentInfoModel.Phone"].ToString();
                    else
                        address.PhoneNumber = form["Phone"].ToString();

                }
                else
                {
                    var AddressIdSelected = form["AddressIdSelected"].ToString().Split('-');
                    if (!string.IsNullOrEmpty(AddressIdSelected[0]))
                    {
                        address.Address1 = AddressIdSelected[0];
                        address.City = AddressIdSelected[1];
                        address.StateProvinceId = Convert.ToInt32(AddressIdSelected[2]);
                        address.ZipPostalCode = AddressIdSelected[3];
                        address.CountryId = Convert.ToInt32(AddressIdSelected[4]);
                    }
                    else
                    {
                        address.Address1 = _workContext.CurrentCustomer.BillingAddress.Address1;
                        address.City = _workContext.CurrentCustomer.BillingAddress.City;
                        address.StateProvinceId = _workContext.CurrentCustomer.BillingAddress.StateProvinceId;
                        address.ZipPostalCode = _workContext.CurrentCustomer.BillingAddress.ZipPostalCode;
                    }
                    
                }

                paymentInfo.NewAddress = address;

                paymentInfo.listTypeDeposite = listTypeDeposite;
                paymentInfo.listTypeMemo = listTypeMemo;
                paymentInfo.listTypePayment = listTypePayment;
                paymentInfo.allCredit = allCredit;

                decimal newDiscountApply = 0;
                decimal creditCardApplyTotal = Convert.ToDecimal(creditCardApply);

                if (!string.IsNullOrEmpty(allCredit) && allCredit != "0")
                {
                    List<string> tokens = allCredit.ToString().Split(',').ToList();
                    if (tokens.Count > 0)
                    {
                        foreach (var item in tokens)
                        {
                            if (!string.IsNullOrEmpty(item) && item != "0")
                            {
                                var credits = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                                newDiscountApply += credits.AccountCredit;
                            }
                        }
                    }
                }
                paymentInfo.creditmemo = Convert.ToDecimal(creditmemo);
                paymentInfo.customerDeposite = Convert.ToDecimal(customerDeposite);
                paymentInfo.CustomerPayment = Convert.ToDecimal(customerPayment);

				

				if (form["listTypeDeposite"] != "" && form["listTypeDeposite"] != "0")
                {
                    List<string> tokens = listTypeDeposite.ToString().Split(',').ToList();
                    if (tokens.Count > 0)
                    {
                        foreach (var item in tokens)
                        {
                            if (!string.IsNullOrEmpty(item) && item != "0")
                            {
                                var credits = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                                var totalCredit = credits.AccountCredit - credits.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;
                            }
                        }
                    }

                }

                if (form["listTypeMemo"] != "" && form["listTypeMemo"] != "0")
                {
                    List<string> tokens = listTypeMemo.ToString().Split(',').ToList();
                    if (tokens.Count > 0)
                    {
                        foreach (var item in tokens)
                        {
                            if (!string.IsNullOrEmpty(item) && item != "0")
                            {
                                var credits = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                                var totalCredit = credits.AccountCredit - credits.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;
                            }
                        }
                    }

                }

                if (form["listTypePayment"] != "" && form["listTypePayment"] != "0")
                {
                    List<string> tokens = listTypePayment.ToString().Split(',').ToList();
                    if (tokens.Count > 0)
                    {
                        foreach (var item in tokens)
                        {
                            if (!string.IsNullOrEmpty(item) && item != "0")
                            {
                                var credits = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                                var totalCredit = credits.AccountCredit - credits.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;
                            }
                        }
                    }
                }

                foreach (var x in listType)
                {
                    if (x == "1")
                    {
                        var credits = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 1);

                        if (credits != null)
                        {
                            foreach (var item in credits)
                            {
                                var totalCredit = item.AccountCredit - item.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;


                            }
                        }
                    }
                    if (x == "2")
                    {
                        var credits = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 2);

                        if (credits != null)
                        {
                            foreach (var item in credits)
                            {
                                var totalCredit = item.AccountCredit - item.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;
                            }
                        }
                    }
                    if (x == "3")
                    {
                        var credits = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 3);

                        if (credits != null)
                        {
                            foreach (var item in credits)
                            {
                                var totalCredit = item.AccountCredit - item.TotalApply;
                                if (totalCredit > 0)
                                    newDiscountApply += totalCredit;
                            }
                        }
                    }
                }


                if (newDiscountApply != 0)
                {
                    if (newDiscountApply > val)
                    {
                        paymentInfo.discountApply = Convert.ToDecimal(discountApply); ;
                        creditCardApplyTotal = 0;
                    }
                    else
                    {
                        paymentInfo.discountApply = newDiscountApply;
                    }
                }

                else
                    paymentInfo.discountApply = Convert.ToDecimal(discountApply);

                paymentInfo.listType = listType;

                paymentInfo.creditCardApply = creditCardApplyTotal;
                paymentInfo.objectJson = form["objectJson"].ToString();
                paymentInfo.Subtotal = Convert.ToDecimal(form["val"]);
                //session save
                HttpContext.Session.Set("InvoicePaymentInfo", paymentInfo);
                return RedirectToRoute("InvoiceListToPayConfirm");
            }

            //If we got this far, something failed, redisplay form
            //model
            var model = _checkoutModelFactory.PreparePaymentInfoModel(paymentMethod);
            GetCreditCardSaved(model);

            HttpContext.Session.Set<PlaceOrderResult>("ErrorPaymentProcessing", null);
            HttpContext.Session.Set<PlaceOrderResult>("ErrorPayment", null);


            return View(model);
        }

        public IActionResult InvoiceListToPayConfirm()
        {
            //validation
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();


            OrderPaymentModel orderList = new OrderPaymentModel();

            HttpContext.Session.Set<PlaceOrderResult>("ErrorPayment", null);

            var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("InvoicePaymentInfo");
            if (processPaymentRequest != null)
            {

                List<string> tokens = processPaymentRequest.orders.Split(',').ToList();

                if (tokens.Count > 0)
                {
                    List<OrderConfirmModel> OrderConfirmList = new List<OrderConfirmModel>();
                    foreach (var item in tokens)
                    {
                        var order = _orderService.GetInvoiceById(Int32.Parse(item.ToString()));
                        var company = new Company();

                        if (order.CompanyId != null)
                            company = _companyService.GetCompanyById(Convert.ToInt32(order.CompanyId));


                        var orderDetailModel = new OrderDetailsModel
                        {
                            Id = order.Id,
                            company = company.CompanyName,
                            InvoiceNumber = order.InvoiceNo,
                            OrderTotalPayList = order.Total,
                            foreignamountunpaid = order.foreignamountunpaid,
                            OrderStatus = order.StatusName,
                            OrderSubtotalInv = processPaymentRequest.Subtotal,
                            OrderPayWithCreditCard = processPaymentRequest.creditCardApply,
                            DiscountApply = processPaymentRequest.discountApply

                        };
                        int StateProvinceId = 0;

                        if (processPaymentRequest.NewAddress?.StateProvinceId != null)
                        {
                            StateProvinceId = Convert.ToInt32(processPaymentRequest.NewAddress?.StateProvinceId);
                        }

                        var stateName = _stateProvinceService.GetStateProvinceById(StateProvinceId);

                        int CountryId = 0;
                        if (processPaymentRequest.NewAddress?.CountryId != null)
                        {
                            CountryId = Convert.ToInt32(processPaymentRequest.NewAddress?.CountryId);
                        }
                        var Country = _countryService.GetCountryById(CountryId);

                        var OrderConfirmModel = new OrderConfirmModel
                        {
                            Id = order.Id,
                            company = company.CompanyName,
                            InvoiceNumber = null,
                            OrderTotalPayList = order.foreigntotal,
                            CreatedOn = order.CreatedDate,
                            PONumber = order.PONumber,
                            OrderSubtotalInv = processPaymentRequest.Subtotal,
                            OrderPayWithCreditCard = processPaymentRequest.creditCardApply,
                            DiscountApply = processPaymentRequest.discountApply,
                            Address1 = processPaymentRequest.NewAddress?.Address1,
                            City = processPaymentRequest.NewAddress?.City,
                            StateProvinceName = stateName?.Name,
                            ZipPostalCode = processPaymentRequest.NewAddress?.ZipPostalCode,
                            CountryName = Country?.Name
                        };
                        OrderConfirmList.Add(OrderConfirmModel);


                        orderList.OrderDetailsModel.Add(orderDetailModel);
                    }
                    HttpContext.Session.Set("InvoiceConfirmModel", OrderConfirmList);
                }

            }
            else
            {
                return RedirectToAction("Login", "Account");
            }

            //int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);
            //    NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            //if (orderId == 0)
            //    return Challenge();

            //var order = _orderService.GetOrderById(orderId);

            //if (order == null || order.PaymentStatus != PaymentStatus.Pending)
            //    return Challenge();

            //if (_workContext.CurrentCustomer.Id != order.CustomerId && order.CompanyId.Value != _workContext.WorkingCompany.Id)
            //    return Challenge();

            var warnings = HttpContext.Session.Get<List<string>>("ErrorPaymentProcessing");

            //model
            var model = new CheckoutConfirmModel
            {
                OrderPaymentModel = orderList,
                Warnings = warnings
                //terms of service
                //TermsOfServiceOnOrderConfirmPage = _orderSettings.TermsOfServiceOnOrderConfirmPage,
                // TermsOfServicePopup = _commonSettings.PopupForTermsOfServiceLinks
            };
           
            return View(model);

        }

        [HttpPost, ActionName("InvoiceListToPayConfirm")]
        public virtual IActionResult InvoiceListToPayConfirm(string orderByPay)
        {
            if (_workContext.CurrentCustomer.IsGuest() && !_orderSettings.AnonymousCheckoutAllowed)
                return Challenge();

            List<TransactionModel> TransactionModel = new List<TransactionModel>();

            var processPaymentRequest = HttpContext.Session.Get<ProcessPaymentRequest>("InvoicePaymentInfo");
            if (processPaymentRequest == null)
                processPaymentRequest = new ProcessPaymentRequest();

            //model
            var model = new CheckoutConfirmModel
            {

            };
            var WorkingCompanyId = 0;
            if (_workContext.CurrentCustomer.Companies.Any())
            {
                if (_workContext.WorkingCompany != null)
                {
                    WorkingCompanyId = Convert.ToInt32(_workContext.WorkingCompany.NetsuiteId);
                }
            }

            List<string> tokens = processPaymentRequest.orders.Split(',').ToList();
            InvoiceModel myDeserializedClass = JsonConvert.DeserializeObject<InvoiceModel>(processPaymentRequest.objectJson);

            List<CustomerAccountCredit> Credits = new List<CustomerAccountCredit>();

            #region Account Credit Info


            if (!string.IsNullOrEmpty(processPaymentRequest.allCredit) && processPaymentRequest.allCredit != "0")
            {
                List<string> allCreditIds = processPaymentRequest.allCredit.Split(',').ToList();
                foreach (var item in allCreditIds)
                {
                    if (!string.IsNullOrEmpty(item))
                    {
                        var paymentInfo = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                        if (paymentInfo != null)
                            Credits.Add(paymentInfo);
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(processPaymentRequest.listTypePayment) && processPaymentRequest.listTypePayment != "0")
                {
                    List<string> InvoiceIds = processPaymentRequest.listTypePayment.Split(',').ToList();
                    foreach (var item in InvoiceIds)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            var PaymentInfo = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                            if (PaymentInfo != null)
                                Credits.Add(PaymentInfo);
                        }
                    }
                }

                if (!string.IsNullOrEmpty(processPaymentRequest.listTypeMemo) && processPaymentRequest.listTypeMemo != "0")
                {
                    List<string> InvoiceIds = processPaymentRequest.listTypeMemo.Split(',').ToList();
                    foreach (var item in InvoiceIds)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            var memoInfo = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                            if (memoInfo != null)
                                Credits.Add(memoInfo);
                        }
                    }
                }

                if (!string.IsNullOrEmpty(processPaymentRequest.listTypeDeposite) && processPaymentRequest.listTypeDeposite != "0")
                {
                    List<string> InvoiceIds = processPaymentRequest.listTypeDeposite.Split(',').ToList();
                    foreach (var item in InvoiceIds)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            var paymentInfo = _creditApply.GetCustomerAccountCreditApplById(Convert.ToInt32(item));
                            if (paymentInfo != null)
                                Credits.Add(paymentInfo);
                        }
                    }
                }

                if (!string.IsNullOrEmpty(processPaymentRequest.listType) && processPaymentRequest.listType != "0")
                {
                    List<string> InvoiceIds = processPaymentRequest.listType.Split(',').ToList();
                    foreach (var item in InvoiceIds)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            if (item == "1")
                            {
                                var paymentInfo = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 1); ;
                                if (paymentInfo != null)
                                {
                                    foreach (var x in paymentInfo)
                                    {
                                        Credits.Add(x);
                                    }
                                }

                            }
                            if (item == "2")
                            {
                                var paymentInfo = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 2); ;
                                if (paymentInfo != null)
                                {
                                    foreach (var x in paymentInfo)
                                    {
                                        Credits.Add(x);
                                    }
                                }

                            }
                            if (item == "3")
                            {
                                var paymentInfo = _creditApply.GetCustomerAccountCredit(WorkingCompanyId).Where(r => r.Type == 3); ;
                                if (paymentInfo != null)
                                {
                                    foreach (var x in paymentInfo)
                                    {
                                        Credits.Add(x);
                                    }
                                }

                            }

                        }
                    }
                }

            }
            var ListCreditOrderByAmoutDesc = Credits.OrderBy(r => r.AccountCredit).ToList();
            var ListCreditOrderByAmoutDescRollBack = new List<CustomerAccountCredit>();
            #endregion

            List<ApplyInvoiceCreditModel> ApplyInvoiceCreditModel = new List<ApplyInvoiceCreditModel>();

            var TotalPayInvoice = myDeserializedClass.invoicesToPay.Sum(r => Convert.ToDecimal(r.ValuePay));

            var listInvoice2 = myDeserializedClass.invoicesToPay.OrderByDescending(r => Convert.ToDecimal(r.ValuePay));

            decimal tempDiscount = 0;

            foreach (var item in listInvoice2)
            {
                var tempTotalInv = Convert.ToDecimal(item.ValuePay);

                var invoice = _orderService.GetInvoiceById(Int32.Parse(item.OrderId.ToString()));

                if (tempTotalInv > 0)
                {
                    foreach (var credit in ListCreditOrderByAmoutDesc)
                    {
                        var ApplyCreditInvoice = new ApplyInvoiceCreditModel();
                        

                        decimal NewTotalCreditAppy = credit.AccountCredit - credit.TotalApply;
                        decimal NewTotalInvoice = 0;
                        if (NewTotalCreditAppy > 0)
                        {
                            if (tempTotalInv > NewTotalCreditAppy)
                            {
                                tempDiscount += NewTotalCreditAppy;

                                var creditApply = new CustomerAccountCredit();
                                creditApply.TotalApply = credit.TotalApply;
                                creditApply.Id = credit.Id;
                                ListCreditOrderByAmoutDescRollBack.Add(creditApply);


                                credit.TotalApply = credit.TotalApply + NewTotalCreditAppy;
                                NewTotalInvoice = tempTotalInv - NewTotalCreditAppy;
                                NewTotalCreditAppy = 0;

                                ApplyCreditInvoice.InvoiceId = item.OrderId;
                                ApplyCreditInvoice.InvoiceTotalPay = tempTotalInv;
                                ApplyCreditInvoice.NewInvoiceTotalPay = NewTotalInvoice;
                                ApplyCreditInvoice.TotalInvoice = invoice.Total;
                                ApplyCreditInvoice.TotalCreditApply = NewTotalCreditAppy;
                                ApplyCreditInvoice.IsTotalCreditApply = true;
                                ApplyCreditInvoice.creditApply.Add(credit);

                                //tempDiscount = tempDiscount + tempTotalInv;

                            }
                            else
                            {
                                if (tempTotalInv != 0)
                                {
                                    NewTotalInvoice = 0;
                                    tempDiscount += tempTotalInv;

                                    var creditApply = new CustomerAccountCredit();
                                    creditApply.TotalApply = credit.TotalApply;
                                    creditApply.Id = credit.Id;
                                    ListCreditOrderByAmoutDescRollBack.Add(creditApply);

                                    credit.TotalApply = credit.TotalApply + NewTotalCreditAppy;

                                    NewTotalCreditAppy = NewTotalCreditAppy - tempTotalInv;

                                    ApplyCreditInvoice.InvoiceId = item.OrderId;
                                    ApplyCreditInvoice.InvoiceTotalPay = NewTotalInvoice;
                                    ApplyCreditInvoice.NewInvoiceTotalPay = tempTotalInv;
                                    ApplyCreditInvoice.TotalInvoice = invoice.Total;
                                    ApplyCreditInvoice.TotalCreditApply = NewTotalCreditAppy;

                                    if (NewTotalCreditAppy == 0)
                                        ApplyCreditInvoice.IsTotalCreditApply = true;
                                    else
                                        ApplyCreditInvoice.IsTotalCreditApply = false;

                                    ApplyCreditInvoice.creditApply.Add(credit);

                                }
                            }
                            ApplyInvoiceCreditModel.Add(ApplyCreditInvoice);

                            tempTotalInv = NewTotalInvoice;
                            if (tempTotalInv == 0)
                            {
                                break;
                            }
                        }
                    }
                }
                else
                {
                    var ApplyCreditInvoice = new ApplyInvoiceCreditModel();
                    ApplyCreditInvoice.InvoiceId = item.OrderId;
                    ApplyCreditInvoice.InvoiceTotalPay = tempTotalInv;
                    ApplyCreditInvoice.NewInvoiceTotalPay = 0;
                    ApplyCreditInvoice.TotalInvoice = invoice.Total;
                    ApplyCreditInvoice.TotalCreditApply = 0;
                    ApplyCreditInvoice.IsTotalCreditApply = false;

                    ApplyInvoiceCreditModel.Add(ApplyCreditInvoice);
                }

            }
            //Run by payment
            foreach (var item in listInvoice2)
            {
                var payInovice = ApplyInvoiceCreditModel.Where(r => r.InvoiceId == item.OrderId && r.InvoiceTotalPay == 0);

                if (payInovice.Count() > 0)
                {
                    foreach (var x in payInovice)
                    {
                        if(!string.IsNullOrEmpty(x.InvoiceId))
                        {
                            var invoice = _invoiceService.GetInvoiceById(Convert.ToInt32(x.InvoiceId));
                            var TotalPaid = invoice.Total - invoice.AmountDue;

                            if (!string.IsNullOrEmpty(item.ValuePay))
                                TotalPaid  = TotalPaid - Convert.ToDecimal(item.ValuePay);

                            if (TotalPaid==0)
                                item.IsPay = true;
                            else
                                item.IsPay = false;
                        }
                    }
                   
                    
                }
                else
                {
                    payInovice = ApplyInvoiceCreditModel.Where(r => r.InvoiceId == item.OrderId).OrderBy(r => r.InvoiceTotalPay);
                    if (payInovice.Count() > 0)
                    {
                        item.IsPay = false;
                        item.PendingPay = payInovice.FirstOrDefault().NewInvoiceTotalPay;
                    }

                }


            }


            var CreditApply4 = ApplyInvoiceCreditModel.Select(r => r.creditApply).GroupBy(a => a);

            List<CustomerAccountCredit> ApplyInvoiceCreditModel2 = new List<CustomerAccountCredit>();

            foreach (var item in CreditApply4)
            {
                foreach (var x in item)
                {
                    foreach (var j in x)
                    {
                        var ItemInfo = Credits.Where(r => r.Id == j.Id).ToList();

                        if (ItemInfo.Count() > 0)
                        {
                            foreach (var a in ItemInfo)
                            {
                                if (a != null)
                                {
                                    if (!ApplyInvoiceCreditModel2.Contains(a))
                                        ApplyInvoiceCreditModel2.Add(a);
                                }

                            }
                        }

                    }
                }
            }
            //var b = ApplyInvoiceCreditModel2.GroupBy(a => a.creditApply.Select(r=>r.TotalApply));
            //var bb = ApplyInvoiceCreditModel2.GroupBy(a => a.creditApply.Select(r => r.Id));

            //var CreditApply3 = b.Sum(x => x.Key.Sum(r=>r));

            var CreditApply2 = ApplyInvoiceCreditModel2.Sum(x => x.TotalApply);
            //var CreditApply = ApplyInvoiceCreditModel.Sum(r => r.creditApply.GroupBy(a=>a.Id).Select(z => z.TotalApply).Sum(x => x.Key));

            //var CreditApply = ApplyInvoiceCreditModel.GroupBy(a => a.creditApply).Sum(r => r.Key.Sum(x => x.TotalApply));
            //.Sum(r=>r.creditApply.Sum(x=>x.TotalApply));
            //  var TotalCreditCardPay = TotalPayInvoice - CreditApply;
            var TotalCreditCardPay = TotalPayInvoice - tempDiscount;

            if (TotalCreditCardPay < 0)
                TotalCreditCardPay = 0;

            var SerializeObjectInvoice = JsonConvert.SerializeObject(listInvoice2);
            var CreditsApply = JsonConvert.SerializeObject(ApplyInvoiceCreditModel2);

            if (tokens.Count > 0)
            {
                try
                {
                    //place order
                    GenerateOrderGuid(processPaymentRequest);
                    processPaymentRequest.StoreId = _storeContext.CurrentStore.Id;
                    processPaymentRequest.CustomerId = _workContext.CurrentCustomer.Id;
                    processPaymentRequest.PaymentMethodSystemName = _paymentSettings.DefaultPaymentMethod;

                    processPaymentRequest.OrderTotal = TotalCreditCardPay;
                    processPaymentRequest.InitialOrderId = 0;
                    processPaymentRequest.invoiceId = 0;
                    processPaymentRequest.IsInvoice = true;
                    processPaymentRequest.InvoicesToPay = SerializeObjectInvoice;
                    processPaymentRequest.CreditsApply = CreditsApply;

                    HttpContext.Session.Set<PlaceOrderResult>("ErrorPaymentProcessing", null);
                    HttpContext.Session.Set<PlaceOrderResult>("ErrorPayment", null);
                    
                    HttpContext.Session.Set<ProcessPaymentRequest>("InvoicePaymentInfo", processPaymentRequest);
                    var placeOrderResult = new PlaceOrderResult();
                    placeOrderResult = _orderProcessingService.RetryPlaceOrder(processPaymentRequest);
                    if (TotalCreditCardPay == 0 && processPaymentRequest.IsInvoice)
                    {
                        if (placeOrderResult.Success)
                        {
                            UpdateInvoiceInformationAfterPay(processPaymentRequest, ApplyInvoiceCreditModel, TotalPayInvoice, listInvoice2, TotalCreditCardPay, SerializeObjectInvoice, CreditsApply, placeOrderResult, ApplyInvoiceCreditModel2);
                        }
                    }
                    else
                    {

                        if (placeOrderResult.Success)
                        {
                            UpdateInvoiceInformationAfterPay(processPaymentRequest, ApplyInvoiceCreditModel, TotalPayInvoice, listInvoice2, TotalCreditCardPay, SerializeObjectInvoice, CreditsApply, placeOrderResult, ApplyInvoiceCreditModel2);

                            var postProcessPaymentRequest = new PostProcessPaymentRequest
                            {
                                Invoice = placeOrderResult.PlacedOrderInvoice
                            };

                            if (_webHelper.IsRequestBeingRedirected || _webHelper.IsPostBeingDone)
                            {
                                //redirection or POST has been done in PostProcessPayment
                                return Content("Redirected");
                            }
                        }
                        else
                        {
                            foreach(var credits in ListCreditOrderByAmoutDesc)
                            {
                                var totalApplyCredit = ListCreditOrderByAmoutDescRollBack.Where(r => r.Id == credits.Id).FirstOrDefault();
                                if (totalApplyCredit != null)
								{
                                    credits.TotalApply = totalApplyCredit.TotalApply;
                                    _creditApply.UpdateCustomerAccountCredit(credits);
                                }
                            }

                            placeOrderResult.Errors.Add("ErrorPayment");
                            HttpContext.Session.Set<PlaceOrderResult>("ErrorPayment", placeOrderResult);
                        }

                        foreach (var error in placeOrderResult.Errors)
                            model.Warnings.Add(error);
                    }
                }
                catch (Exception exc)
                {
                    _logger.Warning(exc.Message, exc);
                    model.Warnings.Add(exc.Message);
                }

                HttpContext.Session.Set<PlaceOrderResult>("ErrorPaymentProcessing", null);

                if (model.Warnings.Count() > 0)
                {
                    HttpContext.Session.Set<List<string>>("ErrorPaymentProcessing", model.Warnings.ToList());

                    return RedirectToRoute("InvoiceListToPayConfirm");
                }
				else
				{
                   
                    return RedirectToRoute("InvoiceListToPayStepFinish");

                }
            }



            ////If we got this far, something failed, redisplay form
            return View(new CheckoutConfirmModel());
        }

        private void UpdateInvoiceInformationAfterPay(ProcessPaymentRequest processPaymentRequest, List<ApplyInvoiceCreditModel> ApplyInvoiceCreditModel, decimal TotalPayInvoice, IOrderedEnumerable<InvoicesToPay> listInvoice2, decimal TotalCreditCardPay, string SerializeObjectInvoice, string CreditsApply, PlaceOrderResult placeOrderResult, List<CustomerAccountCredit> ApplyInvoiceCreditModel2)
        {
            foreach (var item in listInvoice2)
            {
                var invoice = _orderService.GetInvoiceById(Convert.ToInt32(item.OrderId));
                decimal InvoiceDiscount = 0;

                if (Convert.ToDecimal(invoice.AmountDue) > 0)
                    InvoiceDiscount = Convert.ToDecimal(invoice.AmountDue) - Convert.ToDecimal(item.ValuePay);
                else
                {
                    if (Convert.ToDecimal(invoice.AmountDue) == 0)
                        InvoiceDiscount = Convert.ToDecimal(invoice.Total) - Convert.ToDecimal(item.ValuePay);
                }
               

                if (invoice != null)
                {
                    
                    if (InvoiceDiscount == 0)
                    {
                        invoice.PaymentStatusId = (int)PaymentStatus.Paid;
                    }
                    else
                    {
                        invoice.PaymentStatusId = (int)PaymentStatus.PartialPay;
                    }

                    invoice.CardType = string.Empty;
                    invoice.CardName = string.Empty;
                    invoice.CardNumber = string.Empty;
                    invoice.MaskedCreditCardNumber = string.Empty;
                    invoice.CardCvv2 = string.Empty;
                    invoice.CardExpirationMonth = string.Empty;
                    invoice.CardExpirationYear = string.Empty;
                    invoice.PaymentMethodSystemName = processPaymentRequest.PaymentMethodSystemName;

                    invoice.StatusPaymentNP = false;

                    if (InvoiceDiscount == 0)
                    {
                        invoice.AmountDue = 0;
                    }
                    else
                    {
                        if (Convert.ToDecimal(invoice.AmountDue) > 0)
                            invoice.AmountDue = Convert.ToDecimal(invoice.AmountDue) - Convert.ToDecimal(item.ValuePay);
                        else
                            invoice.AmountDue = Convert.ToDecimal(invoice.Total) - Convert.ToDecimal(item.ValuePay);
                    }

                    var InfoInvoice = ApplyInvoiceCreditModel.Where(r => r.InvoiceId == invoice.Id.ToString());

                    _invoiceService.UpdateOrder(invoice);
                }
                if (placeOrderResult.PlacedOrderInvoice != null)
                {

                    UpdatePaymentInvoice(placeOrderResult.PlacedOrderInvoice, processPaymentRequest);
                }
            }
            _workflowMessageService.SendInvoicePaidCustomerNotification(listInvoice2.ToList(), TotalPayInvoice, processPaymentRequest.NewAddress, 1,null,null, ApplyInvoiceCreditModel2);

            CreateTransactionInvoice(ApplyInvoiceCreditModel, TotalCreditCardPay, TotalPayInvoice, SerializeObjectInvoice, CreditsApply);
            UpdateCreditApplyByCustomer(ApplyInvoiceCreditModel2);
            
            HttpContext.Session.Set<ProcessPaymentRequest>("InvoicePaymentInfo", null);
        }

        private void UpdateCreditApplyByCustomer(List<CustomerAccountCredit> applyInvoiceCreditModel2)
        {
            foreach (var item in applyInvoiceCreditModel2)
            {
                try
                {
                    var credit = _creditApply.GetCustomerAccountCreditApplById(item.Id);
                        credit.TotalApply = item.TotalApply;

                    _creditApply.UpdateCustomerAccountCredit(credit);
                }
                catch (Exception exc)
                {
                    _logger.Warning(exc.Message, exc);
                }
            }
        }

        private void CreateTransactionInvoice(List<ApplyInvoiceCreditModel> transactionModel, decimal TotalCreditCardPay, decimal TotalPayInvoice, string SerializeObjectInvoice, string CreditsApply)
        {
            try
            {
                var InvoiceTransaction = new InvoiceTransaction();

                InvoiceTransaction.ValuePay = TotalPayInvoice;
                InvoiceTransaction.TotalCreditCardPay = TotalCreditCardPay;
                InvoiceTransaction.CustomerDepositeApply = CreditsApply;
                InvoiceTransaction.InvoiceApply = SerializeObjectInvoice;
                InvoiceTransaction.CreatedDate = DateTime.Now;

                _invoiceService.InsertInvoiceTransaction(InvoiceTransaction);


                //var GetPendingDataToSync = _pendingDataToSyncService.GetPendingInvocesDataToSync(Convert.ToInt32(InvoiceTransaction.Id), ImporterIdentifierType.InvoicesSync);

                //if (GetPendingDataToSync != null)
                //{
                //    GetPendingDataToSync.Synchronized = false;
                //    GetPendingDataToSync.UpdateDate = DateTime.Now;
                //    _pendingDataToSyncService.UpdatetPendingDataToSync(GetPendingDataToSync);
                //}
                //else
                //{
                //    var items = new PendingDataToSync();
                //    items.IdItem = Convert.ToInt32(InvoiceTransaction.Id);
                //    items.Synchronized = false;
                //    items.Type = (int)ImporterIdentifierType.InvoicesSync;
                //    items.UpdateDate = DateTime.Now;
                //    _pendingDataToSyncService.InsertPendingDataToSync(items);
                //}
            }
            catch (Exception exc)
            {
                _logger.Warning(exc.Message, exc);
            }

        }

        private void UpdatePaymentInvoice(Invoice placedOrderInvoice, ProcessPaymentRequest processPaymentRequest)
        {
            var companyInfo = _companyService.GetCompanyById(placedOrderInvoice.CompanyId);
            if (companyInfo != null)
            {
                var CreditApplyCustomer = _creditApply.GetCustomerAccountCredit(Convert.ToInt32(companyInfo.NetsuiteId));
                if (CreditApplyCustomer.Count == 0)
                {
                    CreditApplyCustomer = _creditApply.GetCustomerAccountCredit(Convert.ToInt32(companyInfo.Parent_Id));
                }
                if (processPaymentRequest.ApplyAccountCreditMemo != null)
                {
                    var CreditMemo = processPaymentRequest.ApplyAccountCreditMemo;

                    var AllCreditMemos = CreditApplyCustomer.Where(r => r.Type == 1).OrderByDescending(r => r.AccountCredit);
                    var creditMemo = CreditMemo;

                    foreach (var item in AllCreditMemos)
                    {
                        if (item.AccountCredit >= creditMemo)
                        {
                            item.TotalApply = creditMemo;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);
                        }
                        if (item.AccountCredit < creditMemo)
                        {
                            item.TotalApply = item.AccountCredit;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);

                            creditMemo = creditMemo - item.AccountCredit;
                        }
                    }
                }
                if (processPaymentRequest.ApplyAccountCustomerDeposite != null)
                {
                    var CustomerDeposite = processPaymentRequest.ApplyAccountCustomerDeposite;
                    var AllCreditMemos = CreditApplyCustomer.Where(r => r.Type == 2).OrderByDescending(r => r.AccountCredit);

                    var creditMemo = CustomerDeposite;
                    foreach (var item in AllCreditMemos)
                    {
                        if (item.AccountCredit >= creditMemo)
                        {
                            item.TotalApply = creditMemo;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);
                        }
                        if (item.AccountCredit < creditMemo)
                        {
                            item.TotalApply = item.AccountCredit;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);

                            creditMemo = creditMemo - item.AccountCredit;
                        }
                    }

                }
                if (processPaymentRequest.ApplyAccountCustomerPayment != null)
                {
                    var CustomerPayment = processPaymentRequest.ApplyAccountCustomerPayment;
                    var AllCreditMemos = CreditApplyCustomer.Where(r => r.Type == 3).OrderByDescending(r => r.AccountCredit);
                    var creditMemo = CustomerPayment;

                    foreach (var item in AllCreditMemos)
                    {
                        if (item.AccountCredit >= creditMemo)
                        {
                            item.TotalApply = creditMemo;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);
                        }
                        if (item.AccountCredit < creditMemo)
                        {
                            item.TotalApply = item.AccountCredit;
                            item.DateApplyUpdate = DateTime.Now;

                            _creditApply.UpdateCustomerAccountCredit(item);

                            creditMemo = creditMemo - item.AccountCredit;
                        }
                    }
                }

            }
        }

        public IActionResult InvoiceListToPayStepFinish()
        {
            var processPaymentRequest = HttpContext.Session.Get<PlaceOrderResult>("ErrorPayment");

            if (processPaymentRequest != null)
            {
                if (processPaymentRequest.Errors.Count() > 0)
                    return View(new List<OrderConfirmModel>());
            }

            var OrderPaymentModel = HttpContext.Session.Get<List<OrderConfirmModel>>("InvoiceConfirmModel");
            if (OrderPaymentModel == null)
            {
                OrderPaymentModel = new List<OrderConfirmModel>();
            }
            return View(OrderPaymentModel);
        }

        #endregion
    }
}