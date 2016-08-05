<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>회원 탈퇴</h1>
				<p class="desc">회원 탈퇴를 진행합니다.</p>
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
		                       		<div class="ax-rwd-table">
									<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="td inputText" style="" title="">
		                                        <input type="hidden" id="user_no" name="user_no" value="${user.user_no}"/>
		                                        </span>
		                                    </label>		                 
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div style="font-size:20; text-align:center;"> [ ${user.user_name} ] 님 정말로 탈퇴 하시겠습니까? </div>		                            		                            		                            		                          	                            		                            
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
		                    <button type="button" class="AXButton" onclick="fnObj.userDelete();">탈퇴</button>
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
	var page_menu_id = "m08"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	var fnObj = {
		pageStart: function(){				
		},
	       pageResize: function(){
	           parent.userInsertModal.resize();
	       },
	       userDelete: function() {
	       	var data = $("#form").serialize();
	       	$.ajax({
		        url: "/YeaMin/deleteUser.json",
		        type: "post",
		        data: data,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	var result=document.getElementById("result");
		        	if(ret.result === "ok") {
		        		//삭제 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") {
		        		//식제 실패
		        		result.innerHTML=ret.msg;
		        	}
		        }
		    });
	       },
	       close: function() {
	       	
	       }
	};
</script>