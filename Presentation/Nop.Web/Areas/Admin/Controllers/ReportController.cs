using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Nop.Core;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Invoice;
using Nop.Core.Domain.Invoices;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Services.Customers;
using Nop.Services.ExportImport;
using Nop.Services.Helpers;
using Nop.Services.Invoices;
using Nop.Services.Localization;
using Nop.Services.NN;
using Nop.Services.Payments;
using Nop.Services.Security;
using Nop.Web.Areas.Admin.Factories;
using Nop.Web.Areas.Admin.Models.Orders;
using Nop.Web.Areas.Admin.Models.Reports;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Models.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Nop.Web.Areas.Admin.Controllers
{
    public partial class ReportController : BaseAdminController
    {
        #region Fields

        private readonly IPermissionService _permissionService;
        private readonly IReportModelFactory _reportModelFactory;
        private readonly IOrderModelFactory _orderModelFactory;
        private readonly IInvoiceService _invoiceService;
        private readonly ICompanyService _companyservices;
        private readonly IPriceFormatter _priceFormatter;
        private readonly ILocalizationService _localizationService;
        private readonly IDateTimeHelper _dateTimeHelper;
        private readonly IExportManager _exportManager;
        private readonly IBaseAdminModelFactory _baseAdminModelFactory;
        private readonly IFreigthQuoteService _freigthQuoteService;
        private readonly IAddressService _addressService;
        #endregion

        #region Ctor

        public ReportController(
            IPermissionService permissionService,
            IReportModelFactory reportModelFactory, IBaseAdminModelFactory baseAdminModelFactory, IExportManager exportManager, IDateTimeHelper dateTimeHelper,IOrderModelFactory orderModelFactory, IInvoiceService invoiceService, 
            ICompanyService companyservices, IPriceFormatter priceFormatter, ILocalizationService localizationService, IFreigthQuoteService freigthQuoteService, IAddressService addressService)
        {
            _permissionService = permissionService;
            _reportModelFactory = reportModelFactory;
            _orderModelFactory = orderModelFactory;
            _invoiceService = invoiceService;
            _companyservices = companyservices;
            _priceFormatter = priceFormatter;
            _localizationService = localizationService;
            _dateTimeHelper = dateTimeHelper;
            _exportManager = exportManager;
            _baseAdminModelFactory = baseAdminModelFactory;
            _freigthQuoteService = freigthQuoteService;
            _addressService = addressService;
        }

        #endregion

        #region Methods

        #region Low stock

        public virtual IActionResult LowStock()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageProducts))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareLowStockProductSearchModel(new LowStockProductSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult LowStockList(LowStockProductSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageProducts))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareLowStockProductListModel(searchModel);

            return Json(model);
        }

        #endregion

        #region Bestsellers

        public virtual IActionResult Bestsellers()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareBestsellerSearchModel(new BestsellerSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult BestsellersList(BestsellerSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareBestsellerListModel(searchModel);

            return Json(model);
        }

        #endregion

        #region Never Sold

        public virtual IActionResult NeverSold()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareNeverSoldSearchModel(new NeverSoldReportSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult NeverSoldList(NeverSoldReportSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareNeverSoldListModel(searchModel);

            return Json(model);
        }

        #endregion

        #region Country sales

        public virtual IActionResult CountrySales()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.OrderCountryReport))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareCountrySalesSearchModel(new CountryReportSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult CountrySalesList(CountryReportSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.OrderCountryReport))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareCountrySalesListModel(searchModel);

            return Json(model);
        }

        #endregion

        #region Customer reports

        public virtual IActionResult RegisteredCustomers()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareCustomerReportsSearchModel(new CustomerReportsSearchModel());

            return View(model);
        }

        public virtual IActionResult BestCustomersByOrderTotal()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareCustomerReportsSearchModel(new CustomerReportsSearchModel());

            return View(model);
        }

        public virtual IActionResult BestCustomersByNumberOfOrders()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareCustomerReportsSearchModel(new CustomerReportsSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult ReportBestCustomersByOrderTotalList(BestCustomersReportSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareBestCustomersReportListModel(searchModel);

            return Json(model);
        }

        [HttpPost]
        public virtual IActionResult ReportBestCustomersByNumberOfOrdersList(BestCustomersReportSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareBestCustomersReportListModel(searchModel);

            return Json(model);
        }

        [HttpPost]
        public virtual IActionResult ReportRegisteredCustomersList(RegisteredCustomersReportSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareRegisteredCustomersReportListModel(searchModel);

            return Json(model);
        }

        #endregion

        #region Payments Report
        public virtual IActionResult PaymentInvoice (List<int> orderStatuses = null, List<int> paymentStatuses = null, List<int> shippingStatuses = null)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedView();

            //prepare model


            var model = PrepareInvoiceSearchModel(new InvoiceSearchModel
            {
                OrderStatusIds = orderStatuses,
                PaymentStatusIds = paymentStatuses,
                ShippingStatusIds = shippingStatuses, 

                CreditMemo = "CM001: $20, CM002: $30",
                TotalCreditMemo="$50",

                CustomerDeposite = "CD001: $10, CD001: $10",
                TotalCustomerDeposite = "$20",

                CustomerPayment = "CPTY001: $20",
                TotalCustomerPayment = "$20"
            });

            //var model = _orderModelFactory.PrepareOrderSearchModel(new OrderSearchModel
            //{
            //    OrderStatusIds = orderStatuses,
            //    PaymentStatusIds = paymentStatuses,
            //    ShippingStatusIds = shippingStatuses
            //});

            return View(model);
        }
        public virtual InvoiceSearchModel PrepareInvoiceSearchModel(InvoiceSearchModel searchModel)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));


            //prepare available order, payment and shipping statuses
            _baseAdminModelFactory.PrepareInvoiceStatuses(searchModel.AvailableOrderStatuses);
            if (searchModel.AvailableOrderStatuses.Any())
            {
                if (searchModel.OrderStatusIds?.Any() ?? false)
                {
                    var ids = searchModel.OrderStatusIds.Select(id => id.ToString());
                    searchModel.AvailableOrderStatuses.Where(statusItem => ids.Contains(statusItem.Value)).ToList()
                        .ForEach(statusItem => statusItem.Selected = true);
                }
                else
                    searchModel.AvailableOrderStatuses.FirstOrDefault().Selected = true;
            }

            _baseAdminModelFactory.PreparePaymentStatuses(searchModel.AvailablePaymentStatuses);
            if (searchModel.AvailablePaymentStatuses.Any())
            {
                if (searchModel.PaymentStatusIds?.Any() ?? false)
                {
                    var ids = searchModel.PaymentStatusIds.Select(id => id.ToString());
                    searchModel.AvailablePaymentStatuses.Where(statusItem => ids.Contains(statusItem.Value)).ToList()
                        .ForEach(statusItem => statusItem.Selected = true);
                }
                else
                    searchModel.AvailablePaymentStatuses.FirstOrDefault().Selected = true;
            }


            return searchModel;
        }

       
        public virtual IActionResult InvoiceList(InvoiceSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedDataTablesJson();

            //prepare model
            //var model = _orderModelFactory.PrepareOrderListModel(searchModel);

            var startDateValue = !searchModel.StartDate.HasValue ? null
                : (DateTime?)_dateTimeHelper.ConvertToUtcTime(searchModel.StartDate.Value, _dateTimeHelper.CurrentTimeZone);
            var endDateValue = !searchModel.EndDate.HasValue ? null
                : (DateTime?)_dateTimeHelper.ConvertToUtcTime(searchModel.EndDate.Value, _dateTimeHelper.CurrentTimeZone).AddDays(1);

            var orderStatusIds = (searchModel.OrderStatusIds?.Contains(0) ?? true) ? null : searchModel.OrderStatusIds.ToList();
           
            var paymentStatusIds = (searchModel.PaymentStatusIds?.Contains(0) ?? true) ? null : searchModel.PaymentStatusIds.ToList();


            var InvoicesList = _invoiceService.SearchInvoice(createdFromUtc: startDateValue,
                createdToUtc: endDateValue, osIds: orderStatusIds,
                psIds: paymentStatusIds);

          

            //prepare list model
            var model = new InvoiceListModel().PrepareToGrid(searchModel, InvoicesList, () =>
            {
                //fill in model values from the entity
                return InvoicesList.Select(order =>
                {
                    //fill in model values from the entity
                    var Id = order.Id;
                    var CustomerDepositeApply = "";
                    var InvoiceApply = "";

                    decimal ValuePay = order.ValuePay;
                    decimal TotalCreditCardPay = order.TotalCreditCardPay;
                    var CreatedDate = order.CreatedDate;

                    List<CustomerAccountCredit> CustomerDepositeApplyJson = JsonConvert.DeserializeObject<List<CustomerAccountCredit>>(order.CustomerDepositeApply).ToList();
                    var company = new List<Company>();
                    string companyName = "";
                    if (CustomerDepositeApplyJson.Count() > 0)
					{
                        foreach (var x in CustomerDepositeApplyJson)
                        {
                            company = _companyservices.GetCompanyByNetSuiteId(x.CompanyId);
                            CustomerDepositeApply += x.Transid + " Total Credit: " + _priceFormatter.FormatPrice(x.AccountCredit) + " Total Applied: " + _priceFormatter.FormatPrice(x.TotalApply)  /*+ " - Company: " + company.CompanyName */ + " , ";
                        }
					}
					else
					{
                        List<InvoicesToPay> InvoiceApplyList = JsonConvert.DeserializeObject<List<InvoicesToPay>>(order.InvoiceApply).ToList();

                        foreach (var x in InvoiceApplyList)
                        {
                            var orderInfo = _invoiceService.GetInvoiceById(Convert.ToInt32(x.OrderId)); 
                            var companyInfo = _companyservices.GetCompanyById(orderInfo.CompanyId);
                            if(companyInfo!=null)
                                companyName = companyInfo.CompanyName + " (" + companyInfo.NetsuiteId + ")";
                            //CustomerDepositeApply += x.Transid + " Total Credit: " + _priceFormatter.FormatPrice(x.AccountCredit) + " Total Applied: " + _priceFormatter.FormatPrice(x.TotalApply)  /*+ " - Company: " + company.CompanyName */ + " , ";
                        }

                    }


                    
                    if (company.Count()>0)
                        companyName =  company.FirstOrDefault().CompanyName +" ("+ company.FirstOrDefault().NetsuiteId+")";
					else
					{

					}
                    var InvoiceApplyJson = JsonConvert.DeserializeObject<List<Services.Payments.InvoicesToPay>>(order.InvoiceApply);

                    if (InvoiceApplyJson != null)
                    {
                        foreach (var j in InvoiceApplyJson)
                        {
                            if (j.OrderId != null) {
                                var invoice = _invoiceService.GetInvoiceById(Convert.ToInt32(j.OrderId));

                                var TotalPay = "";
                                var TotalApplied = "";
                                var TotalUNApplied = "";

                                if (j.IsPay)
                                {
                                    TotalPay = _priceFormatter.FormatPrice(invoice.Total);
                                    var isPay = invoice.Total - invoice.AmountDue - Convert.ToDecimal(j.ValuePay);
                                    if (isPay == 0)
                                        TotalApplied = _priceFormatter.FormatPrice(invoice.Total);
                                    else
                                        TotalApplied = _priceFormatter.FormatPrice(Convert.ToDecimal(j.ValuePay));

                                }
                                if (!j.IsPay)
                                {
                                    if (invoice!=null)
                                    {
                                        TotalPay = _priceFormatter.FormatPrice(invoice.Total);
                                        if (invoice.AmountDue > 0)
                                            TotalApplied = _priceFormatter.FormatPrice(Convert.ToDecimal(j.ValuePay));
                                        else
                                            TotalApplied = _priceFormatter.FormatPrice(invoice.Total - Convert.ToDecimal(j.ValuePay));

                                        if (TotalApplied == "$0.00")
                                            TotalApplied = _priceFormatter.FormatPrice(invoice.Total);
                                    }
                                    
                                }

                                // NamePay = "Partially Paid";
                                if(invoice!=null)
                                    InvoiceApply += invoice.PONumber + " Invoice Amount: " + TotalPay + " Amount Paid: " + TotalApplied + " , ";
                                else
                                    InvoiceApply +=  " Invoice Amount: " + TotalPay + " Amount Paid: " + TotalApplied + " , ";

                            }
                        }
                    }

                    var InvoiceTransactionModel = new InvoiceTransactionModel
                    {
                        Id = Id,
                        ValuePayPriceFormat = _priceFormatter.FormatPrice(ValuePay),
                        TotalCreditCardPayPriceFormat = _priceFormatter.FormatPrice(TotalCreditCardPay),
                        CustomerDepositeApply = CustomerDepositeApply,
                        InvoiceApply = InvoiceApply,
                        CreatedDate= CreatedDate,
                        Company = companyName
                    };
                  

                    return InvoiceTransactionModel;
                }).OrderByDescending(r=>r.Id);
            });

            
            return Json(model);
        }


        [HttpPost, ActionName("List")]
        [FormValueRequired("exportexcel-all")]
        public virtual IActionResult ExportExcelAll(InvoiceSearchModel model)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders) || !_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedView();

            var startDateValue = model.StartDate == null ? null
                            : (DateTime?)_dateTimeHelper.ConvertToUtcTime(model.StartDate.Value, _dateTimeHelper.CurrentTimeZone);

            var endDateValue = model.EndDate == null ? null
                            : (DateTime?)_dateTimeHelper.ConvertToUtcTime(model.EndDate.Value, _dateTimeHelper.CurrentTimeZone).AddDays(1);

           

            var orderStatusIds = model.OrderStatusIds != null && !model.OrderStatusIds.Contains(0)
                ? model.OrderStatusIds.ToList()
                : null;
            var paymentStatusIds = model.PaymentStatusIds != null && !model.PaymentStatusIds.Contains(0)
                ? model.PaymentStatusIds.ToList()
                : null;
            var shippingStatusIds = model.ShippingStatusIds != null && !model.ShippingStatusIds.Contains(0)
                ? model.ShippingStatusIds.ToList()
                : null;

            var filterByProductId = 0;
         

            //load orders
            var orders =  _invoiceService.SearchInvoice(storeId: model.StoreId,
                paymentMethodSystemName: model.PaymentMethodSystemName,
                createdFromUtc: startDateValue,
                createdToUtc: endDateValue,
                osIds: orderStatusIds,
                psIds: paymentStatusIds
               );

            try
            {
                var bytes = _exportManager.ExportInvoiceToXlsx(orders);
                return File(bytes, MimeTypes.TextXlsx, "InvoicesReport.xlsx");
            }
            catch (Exception exc)
            {
                
                return RedirectToAction("InvoiceList");
            }
        }

        [HttpPost]
        public virtual IActionResult ExportExcelSelected(string selectedIds)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders) || !_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedView();

            var orders = new List<InvoiceTransaction>();
            if (selectedIds != null)
            {
                var ids = selectedIds
                    .Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                    .Select(x => Convert.ToInt32(x))
                    .ToArray();
                orders.AddRange(_invoiceService.GetTransactionByIds(ids));
            }

            try
            {
                var bytes = _exportManager.ExportInvoiceToXlsx(orders);
                return File(bytes, MimeTypes.TextXlsx, "InvoiceTransactionReport.xlsx");
            }
            catch (Exception exc)
            {
                
                return RedirectToAction("InvoiceList");
            }
        }
        #endregion

        #region Freight Quotes
        public virtual IActionResult FreightQuotes(List<int> orderStatuses = null, List<int> paymentStatuses = null, List<int> shippingStatuses = null)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedView();

            //prepare model


            var model = PrepareFreightQuoteSearchModel(new   FreightQuoteSearchModel
            {
                OrderStatusIds = orderStatuses,
                PaymentStatusIds = paymentStatuses,
                ShippingStatusIds = shippingStatuses,

                CreditMemo = "CM001: $20, CM002: $30",
                TotalCreditMemo = "$50",

                CustomerDeposite = "CD001: $10, CD001: $10",
                TotalCustomerDeposite = "$20",

                CustomerPayment = "CPTY001: $20",
                TotalCustomerPayment = "$20"
            });

            //var model = _orderModelFactory.PrepareOrderSearchModel(new OrderSearchModel
            //{
            //    OrderStatusIds = orderStatuses,
            //    PaymentStatusIds = paymentStatuses,
            //    ShippingStatusIds = shippingStatuses
            //});

            return View(model);
        }
        public virtual FreightQuoteSearchModel PrepareFreightQuoteSearchModel(FreightQuoteSearchModel searchModel)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));


            //prepare available order, payment and shipping statuses
            _baseAdminModelFactory.PrepareInvoiceStatuses(searchModel.AvailableOrderStatuses);
            if (searchModel.AvailableOrderStatuses.Any())
            {
                if (searchModel.OrderStatusIds?.Any() ?? false)
                {
                    var ids = searchModel.OrderStatusIds.Select(id => id.ToString());
                    searchModel.AvailableOrderStatuses.Where(statusItem => ids.Contains(statusItem.Value)).ToList()
                        .ForEach(statusItem => statusItem.Selected = true);
                }
                else
                    searchModel.AvailableOrderStatuses.FirstOrDefault().Selected = true;
            }

            _baseAdminModelFactory.PreparePaymentStatuses(searchModel.AvailablePaymentStatuses);
            if (searchModel.AvailablePaymentStatuses.Any())
            {
                if (searchModel.PaymentStatusIds?.Any() ?? false)
                {
                    var ids = searchModel.PaymentStatusIds.Select(id => id.ToString());
                    searchModel.AvailablePaymentStatuses.Where(statusItem => ids.Contains(statusItem.Value)).ToList()
                        .ForEach(statusItem => statusItem.Selected = true);
                }
                else
                    searchModel.AvailablePaymentStatuses.FirstOrDefault().Selected = true;
            }


            return searchModel;
        }


        public virtual IActionResult FreightQuotesList(FreightQuoteSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.PaymentInvoice))
                return AccessDeniedDataTablesJson();

            //prepare model
            //var model = _orderModelFactory.PrepareOrderListModel(searchModel);

            var startDateValue = !searchModel.StartDate.HasValue ? null
                : (DateTime?)_dateTimeHelper.ConvertToUtcTime(searchModel.StartDate.Value, _dateTimeHelper.CurrentTimeZone);
            
            
            var InvoicesList = _freigthQuoteService.SearchFreigthQuote(createdFromUtc: startDateValue);



            //prepare list model
            var model = new FreightQuoteListModel().PrepareToGrid(searchModel, InvoicesList, () =>
            {
                //fill in model values from the entity
                return InvoicesList.Select(order =>
                {
                    var addressBilling = _addressService.GetAddressById(order.BillingAddress_Id);
                    var addressShipping = _addressService.GetAddressById(order.Shippng_Address_Id);

                    var InvoiceTransactionModel = new FreightQuoteTransactionModel
                    {
                        Id = order.Id,
                        Name = order.Name,
                        Email = order.Email,
                        Phone = order.Phone,
                        RequestDate = order.RequestDate.ToString("MM-dd-yyyy"),
                        BillingAddress = addressBilling.Address1 + " " + addressBilling.Address2 + ", " + addressBilling.City + ", " + addressBilling.ZipPostalCode + ", " + addressBilling.StateProvince?.Name,
                        Shippng_Address = addressShipping.Address1 + " " + addressShipping.Address2 + ", " + addressShipping.City + ", " + addressShipping.ZipPostalCode + ", " + addressShipping.StateProvince?.Name,
                        Items = order.Items,
                        Infomation = order.Infomation,
                        TotalAmount = order.TotalAmount
                    };


                    return InvoiceTransactionModel;
                }).OrderByDescending(r => r.Id);
            });


            return Json(model);
        }



        #endregion

        #region SearchedWords

        public virtual IActionResult SearchedWords()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedView();

            //prepare model
            var model = _reportModelFactory.PrepareSearchedWordSearchModel(new SearchedWordSearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult SearchedWordsList(SearchedWordSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageOrders))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _reportModelFactory.PrepareSearchedWordListModel(searchModel);

            return Json(model);
        }

        #endregion

        #endregion
    }
}
