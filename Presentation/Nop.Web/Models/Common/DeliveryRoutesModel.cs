using Nop.Web.Framework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Models.Common
{
    public partial class DeliveryRoutesModel: BaseNopEntityModel
    {
        public string Location { get; set; }
        public string Name { get; set; }
        public decimal Minimum { get; set; }
        public bool Available { get; set; }
    }
}
