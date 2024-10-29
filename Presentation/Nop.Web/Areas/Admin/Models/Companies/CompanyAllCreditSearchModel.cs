using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer address list model
    /// </summary>
    public partial class CompanyAllCreditSearchModel : BaseSearchModel
    {
        #region Properties

        public int CompanyId { get; set; }

        #endregion
    }
}