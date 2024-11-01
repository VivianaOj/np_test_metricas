﻿using Microsoft.AspNetCore.Mvc;
using Nop.Core;
using Nop.Core.Domain.Messages;
using Nop.Services.Customers;
using Nop.Services.Localization;
using Nop.Services.Messages;
using Nop.Web.Factories;
using Nop.Web.Framework.Mvc.Filters;
using System;

namespace Nop.Web.Controllers
{
    public partial class NewsletterController : BasePublicController
    {
        private readonly ILocalizationService _localizationService;
        private readonly INewsletterModelFactory _newsletterModelFactory;
        private readonly INewsLetterSubscriptionService _newsLetterSubscriptionService;
        private readonly IStoreContext _storeContext;
        private readonly IWorkContext _workContext;
        private readonly IWorkflowMessageService _workflowMessageService;
        private readonly ICustomerService _customerService;

        public NewsletterController(ILocalizationService localizationService,
            INewsletterModelFactory newsletterModelFactory,
            INewsLetterSubscriptionService newsLetterSubscriptionService,
            IStoreContext storeContext,
            IWorkContext workContext,
            IWorkflowMessageService workflowMessageService,
            ICustomerService customerService)
        {
            _localizationService = localizationService;
            _newsletterModelFactory = newsletterModelFactory;
            _newsLetterSubscriptionService = newsLetterSubscriptionService;
            _storeContext = storeContext;
            _workContext = workContext;
            _workflowMessageService = workflowMessageService;
            _customerService = customerService;
        }

        //available even when a store is closed
        [CheckAccessClosedStore(true)]
        [HttpPost]
        public virtual IActionResult SubscribeNewsletter(string email, bool subscribe)
        {
            string result;
            var success = false;

            if(!string.IsNullOrEmpty(email))
                email = email.Trim();

            if (!CommonHelper.IsValidEmail(email))
            {
                result = _localizationService.GetResource("Newsletter.Email.Wrong");
            }
            else
            {
                var customer = _customerService.GetCustomerByEmail(email);
                if (customer != null && customer.NetsuitId != 0)
                {
                    result = _localizationService.GetResource("Newsletter.IsAccountCustomer");
                }
                else
                {
                    var subscription = _newsLetterSubscriptionService.GetNewsLetterSubscriptionByEmailAndStoreId(email, _storeContext.CurrentStore.Id);
                    if (subscription != null)
                    {

                        if (subscribe)
                        {
                            if (!subscription.Active)
                            {
                                _workflowMessageService.SendNewsLetterSubscriptionActivationMessage(subscription, _workContext.WorkingLanguage.Id);
                            }
                            result = _localizationService.GetResource("Newsletter.SubscribeEmailSent");
                        }
                        else
                        {
                            if (subscription.Active)
                            {
                                _workflowMessageService.SendNewsLetterSubscriptionDeactivationMessage(subscription, _workContext.WorkingLanguage.Id);
                            }
                            result = _localizationService.GetResource("Newsletter.UnsubscribeEmailSent");
                        }

                    }
                    else if (subscribe)
                    {
                        subscription = new NewsLetterSubscription
                        {
                            NewsLetterSubscriptionGuid = Guid.NewGuid(),
                            Email = email,
                            Active = true,
                            StoreId = _storeContext.CurrentStore.Id,
                            CreatedOnUtc = DateTime.UtcNow
                        };
                        _newsLetterSubscriptionService.InsertNewsLetterSubscription(subscription);
                        _workflowMessageService.SendNewsLetterSubscriptionActivationMessage(subscription, _workContext.WorkingLanguage.Id);

                        result = _localizationService.GetResource("Newsletter.SubscribeEmailSent");
                    }
                    else
                    {
                        result = _localizationService.GetResource("Newsletter.UnsubscribeEmailSent");
                    }
                }
                success = true;
            }

            return Json(new
            {
                Success = success,
                Result = result,
            });
        }

        //available even when a store is closed
        [CheckAccessClosedStore(true)]
        public virtual IActionResult SubscriptionActivation(Guid token, bool active)
        {
            var subscription = _newsLetterSubscriptionService.GetNewsLetterSubscriptionByGuid(token);
            if (subscription == null)
                return RedirectToRoute("Homepage");

            if (active)
            {
                subscription.Active = true;
                _newsLetterSubscriptionService.UpdateNewsLetterSubscription(subscription);
            }
            else
                _newsLetterSubscriptionService.DeleteNewsLetterSubscription(subscription);

            var model = _newsletterModelFactory.PrepareSubscriptionActivationModel(active);
            return View(model);
        }
    }
}