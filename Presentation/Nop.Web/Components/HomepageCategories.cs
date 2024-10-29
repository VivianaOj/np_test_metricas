using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nop.Services.Configuration;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;

namespace Nop.Web.Components
{
    public class HomepageCategoriesViewComponent : NopViewComponent
    {
        private readonly ICatalogModelFactory _catalogModelFactory;

        private readonly ISettingService _settingService;


        public HomepageCategoriesViewComponent(ICatalogModelFactory catalogModelFactory, ISettingService settingService)
        {
            _catalogModelFactory = catalogModelFactory;
            _settingService = settingService;
        }

        public IViewComponentResult Invoke()
        {
            var model = _catalogModelFactory.PrepareHomepageCategoryModels();
            if (!model.Any())
                return Content("");

            ViewBag.url_fb = _settingService.GetSetting("storeinformationsettings.facebooklink").Value;
            ViewBag.url_instagram = _settingService.GetSetting("storeinformationsettings.youtubelink").Value;
            ViewBag.url_linkedin = _settingService.GetSetting("storeinformationsettings.twitterlink").Value;

            return View(model);
        }
    }
}
