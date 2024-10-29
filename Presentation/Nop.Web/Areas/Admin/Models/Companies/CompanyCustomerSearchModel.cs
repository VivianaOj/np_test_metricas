using Nop.Web.Framework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Areas.Admin.Models.Companies
{
    public class CompanyCustomerSearchModel : BaseSearchModel
    {
        #region Properties

        public int CompanyId { get; set; }

        public int CustomerId { get; set; }

        #endregion
    }
}