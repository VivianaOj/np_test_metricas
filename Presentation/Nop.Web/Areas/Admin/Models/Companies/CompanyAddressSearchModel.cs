using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer address search model
    /// </summary>
    public partial class CompanyAddressSearchModel : BaseSearchModel
    {
        #region Properties

        public int CompanyId { get; set; }

        #endregion
    }
}