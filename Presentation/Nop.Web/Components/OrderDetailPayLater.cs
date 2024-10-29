using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nop.Core;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Orders;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Services.Directory;
using Nop.Services.Localization;
using Nop.Services.Orders;
using Nop.Web.Factories;
using Nop.Web.Framework.Components;
using Nop.Web.Models.Common;
using Nop.Web.Models.Order;
using Nop.Web.Models.ShoppingCart;

namespace Nop.Web.Components
{
    public class OrderDetailPayLaterViewComponent : NopViewComponent
    {
        private readonly IOrderService _orderService;
        private readonly IStoreContext _storeContext;
        private readonly IWorkContext _workContext; 
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly ILocalizationService _localizationService;
        private readonly IPriceFormatter _priceFormatter;
        private readonly ICurrencyService _currencyService;

        public OrderDetailPayLaterViewComponent(IOrderService orderService, IGenericAttributeService genericAttributeService,
            IStoreContext storeContext, IPriceFormatter priceFormatter, ICurrencyService currencyService,
            IWorkContext workContext, ILocalizationService localizationService)
        {
            _orderService = orderService;
            _storeContext = storeContext;
            _workContext = workContext;
            _genericAttributeService = genericAttributeService;
            _localizationService = localizationService;
            _priceFormatter = priceFormatter;
            _currencyService = currencyService;
        }

        public IViewComponentResult Invoke(bool? prepareAndDisplayOrderReviewData, ShoppingCartModel overriddenModel)
        {
            int orderId = _genericAttributeService.GetAttribute<int>(_workContext.CurrentCustomer,
                 NopCustomerDefaults.OrderToBepaid, _storeContext.CurrentStore.Id);

            if (orderId == 0)
                return null;

            var order = _orderService.GetOrderById(orderId);
            var company = _workContext.CurrentCustomer.CompanyCustomerMappings.Where(r => r.DefaultCompany).FirstOrDefault()?.Company.CompanyName;
            var orderTotalInCustomerCurrency = _currencyService.ConvertCurrency(order.OrderTotal, order.CurrencyRate);

            var model = new OrderDetailsModel
            {
                Id = order.Id,
                CreatedOn = order.CreatedOnUtc,
                OrderStatus = _localizationService.GetLocalizedEnum(order.OrderStatus),
                CustomOrderNumber = order.CustomOrderNumber,
                TransId = order.tranId,
                ShippingAddress = new AddressModel
                {
                    Address1 = order.ShippingAddress?.Address1,
                    County=order.ShippingAddress?.County,
                    City = order.ShippingAddress?.City,
                    ZipPostalCode = order.ShippingAddress?.ZipPostalCode,
                    StateProvinceId = order.ShippingAddress?.StateProvinceId,

                },
                company = company,

                OrderTotal = _priceFormatter.FormatPrice(orderTotalInCustomerCurrency, true, order.CustomerCurrencyCode, false, _workContext.WorkingLanguage)
            };

            return View(model);
        }
    }
}
