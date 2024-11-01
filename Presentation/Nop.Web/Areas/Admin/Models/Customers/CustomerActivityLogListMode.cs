﻿using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Customers
{
    /// <summary>
    /// Represents a customer activity log list model
    /// </summary>
    public partial class CustomerActivityLogListModel : BasePagedListModel<CustomerActivityLogModel>
    {
    }

    public partial class ImportActivityLogListModel : BasePagedListModel<LogNetsuiteImportModel>
    {
    }
}