using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nop.Core;
using Nop.Core.Caching;
using Nop.Services.Catalog;
using Nop.Services.Security;
using Nop.Services.Stores;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;
using Nop.Web.Infrastructure.Cache;

namespace Nop.Web.Components
{
    public class RelatedProductsViewComponent : NopViewComponent
    {
        private readonly IAclService _aclService;
        private readonly IProductModelFactory _productModelFactory;
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private readonly IStaticCacheManager _cacheManager;
        private readonly IStoreContext _storeContext;
        private readonly IStoreMappingService _storeMappingService;

        public RelatedProductsViewComponent(IAclService aclService,
            IProductModelFactory productModelFactory,
            IProductService productService,
            IStaticCacheManager cacheManager,
            IStoreContext storeContext,
            IStoreMappingService storeMappingService,
            ICategoryService categoryService)
        {
            _aclService = aclService;
            _productModelFactory = productModelFactory;
            _productService = productService;
            _cacheManager = cacheManager;
            _storeContext = storeContext;
            _storeMappingService = storeMappingService;
            _categoryService = categoryService;
        }

        public IViewComponentResult Invoke(int productId, int? productThumbPictureSize, List<int> productsIds = null, int categoryId=0)
        {
            //load and cache report
            var relatedProductIds = _cacheManager.Get(string.Format(NopModelCacheDefaults.ProductsRelatedIdsKey, productId, _storeContext.CurrentStore.Id),
                () => _productService.GetRelatedProductsByProductId1(productId).Select(x => x.ProductId2).ToArray());
            int[] InfoProductOrder = new int[20];
            //load products
            var products = _productService.GetProductsByIds(relatedProductIds);
            //ACL and store mapping
            products = products.Where(p => _aclService.Authorize(p) && _storeMappingService.Authorize(p)).ToList();
            //availability dates
            products = products.Where(p => _productService.ProductIsAvailable(p)).ToList();
            //visible individually
            products = products.Where(p => p.VisibleIndividually).ToList();


                if (!products.Any())
                {
                ////load products


                //if (categories.Any())
                //{
                var count = 0;
                relatedProductIds = new int[20];
                var count2 = 0;

                if (productsIds != null)
                {
                    if (relatedProductIds.Length == 0)
                    {
                        foreach (var id in productsIds)
                        {
                            var productIdInfo = _productService.GetRelatedProductsByProductId1(id).Select(x => x.ProductId2).ToArray();
                            if (productIdInfo != null)
                            {
                                if (count2 < 20)
                                {
                                    foreach (var x in productIdInfo)
                                    {
                                        if (!relatedProductIds.Contains(x))
                                        {
                                            relatedProductIds[count2] = x;
                                            count2++;
                                        }
                                    }
                                }
                                products = _productService.GetProductsByIds(relatedProductIds);
                            }
                            count++;
                        }
                    }

                    if (products.Count() == 0 && categoryId!=0)
                    {
                        var catProd = _categoryService.GetProductCategoriesByCategoryId(categoryId);
                        if (catProd.Count == 0)
                        {
                            var catProdParent = _categoryService.GetAllCategoriesByParentCategoryId(categoryId);

                            foreach (var item in catProdParent)
                            {
                                catProd = _categoryService.GetProductCategoriesByCategoryId(item.Id);

                                if (catProd.Count == 0)
                                {
                                     var Subcategories = _categoryService.GetAllCategoriesByParentCategoryId(item.Id);
                                    foreach (var x in Subcategories)
                                    {
                                        catProd = _categoryService.GetProductCategoriesByCategoryId(x.Id);

                                        GetRelateProductbyCategory(relatedProductIds, ref products, ref count, ref count2, catProd);
                                    }

                                }
                                else
                                {
                                    GetRelateProductbyCategory(relatedProductIds, ref products, ref count, ref count2, catProd);
                                }
                            }

                        }
                        else
                        {
                            GetRelateProductbyCategory(relatedProductIds, ref products, ref count, ref count2, catProd);

                            //foreach (var id in catProd)
                            //{
                            //    var productIdInfo = _productService.GetRelatedProductsByProductId1(id.Id).Select(x => x.ProductId2).ToArray();
                            //    if (productIdInfo != null)
                            //    {

                            //        if (count2 < 20)
                            //        {
                            //            foreach (var x in productIdInfo)
                            //            {
                            //                if (!relatedProductIds.Contains(x))
                            //                {
                            //                    relatedProductIds[count2] = x;
                            //                    count2++;
                            //                }
                            //            }
                            //        }
                            //        products = _productService.GetProductsByIds(relatedProductIds);
                            //    }
                            //    //productIds[count] = id;
                            //    count++;
                            //}
                        }

                    }
                }
                else
                    return Content("");
            }
            if (products.Count() == 0)
            {
                var count = 0;
                relatedProductIds = new int[20];
                var count2 = 0;

                foreach (var id in productsIds)
                {
                    var productIdInfo = _productService.GetRelatedProductsByProductId1(id).Select(x => x.ProductId2).ToArray();
                    if (productIdInfo != null)
                    {

                        if (count2 < 20)
                        {
                            foreach (var x in productIdInfo)
                            {
                                if (!relatedProductIds.Contains(x))
                                {

                                    if (count2 < 20)
                                    {
                                        relatedProductIds[count2] = x;
                                        count2++;
                                    }
                                }
                            }
                        }
                    }
                    //productIds[count] = id;
                    count++;
                }
                //load products
                 products = _productService.GetProductsByIds(relatedProductIds);
            }

            var model = _productModelFactory.PrepareProductOverviewModels(products, true, true, productThumbPictureSize).ToList();
            return View(model);
        }

        private void GetRelateProductbyCategory(int[] relatedProductIds, ref IList<Core.Domain.Catalog.Product> products, ref int count, ref int count2, IPagedList<Core.Domain.Catalog.ProductCategory> catProd)
        {
            foreach (var prod in catProd)
            {
                var productIdInfo = _productService.GetRelatedProductsByProductId1(prod.ProductId).Select(x => x.ProductId2).ToArray();
                if (productIdInfo != null)
                {
                    if (count2 < 20)
                    {
                        foreach (var x in productIdInfo)
                        {
                            if (!relatedProductIds.Contains(x))
                            {
                                relatedProductIds[count2] = x;
                                count2++;
                            }
                        }
                    }
                    products = _productService.GetProductsByIds(relatedProductIds);
                }
                count++;
            }
        }
    }
}