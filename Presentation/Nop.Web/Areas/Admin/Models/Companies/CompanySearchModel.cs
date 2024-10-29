using Nop.Web.Framework.Models;
using Nop.Web.Framework.Mvc.ModelBinding;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    public partial class CompanySearchModel : BaseSearchModel
    {
        #region Properties

        [NopResourceDisplayName("Admin.Customers.Company.List.CompanyName")]
        public string CompanyName { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.List.NetSuiteId")]
        public string NetSuiteId { get; set; }

        [NopResourceDisplayName("Admin.Customers.Company.List.CompanyEmail")]
        public string CompanyEmail { get; set; }

        public int customerId { get; set; }


        #endregion
    }
}
