using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nop.Core.Domain.Catalog;
using Nop.Core.Domain.Common;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Services.Configuration;
using Nop.Services.Security;
using Nop.Services.Seo;
using Nop.Services.Stores;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;
using Nop.Web.Models.Catalog;

namespace Nop.Web.Components
{
    public class HomepageProductsViewComponent : NopViewComponent
    {
        private readonly IAclService _aclService;
        private readonly IProductModelFactory _productModelFactory;
        private readonly IProductService _productService;
        private readonly IStoreMappingService _storeMappingService;
        private readonly ISettingService _settingService;
        private readonly IAnywhereSliderService _anywhereService;
        private readonly IUrlRecordService _urlRecordService;

        public HomepageProductsViewComponent(IAclService aclService,
            IProductModelFactory productModelFactory,
            IProductService productService,
            IStoreMappingService storeMappingService,
            ISettingService settingService,
            IAnywhereSliderService anywhereService,
            IUrlRecordService urlRecordService)
        {
            _aclService = aclService;
            _productModelFactory = productModelFactory;
            _productService = productService;
            _storeMappingService = storeMappingService;
            _settingService = settingService;
            _anywhereService = anywhereService;
            _urlRecordService = urlRecordService;
        }

        public IViewComponentResult Invoke(int? productThumbPictureSize)
        {
            var products = _productService.GetAllProductsDisplayedOnHomepage();
            //ACL and store mapping
            products = products.Where(p => _aclService.Authorize(p) && _storeMappingService.Authorize(p)).ToList();
            //availability dates
            products = products.Where(p => _productService.ProductIsAvailable(p)).ToList();

            products = products.Where(p => p.VisibleIndividually).ToList();
            var promotion = GetPromotionProduct();
            if (promotion != null)
            {
                Product Promotion = new Product();
                Promotion = _productService.GetProductById(promotion.Id);
                products.Insert(0, Promotion);
            }
            
            //while (products.Count > 4)
            //{
            //    products.RemoveAt(products.Count - 1);
            //}

            if (!products.Any())
                return Content("");

            var model = _productModelFactory.PrepareProductOverviewModels(products, true, true, productThumbPictureSize).ToList();
            if (promotion != null)
                model.Insert(0, promotion);

            return View(model);
        }
        private ProductOverviewModel GetPromotionProduct()
        {
            //Promotion banner
            string dealMonth = _settingService.GetSetting("dealofthemonth.type.anywhereslider")?.Value;
            if (dealMonth != null)
            {
                SS_AS_AnywhereSlider anyqhereSlider = new SS_AS_AnywhereSlider();
                anyqhereSlider = _anywhereService.GetRegiusterById(dealMonth);
                SS_AS_SliderImage sliderImage = new SS_AS_SliderImage();
                sliderImage = _anywhereService.GetSliderById(anyqhereSlider.Id);
                int ProductId = _productService.GetProductIdByPictureId(sliderImage.PictureId);
                Product ProductPromotion = new Product();
                ProductPromotion = _productService.GetProductById(ProductId);

                if (ProductPromotion != null)
                {
                    var promotion = new ProductOverviewModel
                    {
                        Id = ProductPromotion.Id,
                        Name = ProductPromotion.Name,
                        ShortDescription = ProductPromotion.ShortDescription,
                        FullDescription = ProductPromotion.FullDescription,
                        SeName = _urlRecordService.GetSeName(ProductPromotion),
                        Sku = ProductPromotion.Sku,
                        ProductType = ProductPromotion.ProductType,
                        MarkAsNew = ProductPromotion.MarkAsNew &&
                               (!ProductPromotion.MarkAsNewStartDateTimeUtc.HasValue || ProductPromotion.MarkAsNewStartDateTimeUtc.Value < DateTime.UtcNow) &&
                               (!ProductPromotion.MarkAsNewEndDateTimeUtc.HasValue || ProductPromotion.MarkAsNewEndDateTimeUtc.Value > DateTime.UtcNow),
                    };
                    return promotion;
                }
                
            }
            return null;
            
        }
    }
}