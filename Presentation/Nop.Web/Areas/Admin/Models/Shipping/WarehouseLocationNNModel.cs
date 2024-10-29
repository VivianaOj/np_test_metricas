using Nop.Web.Areas.Admin.Models.Common;
using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Framework.Models;
using Nop.Core.Domain.Shipping;
using Nop.Core.Domain.Directory;
using System.Collections.Generic;

namespace Nop.Web.Areas.Admin.Models.Shipping
{
    /// <summary>
    /// Represents a warehouse model
    /// </summary>
    public partial class WarehouseLocationNNModel : BaseNopEntityModel
    {

        #region Ctor

        [NopResourceDisplayName("Nop.Plugin.Shipping.NNDelivery.Fields.Name")]
        public string Name { get; set; }

        [NopResourceDisplayName("Nop.Plugin.Shipping.NNDelivery.Fields.Location")]
        public string Location { get; set; }

        [NopResourceDisplayName("Nop.Plugin.Shipping.NNDelivery.Fields.IdState")]
        public int StateId { get; set; }

        #endregion
    }


    public class ConfigurationLocationNNModel : BaseNopModel
    {
        public ConfigurationLocationNNModel()
        {
            AddDeliveryRoutesModel = new WarehouseLocationNNModel();
            DeliveryRoutesSearchModel = new WarehouseLocationNNSearchModel();
        }

        ////[NopResourceDisplayName("Nop.Plugin.Shipping.NNDelivery.FixedRate")]
        ////public decimal FixedRate { get; set; }

        public WarehouseLocationNNModel AddDeliveryRoutesModel { get; set; }

        public WarehouseLocationNNSearchModel DeliveryRoutesSearchModel { get; set; }

    }
}