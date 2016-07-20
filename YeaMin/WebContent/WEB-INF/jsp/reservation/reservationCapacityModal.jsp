<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
	
	    <title>Barracks-2</title>
	
	    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	
	    <link rel="stylesheet" type="text/css" href="http://cdno.axisj.com/axicon/axicon.min.css" />
	    <link rel="stylesheet" type="text/css" href="http://cdno.axisj.com/axisj/ui/kakao/AXJ.min.css" id="axu-theme-axisj" />
	
	    <script type="text/javascript" src="http://cdno.axisj.com/axisj/jquery/jquery.min.js"></script>
	    <script type="text/javascript" src="http://cdno.axisj.com/axisj/dist/AXJ.min.js"></script>
	
	    <link rel="stylesheet" href="ui/cacao/admin.css" id="axu-theme-admin" />
	    <link rel="stylesheet" href="ui/custom.css" />
	    <link rel="stylesheet" href="css/yeamin.css" />
	    
		<script type="text/javascript">
		var fnObj = {
			pageStart: function(){
				$("#reservation_capacity_people").bindNumber({
					min: 1,
					onChange: function(){
						// trace(this);
					}
				});
				
				// $("#reservation_capacity_time").bindDateTime();
			},
	        pageResize: function(){
	        	parent.myModal.resize();
	        },
	        insert: function() {
	        	var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/insertReservationCapacity.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		parent.fnObj.search.submit();
			        		fnObj.close();
			        	}
			        }
			    });
	        },
	        update: function() {
				var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/updateReservationCapacity.json",
			        type: "post",
			        data: data,
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		parent.fnObj.search.submit();
			        		fnObj.close();
			        	}
			        }
			    });
	        },
	        close: function() {
	        	parent.reservationCapacityModal.close();
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
		                <h1>시간 예약 관리</h1>
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
		                                        <span class="th" style="min-width:100px;">예약 수용 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                            ${dto.reservation_capacity_no}
		                                        	<input type="hidden" name="reservation_capacity_no" value="${dto.reservation_capacity_no}"/>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">예약 수용 요일</span>
		                                        <span class="td inputText" style="" title="">
		                                            <select name="reservation_capacity_dw" class="AXSelect">
														<option ${(dto.reservation_capacity_dw eq 'D') ? 'selected' : ''} value="D">평일</option>
														<option ${(dto.reservation_capacity_dw eq 'W') ? 'selected' : ''} value="W">주말</option>
		                                            </select>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">예약 수용 시간</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="text" name="reservation_capacity_time" class="AXInput W150" id="reservation_capacity_time" value="${dto.reservation_capacity_time}" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item fullWidth">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">예약 수용 인원 수</span>
		                                        <span class="td inputText" style="" title="">
		                                            <input type="tel" name="reservation_capacity_people" id="reservation_capacity_people" value="${dto.reservation_capacity_people}" class="AXInput W50" />
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