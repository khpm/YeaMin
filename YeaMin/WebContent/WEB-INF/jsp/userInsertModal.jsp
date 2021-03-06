<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
		
		<title>${title}</title>
		
		<!-- jquery -->
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		
		<!-- axicon -->
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css"/>
		
		<!-- axisj -->
		<c:if test="${user == null or user.is_admin eq 'N'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/bulldog/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark/admin.css" id="axu-theme-admin"/>
		</c:if>
		<c:if test="${user.is_admin eq 'Y'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/cocker/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark-red/admin.css" id="axu-theme-admin"/>
		</c:if>
		
		<link rel="stylesheet" href="/YeaMin/ui/custom.css"/>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/lib/AXDivSlider.js"></script>
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>

		<!-- yeamin -->
		<link rel="stylesheet" href="/YeaMin/css/yeamin.css" />
		<script type="text/javascript" src="/YeaMin/js/yeamin.js"></script>
	    
		<script type="text/javascript">
		var authNum = 0;
		var fnObj = {
			pageStart: function(){
				// 아이디
				$("#user_id").bind("keyup", function(event) {
					if($("#user_id").val() != ''){
						var data = $("#form").serialize();
			        	
			        	$.ajax({
					        url: "/YeaMin/userIdDuplicationCheck.json",
					        type: "post",
					        data: data,
					        success: function(data) {
								var ret = JSON.parse(data);
					        	
					        	if(ret.result === "ok") {
					        		$("#userIdDuplicationCheckRetMsg").hide();
					        		$("#userInsertBtn").attr("disabled",false);
					        	} else if(ret.result === "error") {
					        		$("#userIdDuplicationCheckRetMsg").show();
					        		$("#userIdDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
					        		$("#userInsertBtn").attr("disabled",true);
					        	}
					        }
					    });
					}
				});
				
				// 생년월일
				$("#user_birth_day").bindDate({
					onchange: function(){
						// trace(Object.toJSON(this));
					}
				}).val("1990-01-01");
				
				// 성별
				$("#user_gender").bindSegment({
					options:[
						{optionValue:"M", optionText:"남자"},
						{optionValue:"F", optionText:"여자"}
					], 
					onChange:function(){
						//this.targetID, this.options, this.selectedIndex, this.selectedOption
						// toast.push(Object.toJSON({targetID:this.targetID, options:this.options, selectedIndex:this.selectedIndex, selectedOption:this.selectedOption}));
					}
				});
				
				$("#user_hp").bindPattern({pattern: "phone"});
			},
	        pageResize: function(){
	            parent.userInsertModal.resize();
	        },
	        userInsert: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
	        	var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/insertUser.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		parent.fnHeaderObj.goMain();
			        		fnObj.close();
			        	} else if(ret.result === "error") {
			        		fnObj.pageResize();
			        		$(".ret-msg").show();
			        		$(".ret-msg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
			        	}
			        }
			    });
	        },
	        sendAuthNum: function() {
	        	var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/mailService.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		authNum = ret.authNumber;
			        		$("#sendAuthBtn").hide();
			        		$("#confirmAuthBtn").show();
			        	} else if(ret.result === "error") {

			        	}
			        }
			    });
	        },
	        checkAuthNum: function() {
	        	if(authNum == $("#authNum").val()){
	        		dialog.push("인증완료");
	        		$("#user_email").attr("readonly",true);
	        		$("#authNum").attr("readonly",true);
	        		$("#authNumCheckRetMsg").html("인증이 완료되었습니다.");
	        		$("#confirmAuthBtn").hide();
	        		$("#userInsertBtn").attr("disabled", false);
	        	}else{
	        		dialog.push("인증번호가 틀립니다");
	        	}
	        },
	        close: function() {
	        	parent.userInsertModal.close();
	        }
		};
		</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>회원가입</h1>
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
		                                    <label class="item-lable" for="user_id">
		                                        <span class="th" style="min-width:130px;">아이디</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_id" name="user_id" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        	<span id="userIdDuplicationCheckRetMsg" class="ret-msg"></span>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_pw">
		                                        <span class="th" style="min-width:130px;">비밀번호</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="password" id="user_pw" name="user_pw" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_name">
		                                        <span class="th" style="min-width:130px;">이름</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_name" name="user_name" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_email">
		                                        <span class="th" style="min-width:130px;">이메일</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_email" name="user_email" title="" placeholder="" value="" class="AXInput av-required av-email W300"/>
		                                            <br/>
		                                        	<input type="text" id="authNum" name="authNum" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        	<input id="sendAuthBtn" type="button" class="AXButton" value="인증번호발송" onclick="fnObj.sendAuthNum()">
		                                        	<input id="confirmAuthBtn" type="button" class="AXButton" value="인증하기" onclick="fnObj.checkAuthNum()" style="display: none;">
		                                        	<span id="authNumCheckRetMsg" class="ret-msg"></span>
		                                        </span>		                                     
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_hp">
		                                        <span class="th" style="min-width:130px;">전화번호</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_hp" name="user_hp" title=""  value="" class="AXInput av-required W150"/>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_birth_day">
		                                        <span class="th" style="min-width:130px;">생년월일</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_birth_day" name="user_birth_day" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:130px;">성별</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_gender" name="user_gender" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <input type="hidden" id="is_admin" name="is_admin" value="N"/>
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
		                    <button type="button" id="userInsertBtn" class="AXButton" onclick="fnObj.userInsert();" disabled>회원가입</button>
		                    <button type="button" class="AXButton" onclick="fnObj.close();">취소</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>