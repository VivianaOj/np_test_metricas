using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Invoices;
using Nop.Web.Areas.Admin.Models.Companies;
using Nop.Web.Areas.Admin.Models.Customers;
using System.Collections.Generic;

namespace Nop.Web.Areas.Admin.Factories
{
    public partial interface ICompanyModelFactory
    {
        CompanySearchModel PrepareCompanySearchModel(CompanySearchModel searchModel);

        CompanyListModel PrepareCompanyListModel(CompanySearchModel searchModel);

        CompanyModel PrepareCompanyModel(CompanyModel model, Company company);

        CompanyAddressListModel PrepareCompanyAddressListModel(CompanyAddressSearchModel searchModel, Company company);

        CompanyAllCreditListModel PrepareCompanyCreditListModel(CompanyAllCreditSearchModel searchModel, Company company);

        CompanyOrderListModel PrepareCompanyOrderListModel(CompanyOrderSearchModel searchModel, Company company);

        CustomerListModel PrepareCustomerOrderListModel(CompanyCustomerSearchModel searchModel, Company company);

        CompanyInvoicesListModel PrepareCompanyInvoicesListModel(CompanyInvoicesSearchModel searchModel, IList<Invoice> Invoice);
        //CustomerListModel PrepareCustomerOrderListModel(CompanyCustomerSearchModel searchModel, Company company);

    }
}
