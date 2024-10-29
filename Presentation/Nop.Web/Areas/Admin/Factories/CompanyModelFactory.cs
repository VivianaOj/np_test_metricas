using Nop.Core.Domain.Common;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Invoices;
using Nop.Core.Domain.Shipping;
using Nop.Services.AccountCredit;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Services.Customers;
using Nop.Services.Helpers;
using Nop.Services.Invoices;
using Nop.Services.Localization;
using Nop.Services.Orders;
using Nop.Services.Stores;
using Nop.Web.Areas.Admin.Infrastructure.Mapper.Extensions;
using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Areas.Admin.Models.Companies;
using Nop.Web.Areas.Admin.Models.Customers;
using Nop.Web.Framework.Models.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace Nop.Web.Areas.Admin.Factories
{
    public partial class CompanyModelFactory : ICompanyModelFactory
    {
        #region Fields

        private readonly ICompanyService _companyService;
        private readonly AddressSettings _addressSettings;
        private readonly IAddressAttributeFormatter _addressAttributeFormatter;
        private readonly IStoreService _storeService;
        private readonly IOrderService _orderService;
        private readonly ILocalizationService _localizationService;
        private readonly IDateTimeHelper _dateTimeHelper;
        private readonly IPriceFormatter _priceFormatter;
        private readonly IItemCollectionServices _itemCollection;

        private readonly IInvoiceService _invoiceService;
        private readonly ICustomerCreditBalanceService _credit;
        #endregion

        #region Ctor

        public CompanyModelFactory(ICompanyService companyService, AddressSettings addressSettings,
            IAddressAttributeFormatter addressAttributeFormatter, IStoreService storeService,
            IOrderService orderService, ILocalizationService localizationService, IInvoiceService invoiceService, ICustomerCreditBalanceService credit,
        IDateTimeHelper dateTimeHelper, IPriceFormatter priceFormatter, IItemCollectionServices itemCollection)
        {
            _companyService = companyService;
            _addressSettings = addressSettings;
            _addressAttributeFormatter = addressAttributeFormatter;
            _storeService = storeService;
            _orderService = orderService;
            _localizationService = localizationService;
            _dateTimeHelper = dateTimeHelper;
            _priceFormatter = priceFormatter;
            _itemCollection = itemCollection;
            _invoiceService = invoiceService;
            _credit = credit;

        }

        #endregion

        #region Methods

        public CompanyListModel PrepareCompanyListModel(CompanySearchModel searchModel)
        {
            var companies = _companyService.GetAllCompanies(searchModel.CompanyName, searchModel.NetSuiteId,
                searchModel.CompanyEmail, searchModel.Page - 1, searchModel.PageSize);

            //prepare list model
            var model = new CompanyListModel().PrepareToGrid(searchModel, companies, () =>
            {
                return companies.Select(company =>
                {
                    //fill in model values from the entity
                    var companyModel = company.ToModel<CompanyModel>();

                    companyModel.CompanyName = company.CompanyName;
                    companyModel.NetsuiteId = company.NetsuiteId;
                    companyModel.Email = company.Email;
                    companyModel.EmailsForBilling = company.EmailsForBilling;

                    return companyModel;
                });
            });

            return model;
        }

        public CompanySearchModel PrepareCompanySearchModel(CompanySearchModel searchModel)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            //prepare page parameters
            searchModel.SetGridPageSize();

            return searchModel;
        }

        public CompanyModel PrepareCompanyModel(CompanyModel model, Company company)
        {
            if (model == null)
                throw new ArgumentNullException(nameof(model));

            if (company == null)
                throw new ArgumentNullException(nameof(company));

            model = company.ToModel<CompanyModel>();

            model.Id = company.Id;
            model.CompanyAddressSearchModel.CompanyId = company.Id;
            model.CompanyOrderSearchModel.CompanyId = company.Id;
            model.CompanyCustomerSearchModel.CompanyId = company.Id;
            model.CompanyInvoicesSearchModel.CompanyId = company.Id;
            model.CompanyAllCreditSearchModel.CompanyId = company.Id;
            model.custentity_tj_exempt_customer = company.custentity_tj_exempt_customer;
            model.custentity_tj_exempt_customer_states = company.custentity_tj_exempt_customer_states;

            if (!string.IsNullOrEmpty(company.NetsuiteId))
            {
                var ItemCollection = _itemCollection.GetItemCollectionCompanyByNetsuiteId(Convert.ToInt32(company.Id)).FirstOrDefault();
                if (ItemCollection != null)
                {
                    var collection = _itemCollection.GetItemCollectionByIdTable(Convert.ToInt32(ItemCollection.CollectionId));
                    if (collection != null)
                        model.ItemCollection = collection.Name;
                }
            }

            return model;
        }

        public virtual CompanyAddressListModel PrepareCompanyAddressListModel(CompanyAddressSearchModel searchModel, Company company)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            if (company == null)
                throw new ArgumentNullException(nameof(company));

            //get customer addresses
            var addresses = company.Addresses.Where(r=>!r.Active)
                .OrderByDescending(x => x.CreatedOnUtc).ThenByDescending(x => x.Id)
                //.Select(x => new Address
                //            {
                //	NetsuitId = x.NetsuitId
                //                Id=x.Id,
                //                PhoneNumber=x.PhoneNumber,
                //                Residential=x.Residential,
                //                Address1=x.Address1,
                //                Address2=x.Address2

                //                // Add other fields you want to include in the grouping here
                //            })
                .GroupBy(r => r.NetsuitId)
                .Select(group => group.FirstOrDefault())
                .ToList()
                .ToPagedList(searchModel);

            //prepare list model
            var model = new CompanyAddressListModel().PrepareToGrid(searchModel, addresses, () =>
            {
                return addresses.Select(address =>
                {
                    //fill in model values from the entity        
                    var addressModel = address.ToModel<AddressModel>();
                    addressModel.CountryName = address.Country?.Name;
                    addressModel.StateProvinceName = address.StateProvince?.Name;

                    var companyAddresses = _companyService.GetAllCompanyAddressMappings(address.Id, company.Id).FirstOrDefault();

                    addressModel.IsShipping= companyAddresses.IsShipping;
                    addressModel.IsBilling = companyAddresses.IsBilling;
                    addressModel.ApprovedNNDelivery = companyAddresses.DeliveryRouteName;
                    //fill in additional values (not existing in the entity)
                    PrepareModelAddressHtml(addressModel, address);

                    return addressModel;
                });
            });

            return model;
        }

        public virtual CompanyOrderListModel PrepareCompanyOrderListModel(CompanyOrderSearchModel searchModel, Company company)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            if (company == null)
                throw new ArgumentNullException(nameof(company));

            //get customer orders
            var orders = _orderService.OverriddenSearchOrders(companyId: company.Id, pageIndex: searchModel.Page - 1, pageSize: searchModel.PageSize);

            //prepare list model
            var model = new CompanyOrderListModel().PrepareToGrid(searchModel, orders, () =>
            {
                return orders.Select(order =>
                {
                    //fill in model values from the entity
                    var orderModel = order.ToModel<CompanyOrderModel>();

                    //convert dates to the user time
                    orderModel.CreatedOn = _dateTimeHelper.ConvertToUserTime(order.CreatedOnUtc, DateTimeKind.Utc);

                    //fill in additional values (not existing in the entity)
                    orderModel.StoreName = _storeService.GetStoreById(order.StoreId)?.Name ?? "Unknown";
                    orderModel.OrderStatus = _localizationService.GetLocalizedEnum(order.OrderStatus);
                    orderModel.PaymentStatus = _localizationService.GetLocalizedEnum(order.PaymentStatus);
                    orderModel.ShippingStatus = _localizationService.GetLocalizedEnum(order.ShippingStatus);
                    orderModel.OrderTotal = _priceFormatter.FormatPrice(order.OrderTotal, true, false);

                    return orderModel;
                });
            });

            return model;
        }

        public virtual CustomerListModel PrepareCustomerOrderListModel(CompanyCustomerSearchModel searchModel, Company company)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            if (company == null)
                throw new ArgumentNullException(nameof(company));

            //get customer addresses
            var customers = company.Customers.OrderByDescending(x => x.CreatedOnUtc).ThenByDescending(x => x.Id).ToList().ToPagedList(searchModel);

            //prepare list model
            var model = new CustomerListModel().PrepareToGrid(searchModel, customers, () =>
            {
                return customers.Select(customer =>
                {
                    //fill in model values from the entity

                    var orderModel = customer.ToModel<CustomerModel>();

                    //convert dates to the user time
                    orderModel.Email = customer.Email;
                    orderModel.NetsuitId = customer.NetsuitId;
                    //fill in additional values (not existing in the entity)
                    // PrepareModelCustomerHtml(orderModel, customer);


                    return orderModel;
                });
            });

            return model;
        }

        public virtual CompanyAllCreditListModel PrepareCompanyCreditListModel(CompanyAllCreditSearchModel searchModel, Company company)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            if (company == null)
                throw new ArgumentNullException(nameof(company));

            //get customer credits
            var credits = _credit.GetCustomerCreditBalance(Convert.ToInt32(company.NetsuiteId)).Where(r=>r.IsInActive==false)
                .OrderBy(x => x.Name).ThenByDescending(x => x.DateSync).ToList()
                .ToPagedList(searchModel);

            //prepare list model
            var model = new CompanyAllCreditListModel().PrepareToGrid(searchModel, credits, () =>
            {
                return credits.Select(x =>
                {
                    //fill in model values from the entity        
                    var creditModel = new AllCreditsModel();
                    creditModel.Id = x.Id;
                    creditModel.IsInActive = !x.IsInActive ? "Yes" : "No"; ;
                    creditModel.NetsuiteId = x.NetsuiteId.ToString();
                    creditModel.TotalApply = x.AccountCredit;
                    creditModel.Transid = x.Transid;
                    creditModel.Type = x.Type;
                    creditModel.AccountCredit = x.AccountCredit;
                    creditModel.Name = x.Name;
                    creditModel.DateApplyUpdate = x.DateApplyUpdate;


                    //fill in additional values (not existing in the entity)
                    PrepareModelCreditHtml(creditModel);

                    return creditModel;
                });
            });

            return model;
        }


        public virtual CompanyInvoicesListModel PrepareCompanyInvoicesListModel(CompanyInvoicesSearchModel searchModel, IList<Invoice> invoices)
        {
            if (searchModel == null)
                throw new ArgumentNullException(nameof(searchModel));

            if (invoices == null)
                throw new ArgumentNullException(nameof(invoices));

            
            var pageList = invoices.Select(inv =>
            {
                //fill in model values from the entity
                var invoicesModel = new InvoicesModel();
                invoicesModel.Id = inv.Id;
                invoicesModel.Total = inv.foreigntotal;
                invoicesModel.InvoiceNo = inv.InvoiceNo;

                invoicesModel.SaleOrderId = inv.SaleOrderId;
                invoicesModel.AmountDue = inv.AmountDue;

                if (inv.PaymentStatusId == 30)
                {
                    invoicesModel.StatusName = "Paid";
                }
                else
                {
                    if (inv.PaymentStatusId == 60)
                    {
                        invoicesModel.StatusName = "Partially Paid";
					}
					else
					{
                        if (inv.AmountDue == 0 && inv.PaymentStatusId == 0)
                        {
                            // RemainingBalance = order.Invoice.Total;
                        }
                        else
                        {

                            if (inv.AmountDue > 0 && inv.AmountDue < inv.Total)
                            {
                                invoicesModel.StatusName = "Partially Paid";
                            }
                            else
                            {
                                invoicesModel.StatusName = "Unpaid";
                            }
                        }
					}
                }

                        return invoicesModel;

            }).ToList().ToPagedList(searchModel);


            var model = new CompanyInvoicesListModel().PrepareToGrid(searchModel, pageList, () => pageList);


            ////prepare list model
            //var model = new CompanyInvoicesListModel().PrepareToGrid(searchModel, invoices, () =>
            //{
            //    return invoices.Select(inv =>
            //    {
            //        //fill in model values from the entity
            //        var invoicesModel = inv.ToModel<InvoicesModel>();

            //        //convert dates to the user time
            //        //invoicesModel = _dateTimeHelper.ConvertToUserTime(inv.LastModifiedDate, DateTimeKind.Utc);

            //        invoicesModel.Total = inv.Total;

            //        invoicesModel.InvoiceNo = inv.InvoiceNo;

            //        return invoicesModel;
            //    });
            //});

            return model;
        }


       
        #endregion

        #region Utilities

        protected virtual void PrepareModelAddressHtml(AddressModel model, Address address)
        {
            if (model == null)
                throw new ArgumentNullException(nameof(model));

            var addressHtmlSb = new StringBuilder("<div>");

            if (_addressSettings.CompanyEnabled && !string.IsNullOrEmpty(model.Company))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.Company));


            if (_addressSettings.StreetAddressEnabled && !string.IsNullOrEmpty(model.Address1))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.Address1));

            if (_addressSettings.StreetAddress2Enabled && !string.IsNullOrEmpty(model.Address2))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.Address2));

            if (_addressSettings.CityEnabled && !string.IsNullOrEmpty(model.City))
                addressHtmlSb.AppendFormat("{0},", WebUtility.HtmlEncode(model.City));

            if (_addressSettings.CountyEnabled && !string.IsNullOrEmpty(model.County))
                addressHtmlSb.AppendFormat("{0},", WebUtility.HtmlEncode(model.County));

            if (_addressSettings.StateProvinceEnabled && !string.IsNullOrEmpty(model.StateProvinceName))
                addressHtmlSb.AppendFormat("{0},", WebUtility.HtmlEncode(model.StateProvinceName));

            if (_addressSettings.ZipPostalCodeEnabled && !string.IsNullOrEmpty(model.ZipPostalCode))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.ZipPostalCode));

            if (_addressSettings.CountryEnabled && !string.IsNullOrEmpty(model.CountryName))
                addressHtmlSb.AppendFormat("{0}", WebUtility.HtmlEncode(model.CountryName));

            var customAttributesFormatted = _addressAttributeFormatter.FormatAttributes(address?.CustomAttributes);
            if (!string.IsNullOrEmpty(customAttributesFormatted))
            {
                //already encoded
                addressHtmlSb.AppendFormat("<br />{0}", customAttributesFormatted);
            }

            addressHtmlSb.Append("</div>");

            model.AddressHtml = addressHtmlSb.ToString();
        }


        protected virtual void PrepareModelCustomerHtml(CompanyCustomerModel model, Customer address)
        {
            if (model == null)
                throw new ArgumentNullException(nameof(model));

            var addressHtmlSb = new StringBuilder("<div>");

           
            if (!string.IsNullOrEmpty(model.Email))
                addressHtmlSb.AppendFormat("{0}", WebUtility.HtmlEncode(model.Email));

             
            addressHtmlSb.Append("</div>");

           // model.CustomerHtml = addressHtmlSb.ToString();
        }


        protected virtual void PrepareModelCreditHtml(AllCreditsModel model)
        {
            if (model == null)
                throw new ArgumentNullException(nameof(model));

            var addressHtmlSb = new StringBuilder("<div>");

            if (!string.IsNullOrEmpty(model.Transid))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.Transid));


            if (!string.IsNullOrEmpty(model.NetsuiteId))
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.NetsuiteId));

            
                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.TotalApply.ToString()));

                addressHtmlSb.AppendFormat("{0}<br />", WebUtility.HtmlEncode(model.IsInActive.ToString()));

            addressHtmlSb.Append("</div>");

            model.CreditHtml = addressHtmlSb.ToString();
        }

        #endregion
    }
}
