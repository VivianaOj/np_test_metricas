using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nop.Services.Security;
using Nop.Web.Areas.Admin.Models.Companies;
using Nop.Web.Areas.Admin.Factories;
using Nop.Services.Customers;
using Nop.Services.Invoices;
using Nop.Services.AccountCredit;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Web.Framework.Controllers;
using Microsoft.AspNetCore.Http;

namespace Nop.Web.Areas.Admin.Controllers
{
    public partial class CompanyController : BaseAdminController
    {
        #region Fields

        private readonly IPermissionService _permissionService;
        private readonly ICompanyModelFactory _companyModelFactory;
        private readonly ICompanyService _companyService;
        private readonly IInvoiceService _invoiceService;
        private readonly ICustomerCreditBalanceService _credit;
        #endregion

        #region Ctor

        public CompanyController(IPermissionService permissionService, ICompanyModelFactory companyModelFactory,
            ICompanyService companyService, IInvoiceService invoiceService, ICustomerCreditBalanceService credit)
        {
            _permissionService = permissionService;
            _companyModelFactory = companyModelFactory;
            _companyService = companyService;
            _invoiceService = invoiceService;
            _credit = credit;
        }

        #endregion

        #region Companies

        public virtual IActionResult Index()
        {
            return RedirectToAction("List");
        }

        public virtual IActionResult List()
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedView();

            //prepare model
            var model = _companyModelFactory.PrepareCompanySearchModel(new CompanySearchModel());

            return View(model);
        }

        [HttpPost]
        public virtual IActionResult CompanyList(CompanySearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //prepare model
            var model = _companyModelFactory.PrepareCompanyListModel(searchModel);

            return Json(model);
        }

        public virtual IActionResult View(int id)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedView();

            //try to get a customer with the specified id
            var company = _companyService.GetCompanyById(id);
            if (company == null)
                return RedirectToAction("List");

            //prepare model
            var model = _companyModelFactory.PrepareCompanyModel(new CompanyModel(), company);

            return View(model);
        }

    

        #endregion

        #region Addresses

        [HttpPost]
        public virtual IActionResult AddressesSelect(CompanyAddressSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //try to get a company with the specified id
            var company = _companyService.GetCompanyById(searchModel.CompanyId)
                ?? throw new ArgumentException("No company found with the specified id");

            //prepare model
            var model = _companyModelFactory.PrepareCompanyAddressListModel(searchModel, company);

            return Json(model);
        }

        [HttpPost]
        public virtual IActionResult InvoicesSelect(CompanyInvoicesSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            var company = _companyService.GetCompanyById(searchModel.CompanyId)
               ?? throw new ArgumentException("No company found with the specified id");

            //get customer orders
            var invoices = _invoiceService.GetInvoicesByCompanyId(Convert.ToInt32(company.Id))
                .OrderByDescending(x => x.LastModifiedDate).ThenByDescending(x => x.Id).ToList() ;


            //prepare model
            var model = _companyModelFactory.PrepareCompanyInvoicesListModel(searchModel, invoices);

            return Json(model);
        }

        //[HttpPost]
        public virtual IActionResult AllCreditsSelect(CompanyAllCreditSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //try to get a company with the specified id
            var company = _companyService.GetCompanyById(searchModel.CompanyId)
                ?? throw new ArgumentException("No company found with the specified id");

            //prepare model
            var model = _companyModelFactory.PrepareCompanyCreditListModel(searchModel, company);

            return Json(model);
        }
        #endregion

        #region Orders

        [HttpPost]
        public virtual IActionResult OrderList(CompanyOrderSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //try to get a company with the specified id
            var company = _companyService.GetCompanyById(searchModel.CompanyId)
                ?? throw new ArgumentException("No company found with the specified id");

            //prepare model
            var model = _companyModelFactory.PrepareCompanyOrderListModel(searchModel, company);

            return Json(model);
        }

        #endregion

        #region Customer

        [HttpPost]
        public virtual IActionResult CustomerList(CompanyCustomerSearchModel searchModel)
        {
            if (!_permissionService.Authorize(StandardPermissionProvider.ManageCustomers))
                return AccessDeniedDataTablesJson();

            //try to get a company with the specified id
            var company = _companyService.GetCompanyById(searchModel.CompanyId)
                ?? throw new ArgumentException("No company found with the specified id");

            //prepare model
            var model = _companyModelFactory.PrepareCustomerOrderListModel(searchModel, company);

            return Json(model);
        }


        
        [Area(AreaNames.Admin)]
        [HttpPost, ActionName("Delete")]
        public IActionResult Delete(int id)
        {
            //if (!_permissionService.Authorize(StandardPermissionProvider.NNBoxGenerator))
            //    return AccessDeniedView();

            //var deliveryRoute = _boxPackingService.GetById(id) ??
            //    throw new ArgumentException("No Boxes found with specified Id");

            //_boxPackingService.DeleteBoxes(deliveryRoute);

            return new NullJsonResult();
        }


        #endregion
    }
}