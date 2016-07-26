<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
		
		<title>${title}</title>
		
		<link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
		<link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css" />
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/kakao/AXJ.min.css" id="axu-theme-axisj" />
	
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
	
		<link rel="stylesheet" href="/YeaMin/ui/cacao/admin.css" id="axu-theme-admin" />
		<link rel="stylesheet" href="/YeaMin/ui/custom.css" />
		<link rel="stylesheet" href="/YeaMin/css/yeamin.css" />
		
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		<script type="text/javascript" src="/YeaMin/resource/Chart.min.js"></script>
	    
		<script type="text/javascript">
		var fnObj = {
			pageStart: function(){
				// 아이디
				$("#user_id").bind("keyup", function(event) {
					var data = $("#form").serialize();
		        	
		        	$.ajax({
				        url: "/YeaMin/userIdDuplicationCheck.json",
				        type: "post",
				        data: data,
				        success: function(data) {
							var ret = JSON.parse(data);
				        	
				        	if(ret.result === "ok") {
				        		$("#userIdDuplicationCheckRetMsg").hide();
				        	} else if(ret.result === "error") {
				        		$("#userIdDuplicationCheckRetMsg").show();
				        		$("#userIdDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
				        	}
				        }
				    });
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
	        close: function() {
	        	parent.userInsertModal.close();
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
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">아이디</span>
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
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">비밀번호</span>
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
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">이름</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_name" name="user_name" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item fullWidth">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">이메일</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="user_email" name="user_email" title="" placeholder="" value="" class="AXInput av-required av-email" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">전화번호</span>
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
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">생년월일</span>
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
		                                        <span class="th" style="min-width:100px;">성별</span>
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
		                    <button type="button" class="AXButton" onclick="fnObj.userInsert();">회원가입</button>
		                    <button type="button" class="AXButton" onclick="fnObj.close();">취소</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>