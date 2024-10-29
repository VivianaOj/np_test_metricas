using Nop.Web.Framework.Models;
using System.Collections.Generic;

namespace Nop.Web.Models.Common
{
    public class CompanySelectorModel : BaseNopModel
    {
        public CompanySelectorModel()
        {
            AvailableCompanies = new List<CompanyModel>();
        }

        public IList<CompanyModel> AvailableCompanies { get; set; }

        public int CurrentCompanyId { get; set; }
    }
}
