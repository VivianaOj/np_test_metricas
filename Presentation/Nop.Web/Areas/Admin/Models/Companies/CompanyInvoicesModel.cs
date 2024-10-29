using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer address list model
    /// </summary>
    public partial class CompanyInvoicesModel : BaseNopEntityModel
    {
        #region Ctor

        public CompanyInvoicesModel()
        {
            invoices = new InvoicesModel();
        }

        #endregion

        #region Properties

        public int CompanyId { get; set; }

        public InvoicesModel invoices { get; set; }

        #endregion
    }
}