using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Orders
{
    /// <summary>
    /// Represents an order search model
    /// </summary>
    public partial class OrderSearchModel : BaseSearchModel
    {
        #region Ctor

        public OrderSearchModel()
        {
            AvailableOrderStatuses = new List<SelectListItem>();
            AvailableCompanyList = new List<SelectListItem>();
            AvailableUserRoleList = new List<SelectListItem>();
            AvailablePaymentStatuses = new List<SelectListItem>();
            AvailableShippingStatuses = new List<SelectListItem>();
            AvailableStores = new List<SelectListItem>();
            AvailableVendors = new List<SelectListItem>();
            AvailableWarehouses = new List<SelectListItem>();
            AvailablePaymentMethods = new List<SelectListItem>();
            AvailableCountries = new List<SelectListItem>();
            AvailableSource = new List<SelectListItem>();
            OrderStatusIds = new List<int>();
            PaymentStatusIds = new List<int>();
            ShippingStatusIds = new List<int>();
            CompanyListId = new List<int>();
            UserRoleId = new List<int>();

        }

        #endregion

        #region Properties

        [NopResourceDisplayName("Admin.Orders.List.StartDate")]
        [UIHint("DateNullable")]
        public DateTime? StartDate { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.EndDate")]
        [UIHint("DateNullable")]
        public DateTime? EndDate { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.OrderStatus")]
        public IList<int> OrderStatusIds { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.Companies")]
        public IList<int> CompanyListId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.UserRoleId")]
        public IList<int> UserRoleId { get; set; }


        [NopResourceDisplayName("Admin.Orders.List.PaymentStatus")]
        public IList<int> PaymentStatusIds { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.ShippingStatus")]
        public IList<int> ShippingStatusIds { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.PaymentMethod")]
        public string PaymentMethodSystemName { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.Store")]
        public int StoreId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.Vendor")]
        public int VendorId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.Warehouse")]
        public int WarehouseId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.Product")]
        public int ProductId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.BillingEmail")]
        public string BillingEmail { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.BillingPhone")]
        public string BillingPhone { get; set; }

        public bool BillingPhoneEnabled { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.BillingLastName")]
        public string BillingLastName { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.BillingCountry")]
        public int BillingCountryId { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.OrderNotes")]
        public string OrderNotes { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.GoDirectlyToNumberInvocie")]
        public string GoDirectlyToCustomOrderNumber { get; set; }

        [NopResourceDisplayName("Admin.Orders.List.SourceName")]
        public string SourceName { get; set; }

        public bool IsLoggedInAsVendor { get; set; }
        public IList<SelectListItem> AvailableUserRoleList { get; set; }
        public IList<SelectListItem> AvailableCompanyList { get; set; }
        public IList<SelectListItem> AvailableOrderStatuses { get; set; }

        public IList<SelectListItem> AvailablePaymentStatuses { get; set; }

        public IList<SelectListItem> AvailableShippingStatuses { get; set; }

        public IList<SelectListItem> AvailableStores { get; set; }

        public IList<SelectListItem> AvailableVendors { get; set; }

        public IList<SelectListItem> AvailableWarehouses { get; set; }

        public IList<SelectListItem> AvailablePaymentMethods { get; set; }

        public IList<SelectListItem> AvailableCountries { get; set; }

        public IList<SelectListItem> AvailableSource { get; set; }
        public bool HideStoresList { get; set; }

        #endregion
    }
}