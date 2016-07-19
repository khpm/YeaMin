<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-header">
    <div class="ax-wrap">
        <div class="ax-layer">
            <div class="ax-col-12">
                <div class="ax-unit">
                    <div class="ax-logo">
                     <a href="index.html"><span class="logo-img"><i class="axi axi-axisj"></i></span><span class="logo-txt">AXU4J@AXISJ</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="ax-layer">
            <div class="ax-col-8">
                <div class="ax-unit">
                    <!-- 상단 top-down-menu 표시 영역 : s-->
                    <div id="ax-top-menu" class="ax-top-menu AXMenuBox"></div>
                    <!-- e : 상단 top-down-menu 표시 영역 -->
                    <div class="mx-top-menu"><a id="mx-top-menu-handle" class="mx-menu-button"><i class="axi axi-th"></i></a></div>
                </div>
            </div>
            <div class="ax-col-4">
                <div class="ax-unit">
                    <ul class="ax-loginfo" id="ax-loginfo">
                        <c:if test="${user == null}">
		                	 <li class="btns"><a href="#" class="AXButton" id="btn-userLogin"><i class="axi axi-ion-log-in"></i> 로그인</a></li>
		                	 <li class="btns"><a href="#" class="AXButton" id="btn-userInsert"><i class="axi axi-ion-person-add"></i> 회원가입</a></li>
	                	</c:if>
                        <c:if test="${user != null}">
                        	<li class="profile"><div class="photo"></div></li>
                        	<li class="account"><a href="#">${user.user_name}</a></li>
		                	<li class="btns"><a href="#" class="AXButton" id="btn-userLogout"><i class="axi axi-ion-log-out"></i> 로그아웃</a></li>
	                	</c:if>
                    </ul>
                    <div class="mx-loginfo"><a id="mx-loginfo-handle" class="mx-menu-button"><i class="axi axi-bars"></i></a></div>
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
</div>
<div class="H60"></div>
<script type="text/javascript">
	var fnHeaderObj = {
		pageStart: function(){
			this.userInsertModal.bind();
            this.userLoginModal.bind();
            this.bindEvent();
        },
        bindEvent: function(){
        	axdom("#btn-userInsert").bind("click", function(){
            	fnHeaderObj.userInsertModal.open();
            });
        	
            axdom("#btn-userLogin").bind("click", function(){
            	fnHeaderObj.userLoginModal.open();
            });
            
            axdom("#btn-userLogout").bind("click", function(){
            	$.ajax({
			        url: "/YeaMin/userLogout.do",
			        type: "post",
			        data: "",
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		fnHeaderObj.goMain();
			        	}
			        }
			    });
            });
        },
        userInsertModal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.userInsertModal = this.target;
                this.target.setConfig({
                    windowID:"myModalContainer",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    displayLoading:true
                });
            },
            open: function(){
                this.target.open({
                    url:"/YeaMin/userInsertModal.do",
                    pars: "",
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        },
        userLoginModal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.userLoginModal = this.target;
                this.target.setConfig({
                    windowID:"myModalContainer",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    displayLoading:true
                });
            },
            open: function(){
                this.target.open({
                    url:"/YeaMin/userLoginModal.do",
                    pars: "",
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        },
        goMain: function() {
        	location.href="/YeaMin/main.do";
        }
    };
	
	jQuery(document.body).ready(function () {
		fnHeaderObj.pageStart();
	});
</script>