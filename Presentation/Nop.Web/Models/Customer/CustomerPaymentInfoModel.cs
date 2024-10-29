using Microsoft.AspNetCore.Mvc.Rendering;
using Nop.Core.Domain.Common;
using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nop.Web.Models.Customer
{
    public class CustomerPaymentInfoModel
    {
        public CustomerPaymentInfoModel()
        {
            ExpireMonths = new List<SelectListItem>();
            ExpireYears = new List<SelectListItem>();

            AvailableCountries = new List<SelectListItem>();
            AvailableStates = new List<SelectListItem>();
            BillingAddresList = new List<Address>();
        }

        [NopResourceDisplayName("Payment.CardholderName")]
        public string CardholderName { get; set; }

        [NopResourceDisplayName("Payment.CardNumber")]
        public string CardNumber { get; set; }

        [NopResourceDisplayName("Payment.ExpirationDate")]
        public string ExpireMonth { get; set; }

        [NopResourceDisplayName("Payment.ExpirationDate")]
        public string ExpireYear { get; set; }

        public IList<SelectListItem> ExpireMonths { get; set; }
        public IList<SelectListItem> ExpireYears { get; set; }

        [NopResourceDisplayName("Payment.CardCode")]
        public string CardCode { get; set; }

        public string ResponsePayment { get; set; }
        public string messageStatus { get; set; }


        public string Address1 { get; set; }
        public string City { get; set; }
        public int CountryId { get; set; }
        public int StateProvinceId { get; set; }
        public string ZipPostalCode { get; set; }
        public string PhoneNumber { get; set; }
        
        public bool ValidZipCode { get; set; }

        public IList<SelectListItem> AvailableCountries { get; set; }
        public IList<SelectListItem> AvailableStates { get; set; }

        public IList<Address> BillingAddresList { get; set; }
        public int AddressIdSelected { get; set; }
    }
}
