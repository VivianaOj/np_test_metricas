using System.Collections.Generic;
using Nop.Core.Domain.Shipping;
using Nop.Web.Framework.Models;

namespace Nop.Web.Models.Checkout
{
    public partial class CheckoutShippingMethodModel : BaseNopModel
    {
        public CheckoutShippingMethodModel()
        {
            PickupPoints = new List<CheckoutPickupPointModel>();
            ShippingMethods = new List<ShippingMethodModel>();
            Warnings = new List<string>();
        }

        public IList<ShippingMethodModel> ShippingMethods { get; set; }

        public bool NotifyCustomerAboutShippingFromMultipleLocations { get; set; }

        public IList<string> Warnings { get; set; }

        public IList<CheckoutPickupPointModel> PickupPoints { get; set; }
        public bool AllowPickupInStore { get; set; }
        public bool PickupInStore { get; set; }
        public bool PickupInStoreOnly { get; set; }
        public bool DisplayPickupPointsOnMap { get; set; }
        public string GoogleMapsApiKey { get; set; }

        public bool IsAccoutCustomer { get; set; }
        public bool UnShippable { get; set; }

        public bool IsCommercial { get; set; }

        #region Nested classes

        public partial class ShippingMethodModel : BaseNopModel
        {
            public string ShippingRateComputationMethodSystemName { get; set; }
            public string Name { get; set; }
            public string Description { get; set; }
            public string Fee { get; set; }
            public bool Selected { get; set; }

            public string address { get; set; }
            public int AddressId { get; set; }

            public ShippingOption ShippingOption { get; set; } 
        }

        #endregion
    }
}