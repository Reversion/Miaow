/*
* Copyright by iPow(www.xidea.org)
*/
var sightHttp = "http://localhost:2466/", iPowSearch = null, iPowUser = null, iPowResult = null, iPowHotel = null;
function showArea() { $("#addrProvince").remove(); var D = $(this).attr("id"), G = $(this).offset(), E = G.left - 160, C = G.top + 20, B = "<div id='addrProvince'><span><em>\u8bf7\u9009\u62e9\u5730\u70b9</em><a id='gb'>[&nbsp;\u5173\u95ed&nbsp;]</a></span><ul></ul><div style='clear:both;'></div></div>"; areasLen = provinceArr.length; var A = ""; for (var F = 0; F < areasLen; F++) A = A + "<li id='" + provinceArr[F][0] + "'>" + provinceArr[F][1] + "</li>"; $("body").append(B); $("#addrProvince ul").append(A); $("#addrProvince").css({ left: E + "px", top: C + "px" }); $("#addrProvince span a#fh").bind("click", function () { $("#addrProvince ul").empty(); $("#addrProvince ul").append(A); $("#addrProvince ul li").bind("click", { iptn: D }, liBind) }); $("#addrProvince span a#gb").bind("click", function () { $("#addrProvince").remove() }); $("#SightList").bind("click", function () { $("#addrProvince").remove() }); $("#addrProvince ul li").bind("click", { iptn: D }, liBind) } function liBind(D) { var C = "", A = $(this).attr("id"), B = $(this).text(); B = StrCode(B.replace(/\+/g, "%2B").replace(/\//g, "%2F")); C = sightHttp; C = C + B; location.href = C; $("#addrProvince").css("display", "none") } function showCity() { $("#addr").remove(); var C = $(this).attr("id"), B = "<div id='addr'><span><em>\u8bf7\u9009\u62e9\u57ce\u5e02</em><a id='gb'>[&nbsp;\u5173\u95ed&nbsp;]</a></span><ul></ul><div style='clear:both;'></div></div>"; areasLen = cityArr.length; var A = ""; for (var D = 0; D < areasLen; D++) A = A + "<li id='" + cityArr[D] + "'>" + cityArr[D] + "</li>"; $("#cityShow").append(B); $("#addr ul").append(A); $("#addr span a#fh").bind("click", function () { $("#addr ul").empty(); $("#addr ul").append(A); $("#addr ul li").bind("click", { iptn: C }, liBind1) }); $("#addr span a#gb").bind("click", function () { $("#addr").remove() }); $("#SightList").bind("click", function () { $("#addr").remove() }); $("#addr ul li").bind("click", { iptn: C }, liBind1) } function liBind1(D) { var C = "", A = $(this).attr("id"), B = $(this).text(); B = StrCode(B.replace(/\+/g, "%2B").replace(/\//g, "%2F")); C = sightHttp; C = C + "search/?q=" + B; location.href = C; $("#addr").css("display", "none") }
function showSightList(B, A, E, D, C) { if (iPowSearch != null) iPowSearch.showSightList(B, A, E, D, C) }
function StrCode(A) { if (encodeURIComponent) return encodeURIComponent(A); if (escape) return escape(A) }
function isearch(B, A) {
    mapInital = false;
    var C = $("#txtKeyword").attr("value");
    C = C.replace("\u5e02", "");
    if (iPowSearch != null)
        iPowSearch.getResultList(C, B, A)
}
function goSearch() {
    var A = $("#txtKeyword").attr("value");
    A = A.replace(/<.*>/gi, "");
    if (A != "") {
        A = StrCode(A.replace(/\+/g, "%2B").replace(/\//g, "%2F"));
        var B = "http://jq.ipow.cn/search/?q=" + A; window.location.href = B;
        return false
    }
    else {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u641c\u7d22\u5173\u952e\u5b57\uff01");
        $("#txtKeyword").focus()
    }
}
function getFocus() { if (event.keyCode == 13) { $("#search").click(); return false } }
function parseQuery(B) {
    var C = new Object();
    if (!B) return C; var D = B.split(/[;&]/);
    for (var G = 0; G < D.length; G++) {
        var F = D[G].split("=");
        if (!F || F.length != 2) continue; var E = unescape(F[0]), A = unescape(F[1]);
        A = A.replace(/\+/g, " ");
        C[E] = A
    } return C
}
function setPageLoad() {
    var A = UnStrCode(location.href.replace(/^[^\?]+\??/, "")), C = parseQuery(A), B = UnStrCode(C["q"]);
    if (B == "undefined" || B == "")
        window.location.href = "http://jq.ipow.cn/";
    else {
        $("#txtKeyword").attr("value", B);
        isearch(1, 0)
    }
}
function isUndefined(A) {
    return typeof A == "undefined" ? true : false
}

function UnStrCode(A) {
    if (decodeURIComponent) return decodeURIComponent(A);
    if (unescape) return unescape(A)
}
function onlyDate() {
    var A = window.event.srcElement;
    if (event.keyCode < 48 || event.keyCode > 57) return false; if (A.value.length > 4 && A.value.indexOf("-") < 1) A.value = "";
    if (A.value.length == 4 || A.value.length == 7) A.value = A.value + "-";
    if (A.value.length == 10 && A.maxLength != 10) A.value = A.value + " ";
    if (A.value.length == 13) A.value = A.value + ":"
}
function TripSearch(F) {
    var D = $.trim($("#txtTermini").attr("value")), E = $.trim($("#txtSpringBoard").attr("value")), B = $.trim($("#txtNum").attr("value")), A = $.trim($("#txtSpringDate").attr("value")), G = $.trim($("#TerminiType").attr("value")); if (D == "" || D == undefined) { alert("\u8bf7\u9009\u62e9\u60a8\u7684\u76ee\u7684\u5730\uff01"); $("#txtTermini").focus(); return false } if (E == "" || E == undefined) { alert("\u8bf7\u9009\u62e9\u60a8\u7684\u51fa\u53d1\u5730\uff01"); $("#txtSpringBoard").focus(); return false } if (A == "" || A == undefined) {
        alert("\u8bf7\u9009\u62e9\u60a8\u7684\u51fa\u53d1\u65e5\u671f\uff01"); $("#txtSpringDate").focus();
        return false
    }
    if (B == "" || B == undefined) {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u884c\u7a0b\u5929\u6570\uff01");
        $("#txtNum").focus(); return false
    } else if (isNaN(B)) {
        alert("\u8bf7\u6b63\u786e\u8f93\u5165\u60a8\u7684\u884c\u7a0b\u5929\u6570\uff01");
        $("#txtNum").focus(); return false
    } var C = "f=" + escape(E) + "&a=" + escape(D) + "&d=" + B + "&t=" + escape(A) + "&k=" + escape(G) + ""; if (D != "") switch (F) { case 1: location.href = "index.shtml?" + C; break; default: break }
}
function isearch_hotel() {
    mapInital = false;
    var B = $.trim($("#txtBide").attr("value")), A = $.trim($("#txtKeyword").attr("value"));
    B = B.replace(/<.*>/gi, ""); A = A.replace(/<.*>/gi, "");
    if (B == "") {
        alert("\u8bf7\u9009\u62e9\u60a8\u7684\u76ee\u7684\u5730\uff01");
        $("#txtBide").focus(); return false
    }
    $("#hotelCity").text(B);
    if (iPowSearch != null) iPowSearch.getHotelResultList(A, B, 0, 1)
}
function setHPageLoad() {
    var B = UnStrCode(location.href.replace(/^[^\?]+\??/, "")), D = parseQuery(B), F = UnStrCode(D["city"]), E = UnStrCode(D["cometime"]), A = UnStrCode(D["leavetime"]), C = UnStrCode(D["q"]); if (E) if (C == "undefined") C = ""; if (E == "undefined") E = ""; if (A == "undefined") A = ""; if (F == "undefined" || F == "" || E == "undefined" || E == "") {
        location.href = "http://hotel.ipow.cn/"; return false
    } else {
        $("#txtBide").attr("value", F);
        $("#txtComeTime").attr("value", E);
        $("#txtLeaveTime").attr("value", A);
        $("#txtKeyword").attr("value", C); isearch_hotel()
    }
}
function gosearch_hotel() {
    var B = $("#txtKeyword").attr("value"), E = $("#txtBide").attr("value"), D = $("#txtComeTime").attr("value"), A = $("#txtLeaveTime").attr("value"), C = ""; B = B.replace(/<.*>/gi, ""); E = E.replace(/<.*>/gi, ""); if (E != "") { E = StrCode(E.replace(/\+/g, "%2B").replace(/\//g, "%2F")); C = "city=" + E + "" } else { alert("\u8bf7\u8f93\u5165\u60a8\u7684\u76ee\u7684\u5730\uff01"); $("#txtBide").focus(); return false } if (D != "") C = C + "&cometime=" + D; else {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u5165\u4f4f\u65f6\u95f4\uff01"); $("#txtComeTime").focus(); return false
    } if (A != "") C = C + "&leavetime=" + D; else {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u79bb\u5e97\u65f6\u95f4\uff01");
        $("#txtLeaveTime").focus(); return false
    } if (B != "") {
        B = StrCode(B.replace(/\+/g, "%2B").replace(/\//g, "%2F")); C = C + "&q=" + B
    } if (C != "") {
        window.location.href = "http://hotel.ipow.cn/search/?" + C; return false
    }
}
function UserLogin() {
    var A = $("#iUserName").attr("value"), B = $("#txtPassword").attr("value");
    if (A == "") {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u7528\u6237\u540d\u79f0\uff01"); $("#iUserName").focus();
        return false
    } if (B == "") {
        alert("\u8bf7\u8f93\u5165\u60a8\u7684\u5bc6\u7801\uff01"); $("#txtPassword").focus(); return false
    } if (iPowUser != null) iPowUser.userLogin(A, B)
}
function ClearInput() {
    $("#iUserName").attr("value", "");
    $("#txtPassword").attr("value", "")
}
function smallOf(A, B) {
    return A < B ? A : B
}
function rPage(C, A, E) {
    var H = tempMapData, B = H.length, G = [], F = "", I = smallOf(B, parseInt(C + A)), D = 1;
    $("#noResult").hide();
    for (var J = C; J < I; J++) {
        G.push(H[J]);
        F += "<li id=\"" + H[J].DomID + "\"> \t\t\t<a href=\"" + H[J].Url + "\" target=\"_blank\" class=\"LR\" rel=\"" + H[J].SightID + "|" + H[J].Latitude + "|" + H[J].Longitude + "\" title=\"" + H[J].Name + "\"> <span class=\"ico\">" + D + "</span> <span class=\"img1\"><img src=\"" + H[J].ImageSrc + "\" width=\"32px\" height=\"32px\" /></span> <dl> \t\t <dt><span class=\"sightTitle\">" + H[J].Name.substring(0, 10) + "</span><em style=\" background-color:#286903;\" id=\"GoCount\">" + H[J].GoCount + "</em><span class=\"sightIco\">\u4eba\u53bb\u8fc7</span><em>" + H[J].WantCount + "</em><span class=\"sightIco\">\u4eba\u60f3\u53bb</span></dt> \t\t <dd>" + H[J].Address + "</dd> \t\t </dl> <span class=\"price2\"> \t \uffe5<font class=\"fontBlue2\">" + H[J].Price + "</font>/\u95e8\u7968 </span> </a>\t\t\t\t\t\t\t\t<span class=\"addTrip\" title=\"\u52a0\u5165\u6211\u7684\u884c\u7a0b\" rel=\"" + H[J].SightType + "|" + H[J].CommCount + "|" + H[J].PicCount + "\" id=\"opration" + J + "\">\u52a0\u5165\u884c\u7a0b</span>\t\t\t\t\t\t\t\t</li>";
        D++
    }
    if (F == "")
        F += "<div class=\"noresult\"> \t<h1>\u62b1\u6b49\uff01\u6ca1\u6709\u627e\u5230\u4e0e\u201c" + $("#txtKeyword").attr("value") + "\u201d\u76f8\u5173\u7684\u666f\u70b9\u8d44\u6599</h1>\t\t\t\t\t<h3>iPow\u5efa\u8bae\u60a8\uff1a</h3> <p> 1.\u770b\u770b\u8f93\u5165\u7684\u6587\u5b57\u662f\u5426\u6709\u8bef\uff1b<br /> 2.\u7528\u5176\u4ed6\u76f8\u540c\u542b\u4e49\u7684\u6587\u5b57\u8bd5\u8bd5\uff1b<br /> 3.\u5728\u8f93\u5165\u7684\u6587\u5b57\u4e2d\u5305\u542b\u666f\u70b9\u540d\u79f0\u53ef\u80fd\u4f1a\u6709\u60a8\u9700\u8981\u7684\u7ed3\u679c\u3002 </p></div>"; else F = "<ul>" + F + "</ul>"; $("#ResultList").html(F);
    jQuery("#ResultList .addTrip").click(function () { iPowDraw.init($(this)) });
    mapinitialize(G, "gMap", "jxMapTipPanel");
    $("#RusultPage").html("<span class=\"pageContainer\">" + PageUi(C, E, A) + "</span>")
}
function PageUi(C, J, B) {
    var A = tempMapData.length,
 D = (parseInt(C) + parseInt(B) - 1) / parseInt(B);
    D = parseInt(D); 
    var G = "", H = parseInt(Math.ceil(A / B));
    if (H != 1) {
        var F = parseInt(D) + 1, E = "";
        if (D + 1 <= 1);
        else if (D + 1 > 1) G = "<a href=\"javascript:;\" onclick=\"rPage(" + (parseInt(D) - 1) * B + "," + B + ", " + (parseInt(D) - 1) + ");\" title=\"\u4e0a\u4e00\u9875\">&lt;&lt;</a>" + G;
        var I;
        if (F <= 10 && H <= 10) {
            for (I = 1; I <= H; I++) if (I == F) G = "<span>" + I + " </span>" + G;
            else G = "<a href=\"javascript:void(0);\" onclick=\"rPage(" + parseInt(I - 1) * B + "," + B + "," + parseInt(I - 1) + " );\" >" + I + "</a>" + G
        } else if (H >= 10 && F <= 5) { for (I = 1; I <= 10; I++) if (I == F) G = "<span>" + I + " </span>" + G; else G = "<a href=\"javascript:void(0);\" onclick=\"rPage(" + parseInt(I - 1) * B + "," + B + "," + parseInt(I - 1) + " );\" >" + I + "</a>" + G } else if ((F + 5) <= H) { for (I = (F - 4); I <= (F + 5); I++) if (I == F) G = "<span>" + I + " </span>" + G; else G = "<a href=\"javascript:void(0);\" onclick=\"rPage(" + parseInt(I - 1) * B + "," + B + "," + parseInt(I - 1) + " );\" >" + I + "</a>" + G } else for (I = (F - 4); I <= H; I++) if (I == F) G = "<span>" + I + " </span>" + G; else G = "<a href=\"javascript:void(0);\" onclick=\"rPage(" + parseInt(I - 1) * B + "," + B + "," + parseInt(I - 1) + " );\" >" + I + "</a>" + G; if (F < H) if (D + 1 < H) G = "<a href=\"javascript:;\" onclick=\"rPage(" + (parseInt(D) + 1) * B + "," + B + "," + (parseInt(D) + 1) + " );\" title=\"\u4e0b\u4e00\u9875\" >&gt;&gt;</a>" + G
    } return G
}
function HotelPageUi(D, K, B, C) {
    var A = tempMapData.length, E = (parseInt(D) + parseInt(B) - 1) / parseInt(B); E = parseInt(E);
    var H = "", I = parseInt(Math.ceil(A / B)); if (I != 1) {
        var G = parseInt(E) + 1, F = "";
        if (E + 1 <= 1);
        else if (E + 1 > 1) H = "<a href=\"javascript:;\" onclick=\"rhPage(" + (parseInt(E) - 1) * B + "," + B + ", " + (parseInt(E) - 1) + ",'" + C + "');\" title=\"\u4e0a\u4e00\u9875\">&lt;&lt;</a>" + H;
        var J; if (G <= 10 && I <= 10) {
            for (J = 1; J <= I; J++) if (J == G) H = "<span>" + J + " </span>" + H;
            else H = "<a href=\"javascript:void(0);\" onclick=\"rhPage(" + parseInt(J - 1) * B + "," + B + "," + parseInt(J - 1) + ",'" + C + "' );\" >" + J + "</a>" + H
        } else if (I >= 10 && G <= 5) { for (J = 1; J <= 10; J++) if (J == G) H = "<span>" + J + " </span>" + H; else H = "<a href=\"javascript:void(0);\" onclick=\"rhPage(" + parseInt(J - 1) * B + "," + B + "," + parseInt(J - 1) + " ,'" + C + "');\" >" + J + "</a>" + H } else if ((G + 5) <= I) { for (J = (G - 4); J <= (G + 5); J++) if (J == G) H = "<span>" + J + " </span>" + H; else H = "<a href=\"javascript:void(0);\" onclick=\"rhPage(" + parseInt(J - 1) * B + "," + B + "," + parseInt(J - 1) + ",'" + C + "' );\" >" + J + "</a>" + H } else for (J = (G - 4); J <= I; J++) if (J == G) H = "<span>" + J + " </span>" + H; else H = "<a href=\"javascript:void(0);\" onclick=\"rhPage(" + parseInt(J - 1) * B + "," + B + "," + parseInt(J - 1) + ",'" + C + "' );\" >" + J + "</a>" + H; if (G < I) if (E + 1 < I) H = "<a href=\"javascript:;\" onclick=\"rhPage(" + (parseInt(E) + 1) * B + "," + B + "," + (parseInt(E) + 1) + ",'" + C + "' );\" title=\"\u4e0b\u4e00\u9875\" >&gt;&gt;</a>" + H
    }
    return H
}
function rhPage(G, A, I, B) {
    jQuery("#showmode").val(B); var J = tempMapData, H = J.length;
    jQuery("#ResultCount").text(H); var E = [], K = ""; B = B; var L = smallOf(H, parseInt(G + A)), D = 1;
    $("#noResult").hide(); for (var F = G; F < L; F++) {
        E.push(J[F]); switch (B) {
            case "list":
                K += "<a href=\"" + J[F].Url + "\" target=\"_blank\" id=\"" + J[F].DomID + "\" class=\"LR\" title=\"" + J[F].Name + "\">\t\t <span class=\"ico\">" + D + "</span>\t\t\t\t\t\t\t\t\t <span class=\"img1\"><img src=\"" + J[F].ImageSrc + "\" width=\"32px\" height=\"32px\" /></span>\t\t\t\t\t\t\t\t\t <dl>\t\t\t\t\t\t\t\t\t\t <dt><span class=\"sightTitle\">" + J[F].Name.substring(0, 10) + "</span><span sytle=\"width:250px;\">" + J[F].HotelType + "</span></dt>\t\t\t\t\t\t\t\t\t\t <dd>" + J[F].Address + "</dd>\t\t\t\t\t\t\t\t\t </dl>\t\t\t\t\t\t\t\t\t <span class=\"info2\">\t\t\t\t\t\t\t\t\t\t <em class=\"emImg\">" + J[F].PicCount + "</em>\t\t\t\t\t\t\t\t\t\t <em class=\"emComm\">" + J[F].CommCount + "</em>\t\t\t\t\t\t\t\t\t </span>\t\t\t\t\t\t\t\t\t <span class=\"price2\">\t\t\t\t\t\t\t\t\t\t \uffe5<font class=\"fontBlue2\">" + J[F].Price + "</font>\u8d77\t\t\t\t\t\t\t\t\t </span>\t\t\t\t\t\t\t\t </a>";
                break;
            case "pic":
                var C = J[F].Remark;
                if (C.length > 95) C = C.substring(0, 95) + "\u2026"; K += " <div class=\"listHotelInfo\" id=\"" + J[F].DomID + "\"> \t\t\t\t\t\t\t<h1><em class=\"emNoIco\">" + D + "</em>" + J[F].Name + "</h1> \t\t\t\t\t\t\t<h3>" + J[F].HotelType + "</h3> \t\t\t\t\t\t\t<a href=\"" + J[F].Url + "\" class=\"aImg\" title=\"" + J[F].Name + "\" target=\"_blank\"><img src=\"" + J[F].ImageSrc + "\"/></a> \t\t\t\t\t\t\t<div class=\"listHotelModel\"> \t\t\t\t\t\t\t<h2>" + J[F].Address + "</h2> \t\t\t\t\t\t\t<dl> \t\t\t\t\t\t\t<dt> \t\t\t\t\t\t\t<span>\uffe5<font class=\"listHotelPrice\">" + J[F].Price + "</font>/\u8d77</span> \t\t\t\t\t\t\t<a href=\"" + J[F].Url + "\" target=\"_blank\" class=\"listRates\"></a> \t\t\t\t\t\t\t</dt> \t\t\t\t\t\t\t<dd class=\"dContent\">" + C + "</dd> \t\t\t\t\t\t\t</dl> \t\t\t\t\t\t\t</div> \t\t\t\t\t\t\t</div>";
                break;
            default: break
        }
        D++
    }
    if (K == "") K += "<div class=\"noresult\"> \t<h1>\u62b1\u6b49\uff01\u6ca1\u6709\u627e\u5230\u4e0e\u201c" + $("#txtKeyword").attr("value") + "\u201d\u76f8\u5173\u7684\u9152\u5e97\u8d44\u6599</h1>\t\t\t\t\t<h3>iPow\u5efa\u8bae\u60a8\uff1a</h3> <p> 1.\u770b\u770b\u8f93\u5165\u7684\u6587\u5b57\u662f\u5426\u6709\u8bef\uff1b<br /> 2.\u7528\u5176\u4ed6\u76f8\u540c\u542b\u4e49\u7684\u6587\u5b57\u8bd5\u8bd5\uff1b<br /> 3.\u5728\u8f93\u5165\u7684\u6587\u5b57\u4e2d\u5305\u542b\u666f\u70b9\u540d\u79f0\u53ef\u80fd\u4f1a\u6709\u60a8\u9700\u8981\u7684\u7ed3\u679c\u3002 </p></div>"; $("#ResultList").html(K); if (B == "pic") jQuery("#ResultList").mouseList({ over: "#EDEDED", out: "#fff", className: ".listHotelInfo" });
    if (mapInital == false) mapinitialize(E);
    else HotelMarker.resetMarkers(map, mapDataProcess(E));
    $("#RusultPage").html("<span class=\"pageContainer\">" + HotelPageUi(G, I, A, B) + "</span>")
}
function transferEnter() {
    var A = event.keyCode;
    if (A == 13) goSearch()
}
jQuery.fn.selectList = function (A) {
    A = jQuery.extend({ listObj: "", showObj: "" }, A);
    return this.each(function () {
        var H = this, F = H.id, J = false, C = $("#" + F + " .selectList li"), G = function () { C.each(function (A) { $(this).bind("mousemove", function () { I(A) }); $(this).bind("click", function () { D(A) }) }) }, I = function (B) { C.removeClass("onhover"); $("#" + A.listObj + " li:eq(" + B + ")").addClass("onhover") }, E = function () { $("#" + F + "").click(function () { if (!J) { $("#" + A.listObj + "").show(); J = true } else { B(); J = false } }); $("#" + F + "").blur(function () { B() }) }, D = function (C) { var D = $("#" + A.listObj + " li:eq(" + C + ")").attr("title"), E = $("#" + A.listObj + " li:eq(" + C + ")").attr("key"); $("#" + A.showObj).text(D); B() }, B = function () { $("#" + A.listObj + "").hide() }; if (A.listObj) { G(); E() }
    })
};
jQuery.fn.selectTab = function (A) { A = jQuery.extend({ clicked: "", selectNo: 1 }, A); return this.each(function () { var D = false, B = $(this), E = "conditionList"; E = E + A.selectNo; var C = function () { if (!D) { $("#" + E).slideDown("slow"); B.addClass(A.clicked); D = true } else { $("#" + E).slideUp("slow"); B.removeClass(A.clicked); D = false } }; $(this).find("a").click(function () { C() }) }) }; jQuery.fn.mouseList = function (A) {
    A = jQuery.extend({ over: "#fff", out: "#fff", className: "" }, A);
    return this.each(function () {
        $Local = $(this);
        $Local.find("div" + A.className + "").mouseover(function () { $(this).css("background-color", A.over) }); $Local.find("div" + A.className + "").mouseout(function () {
            $(this).css("background-color", A.out)
        })
    })
};
jQuery.fn.scrollDiv = function (A) {
    A = jQuery.extend({ top: 100 }, A);
    return this.each(function () {
        var A = $(this), B = function () {
            var A = [], B; if (typeof window.pageYOffset != "undefined") B = window.pageYOffset;
            else if (typeof document.compatMode != "undefined" && document.compatMode != "BackCompat")
                B = document.documentElement.scrollTop;
            else if (typeof document.body != "undefined") B = document.body.scrollTop; A.top = B; return A
        }, C = function (C) {
            var A = B();
            if (parseInt(A.top) > 140) C.animate({ top: parseInt(A.top - 139) }, 20).slideDown("slow");
            else C.css("top", 0)
        }; C(A);
        $(window).scroll(function () { C(A) })
    })
}
