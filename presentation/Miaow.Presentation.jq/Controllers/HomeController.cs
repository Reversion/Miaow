﻿using System;
using System.Web.Mvc;
using Miaow.Application.jq.Dto;

namespace Miaow.Presentation.jq.Controllers
{
    [HandleError]
    public class HomeController :
        Miaow.Infrastructure.Crosscutting.NetFramework.Controllers.MiaowBaseController
    {
        const int pageSize = 10;

        Miaow.Application.jq.Service.IHomeService homeService;

        public HomeController(Miaow.Infrastructure.Crosscutting.NetFramework.IWorkContext work,
            Miaow.Application.jq.Service.IHomeService MiaowHome)
            : base(work)
        {
            if (MiaowHome == null)
            {
                throw new ArgumentNullException("homeService is null");
            }
            homeService = MiaowHome;
        }

        public ActionResult Index(string city, int? id)
        {
            HomeDto data = null;
            var pi = id == null ? 1 : (int)id;
            if (string.IsNullOrEmpty(city) || string.Compare(city, "scripts", false) == 0)
            {
                data = homeService.GetHomeModelNoCity(pi, pageSize);
            }
            else
            {
                data = homeService.GetHomeModelByCity(city, pi, pageSize);
            }
            return View(data);
        }

        public ActionResult Province(string prov, string city, int? cla, int? id)
        {
            HomeDto data = null;
            var pi = (id == null ? 1 : (int)id);
            string cityCopy = string.Empty;
            if (city != "all")
            {
                cityCopy = city;
            }
            if (string.IsNullOrEmpty(prov))
            {
                data = homeService.GetHomeModelNoCity(id ?? 1, pageSize);
                return View(data);
            }
            else
            {
                data = homeService.GetHomeModelByProvAndCityAndType(prov, cityCopy, cla ?? 0, pi, 9);
                if (Request.IsAjaxRequest())
                {
                    return PartialView("ProvincePartial", data);
                }
                return View(data);
            }
        }

        public ActionResult SelectProvinceByTicket(string prov, int? cla, int? start, int? end, int? id)
        {
            HomeDto data = null;
            var pi = (id == null ? 1 : (int)id);
            if (string.IsNullOrEmpty(prov))
            {
                data = homeService.GetHomeModelNoCity(pi, pageSize);
                return View(data);
            }
            else
            {
                data = homeService.GetHomeModelByProvAndCityAndTicket(prov, cla ?? 0, start, end, id ?? 1, 9);
                if (Request.IsAjaxRequest())
                {
                    return PartialView("ProvincePartial", data);
                }
                return View(data);
            }
        }

        public ViewResult Type(string city, int? cla, int? id)
        {
            HomeDto data = null;
            var pi = (id == null ? 1 : (int)id);
            if (string.IsNullOrEmpty(city))
            {
                data = homeService.GetHomeModelNoCity(pi, pageSize);
            }
            else
            {
                data = homeService.GetHomeModelByCityAndType(city, cla ?? 0, true, pi, pageSize);
            }
            return View(data);
        }
    }
}
