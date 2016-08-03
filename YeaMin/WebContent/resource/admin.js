AXConfig.AXGrid.emptyListMSG = "조회된 결과가 없습니다.";
AXConfig.AXGrid.listCountMSG = "<b>{listCount}</b> count(s)",
AXConfig.AXGrid.pageCountMSG = "page(s)"

var topMenu_data = [
    {
        _id: "m01", label: "가게 관리", url: "#", cn: [
	        {_id: "m0101", label: "가게 정보 관리", url: "/YeaMin/storeContents.do"},
	        {_id: "m0102", label: "상품 카테고리 정보 관리", url: "/YeaMin/productCategoryContents.do"},
	        {_id: "m0103", label: "상품 정보 관리", url: "/YeaMin/productContents.do"}
	    ]
    },
    {
        _id: "m02", label: "예약 관리", url: "#", cn: [
        	{_id: "m0201", label: "예약 수용 관리", url: "/YeaMin/reservationCapacityContents.do"},
	        {_id: "m0202", label: "예약 이력 및 현황", url: "/YeaMin/reservationContents.do"},
	        {_id: "m0203", label: "예약 통계", url: "/YeaMin/reservationStatsContents.do"}
	    ]
    },
    {_id: "m04", label: "회원 관리", url: "/YeaMin/userContents.do"},
    {_id: "m05", label: "함께 예약하기", url: "/YeaMin/reservationTogetherContents.do"},
    {_id: "m06", label: "게시판", url: "/YeaMin/boardContents.do"}
];

//{_id: "m02", LABEL: '<I CLASS="AXI AXI-ASTERISK"></I> 회원정보 수정', URL: "/YEAMIN/USERUPDATECONTENTS.DO", TARGET: "_SELF"},
//{_ID: "M03", LABEL: '<I CLASS="AXI AXI-COLUMNS"></I> 회원탈퇴', URL: "/YEAMIN/USERDELETECONTENTS.DO", TARGET: "_SELF"},

var sideMenu_data = [
    {_id: "m00", label: '<i class="axi axi-home2"></i> 가게 정보', url: "#storeInfo", target: "_self", areaId: "storeInfo"},
    {_id: "m05", label: '<i class="axi axi-bar-graph"></i> 통계', url: "#statsInfo", target: "_self", areaId: "statsInfo"},
    {_id: "m06", label: '<i class="axi axi-restaurant-menu"></i> 메뉴판', url: "#menuInfo", target: "_self", areaId: "menuInfo"},
    {_id: "m07", label: '<i class="axi axi-comment"></i> 리뷰', url: "#reviewInfo", target: "_self", areaId: "reviewInfo"},
    {_id: "m08", label: '<i class="axi axi-comment"></i> TOP', url: "#", target: "_self", areaId: ""}
];

