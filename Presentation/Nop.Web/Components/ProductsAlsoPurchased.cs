using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nop.Core;
using Nop.Core.Caching;
using Nop.Core.Domain.Catalog;
using Nop.Services.Catalog;
using Nop.Services.Orders;
using Nop.Services.Security;
using Nop.Services.Stores;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;
using Nop.Web.Infrastructure.Cache;

namespace Nop.Web.Components
{
    public class ProductsAlsoPurchasedViewComponent : NopViewComponent
    {
        private readonly CatalogSettings _catalogSettings;
        private readonly IAclService _aclService;
        private readonly IOrderReportService _orderReportService;
        private readonly IProductModelFactory _productModelFactory;
        private readonly IProductService _productService;
        private readonly IStaticCacheManager _cacheManager;
        private readonly IStoreContext _storeContext;
        private readonly IStoreMappingService _storeMappingService;
        private readonly IWorkContext _workContext;


        public ProductsAlsoPurchasedViewComponent(CatalogSettings catalogSettings,
            IAclService aclService,
            IOrderReportService orderReportService,
            IProductModelFactory productModelFactory,
            IProductService productService,
            IStaticCacheManager cacheManager,
            IStoreContext storeContext,
            IStoreMappingService storeMappingService, IWorkContext workContext)
        {
            _catalogSettings = catalogSettings;
            _aclService = aclService;
            _orderReportService = orderReportService;
            _productModelFactory = productModelFactory;
            _productService = productService;
            _cacheManager = cacheManager;
            _storeContext = storeContext;
            _storeMappingService = storeMappingService;
            _workContext = workContext;
        }

        public IViewComponentResult Invoke(int productId, int? productThumbPictureSize, List<int> productsIds )
        {
            if (!_catalogSettings.ProductsAlsoPurchasedEnabled)
                return Content("");

            List<int> termsList = new List<int>();

            int[] InfoProductOrder = new int[20];
            //load and cache report
            var productIds =   _orderReportService.GetAlsoPurchasedProductsIds(_storeContext.CurrentStore.Id, productId, _catalogSettings.ProductsAlsoPurchasedNumber, _workContext.CurrentCustomer.Id);

            if (productsIds != null)
            {
                if(productIds.Length == 0)
                {
                    var count = 0;
                    productIds = new int[20];
                    var count2 = 0;
                    foreach (var id in productsIds)
                    {
                         var productIdInfo = _orderReportService.GetAlsoPurchasedProductsIds( _storeContext.CurrentStore.Id, id, _catalogSettings.ProductsAlsoPurchasedNumber, _workContext.CurrentCustomer.Id);
                        if (productIdInfo != null)
                        {

                            if (count2 < 20)
                            {
                                foreach (var x in productIdInfo)
                                {
                                    if (!productIds.Contains(x) && !productsIds.Contains(x))
                                    {
                                        productIds[count2] = x;
                                        count2++;
                                    }
                                }
                            }
                        }
                        //productIds[count] = id;
                        count++;
                    }
                }
            }

            //if (termsList.Count > 0)
            //{
            //    var count = 0;
            //    productIds = new int[productsIds.Count];
            //    foreach (var id in termsList)
            //    {
            //        productIds[count] = id;
            //    }
            //    count++;
            //}

            //if (productsIds != null)
            //{
            //    if (productIds.Length == 0)
            //    {
            //        productIds = new int[productsIds.Count];
            //        var count = 0;
            //        foreach (var id in productsIds)
            //        {
            //            productIds[count] = id;
            //            count++;
            //        }
            //    }
            //}

            //load products
            var products = _productService.GetProductsByIds(productIds);

            //ACL and store mapping
            products = products.Where(p => _aclService.Authorize(p) && _storeMappingService.Authorize(p)).ToList();

            //availability dates
            products = products.Where(p => _productService.ProductIsAvailable(p)).ToList();

            if (!products.Any())
                return Content("");

            var model = _productModelFactory.PrepareProductOverviewModels(products, true, true, productThumbPictureSize).ToList();
            return View(model);
        }
    }
}