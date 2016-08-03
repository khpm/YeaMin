<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>회원정보 수정</h1>
				<p class="desc">회원 정보를 수정합니다.</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
					
				<!-- s.CXPage -->
				<div id="CXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">							
									<form id="form" method="get" onsubmit="return false;">
										<input type="hidden" id="user_no" name="user_no" value="${user.user_no}"/>
			                       		<div class="ax-rwd-table" style="margin:5px;">
										<div class="item-group" style="">
			                                <div class="item">
			                                    <label class="item-lable">
			                                        <span class="th" style="min-width:100px;">아이디</span>
			                                        <span class="td inputText" style="" title="">
				                                       ${user.user_id}
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
			                                            <input type="password" id="user_pw" name="user_pw" title="" placeholder="" value="${user.user_pw}" class="AXInput av-required W150" />
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
			                                            <input type="text" id="user_name" name="user_name" title="" placeholder="" value="${user.user_name}" class="AXInput av-required W150" />
			                                        </span>
			                                        <span id="userNameDuplicationCheckRetMsg" class="ret-msg"></span>
			                                    </label>
			                                </div>
			                                <div class="item-clear"></div>
			                                <div class="group-clear"></div>
			                            </div>
			                            <div class="item-group" style="">
			                                <div class="item">
			                                    <label class="item-lable">
			                                        <span class="th" style="min-width:100px;">이메일</span>
			                                        <span class="td inputText" style="" title="">
			                                            <input type="text" id="user_email" name="user_email" title="" placeholder="" value="${user.user_email}" class="AXInput av-required av-email W400" />
			                                        </span>
			                                        <span id="userEmailDuplicationCheckRetMsg" class="ret-msg"></span>
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
			                                            <input type="text" id="user_hp" name="user_hp" title=""  value="${user.user_hp}" class="AXInput av-required W150"/>
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
			                                            <input type="text" id="user_birth_day" name="user_birth_day" title="" placeholder="" value="${user.user_birth_day}" class="AXInput av-required W150" />
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
			                                            <input type="text" id="user_gender" name="user_gender" title="" placeholder="" value="${user.user_gender}" class="AXInput av-required W150" style="height:30px;"/>
			                                        </span>
			                                    </label>
			                                </div>
			                                <div class="item-clear"></div>
			                                <div class="group-clear"></div>
			                            </div>
			                            <c:if test="${user.is_admin eq 'N'}">
			                            	<input type="hidden" id="is_admin" name="is_admin" value="N"/>
			                            </c:if>
			                            <c:if test="${user.is_admin eq 'Y'}">
			                            	<input type="hidden" id="is_admin" name="is_admin" value="Y"/>
			                            </c:if>
			                        </div>
			                        <!-- 결과 -->
			                        <div id="result"></div>
			                    </form>
								</div>
							</div>
						</div>
							<div class="ax-clear"></div>
					</div>
				</div>
				<!-- e.CXPage -->					
				<div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		                <div class="ax-unit center">
		                    <button type="button" class="AXButton" onclick="fnObj.userUpdate();">수정</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>	
			</div>
			<div class="ax-clear"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var page_menu_id = "m07"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	var fnObj = {
		pageStart: function(){
			// 아이디
			$("#user_id").bind("keyup", function(event) {
				//var data = $("#form").serialize();
	        	$.ajax({
			        url: "/YeaMin/userIdDuplicationCheck.json",
			        type: "post",
			        data: "user_id="+form.user_id.value,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		$("#userIdDuplicationCheckRetMsg").show();
			        		$("#userIdDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
			        	} else if(ret.result === "error") {
			        		$("#userIdDuplicationCheckRetMsg").show();
			        		$("#userIdDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
			        	}
			        }
			    });
			});
			
			// 이름
			$("#user_name").bind("keyup", function(event) {
				if(form.user_name.value.length < 6){
					$("#userNameDuplicationCheckRetMsg").hide();
				}else{
					$("#userNameDuplicationCheckRetMsg").show();
	        		$("#userNameDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + "5글자 이상 입력하실 수 없습니다.");
				}
	        	
			});
			
			// 이메일
			$("#user_email").bind("keyup", function(event) {
				if(form.user_email.value.indexOf("@")!=-1 && form.user_email.value.indexOf(".")!=-1){
					$("#userEmailDuplicationCheckRetMsg").hide();
				}else{
					$("#userEmailDuplicationCheckRetMsg").show();
					$("#userEmailDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + "이메일 형식에 맞지 않습니다.");
				}
	        	
			});
			
			// 핸드폰 번호
			$("#user_hp").bind("keyup", function(event) {
				var hp=form.user_hp.value;
				if(hp.length < 12){
				
				}else{
					form.user_hp.value=hp.substring(0,hp.length-1);
				}
	        	
			});
			
			// 생년월일
			$("#user_birth_day").bindDate({
				onchange: function(){
					// trace(Object.toJSON(this));
				}
			}).val(form.user_birth_day.value);
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
		},
        pageResize: function(){
            parent.userInsertModal.resize();
        },
        userUpdate: function() {
        	var data = $("#form").serialize();
        	$.ajax({
		        url: "/YeaMin/updateUser.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	var result=document.getElementById("result");
		        	if(ret.result === "ok") {
		        		//수정 성공
		        		result.innerHTML=ret.msg;
		        		location.href="/YeaMin/userUpdateContents.do";
		        	} else if(ret.result === "error") {
		        		//수정 실패
		        		result.innerHTML=ret.msg;
		        	}
		        }
		    });
        },
        close: function() {
        	
        }
	};
</script>