var topMenu = new AXTopDownMenu();
var mobileMenu = new AXMobileMenu();
var loginInfoModal = new AXMobileModal();
var fcObj = {
    pageStart: function () {

        // ax-header가 존재 하는 경우
        if (jQuery(".ax-header").get(0)) {
            fcObj.bindEvent();
            fcObj.bindTopMenu();
            fcObj.bindSideMenu();
        }

        try {
            fnObj.pageStart();
        } catch (e) {

        }
        // this.theme.init();
    },
    pageResize: function () {
        fcObj.setAsideMenu();
    },
    setAsideMenu: function () {
        if (!jQuery(".ax-aside").get(0)) return;

        if (!jQuery(".ax-aside-box").data("status")) {
            if (axf.clientWidth() <= 1024 && axf.clientWidth() >= 767) {
                jQuery(".ax-aside-menu").addClass("on");
                jQuery(".ax-aside-box").hide();
            } else if (axf.clientWidth() > 1024) {
                jQuery(".ax-aside-menu").removeClass("on");
                jQuery(".ax-aside-box").show();
            }
        }
    },
    bindEvent: function () {
        fcObj.setAsideMenu();

        axdom(".AXCheckbox").find("input").bind("click", function () {
            if (this.checked)this.checked = true; else this.checked = false;
            if (jQuery(this).parent().hasClass("checked")) jQuery(this).parent().removeClass("checked");
            else jQuery(this).parent().addClass("checked");
        });

        axdom(".ax-aside-menu").bind("click", function () {
            var elem = jQuery(".ax-aside-box");
            elem.toggle();
            if (elem.css('display') == 'none') {
                elem.data("status", "open");
                jQuery(".ax-content").addClass("expand");
                jQuery(".ax-aside-menu").addClass("on");
            } else {
                elem.data("status", "close");
                jQuery(".ax-content").removeClass("expand");
                jQuery(".ax-aside-menu").removeClass("on");
            }
            axdom(window).resize();
        });
    },
    bindTopMenu: function () {
        topMenu.setConfig({
            targetID: "ax-top-menu",
            parentMenu: {
                className: "parentMenu"
            },
            childMenu: {
                className: "childMenu",
                hasChildClassName: "expand", // script 방식에서만 지원 됩니다.
                align: "center",
                valign: "top",
                margin: {top: 0, left: 0},
                arrowClassName: "varrow2",
                arrowMargin: {top: 1, left: 0}
            },
            childsMenu: {
                className: "childsMenu",
                hasChildClassName: "expand",
                align: "left",
                valign: "top",
                margin: {top: -4, left: 0},
                arrowClassName: "harrow",
                arrowMargin: {top: 13, left: 1}
            },
            onComplete: function () {
                if (window.page_menu_id) topMenu.setHighLightOriginID(window.page_menu_id);
            }
        });
        topMenu.setTree(topMenu_data);


        axdom("#mx-top-menu-handle").bind("click", function () {
            mobileMenu.open();
        });

        mobileMenu.setConfig({
            reserveKeys: {
                primaryKey: "parent_srl",
                labelKey: "label",
                urlKey: "link",
                targetKey: "target",
                addClassKey: "ac",
                subMenuKey: "cn"
            },
            onclick: function () { // 메뉴 클릭 이벤트
                mobileMenu.close();
                location.href = this.url;
            }
        });
        mobileMenu.setTree(topMenu_data);


        loginInfoModal.setConfig({
            width: 300, height: 160,
            head: {
                close: {
                    onclick: function () {

                    }
                }
            },
            onclose: function () {
                trace("close bind");
            }
        });
        axdom("#mx-loginfo-handle").bind("click", function () {
            var obj = loginInfoModal.open();
            obj.modalHead.html('<div class="modal-log-info-title">Login Info</div>');
            obj.modalBody.html('<div class="modal-log-info-wrap"><ul class="ax-loginfo">' + axdom("#ax-loginfo").html() + '</ul><div style="clear:both;"></div></div>');
        });

    },
    bindSideMenu: function () {
        var po = [], _target = axdom("#ax-aside-ul");
        var active_menu_id = window.page_menu_id;
        for (var mi = 0; mi < sideMenu_data.length; mi++) {
            po.push('<li><a id="' + sideMenu_data[mi].areaId + 'Link" href="' + sideMenu_data[mi].url + '" target="' + sideMenu_data[mi].target + '" ');
            if(active_menu_id == sideMenu_data[mi]._id) po.push(' class="active"');
            po.push('>');
            po.push(sideMenu_data[mi].label);
            po.push('</a></li>')
        }
        _target.empty();
        _target.append(po.join(''));
    },

    theme: {
        sel: null,
        init: function () {
            var themes = [
                ["cocker", "cocker"],
                ["cocker-dark", "bulldog"],
                ["cocker-dark-red", "cocker"],
                ["cacao", "kakao"],
                ["cacao-dark", "kakao"]
            ];
            var po = [];
            $.each(themes, function () {
                po.push('<option value="', this[0], '/', this[1], '">', this[0], '</option>');
            });
            fcObj.theme.sel = jQuery("#theme-select");
            fcObj.theme.sel.html(po.join(''));

            var _theme;
            if ((_theme = axf.getCookie("axutheme"))) {
                fcObj.theme.sel.val(_theme);
                fcObj.theme.change(_theme);
            }
            fcObj.theme.sel.bind("change", function (e) {
                fcObj.theme.change(e.target.value);
            });
        },
        change: function (theme) {
            var t = theme.split("/");
            jQuery("#axu-theme-admin").attr("href", "ui/" + t[0] + "/admin.css");
            jQuery("#axu-theme-axisj").attr("href", "http://cdno.axisj.com/axisj/ui/" + t[1] + "/AXJ.min.css?v=" + axf.timekey());
            axf.setCookie("axutheme", theme);
        }
    }
};

jQuery(document.body).ready(function () {
    fcObj.pageStart()
});
jQuery(window).resize(function () {
    fcObj.pageResize();
});

// 2014-12-26 AXU, admin.js add script
jQuery(document.body).ready(function () {
    jQuery(document.body).append('<div class="ax-scroll-top"><a href="javascript:window.scroll(0, 0);"><i class="axi axi-ion-arrow-up-c"></i> TOP</a></div>');
    window.scroll_top_handle = jQuery(".ax-scroll-top");
});

jQuery(window).bind("scroll", function () {
	var scrollTop = $(document.body).scrollTop();
	
    if (scrollTop > 60) {
        window.scroll_top_handle.addClass("on");
        $(".ax-aside").css("top", scrollTop + 130);
        
        for (var mi = 0; mi < sideMenu_data.length; mi++) {
        	if(sideMenu_data[mi].areaId != "") {
        		var elementTop = $("#" + sideMenu_data[mi].areaId).position().top;
                var elementHeight = $("#" + sideMenu_data[mi].areaId).height();
                
                if(scrollTop >= elementTop && elementTop + elementHeight > scrollTop) {
                	$("#" + sideMenu_data[mi].areaId + "Link").addClass("active");
                } else {
                	$("#" + sideMenu_data[mi].areaId + "Link").removeClass("active");
                }
        	}
        }
    } else {
        window.scroll_top_handle.removeClass("on");
        jQuery(".ax-aside").css("top", 130);
    }
});