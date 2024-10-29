using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer address list model
    /// </summary>
    public partial class CompanyAllCreditModel : BaseNopModel
    {
        #region Ctor

        public CompanyAllCreditModel()
        {
            AllCredits = new AllCreditsModel();
        }

        #endregion

        #region Properties

        public int CompanyId { get; set; }

        public AllCreditsModel AllCredits { get; set; }

        #endregion
    }
}