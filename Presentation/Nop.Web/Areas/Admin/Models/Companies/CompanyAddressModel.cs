using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    /// <summary>
    /// Represents a customer address model
    /// </summary>
    public partial class CompanyAddressModel : BaseNopModel
    {
        #region Ctor

        public CompanyAddressModel()
        {
            Address = new AddressModel();
        }

        #endregion

        #region Properties

        public int CompanyId { get; set; }

        public AddressModel Address { get; set; }

        #endregion
    }
}