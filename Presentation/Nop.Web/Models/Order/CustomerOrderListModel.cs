using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nop.Core.Domain.Customers;
using Nop.Core.Domain.Invoices;
using Nop.Core.Domain.Orders;
using Nop.Web.Framework.Models;

namespace Nop.Web.Models.Order
{
    public partial class CustomerOrderListModel : BaseNopModel
    {
        public CustomerOrderListModel()
        {
            Orders = new List<OrderDetailsModel>();
            RecurringOrders = new List<RecurringOrderModel>();
            RecurringPaymentErrors = new List<string>();
            PaymentStatusList = new List<SelectListItem>();
            OrderStatusList = new List<SelectListItem>();
            ChildList = new List<SelectListItem>();
            InvoiceList = new List<InvoiceCompanyList>();
        }

        public IList<OrderDetailsModel> Orders { get; set; }
        public IList<RecurringOrderModel> RecurringOrders { get; set; }
        public IList<string> RecurringPaymentErrors { get; set; }
        public OrderDetailsModel OrdersFilter { get; set; }
        public List<SelectListItem> PaymentStatusList { get; set; }
        public List<SelectListItem> OrderStatusList { get; set; }
        public List<SelectListItem> ChildList { get; set; }
        public bool IsGuest { get; set; }
        public bool AccountCustomer { get; set; }

        public string WarningMessages { get; set; }

        public List<InvoiceCompanyList> InvoiceList { get; set; }

        #region Nested classes

        public partial class OrderDetailsModel : BaseNopEntityModel
        {
            public string CustomOrderNumber { get; set; }
            public string OrderTotal { get; set; }
            public bool IsReturnRequestAllowed { get; set; }
            public OrderStatus OrderStatusEnum { get; set; }
            public string OrderStatus { get; set; }
            public string PaymentStatus { get; set; }
            public string ShippingStatus { get; set; }
            public DateTime CreatedOn { get; set; }
            public ShipmentDetailsModel ShipmentDetails { get; set; }
            public string TransId { get; set; }
            public int OrderProducts { get; set; }

            public string InvoiceNumber { get; set; }
            public string CompanyName { get; set; }
            public string CustomerEmail { get; set; }

            public string CompanyId { get; set; }

            public string PONumber { get; set; }

            public string ShippingMethod { get; set; }
            public string NNDeliveryDate { get; set; }

            
        }

        public partial class RecurringOrderModel : BaseNopEntityModel
        {
            public string StartDate { get; set; }
            public string CycleInfo { get; set; }
            public string NextPayment { get; set; }
            public int TotalCycles { get; set; }
            public int CyclesRemaining { get; set; }
            public int InitialOrderId { get; set; }
            public bool CanRetryLastPayment { get; set; }
            public string InitialOrderNumber { get; set; }
            public bool CanCancel { get; set; }
        }
        public partial class InvoiceCompanyList
        {
            public Company Company { get; set; }
            public Invoice Invoice { get; set; }
            public Nop.Web.Models.Order.OrderDetailsModel OrderDetail { get; set; }

        }
        #endregion
    }
}