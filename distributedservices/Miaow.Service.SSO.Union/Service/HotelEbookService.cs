﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Miaow.Application.Union;

namespace Miaow.Service.Union.Service
{
    /// <summary>
    /// 
    /// </summary>
    public class HotelEbookService : IHotelEbookService
    {
        /// <summary>
        /// Gets the hotel oder list by phone.
        /// </summary>
        /// <param name="phone">The phone.</param>
        /// <returns></returns>
        public List<Miaow.Application.Union.Dto.HotelEbookDto> GetHotelOderListByPhone(string phone)
        {
            List<Miaow.Application.Union.Dto.HotelEbookDto> data = null;
            Miaow.Application.Union.Dto.HotelEbookDto temp = null;
            Config.IUnionConfig fig = Config.ConfigManager.GetConfigProvider();
            UnionDataUrlBase dataUrl = new DataUrl.Default.DingDanlistDefaultService(fig);
            dataUrl.UrlParas.Add("phone", phone);
            dataUrl.UrlParas.Add("typeid", dataUrl.Config.Initial().DingDanType);
            var url = dataUrl.GetUrl();
            Miaow.Infrastructure.Crosscutting.Function.WebHttpHelper req = new Infrastructure.Crosscutting.Function.WebHttpHelper();
            try
            {
                var dataStr = req.WebRequest(Miaow.Infrastructure.Crosscutting.Function.HttpMethod.GET, url.AbsoluteUri, "");
                if (dataStr != null && dataStr != "")
                {
                    var jarray = Newtonsoft.Json.Linq.JArray.Parse(dataStr);
                    data = new List<Miaow.Application.Union.Dto.HotelEbookDto>();
                    foreach (var item in jarray)
                    {
                        temp = new Miaow.Application.Union.Dto.HotelEbookDto();
                        temp.dn = item["dn"] == null ? string.Empty : item["dn"].ToString();
                        temp.hn = item["hn"] == null ? string.Empty : item["hn"].ToString();
                        temp.rm = item["rm"] == null ? string.Empty : item["rm"].ToString();
                        temp.nm = item["nm"] == null ? -1 : int.Parse(item["nm"].ToString());
                        temp.bd = item["bd"] == null ? string.Empty : item["bd"].ToString();
                        temp.ed = item["ed"] == null ? string.Empty : item["ed"].ToString();
                        temp.sm = item["sm"] == null ? string.Empty : item["sm"].ToString();
                        temp.total = item["total"] == null ? string.Empty : item["total"].ToString();
                        data.Add(temp);
                    }
                }
            }
            catch (Exception ex)
            {
                Miaow.Infrastructure.Data.LoggerReopsitoryManager.AddLogInfo(1, 0,
                       Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetCurrentUrl(),
                       Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetReferrerUrl(),
                       "酒店预定", ex.Message,
                       Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetRealIP());
            }
            return data;
        }
    }
}