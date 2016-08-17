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
	var page_menu_id = "m08"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	var fnObj = {
			pageStart: function(){
				fnObj.userBoardCnt();
				fnObj.userReservationCnt();
				fnObj.userReviewCnt();
			},
	       	pageResize: function(){
	           parent.userDeleteModal.resize();
	       	},
	       	userBoardCnt: function(){
	       		var data = $("#form").serialize();
	       		
	       		$.ajax({
			        url: "/YeaMin/selectBoardCnt.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);

			        	if(ret.result === "ok") {
							$("#boardCnt").text(ret.boardCnt+" 개");
			        	}
			        }
			    });
	       	},
			userReservationCnt: function(){
				var data = $("#form").serialize();
	       		
	       		$.ajax({
			        url: "/YeaMin/selectReservationCnt.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);

			        	if(ret.result === "ok") {
							$("#reservationCnt").text(ret.data+" 개");
			        	}
			        }
			    });
	       	},
			userReviewCnt: function(){
				var data = $("#form").serialize();
	       		
	       		$.ajax({
			        url: "/YeaMin/selectReviewCnt2.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
						console.log(ret);
			        	if(ret.result === "ok") {
							$("#reviewCnt").text(ret.reviewCnt+" 개");
			        	}
			        }
			    });	
	       	},
	      	userDelete: function() {
		       	var data = $("#form").serialize();
		       	
		       	$.ajax({
			        url: "/YeaMin/deleteUser.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);

			        	if(ret.result === "ok") {
			        		//삭제 성공
			        		parent.fnHeaderObj.goMain();
			        	} else if(ret.result === "error") {
			        		//식제 실패
			        	}
			        }
			    });
	       	},
	       	close: function() {
	       	 parent.userDeleteModal.close();
	       	}
	};
</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>회원 탈퇴</h1>
		                <p class="desc">회원을 탈퇴합니다.</p>
		            </div>
		        </div>
		        <div class="ax-clear"></div>
		    </div>
		    
			<div class="ax-modal-body">
		        <div class="ax-wrap">
		            <div class="ax-layer">
		                <div class="ax-col-12">
		
		                    <form id="form" method="get" onsubmit="return false;">
		                    	<input type="hidden" name="user_no" value="${user.user_no}"/>
		                        <div class="ax-rwd-table">
									<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">게시글 수</span>
		                                    </label>
		                                    <div id="boardCnt" style="font-size: 18px; float: left; margin-top: 10px;"></div>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">예약 수</span>
		                                    </label>
		                                    <div id="reservationCnt" style="font-size: 18px; float: left; margin-top: 10px;"></div>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">리뷰 수</span>
		                                    </label>
		                                    <div id="reviewCnt" style="font-size: 18px; float: left; margin-top: 10px;"></div>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>		                            
		                        </div>		                        
		                    </form>
							
		                </div>
		                <div class="ax-clear"></div>
		            </div>
		        </div>
		        <div style="width: 100%; font-size: 16px; text-align: center; font: bold;">
		        	${user.user_name} 님 정말로 탈퇴하시겠습니까?
		        </div>
		    </div>
		    
		    <div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		                <div class="ax-unit center">
		                    <button type="button" class="AXButton" onclick="fnObj.userDelete();">탈퇴</button>
		                    <button type="button" class="AXButton" onclick="fnObj.close();">취소</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>