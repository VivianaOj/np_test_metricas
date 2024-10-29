using Nop.Web.Framework.Models;
using Nop.Web.Framework.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Areas.Admin.Models.Orders
{
    public class InvoiceModel : BaseNopEntityModel
    {
        #region Ctor

        public InvoiceModel()
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

    public class InvoiceTransactionModel : BaseNopEntityModel
    {
        #region Ctor

        public InvoiceTransactionModel()
        {

        }

        #endregion

        #region Properties

        //identifiers
        [NopResourceDisplayName("Admin.Orders.Fields.InvoiceId")]
        public override int Id { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.ValuePay")]
        public decimal ValuePay { get; set; }
        public string ValuePayPriceFormat { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.TotalCreditCardPay")]
        public decimal TotalCreditCardPay { get; set; }
        public string TotalCreditCardPayPriceFormat { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.CustomerDepositeApply")]
        public string CustomerDepositeApply { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.InvoiceApply")]
        public string InvoiceApply { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.CreatedDate")]
        public DateTime CreatedDate { get; set; }

        [NopResourceDisplayName("Admin.Orders.Fields.Company")]
        public string Company { get; set; }


        #endregion

    }
}
