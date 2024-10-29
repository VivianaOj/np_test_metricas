using Nop.Core.Domain.Directory;
using Nop.Core.Domain.Shipping;
using Nop.Web.Areas.Admin.Models.Directory;
using Nop.Web.Framework.Models;
using System.Collections.Generic;

namespace Nop.Web.Areas.Admin.Models.Shipping
{
    /// <summary>
    /// Represents a warehouse list model
    /// </summary>
    public partial class WarehouseLocationNNListModel : BasePagedListModel<WarehouseLocationNNModel>
    {
        public List<StateProvince> StateNames { get; set; }
        public List<Warehouse> WarehouseList { get; set; }
    }
}