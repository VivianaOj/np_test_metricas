using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nop.Core.Domain.Catalog;
using Nop.Core.Domain.Common;
using Nop.Core.Domain.Invoice;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Web.Framework.Models;
using Nop.Web.Models.Checkout;
using Nop.Web.Models.Common;
using Nop.Web.Models.Customer;

namespace Nop.Web.Models.Order
{
    public partial class OrderDetailsModel : BaseNopEntityModel
    {
        public OrderDetailsModel()
        {
            TaxRates = new List<TaxRate>();
            GiftCards = new List<GiftCard>();
            Items = new List<OrderItemModel>();
            OrderNotes = new List<OrderNote>();
            Shipments = new List<ShipmentBriefModel>();

            BillingAddress = new AddressModel();
            ShippingAddress = new AddressModel();
            PickupAddress = new AddressModel();

            CustomValues = new Dictionary<string, object>();
            BoxGeneratorList = new List<BoxGenerator>();
        }

        public bool PrintMode { get; set; }
        public bool PdfInvoiceDisabled { get; set; }
        public string TransId { get; set; }
        public string CustomOrderNumber { get; set; }

        public DateTime CreatedOn { get; set; }

        public string OrderStatus { get; set; }
        public bool IsGuest { get; set; }

        public bool IsReOrderAllowed { get; set; }

        public bool IsReturnRequestAllowed { get; set; }
        
        public bool IsShippable { get; set; }
        public bool PickupInStore { get; set; }
        public AddressModel PickupAddress { get; set; }
        public string ShippingStatus { get; set; }
        public AddressModel ShippingAddress { get; set; }
        public string ShippingMethod { get; set; }
        public string NNDeliveryDate { get; set; }

        public IList<ShipmentBriefModel> Shipments { get; set; }

        public AddressModel BillingAddress { get; set; }

        public string VatNumber { get; set; }

        public string PaymentMethod { get; set; }
        public string PaymentMethodStatus { get; set; }
        public bool CanRePostProcessPayment { get; set; }
        public Dictionary<string, object> CustomValues { get; set; }

        public string OrderSubtotal { get; set; }
        public string OrderSubTotalDiscount { get; set; }
        public string OrderShipping { get; set; }
        public string PaymentMethodAdditionalFee { get; set; }
        public string CheckoutAttributeInfo { get; set; }

        public bool PricesIncludeTax { get; set; }
        public bool DisplayTaxShippingInfo { get; set; }
        public string Tax { get; set; }
        public IList<TaxRate> TaxRates { get; set; }
        public bool DisplayTax { get; set; }
        public bool DisplayTaxRates { get; set; }

        public string OrderTotalDiscount { get; set; }
        public int RedeemedRewardPoints { get; set; }
        public string RedeemedRewardPointsAmount { get; set; }
        public string OrderTotal { get; set; }
        
        public IList<GiftCard> GiftCards { get; set; }

        public bool ShowSku { get; set; }
        public IList<OrderItemModel> Items { get; set; }
        
        public IList<OrderNote> OrderNotes { get; set; }

        public bool ShowVendorName { get; set; }

        public ShipmentDetailsModel ShipmentDetails { get; set; }
        public PaymentStatus PaymentStatus { get; set; }

        public string company { get; set; }

        public string InvoiceNumber { get; set; }
        public decimal foreignamountunpaid { get; set; }
        public decimal AmountDue { get; set; }
        public string PONumber { get; set; }
        public decimal OrderShippingInclTax { get; set; }
        public decimal OrderTotalPayList { get; set; }
        public decimal OrderSubtotalInv { get; set; }
        public decimal OrderPayWithCreditCard { get; set; }
        public decimal DiscountApply { get; set; }
        public IList<BoxGenerator> BoxGeneratorList{ get; set; }

        public IList<OrderItem> OrderItems { get; set; }

        public int OrderInvoiceId { get; set; }
        public decimal ValuePayInv { get; set; }
        

        #region Nested Classes

        public partial class OrderItemModel : BaseNopEntityModel
        {
            public Guid OrderItemGuid { get; set; }
            public string Sku { get; set; }
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string ProductSeName { get; set; }
            public string UnitPrice { get; set; }
            public string SubTotal { get; set; }
            public int Quantity { get; set; }
            public string AttributeInfo { get; set; }
            public string RentalInfo { get; set; }
            public string picture { get; set; }
            public string VendorName { get; set; }
            public decimal Discount { get; set; }

            //downloadable product properties
            public int DownloadId { get; set; }
            public int LicenseId { get; set; }

