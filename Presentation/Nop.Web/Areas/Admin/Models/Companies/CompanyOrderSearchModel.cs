using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer orders search model
    /// </summary>
    public partial class CompanyOrderSearchModel : BaseSearchModel
    {
        #region Properties

        public int CompanyId { get; set; }

        #endregion
    }
}