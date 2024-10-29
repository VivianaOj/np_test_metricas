using System;
using Nop.Web.Framework.Models;
using Nop.Web.Framework.Mvc.ModelBinding;

namespace Nop.Web.Areas.Admin.Models.Customers
{
    /// <summary>
    /// Represents a customer activity log model
    /// </summary>
    public partial class CustomerActivityLogModel : BaseNopEntityModel
    {
        #region Properties

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.ActivityLogType")]
        public string ActivityLogTypeName { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.Comment")]
        public string Comment { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.CreatedOn")]
        public DateTime CreatedOn { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.IpAddress")]
        public string IpAddress { get; set; }

        #endregion
    }

    public partial class LogNetsuiteImportModel : BaseNopEntityModel
    {
        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.DateCreate")]
        public DateTime DateCreate { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.LastExecutionDateGeneral")]

        public DateTime LastExecutionDateGeneral { get; set; }
        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.DataFromNetsuite")]

        public string DataFromNetsuite { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.DataUpdatedNetsuite")]
        public string DataUpdatedNetsuite { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.ImportName")]
        public string ImportName { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.Type")]
        public int Type { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.RegisterId")]

        public int RegisterId { get; set; }

        [NopResourceDisplayName("Admin.Customers.Customers.ActivityLog.Message")]
        public string Message { get; set; }


    }
}