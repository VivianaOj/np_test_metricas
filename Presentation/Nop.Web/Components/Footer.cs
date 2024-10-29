using Microsoft.AspNetCore.Mvc;
using Nop.Services.Configuration;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;

namespace Nop.Web.Components
{
    public class FooterViewComponent : NopViewComponent
    {
        private readonly ICommonModelFactory _commonModelFactory;
        private readonly ISettingService _settingService;

        public FooterViewComponent(ICommonModelFactory commonModelFactory, ISettingService settingService)
        {
            _commonModelFactory = commonModelFactory;
            _settingService = settingService;

        }

        public IViewComponentResult Invoke()
        {
            ViewBag.url_fb = _settingService.GetSetting("storeinformationsettings.facebooklink").Value;
            ViewBag.url_instagram = _settingService.GetSetting("storeinformationsettings.youtubelink").Value;
            ViewBag.url_linkedin = _settingService.GetSetting("storeinformationsettings.twitterlink").Value;

            var model = _commonModelFactory.PrepareFooterModel();
            return View(model);
        }
    }
}
