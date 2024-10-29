using System.Collections.Generic;
using Nop.Web.Framework.Models;

namespace Nop.Web.Models.Catalog
{
    public partial class CategoryNavigationModel : BaseNopModel
    {
        public CategoryNavigationModel()
        {
            Categories = new List<CategorySimpleModel>();
            PagingFilteringContext = new CatalogPagingFilteringModel();
        }

        public int CurrentCategoryId { get; set; }
        public List<CategorySimpleModel> Categories { get; set; }
       
        public List<CategorySimpleModel> SubCategories { get; set; }
        
        public CatalogPagingFilteringModel PagingFilteringContext { get; set; }

        #region Nested classes

        public class CategoryLineModel : BaseNopModel
        {
            public int CurrentCategoryId { get; set; }
            public CategorySimpleModel Category { get; set; }
            public bool ShowIcon { get; set; } = true;
        }

        #endregion
    }
}