            public bool Published { get; set; }
        }

        public partial class TaxRate : BaseNopModel
        {
            public string Rate { get; set; }
            public string Value { get; set; }
        }

        public partial class GiftCard : BaseNopModel
        {
            public string CouponCode { get; set; }
            public string Amount { get; set; }
        }

        public partial class OrderNote : BaseNopEntityModel
        {
            public bool HasDownload { get; set; }
            public string Note { get; set; }
            public DateTime CreatedOn { get; set; }
        }

        public partial class ShipmentBriefModel : BaseNopEntityModel
        {
            public string TrackingNumber { get; set; }
            public DateTime? ShippedDate { get; set; }
            public DateTime? DeliveryDate { get; set; }
        }

        public partial class BoxGenerator
        {
            public string BoxName { get; set; }
            public string BoxSize { get; set; }

            public string BoxTotalWeight { get; set; }
            public string BoxContentWeight { get; set; }
            public bool OwnBox { get; set; }
            public List<ItemProductSummary> items { get; set; }
            public int quantity { get; set; }

        }
        #endregion
    }

    
   

    public partial class OrderPaymentModel
    {
        public OrderPaymentModel()
        {
            OrderDetailsModel = new List<OrderDetailsModel>();

            CreditMemos = new List<CustomerAccountCredit>();
            CustomerDeposite = new List<CustomerAccountCredit>();
            CustomerPayments = new List<CustomerAccountCredit>();
            AvailableCountries = new List<SelectListItem>();
            AvailableStates = new List<SelectListItem>();
        }
        public List<OrderDetailsModel> OrderDetailsModel { get; set; }

        public CheckoutPaymentInfoModel CheckoutPaymentInfoModel { get; set; }
        public decimal applyaccountcreditPayment { get; set; }
        public decimal applyaccountcreditCreditMemo { get; set; }
        public decimal applyaccountcreditDeposite { get; set; }

        public decimal  partialPayment { get; set; }

        public IList<CustomerAccountCredit>  CreditMemos { get; set; }
        public IList<CustomerAccountCredit> CustomerDeposite { get; set; }
        public IList<CustomerAccountCredit> CustomerPayments { get; set; }


        public CustomerPaymentInfoModel CustomerPaymentInfoModel { get; set; }

        public int CountryId { get; set; }
        public IList<SelectListItem> AvailableCountries { get; set; }

        public bool StateProvinceEnabled { get; set; }
        public bool StateProvinceRequired { get; set; }
        public int StateProvinceId { get; set; }
        public IList<SelectListItem> AvailableStates { get; set; }
        public string objectJson { get; set; }
    }

    public partial class InvoicePaymentModel
    {
        public InvoicePaymentModel()
        {
            OrderDetailsModel = new List<OrderDetailsModel>();
        }
        public List<OrderDetailsModel> OrderDetailsModel { get; set; }

        public CheckoutPaymentInfoModel CheckoutPaymentInfoModel { get; set; }
    }

    public partial class OrderConfirmModel
    {
        public int  Id { get; set; }
        public string company { get; set; }
        public string InvoiceNumber { get; set; }
        public decimal OrderTotalPayList { get; set; }
        public DateTime CreatedOn { get; set; }
        public string PONumber { get; set; }
        public decimal OrderShippingInclTax { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string Address1 { get; set; }
        public string City { get; set; }
        public string CountryName { get; set; }
        public string StateProvinceName { get; set; }
        public string ZipPostalCode { get; set; }

        public decimal OrderSubtotalInv { get; set; }
        public decimal OrderPayWithCreditCard { get; set; }
        public decimal DiscountApply { get; set; }
    };

    public class TransactionModel
    {
        public int InvoiceId { get; set; }
        public string ValuePay { get; set; }
        public decimal TotalInvoice { get; set; }
        public string InvoiceNumber { get; set; }
        public List<CustomerAccountCredit> credit { get; set; }
        
        public decimal TotalPaymentCreditCard { get; set; }
    }

    public class ApplyInvoiceCreditModel
    {
        public ApplyInvoiceCreditModel()
        {
            creditApply = new List<CustomerAccountCredit>();
        }
        public string InvoiceId { get; set; }
        public decimal InvoiceTotalPay { get; set; }
        public decimal NewInvoiceTotalPay { get; set; }
        public decimal TotalInvoice { get; set; }
        public decimal TotalCreditApply { get; set; }

        public bool IsTotalCreditApply { get; set; }
        public List<CustomerAccountCredit> creditApply { get; set; }

    }
}