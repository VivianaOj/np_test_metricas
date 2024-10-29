
using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Framework.Models;
using System;

namespace Nop.Web.Areas.Admin.Models.Common
{
    public partial class AllCreditsModel : BaseNopEntityModel
    {
        public AllCreditsModel()
        {
           
        }
        public string NetsuiteId { get; set; }

        [NopResourceDisplayName("Admin.Address.Fields.InvoicesNumber")]
        public string Transid { get; set; }
        public decimal TotalApply { get; set; }
        public int Type { get; set; }
        public string IsInActive { get; set; }

        [NopResourceDisplayName("Admin.Address")]
        public string CreditHtml { get; set; }

        public decimal AccountCredit { get; set; }
        public DateTime DateApplyUpdate { get; set; }

        public string Name { get; set; }
        #region Nested classes


        #endregion
    }
}