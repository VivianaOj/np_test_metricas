using Nop.Web.Framework.Models;
using Nop.Web.Framework.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Areas.Admin.Models.Orders
{
    public class FreightQuoteModel : BaseNopEntityModel
    {
        #region Ctor

        public FreightQuoteModel()
        {
          
        }

        #endregion

        #region Properties

        //identifiers
        [NopResourceDisplayName("Admin.Orders.Fields.InvoiceId")]
        public override int Id { get; set; }
        
        [NopResourceDisplayName("Admin.Orders.Fields.InvoiceNumber")]
        public string InvoiceNumber { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.CompanyName")]
        public string CompanyName { get; set; }
        public int CompanyId { get; set; }

        
        [NopResourceDisplayName("Admin.Orders.Fields.OrderId")]
        public int OrderId { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.TotalInvoice")]
        public string TotalInvoice { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.DueDate")]
        public DateTime DueDate { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.StatusPayment")]
        public string StatusPayment { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.StatusPaymentNP")]
        public string StatusPaymentNP { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.foreignamountunpaid")]
        public decimal foreignamountunpaid { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.LastModifiedDate")]
        public DateTime LastModifiedDate { get; set; }

        public string CreditMemo { get; set; }
        public string TotalCreditMemo { get; set; }
        public string CustomerDeposite { get; set; }
        public string TotalCustomerDeposite { get; set; }

        public string CustomerPayment { get; set; }
        public string TotalCustomerPayment { get; set; }


        #endregion

    }

    public class FreightQuoteTransactionModel : BaseNopEntityModel
    {
        #region Ctor

        public FreightQuoteTransactionModel()
        {

        }

        #endregion

        #region Properties

        //identifiers
        [NopResourceDisplayName("Admin.Orders.Fields.Id")]
        public override int Id { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.Name")]
        public string Name { get; set; }
        [NopResourceDisplayName("Admin.Orders.Fields.Email")]

        public string Email { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.Phone")]
        public string Phone { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.RequestDate")]
        public string RequestDate { get; set; }

        public string Infomation { get; set; }
        public string Items { get; set; }
        public string BillingAddress { get; set; }

        public string Shippng_Address { get; set; }

        public decimal TotalAmount { get; set; }
        #endregion

    }
}
