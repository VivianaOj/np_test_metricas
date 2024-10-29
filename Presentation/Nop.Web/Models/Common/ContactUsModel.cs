using System.ComponentModel.DataAnnotations;
using Nop.Web.Framework.Mvc.ModelBinding;
using Nop.Web.Framework.Models;

namespace Nop.Web.Models.Common
{
    public partial class ContactUsModel : BaseNopModel
    {

        [NopResourceDisplayName("ContactUs.FullName")]
        [StringLength(20)]
        public string FullName { get; set; }

        [NopResourceDisplayName("contactus.lastname")]
        [StringLength(20)]
        public string LastName { get; set; }

        [DataType(DataType.EmailAddress)]
        [NopResourceDisplayName("ContactUs.Email")]
        [StringLength(40)]
        public string Email { get; set; }

        [NopResourceDisplayName("ContactUs.Phonenumber")]
        [StringLength(20)]
        public string PhoneNumber { get; set; }

        [NopResourceDisplayName("ContactUs.Company")]
        [StringLength(50)]
        public string Company { get; set; }

        [NopResourceDisplayName("ContactUs.Subject")]
        [StringLength(50)]
        public string Subject { get; set; }
        
        public bool SubjectEnabled { get; set; }

        [NopResourceDisplayName("ContactUs.Enquiry")]
        [StringLength(1000)]
        public string Enquiry { get; set; }



        public bool SuccessfullySent { get; set; }
        public string Result { get; set; }

        public bool DisplayCaptcha { get; set; }
    }
}