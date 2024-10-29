using Nop.Web.Framework.Models;
using Nop.Web.Framework.Mvc.ModelBinding;
using System;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    public partial class CompanyModel : BaseNopEntityModel
    {
        #region Ctor

        public CompanyModel()
        {
            CompanyAddressSearchModel = new CompanyAddressSearchModel();
            CompanyOrderSearchModel = new CompanyOrderSearchModel();
            CompanyCustomerSearchModel = new CompanyCustomerSearchModel();

            CompanyInvoicesSearchModel = new CompanyInvoicesSearchModel();
            CompanyAllCreditSearchModel = new CompanyAllCreditSearchModel();
        }

        #endregion

        #region Properties

        [NopResourceDisplayName("Admin.Customers.Company.Fields.CompanyName")]
        public string CompanyName { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Balance")]
        public decimal Balance { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.TaxExempt ")]
        public decimal TaxExempt { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.custentity_tj_exempt_customer ")]
        public bool custentity_tj_exempt_customer { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.custentity_tj_exempt_customer_states ")]
        public string custentity_tj_exempt_customer_states { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.DaysOverdue")]
        public int DaysOverdue { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.ConsoleBalance")]
        public decimal ConsoleBalance { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.PrimaryLocation")]
        public string PrimaryLocation { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Type")]
        public string Type { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Email")]
        public string Email { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Phone")]
        public string Phone { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.EmailsForBilling")]
        public string EmailsForBilling { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Terms")]
        public string Terms { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.BillingTerms")]
        public string BillingTerms { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.DefaultAddress")]
        public string DefaultAddress { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.EntityStatus")]
        public string EntityStatus { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.NetsuiteId")]
        public string NetsuiteId { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.LastModifiedDate")]
        public DateTime LastModifiedDate { get; set; }

        public CompanyAddressSearchModel CompanyAddressSearchModel { get; set; }

        public CompanyOrderSearchModel CompanyOrderSearchModel { get; set; }

        public CompanyCustomerSearchModel CompanyCustomerSearchModel { get; set; }

        public CompanyInvoicesSearchModel CompanyInvoicesSearchModel { get; set; }

        public CompanyAllCreditSearchModel CompanyAllCreditSearchModel { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.ItemCollection")]
        public string ItemCollection { get; set; }

        #endregion
    }

    public partial class CustomerAccountCreditModel : BaseNopEntityModel
    {
        #region Ctor

        public CustomerAccountCreditModel()
        {
            CompanyAllCreditSearchModel = new CompanyAllCreditSearchModel();
        }
        public CompanyAllCreditSearchModel CompanyAllCreditSearchModel { get; set; }
        #endregion

        #region Properties

        [NopResourceDisplayName("Admin.Customers.Company.Fields.NetsuiteId")]
        public string NetsuiteId { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Transid")]
        public string Transid { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.IsInActive")]
        public bool IsInActive { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.TotalApply")]
        public string TotalApply { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Type")]
        public string Type { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.DateApplyUpdate")]

        public DateTime DateApplyUpdate { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.Fields.Name")]
        public string Name { get; set; }
        #endregion
    }

}