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
		<script type="text/javascript" src="/YeaMin/js/yeamin.js"></script>
		
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		<script type="text/javascript" src="/YeaMin/resource/Chart.min.js"></script>
	    
		<script type="text/javascript">
		var fnObj = {
			pageStart: function() {
				reservation_date.bind();
				
				$("#reservation_people").bindNumber({
					min: 1,
					onChange: function(){
						// trace(this);
					}
				});
			},
	        pageResize: function(){
	        	parent.reservationModal.resize();
	        },
	        insert: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
	        	var reservation_time = $("#reservation_date").val() + " " + $("#reservation_time").val() + ":00";
	        	var data = $("#form").serialize();
	        	data += "&reservation_time=" + reservation_time;
	        	
	        	console.log(data);
	        	
	        	$.ajax({
			        url: "/YeaMin/insertReservation.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		fnObj.close();
			        	}
			        }
			    });
	        },
	        update: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
				var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/updateReservation.json",
			        type: "post",
			        data: data,
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		fnObj.close();
			        	}
			        }
			    });
	        },
	        close: function() {
	        	parent.reservationModal.close();
	        }
		};
		
		var reservation_date = {
			bind: function() {
				$("#reservation_date").bindDate({
					minDate: new Date(),
	                maxDate: new Date().date().add(8),
	                defaultDate: new Date().date().add(1),
					onchange: function() {
						var selectedDate = new Date(this.value);
						
						if(selectedDate < new Date() || selectedDate > new Date().date().add(8) ) {
							$("#reservation_date").val(new Date().add(1).print('yyyy-mm-dd'));
						}
						
						var reservation_capacity_dw = selectedDate.date().print("dw");
						
						if(reservation_capacity_dw.indexOf("토") == 0 || reservation_capacity_dw.indexOf("일") == 0) {
							reservation_capacity_dw = "W";
						} else {
							reservation_capacity_dw = "D";
						}
						
						reservation_time.bind(reservation_capacity_dw);
					}
				});
			}
		};
		
		var reservation_time = {
			bind: function(reservation_capacity_dw) {
				$("#reservation_time").unbindSelect();
				$("#reservation_time").bindSelect({
					isspace: true, isspaceTitle: "선택하세요",
	                ajaxUrl: "selectReservationCapacityList.json",
	                ajaxPars: "reservation_capacity_dw="+reservation_capacity_dw,
	                reserveKeys: {
			            options: "list",
			            optionValue: "reservation_capacity_time",
			            optionText: "reservation_capacity_time",
			            optionData: "reservation_capacity_people"
		            },
		            onChange: function(){
	                    trace(this);
	                }
	            });
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
		                <h1>예약
		                	<c:if test="${modalType eq 'INSERT'}">
		                		 - 등록
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 - 수정
		                	</c:if>
		                </h1>
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
		                    	<input type="hidden" name="reservation_no" value="${dto.reservation_no}"/>
		                    	<input type="hidden" name="user_no" value="${user.user_no}"/>
		                        <div class="ax-rwd-table">
		                        	<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="reservation_date">
		                                        <span class="th" style="min-width:100px;">예약자</span>
		                                        <span class="td inputText" style="" title="">
		                                            <c:if test="${modalType eq 'INSERT'}">
								                		 ${user.user_name}
								                	</c:if>
								                	<c:if test="${modalType eq 'UPDATE'}">
								                		 <button type="button" class="AXButton" onclick="fnObj.update()">수정</button>
								                	</c:if>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
									<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="reservation_date">
		                                        <span class="th" style="min-width:100px;">예약 날짜</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="reservation_date" name="" title="" placeholder="" value="" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">예약 시간</span>
		                                        <span class="td inputText" style="" title="">
		                                            <select id="reservation_time" class="AXSelect W160" id=""></select>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="reservation_people">
		                                        <span class="th" style="min-width:100px;">예약 인원 수</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" id="reservation_people" name="reservation_people" value="${dto.reservation_people}" class="AXInput W50" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
   		                            <div class="item-group" style="">
		                                <div class="item fullWidth">
		                                    <label class="item-lable" for="reservation_comment">
		                                        <span class="th" style="min-width:100px;">전달 사항</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<textarea id="reservation_comment" name="reservation_comment" rows="4" cols="" style="height: 200px;"></textarea>
		                                        </span>
		                                    </label>
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
		    </div>
		    
		    <div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		                <div class="ax-unit center">
		                	<c:if test="${modalType eq 'INSERT'}">
		                		 <button type="button" class="AXButton" onclick="fnObj.insert()">등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 <button type="button" class="AXButton" onclick="fnObj.update()">수정</button>
		                	</c:if>
		                    <button type="button" class="AXButton" onclick="fnObj.close()">닫기</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>