﻿using System.Web.Mvc;
using System.Collections.Generic;

namespace Miaow.Presentation.Union.Controllers
{
    [HandleError]
    public class HomeController :
        Miaow.Infrastructure.Crosscutting.NetFramework.Controllers.MiaowBaseController
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="HomeController"/> class.
        /// </summary>
        /// <param name="work">The work.</param>
        public HomeController(Miaow.Infrastructure.Crosscutting.NetFramework.IWorkContext work)
            : base(work)
        { }

        /// <summary>
        /// Indexes this instance.
        /// </summary>
        /// <returns></returns>
        public ViewResult Index()
        {
            return View();
        }

        /// <summary>
        /// Linkses this instance.
        /// </summary>
        /// <returns></returns>
        [ChildActionOnly]
        [OutputCache(Duration = 3600)]
        public PartialViewResult Links()
        {
            return PartialView("BottomLinkPartial");
        }

        /// <summary>
        /// Bottoms this instance.
        /// </summary>
        /// <returns></returns>
        [ChildActionOnly]
        [OutputCache(Duration = 3600)]
        public PartialViewResult Bottom()
        {
            return PartialView("BottomPartial");
        }
    }




















}
