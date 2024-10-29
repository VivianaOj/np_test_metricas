using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Reports
{
    /// <summary>
    /// Represents a bestseller model
    /// </summary>
    public partial class SearchedWordModel : BaseNopModel
    {
        #region Properties

        public int Id { get; set; }

        [NopResourceDisplayName("Admin.Reports.Sales.Bestsellers.Fields.Word")]
        public string Word { get; set; }

        [NopResourceDisplayName("Admin.Reports.Sales.Bestsellers.Fields.Count")]
        public int Count { get; set; }

        [NopResourceDisplayName("Admin.Reports.Sales.Bestsellers.Fields.DateCreate")]
        public decimal DateCreate { get; set; }

        #endregion
    }
}