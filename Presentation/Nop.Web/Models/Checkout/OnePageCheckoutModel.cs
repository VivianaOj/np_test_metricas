using Nop.Web.Framework.Models;
using System.Collections.Generic;

namespace Nop.Web.Models.Checkout
{
    public partial class OnePageCheckoutModel : BaseNopModel 
    {
        public bool ShowNNDelivery { get; set; }
        public bool ShippingRequired { get; set; }
        public bool DisableBillingAddressCheckoutStep { get; set; }
        public bool ShowRequeistFreight { get; set; }
        public bool ShowBillingMyAcount { get; set; }
        public bool SaveCard { get; set; }
        public CheckoutBillingAddressModel BillingAddress { get; set; }
        public IList<int> ProductIds { get; set; }

        public bool CurrentCustomerIsGuest { get; set; }
        public int CurrentCustomerIsAccount { get; set; }

        public bool PONumberReq { get; set; }
    }
}