﻿using System.Web.Mvc;
using Kuzando.Persistence.Repositories;

namespace Kuzando.Web.Controllers
{
    [HandleError]
    public class HomeController : KuzandoControllerBase
    {
        public HomeController(IUserRepository userRepository)
            : base(userRepository)
        {
        }

        public ActionResult Index()
        {
            var user = GetCurrentUser();
            if (user == null)
            {
                return IndexNotLoggedIn();
            }

            return IndexLoggedIn();
        }

        /// <summary>
        /// Show hompage for a logged in user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private ActionResult IndexLoggedIn()
        {
            return RedirectToAction("ShowWeek", "Tasks");
        }

        /// <summary>
        /// Show homepage for a user that's not logged in
        /// </summary>
        /// <returns></returns>
        private ActionResult IndexNotLoggedIn()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Faq()
        {
            return View();
        }
    }
}