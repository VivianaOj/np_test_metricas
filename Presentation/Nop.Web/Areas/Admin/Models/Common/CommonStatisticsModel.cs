﻿using Nop.Web.Framework.Models;

namespace Nop.Web.Areas.Admin.Models.Common
{
    public partial class CommonStatisticsModel : BaseNopModel
    {
        public int NumberOfOrders { get; set; }

        public int NumberOfCustomers { get; set; }

        public int AccountCustomer { get; set; }
        
        public int CountOrdersToday { get; set; }
        
        public int NumberOfPendingReturnRequests { get; set; }

        public int NumberOfLowStockProducts { get; set; }
        public int TotalAbandoneCart { get; set; }

    }
}