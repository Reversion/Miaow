﻿/*
* Compressed by iPow(www.iPow.cn)
*/
var startName_driver, endName_driver, startcitycode, endcitycode, sis_driver, start_driver, end_driver, route_driver, gold = 0, nn_r = 1, r_start_x = "", r_start_y = "", r_start_name = "", r_start_type = "", r_start_address = "", r_start_tel = "", r_start_pid = "", r_start_citycode = "", r_start_cityname = "", r_end_x = "", r_end_y = "", r_end_name = "", r_end_type = "", r_end_address = "", r_end_tel = "", r_end_pid = "", r_end_citycode = "", r_end_cityname = "", r_xy_array, route_way, r_xy_hc_array = "", r_start_temp = "", r_end_temp = "", route_NN = 0;
function search_route_map() {
    gold = 1; route_NN = 0; startName_driver = document.getElementById("startName_driver").value;
    startcitycode = document.getElementById("fromAreaCode").value;
    endcitycode = document.getElementById("localAreaCode").value;
    endName_driver = document.getElementById("endName_driver").value; jQuery("#sHowList").html("<ul id='mainnav'></ul>");
    if (startcitycode == null || startcitycode == "" || startcitycode == undefined || endcitycode == null || endcitycode == "" || endcitycode == undefined) {
        document.getElementById("mainnav").innerHTML = "<li style=\"border:none;\"><span>\u5bf9\u4e0d\u8d77,\u6682\u65e0\u6b64\u57ce\u5e02\u7684\u6570\u636e^_^...<br/></span></li>"; return
    } else document.getElementById("mainnav").innerHTML = "<li style=\"border:none;\"><span>\u6b63\u5728\u52a0\u8f7d\u6570\u636e...<br/><img src=\"/images/loading2.gif\" /></span></li>"; route_way = document.getElementById("route_way").value; sis_driver = new MSISSearch(); start_driver = new MSearchPointPara(); end_driver = new MSearchPointPara(); route_driver = new MSearchRoutPara(); sis_driver.setSISCallbackFunction(myfunc2); nn_r = 1; start_driver.setCitycode(startcitycode); start_driver.setKeyword(startName_driver); start_driver.setNumber(1); start_driver.setPageSum(1); start_driver.setBatch(1); sis_driver.searchByKeyword(start_driver)
}
function myfunc2(data) {
    if (data.count != 0) {
        if (nn_r == 2) {
            r_xy_array = new Array();
            r_xy_hc_array = new Array();
            var road_length = 0, route_line = "", phone_xin = "", str_xy = "", route_map = eval("(data)");
            for (var i = 0; i < route_map.segmengList.length; i++) {
                var img = "", a = "";
                if (a == "");
                else img = "<img src=\"html/images/r/" + a + "\" />";
                route_line += "<li><div>" + (i + 1) + ":" + route_map.segmengList[i].textInfo + img + "</div></li>";
                phone_xin += route_map.segmengList[i].textInfo + "\uff0e";
                road_length = road_length + parseInt(route_map.segmengList[i].roadLength);
                str_xy += route_map.segmengList[i].coor
            } if (road_length > 1000) road_length = road_length / 1000;
            document.getElementById("mainnav").innerHTML = "<li><div><b>\u8d77:</b>" + r_start_cityname + "&nbsp;&nbsp;&nbsp;&nbsp;" + r_start_name + "</div></li>" + route_line + "<li><div><b>\u7ec8\uff1a</b>" + r_end_cityname + "&nbsp;&nbsp;&nbsp;&nbsp;" + r_end_name + "</div></li><li><div><strong>\u884c\u9a76:</strong>" + road_length + "\u516c\u91cc</div></li>"; poi_xy_r = str_xy.split(","); arrX_r = ""; arrY_r = ""; for (var e = 0; e < poi_xy_r.length - 1; e = e + 2) if (e == poi_xy_r.length - 3) { arrX_r += poi_xy_r[e]; arrY_r += poi_xy_r[e + 1] } else { arrX_r += poi_xy_r[e] + ","; arrY_r += poi_xy_r[e + 1] + "," } var abcObj = document.getElementById("map_right"); if (!(abcObj == null || abcObj == "" || abcObj == undefined)) routeaddline(arrX_r, arrY_r, r_start_y, r_start_x, r_end_y, r_end_x)
        } else {
            if (nn_r == 1) {
                var rs = eval("(data)");
                if (rs.count != 0)
                    for (i = 0; i < rs.poilist.length; i++) {
                        r_start_temp += "<li><a class=\"a1\" href=\"javascript:void(0)\">" + (i + 1) + "." + rs.poilist[i].name + "</a></li>"; r_start_name = rs.poilist[0].name; r_start_x = rs.poilist[0].x; r_start_y = rs.poilist[0].y
                    }
            } if (nn_r == 0) {
                rs = eval("(data)");
                if (rs.count != 0) for (i = 0; i < rs.poilist.length; i++) {
                    r_end_temp += "<li><a class=\"a1\" href=\"javascript:void(0)\">" + (i + 1) + "." + rs.poilist[i].name + "</a></li>";
                    r_end_name = rs.poilist[0].name;
                    r_end_citycode = rs.poilist[0].citycode; r_end_x = rs.poilist[0].x; r_end_y = rs.poilist[0].y
                }
            } start_end_route()
        }
    }
    else
        document.getElementById("mainnav").innerHTML = "<li style=\"border:none;\"><span>\u5bf9\u4e0d\u8d77,\u6682\u65e0\u6b64\u5730\u70b9\u7684\u6570\u636e\uff0c\u8bf7\u60a8\u91cd\u65b0\u8f93\u5165\u9644\u8fd1\u5730\u5740^_^...<br/></span></li>"
}
function start_end_route() {
    if (nn_r == 1) {
        nn_r = 0; end_driver.setCitycode(endcitycode);
        end_driver.setKeyword(endName_driver);
        end_driver.setNumber(1);
        end_driver.setPageSum(1);
        end_driver.setBatch(1);
        sis_driver.searchByKeyword(end_driver)
    }
    else {
        nn_r = 2; route_driver.setStartXY(r_start_x, r_start_y);
        route_driver.setEndXY(r_end_x, r_end_y); route_driver.setCitycode(startcitycode);
        route_driver.setRouteType(route_way); route_driver.setType("drive");
        sis_driver.searchBusAndDrive(route_driver)
    }
}
function routeaddline(D, H, J, A, B, L) {
    mapObj.removeAllOverlays(); var F = "";
    if (r_start_type == " " || r_start_type == "");
    else
        F = F + "<font color=\"#FFFFFF\">\u7c7b\u578b\uff1a" + r_start_type + "</font>";
    if (r_start_address == "\u6682\u65e0\u5730\u5740");
    else F = F + "<br /><font color=\"#FFFFFF\">\u5730\u5740\uff1a" + r_start_address + "</font>";
    if (r_start_tel == "\u6682\u65e0\u7535\u8bdd");
    else F = F + "<br /><font color=\"#FFFFFF\">\u7535\u8bdd\uff1a" + r_start_tel + "</font>";
    var C = new MStyle(); C.lineColor = "0xFFFFFF";
    C.lineOpacity = "80"; C.fillColor = "0x4b8bd9";
    C.lineSize = "2"; C.fillOpacity = "100";
    C.labelColor = "0xFFFFFF";
    C.textContent = "<font color=\"#FFFFFF\"><b>\u8d77\u70b9</b></font>\u3000<br />" + F + "<br /><a href=\"javascript:zoom('" + J + "','" + A + "')\"><font color=\"#ffffff\">\u5b9a\u4f4d\u653e\u5927</font></a>\u3000<a href=\"javascript:javascript:feedback('" + r_start_pid + "','" + r_start_citycode + "','" + r_start_name + "')\"><font color='#ffffff'>\u7ea0\u9519</font></a>  "; var M = ""; if (r_end_type == " " || r_end_type == ""); else M = M + "<font color=\"#FFFFFF\">\u7c7b\u578b\uff1a" + r_end_type + "</font>";
    if (r_end_address == "\u6682\u65e0\u5730\u5740");
    else M = M + "<br /><font color=\"#FFFFFF\">\u5730\u5740\uff1a" + r_end_address + "</font>";
    if (r_end_tel == "\u6682\u65e0\u7535\u8bdd");
    else M = M + "<br /><font color=\"#FFFFFF\">\u7535\u8bdd\uff1a" + r_end_tel + "</font>";
    var E = new MStyle();
    E.textContent = "<font color=\"#FFFFFF\"><b>\u7ec8\u70b9</b></font>\u3000<br />" + M + "<br /><a href=\"javascript:zoom('" + B + "','" + L + "')\"><font color=\"#ffffff\">\u5b9a\u4f4d\u653e\u5927</font></a>\u3000<a href=\"javascript:feedback('" + r_end_pid + "','" + r_end_citycode + "','" + r_end_name + "')\"><font color='#ffffff'>\u7ea0\u9519</font></a>  "; E.lineColor = "0xFFFFFF"; E.lineOpacity = "80"; E.fillColor = "0x4b8bd9";
    E.lineSize = "2"; E.fillOpacity = "100"; E.labelColor = "0xFFFFFF"; var I = new MStyle();
    I.lineSize = 6; I.lineColor = 255; I.lineOpacity = "60";
    var G = new MPointOverlay(new MLatLng(J, A), r_start_name, C), K = new MPointOverlay(new MLatLng(B, L), r_end_name, E);
    mapObj.drawDriveLine(D, H, G, K, I, true)
}
var point = null; function searchByKeyword() {
    var C = document.form1.citycode.value, A = document.form1.keyword.value, E = document.form1.searchType.value, G = document.form1.number.value, F = document.form1.batch.value; if (C == "") {
        alert("\u8bf7\u586b\u5199\u57ce\u5e02\u533a\u53f7\uff0c\u6b64\u5904\u4e0d\u80fd\u4e3a\u7a7a!");
        return false
    } if (A == "") {
        alert("\u8bf7\u586b\u5199\u67e5\u8be2\u5173\u952e\u5b50\uff0c\u6b64\u5904\u4e0d\u80fd\u4e3a\u7a7a!");
        return false
    } var B = new MSISSearch(), D = new MSearchPointPara();
    B.setSISCallbackFunction(keywordCallBack);
    D.setCitycode(C);
    D.setKeyword(A);
    D.setSearchType(E);
    D.setNumber(G); D.setBatch(F);
    B.searchByKeyword(D)
}
function keywordCallBack(D) {
    if (D.count != 0) {
        var C = "<table width='100%' border='0'>";
        for (var A = 0; A < D.poilist.length; A++) {
            var F = D.poilist[A].pguid, I = D.poilist[A].citycode, G = D.poilist[A].x, E = D.poilist[A].y, B = new MStyle();
            B.lineColor = 16777215; B.lineSize = 2; B.fillColor = 4951001;
            B.fillOpacity = 80; B.labelColor = 16777215; B.leading = 2;
            var H = "<font color='#ffffff'><b>" + D.poilist[A].name + "</b></font><br>";
            if (!D.poilist[A].type == "" && D.poilist[A].type != null) H += "<font color='#ffffff'>\u7c7b\u578b:" + D.poilist[A].type + "</font><br/>";
            if (!D.poilist[A].address == "" && D.poilist[A].address != null) H += "<font color='#ffffff'>\u5730\u5740:" + D.poilist[A].address + "</font><br/>"; if (!D.poilist[A].tel == "" && D.poilist[A].tel != null) H += "<font color='#ffffff'>\u7535\u8bdd:" + D.poilist[A].tel + "</font><br/>"; B.textContent = H; point = new MPointOverlay(new MLatLng(E, G), A + 1, B, A + 1); mapObj.addOverlay(point, true); C += "<tr><td colspan='2' onclick=\"mapObj.setCenterByLatLng('" + D.poilist[A].y + "','" + D.poilist[A].x + "');mapObj.openTipById('" + (A + 1) + "')\"><div align='left' class='style3'>" + (A + 1) + "  " + D.poilist[A].name + "</div></td></tr><tr><td><div align='right' class='style2'>\u7c7b\u578b\uff1a</div></td><td class='style2'>" + D.poilist[A].type + "</td></tr><tr><td><div align='right' class='style2'>\u5730\u5740\uff1a</div></td><td class='style2'>" + D.poilist[A].address + "</td></tr><tr><td><div align='right' class='style2'>\u7535\u8bdd\uff1a</div></td><td class='style2'>" + D.poilist[A].tel + "</td></tr>"
        } C += "</table>"; alert(C); document.getElementById("result").innerHTML = C
    } else alert("\u5bf9\u4e0d\u8d77\uff01\u6682\u65e0\u6570\u636e!")
}
var startName_bus, endName_bus, citycode, routeType, sis, start, end, bus, gold = 1, start_x = "", start_y = "", start_name = "", start_type = "", start_address = "", start_tel = "", start_pid = "", start_citycode = "", start_cityname = "", end_x = "", end_y = "", end_name = "", end_type = "", end_address = "", end_tel = "", end_pid = "", end_citycode = "", end_cityname = "", xy_array, xy_hc_array = "", start_temp = "", end_temp = "", bus_NN = 0; function search_bus_map() {
    citycode = document.getElementById("localAreaCode").value; jQuery("#sHowList").html("<ul id='mainnav'></ul>"); if (citycode == null || citycode == "" || citycode == undefined) {
        document.getElementById("mainnav").innerHTML = "<li style=\"border:none;\"><span>\u5bf9\u4e0d\u8d77,\u6682\u65e0\u6b64\u57ce\u5e02\u7684\u6570\u636e^_^...<br/></span></li>";
        return
    } else document.getElementById("mainnav").innerHTML = "<li style=\"border:none;\"><span>\u6b63\u5728\u52a0\u8f7d\u6570\u636e...<br/><img src=\"/images/loading2.gif\" /></span></li>"; bus_NN = 0;
    startName_bus = document.getElementById("startName_bus").value; endName_bus = document.getElementById("endName_bus").value;
    routeType = document.getElementById("routeType").value;
    sis = new MSISSearch();
    start = new MSearchPointPara(); end = new MSearchPointPara();
    bus = new MSearchRoutPara(); sis.setSISCallbackFunction(searchBusCallBack);
    gold = 1; start.setCitycode(citycode); start.setKeyword(startName_bus);
    start.setNumber(1); start.setBatch(1);
    sis.searchByKeyword(start)
}
function searchBusCallBack(data) {
    if (data.count != 0) {
        if (gold == 2) {
            xy_array = new Array(); xy_hc_array = new Array();
            var bus_line = "", bus_map = eval("(data)"), bus_count = bus_map.busList.length;
            for (var i = 0; i < bus_map.busList.length; i++) {
                var bus_text = "", str_xy = "", bus_num = "", xy_hc = "", bus_length = 0;
                for (var k = 0; k < bus_map.busList[i].segmentList.length; k++) {
                    if (k == 0) { bus_num += (bus_map.busList[i].segmentList[k].busName).split("(")[0]; bus_text += "\u6b65\u884c" + bus_map.busList[i].segmentList[k].footLength + "\u7c73\u5230\u8fbe" + bus_map.busList[i].segmentList[k].startName + ",\u6362\u4e58" + bus_map.busList[i].segmentList[k].busName + ",\u9014\u5f84" + bus_map.busList[i].segmentList[k].passDepotCount + "\u7ad9,\u5230\u8fbe" + bus_map.busList[i].segmentList[k].endName + "."; var xy = (bus_map.busList[i].segmentList[k].coordinateList).split(","); xy_hc += xy[xy.length - 3] + "," + xy[xy.length - 2] + "," } else { bus_num = bus_num + "\u8f6c" + (bus_map.busList[i].segmentList[k].busName).split("(")[0]; bus_text += "\u4e0b\u8f66\u6b65\u884c" + bus_map.busList[i].segmentList[k].footLength + "\u7c73\u5230\u8fbe" + bus_map.busList[i].segmentList[k].startName + ",\u6362\u4e58" + bus_map.busList[i].segmentList[k].busName + ",\u9014\u5f84" + bus_map.busList[i].segmentList[k].passDepotCount + "\u7ad9, \u5230\u8fbe" + bus_map.busList[i].segmentList[k].endName + "."; xy = (bus_map.busList[i].segmentList[k].coordinateList).split(","); xy_hc += xy[0] + "," + xy[1] + "," } str_xy += bus_map.busList[i].segmentList[k].coordinateList; bus_length = bus_length + parseInt(bus_map.busList[i].segmentList[k].driverLength);
                    if (bus_map.busList[i].segmentList.length == 1) xy_hc = ""
                } xy_array[i] = str_xy; xy_hc_array[i] = xy_hc; if (i == 0) bus_line += "<li><a href=\"javascript:void(0)\" class=\"List\" id=\"result" + (i + 1) + "\"><strong>\u65b9\u6848" + (i + 1) + "</strong></a><div class=\"current\">" + bus_text + "</div></li>";
                else bus_line += "<li><a href=\"javascript:void(0)\" class=\"List\" id=\"result" + (i + 1) + "\"><strong>\u65b9\u6848" + (i + 1) + "</strong></a><div class=\"hide\">" + bus_text + "</div></li>"
            }
            document.getElementById("mainnav").innerHTML = bus_line;
            jQuery("#mainnav a").click(function () {
                var A = jQuery(this).attr("id"); jQuery("#mainnav .current").removeClass("current").addClass("hide");
                jQuery("#" + A + " ~ div").removeClass("hide").addClass("current")
            });
            var poi_xy = xy_array[0].split(","), arrX = "", arrY = ""; for (var e = 0; e < poi_xy.length - 1; e = e + 2) if (e == poi_xy.length - 3) { arrX += poi_xy[e]; arrY += poi_xy[e + 1] } else { arrX += poi_xy[e] + ","; arrY += poi_xy[e + 1] + "," } var poi_xy_hc = xy_hc_array[0].split(","), hcx = "", hcy = ""; for (e = 0; e < poi_xy_hc.length - 1; e = e + 2) if (e == poi_xy_hc.length - 3) { hcx += poi_xy_hc[e]; hcy += poi_xy_hc[e + 1] } else {
                hcx += poi_xy_hc[e] + ","; hcy += poi_xy_hc[e + 1] + ","
            }
            var abcObj = document.getElementById("map_right");
            if (!(abcObj == null || abcObj == "" || abcObj == undefined))
                drawABusLine(arrX, arrY, start_x, start_y, end_x, end_y, hcx, hcy)
        } else {
            if (gold == 1) {
                var rs = eval("(data)");
                if (rs.count != 0) for (i = 0; i < rs.poilist.length; i++) {
                    start_temp += "<li><a class=\"a1\" href=\"javascript:void(0)\">" + (i + 1) + "." + rs.poilist[i].name + "</a></li>";
                    start_name = rs.poilist[0].name; start_citycode = rs.poilist[0].citycode;
                    start_x = rs.poilist[0].x; start_y = rs.poilist[0].y
                }
            } if (gold == 0) {
                rs = eval("(data)");
                if (rs.count != 0) for (i = 0; i < rs.poilist.length; i++) {
                    end_temp += "<li><a class=\"a1\" href=\"javascript:void(0)\">" + (i + 1) + "." + rs.poilist[i].name + "</a></li>";
                    end_name = rs.poilist[0].name;
                    end_citycode = rs.poilist[0].citycode; end_x = rs.poilist[0].x; end_y = rs.poilist[0].y
                }
            } start_end_bus()
        }
    }
} function start_end_bus() {
    if (gold == 1) {
        gold = 0; end.setCitycode(citycode);
        end.setKeyword(endName_bus); end.setNumber(1);
        end.setPageSum(1); end.setBatch(1); sis.searchByKeyword(end)
    } else {
        gold = 2; bus.setStartXY(start_x, start_y);
        bus.setEndXY(end_x, end_y); bus.setCitycode(citycode);
        bus.setRouteType(routeType); bus.setType("bus");
        sis.searchBusAndDrive(bus)
    }
}
function drawABusLine(D, J, K, N, L, B, F, C) {
    mapObj.removeAllOverlays();
    var G = ""; if (!start_type == null || !start_type == "") G = G + "<font color=\"#FFFFFF\">\u7c7b\u578b\uff1a" + start_type + "</font>";
    if (!start_address == "" || !start_address == null) G = G + "<br /><font color=\"#FFFFFF\">\u5730\u5740\uff1a" + start_address + "</font>";
    if (!start_tel == "" || !start_tel == null) G = G + "<br /><font color=\"#FFFFFF\">\u7535\u8bdd\uff1a" + start_tel + "</font>";
    var A = new MStyle(); A.lineColor = "0xFFFFFF"; A.lineOpacity = "80"; A.lineSize = "2"; A.fillOpacity = "100";
    A.fillColor = "0x4b8bd9"; A.labelColor = "0xFFFFFF";
    A.textContent = "<font color=\"#FFFFFF\"><b>\u8d77\u70b9</b></font>\u3000<br />" + G + "<br />";
    var O = ""; if (end_type == " " || end_type == "");
    else O = O + "<font color=\"#FFFFFF\">\u7c7b\u578b\uff1a" + end_type + "</font>";
    if (end_address == "\u6682\u65e0\u5730\u5740");
    else O = O + "<br /><font color=\"#FFFFFF\">\u5730\u5740\uff1a" + end_address + "</font>";
    if (end_tel == "\u6682\u65e0\u7535\u8bdd");
    else O = O + "<br /><font color=\"#FFFFFF\">\u7535\u8bdd\uff1a" + end_tel + "</font>";
    var E = new MStyle(); E.textContent = "<font color=\"#FFFFFF\"><b>\u7ec8\u70b9</b></font>\u3000<br />" + G + "<br />";
    E.lineColor = "0xFFFFFF"; E.lineOpacity = "80"; E.fillColor = "0xEF501A"; E.lineSize = "2"; E.fillOpacity = "100";
    E.fillColor = "0x4b8bd9"; E.labelColor = "0xFFFFFF";
    var I = new MStyle(); I.lineSize = 6; I.lineColor = 255; I.lineOpacity = "60";
    var H = new MPointOverlay(new MLatLng(N, K), start_name, A), M = new MPointOverlay(new MLatLng(B, L), end_name, E);
    if (K == "" || K == "null" || L == "" || B == "null"); else mapObj.drawBusLine(D, J, F, C, H, M, I, true)
}