using Nop.Web.Framework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Models.Checkout
{
    public partial class StorePickupModel : BaseNopModel
    {
        public StorePickupModel()
        {
            PickupPoints = new List<CheckoutPickupPointModel>();
            Warnings = new List<string>();
        }

        public IList<CheckoutPickupPointModel> PickupPoints { get; set; }
        public bool AllowPickupInStore { get; set; }
        public bool PickupInStore { get; set; }
        public bool PickupInStoreOnly { get; set; }
        public bool DisplayPickupPointsOnMap { get; set; }
        public string GoogleMapsApiKey { get; set; }
        public IList<string> Warnings { get; set; }

    }
}
