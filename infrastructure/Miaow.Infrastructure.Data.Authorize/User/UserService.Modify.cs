﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Miaow.Infrastructure.Data.DataSys;
using Miaow.Infrastructure.Crosscutting.Comm.Service;

namespace Miaow.Infrastructure.Crosscutting.Authorize
{
    public partial class UserService
    {
        #region modify

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <param name="operUser">The oper user.</param>
        /// <returns></returns>
        public bool Modify(Sys_AdminUser user, Sys_AdminUser operUser)
        {
            var res = false;
            if (user != null && user.id > 0)
            {
                var log = new Sys_AdminUserLog();
                log.AddTime = System.DateTime.Now;
                log.IpAddress = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetRealIP();
                log.PageUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetCurrentUrl();
                log.ReferrerUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetReferrerUrl();
                log.State = true;
                log.TypeId = 1;
                try
                {
                    adminUserRepository.Modify(user);
                    res = true;
                    if (operUser != null)
                    {
                        log.UserId = operUser.id;
                        log.ShortMessage = "用户Id：" + operUser.id.ToString() + " 改变用户Id号：" + user.id.ToString() + " 的信息";
                        log.FullMessage = "UpdateUser 用户名：" + operUser.username + " 用户Id：" + operUser.id.ToString()
                            + " 改变了用户Id号：" + user.id.ToString() + " 的信息";
                    }
                    else
                    {
                        log.UserId = 0;
                        log.ShortMessage = "用户Id号：" + user.id.ToString() + " 的信息被修改";
                        log.FullMessage = "UpdateUser " + "用户Id号：" + user.id.ToString() + " 的信息被修改";
                    }
                }
                catch (Exception ex)
                {
                    #region  exception
                    if (operUser != null && operUser.id > 0)
                    {
                        log.ShortMessage = "更新用户数据异常";
                        log.FullMessage = log.ShortMessage = "更新用户Id：" + user.id + " 用户名：" + user.username + " 操作用户Id：" + operUser.id + " 错误信息：" + ex.Message;
                        if (ex.InnerException != null)
                        {
                            log.FullMessage += "   内部错误信息：" + ex.InnerException.Message;
                        }
                    }
                    else
                    {
                        log.ShortMessage = "更新用户数据异常";
                        log.FullMessage = log.ShortMessage = "更新用户Id：" + user.id + " 用户名：" + user.username + " 错误信息：" + ex.Message;
                        if (ex.InnerException != null)
                        {
                            log.FullMessage += "   内部错误信息：" + ex.InnerException.Message;
                        }
                    }
                    #endregion
                }
                Miaow.Infrastructure.Data.LoggerReopsitoryManager.AddLogInfo(log);
            }
            return res;
        }


        public bool Modify(IList<Sys_AdminUser> entity, Sys_AdminUser operUser)
        {
            var res = false;
            if (entity != null && entity.Count > 0)
            {
                foreach (var item in entity)
                {
                    if (item != null && item.id > 0)
                    {
                        var log = new Sys_AdminUserLog();
                        log.AddTime = System.DateTime.Now;
                        log.IpAddress = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetRealIP();
                        log.PageUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetCurrentUrl();
                        log.ReferrerUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetReferrerUrl();
                        log.State = true;
                        log.TypeId = 1;
                        try
                        {
                            adminUserRepository.Modify(item);
                            res = true;
                            if (operUser != null)
                            {
                                log.UserId = operUser.id;
                                log.ShortMessage = "用户Id：" + operUser.id.ToString() + " 改变用户Id号：" + item.id.ToString() + " 的信息";
                                log.FullMessage = "UpdateUser 用户名：" + operUser.username + " 用户Id：" + operUser.id.ToString()
                                    + " 改变了用户Id号：" + item.id.ToString() + " 的信息";
                            }
                            else
                            {
                                log.UserId = 0;
                                log.ShortMessage = "用户Id号：" + item.id.ToString() + " 的信息被修改";
                                log.FullMessage = "UpdateUser " + "用户Id号：" + item.id.ToString() + " 的信息被修改";
                            }
                        }
                        catch (Exception ex)
                        {
                            #region  exception
                            if (operUser != null && operUser.id > 0)
                            {
                                log.ShortMessage = "更新用户数据异常";
                                log.FullMessage = log.ShortMessage = "更新用户Id：" + item.id + " 用户名：" + item.username + " 操作用户Id：" + operUser.id + " 错误信息：" + ex.Message;
                                if (ex.InnerException != null)
                                {
                                    log.FullMessage += "   内部错误信息：" + ex.InnerException.Message;
                                }
                            }
                            else
                            {
                                log.ShortMessage = "更新用户数据异常";
                                log.FullMessage = log.ShortMessage = "更新用户Id：" + item.id + " 用户名：" + item.username + " 错误信息：" + ex.Message;
                                if (ex.InnerException != null)
                                {
                                    log.FullMessage += "   内部错误信息：" + ex.InnerException.Message;
                                }
                            }
                            #endregion
                        }
                        Miaow.Infrastructure.Data.LoggerReopsitoryManager.AddLogInfo(log);
                    }
                }
            }
            return res;
        }

        /// <summary>
        /// Users the change PWD by id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <param name="pwd">The PWD.</param>
        /// <returns></returns>
        public bool ModifyPwdById(int id, string pwd, Sys_AdminUser operUser)
        {
            bool b = false;
            pwd = Miaow.Infrastructure.Crosscutting.Function.StringHelper.Tomd5(pwd);
            int res = ProcedureService.UserChangePwdById(id, pwd);
            if (res > 0)
            {
                b = true;
                var log = new Sys_AdminUserLog();
                log.AddTime = System.DateTime.Now;
                log.IpAddress = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetRealIP();
                log.PageUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetCurrentUrl();
                log.ReferrerUrl = Miaow.Infrastructure.Crosscutting.Function.StringHelper.GetReferrerUrl();
                log.State = true;
                log.TypeId = 1;
                if (operUser != null)
                {
                    log.UserId = operUser.id;
                    log.ShortMessage = "用户Id：" + operUser.id + " 改变用户Id号：" + id.ToString() + " 的密码";
                    log.FullMessage = "UserChangePwdById 用户：" + operUser.username + " 用户Id：" + operUser.id.ToString()
                        + " 改变用户Id号：" + id.ToString() + " 的密码：" + pwd;
                }
                else
                {
                    log.UserId = 0;
                    log.ShortMessage = "用户Id号：" + id.ToString() + " 的密码被修改";
                    log.FullMessage = "UserChangePwdById " + "用户Id号：" + id.ToString() + " 的密码被修改";
                }
            }
            return b;
        }

        /// <summary>
        /// Users the name of the change PWD by.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <param name="pwd">The PWD.</param>
        /// <returns></returns>
        public bool ModifyPwdByName(string name, string pwd, Sys_AdminUser operUser)
        {
            bool b = false;
            pwd = Miaow.Infrastructure.Crosscutting.Function.StringHelper.Tomd5(pwd);
            int id = GetUserIdByName(name);
            if (id > 0)
            {
                b = ModifyPwdById(id, pwd, operUser);
            }
            return b;
        }

        #endregion
    }
}
