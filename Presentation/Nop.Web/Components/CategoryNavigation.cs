using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;

namespace Nop.Web.Components
{
    public class CategoryNavigationViewComponent : NopViewComponent
    {
        private readonly ICatalogModelFactory _catalogModelFactory;

        public CategoryNavigationViewComponent(ICatalogModelFactory catalogModelFactory)
        {
            _catalogModelFactory = catalogModelFactory;
        }

        public IViewComponentResult Invoke(int currentCategoryId, int currentProductId)
        {
            HttpContext.Session.SetInt32("filterCurrentCategory", currentCategoryId);
            //var model = _catalogModelFactory.PrepareCategoryNavigationModel(currentCategoryId, currentProductId);
            var model = _catalogModelFactory.PrepareCategoryNavigationAccordeonModel();
            return View(model);
        }
    }
}
