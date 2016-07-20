<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>${title}</title>
		
		<link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
		<link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
	
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css"/>
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/AXJ.min.css" id="axu-theme-axisj"/>
	
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
	
		<link rel="stylesheet" href="/YeaMin/ui/cacao/admin.css" id="axu-theme-admin"/>
		<link rel="stylesheet" href="/YeaMin/ui/custom.css"/>
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		<script type="text/javascript" src="/YeaMin/resource/Chart.min.js"></script>

		<style type="text/css">
			.ret-msg {
				text-align: center;
				color: red;
				font-size: 15;
				display: none;
			}
		</style>

		<script type="text/javascript">
			var fnObj = {
				pageStart: function(){
					
				},
		        pageResize: function(){
		            parent.userLoginModal.resize();
		        },
		        userLogin: function() {
		        	var data = $("#form").serialize();
		        	
		        	$.ajax({
				        url: "/YeaMin/userLogin.json",
				        type: "post",
				        data: data,
				        success: function(data) {
							var ret = JSON.parse(data);
				        	
				        	if(ret.result === "ok") {
				        		parent.fnHeaderObj.goMain();
				        		fnObj.close();
				        	} else if(ret.result === "error") {
				        		$(".ret-msg").show();
				        		$(".ret-msg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
				        	}
				        }
				    });
		        },
		        close: function() {
		        	parent.userLoginModal.close();
		        }
			};
		    axdom(window).ready(fnObj.pageStart);
		    axdom(window).resize(fnObj.pageResize);
		</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
			
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>로그인</h1>
		                <p class="desc">컨텐츠 상세 설명을 넣어주세요.</p>
		            </div>
		        </div>
		        <div class="ax-clear"></div>
		    </div>
		    
			<div class="ax-modal-body">
		        <div class="ax-wrap">
		            <div class="ax-layer">
		                <div class="ax-col-12">
		
		                    <form id="form" method="get" onsubmit="return false;">
		                        <div class="ax-rwd-table">
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">아이디</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<input type="text" name="user_id" class="AXInput W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">비밀번호</span>
		                                        <span class="td inputText" style="" title="">
													<input type="password" name="user_pw" class="AXInput W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="ret-msg">
		                            </div>
		                        </div>
		                    </form>
		
		                </div>
		                <div class="ax-clear"></div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		                <div class="ax-unit center">
		                	<button type="button" class="AXButton" onclick="fnObj.userLogin()">로그인</button>
		                    <button type="button" class="AXButton" onclick="fnObj.close()">닫기</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>