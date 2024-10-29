using Nop.Core.Domain.Customers;
using Nop.Web.Framework.Models;

namespace Nop.Web.Models.Checkout
{
    public partial class CheckoutPaymentInfoModel : BaseNopModel
    {
        public string PaymentViewComponentName { get; set; }

        /// <summary>
        /// Used on one-page checkout page
        /// </summary>
        public bool DisplayOrderTotals { get; set; }

        public ResponseGetCustomerPaymentProfileModel PaymentsCards { get; set; }

        public bool IsGuest { get; set; }

        public string ErrorMessage { get; set; }
    }
}