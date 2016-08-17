<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		var reservation_remaining_people = 0;	//잔여 인원
		
		var fnObj = {
			pageStart: function() {
				reservation_date.bind();
				grid.bind();
				
				if($("#modalType").val() == "INSERT") {
					
					var productListTemp = [];
					var productList = parent.menuFnObj.tab.productList;
					
					for(var index in productList) {
						var item = productList[index];
						
						if(item.hasOwnProperty("product_cnt") && item.product_cnt > 0) {
							productListTemp.push(item);
						}
					}
					
					grid.target.setList(productListTemp);
				} if($("#modalType").val() == "UPDATE") {
					reservation_date.onchangeHandler($("#reservation_date").val());
					
					grid.target.setList({
					    ajaxUrl: "selectReservationProductList.json",
					    ajaxPars: "reservation_no=" + $("#reservation_no").val(),
					    onLoad: function(){
					        // trace(this);
					    }
					});
				}
				
				$("#reservation_people").bindNumber({
					min: 1,
					onChange: function(){
						if(reservation_remaining_people < this.value){
							$("#reservationInsertBtn").attr("disabled", true);
							$("#reservationUpdateBtn").attr("disabled", true);
						}else{
							$("#reservationInsertBtn").attr("disabled", false);
							$("#reservationUpdateBtn").attr("disabled", false);
						}
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
	        	data += "&reservation_time=" + reservation_time + "&productList=" + JSON.stringify(parent.menuFnObj.tab.productList);
	        	
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
	        	
	        	var reservation_time = $("#reservation_date").val() + " " + $("#reservation_time").val() + ":00";
	        	var data = $("#form").serialize();
	        	data += "&reservation_time=" + reservation_time;
	        	
	        	$.ajax({
			        url: "/YeaMin/updateReservation.json",
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
						reservation_date.onchangeHandler(this.value);
					}
				});
			},
			onchangeHandler: function(value) {
				var selectedDate = new Date(value);
				
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
		            setValue: $("#reservation_time_format").val(),
		            onChange: function(){
	                    if(this.value != ""){
			            	var reservation_capacity_time = this.value;	//선택된 시간 (HH:MI형식)
							var reservation_date = $("#reservation_date").val() +" "+reservation_capacity_time;
			            	 
			            	$.ajax({
						        url: "/YeaMin/selectReservationPeople.json",
						        type: "post",
						        data: "reservation_capacity_time=" + reservation_capacity_time + "&reservation_capacity_dw=" + reservation_capacity_dw + "&reservation_date=" + reservation_date,
						        success: function(data) {
									var ret = JSON.parse(data);
									
						        	if(ret.result === "ok") {		        							        		
						        		$("#reservationPeopleCheckRetMsg").show();
						        		$("#reservationPeopleCheckRetMsg").html("잔여 인원 : "+ ret.list[0].reservation_remaining_people +" / 총 인원 : "+ret.list[0].reservation_capacity_people);
						        		reservation_remaining_people = ret.list[0].reservation_remaining_people;
						        	}
						        }
						    });
	                    }else{
	                    	$("#reservationPeopleCheckRetMsg").hide();
	                    }
	                }
	            });
			}
		};
		
		var grid = {
            target: new AXGrid(),
            get: function(){ return this.target },
            bind: function(){
                this.target.setConfig({
                    targetID: "AXGridTarget",
                    theme: "AXGrid",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    colGroup: [
                        {key:"product_category_name", label:"상품 카테고리 이름", width:"200", align:"center"},
                        {key:"product_name", label:"상품 상품", width:"200", align:"center"},
                        {key:"product_price", label:"상품 가격", width:"100", align:"center", formatter: function() {
                        	return this.value.money();
                        }},
                        {key:"product_cnt", label:"상품 개수", width:"100", align:"center"}
                    ],
                    body: {
                        ondblclick: function(){
                        	// trace(this.index);
                        	// trace(this.item);
                        	// trace(this.list);
                        	// trace(this.page);
                        }
                    },
                    page: {
                        paging: false
                    }
                });
            }
        }
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
		            </div>
		        </div>
		        <div class="ax-clear"></div>
		    </div>
		    
			<div class="ax-modal-body">
		        <div class="ax-wrap">
		            <div class="ax-layer">
		                <div class="ax-col-12">
		
		                    <form id="form" method="get" onsubmit="return false;">
		                    	<input type="hidden" id="modalType" value="${modalType}"/>
		                    	<input type="hidden" id="reservation_no" name="reservation_no" value="${dto.reservation_no}"/>
		                    	<input type="hidden" name="user_no" value="${user.user_no}"/>
		                        <div class="ax-rwd-table">
		                        	<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="reservation_date">
		                                        <span class="th" style="min-width:130px;">예약자</span>
		                                        <span class="td inputText" style="" title="">
		                                            <c:if test="${modalType eq 'INSERT'}">
								                		 ${user.user_name}
								                	</c:if>
								                	<c:if test="${modalType eq 'UPDATE'}">
								                		 ${dto.user_name}
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
		                                        <span class="th" style="min-width:130px;">예약 날짜</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<fmt:formatDate var="reservation_date_format" value="${dto.reservation_time}" pattern="yyyy-MM-dd"/>
		                                            <input type="text" id="reservation_date" name="" title="" placeholder="" value="${reservation_date_format}" class="AXInput av-required W150" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:130px;">예약 시간</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<fmt:formatDate var="reservation_time_format" value="${dto.reservation_time}" pattern="HH:mm"/>
		                                        	<input type="hidden" id="reservation_time_format" value="${reservation_time_format}"/>
		                                            <select id="reservation_time" class="AXSelect W160"></select>
		                                            <span id="reservationPeopleCheckRetMsg" class="ret-msg"></span>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="reservation_people">
		                                        <span class="th" style="min-width:130px;">예약 인원 수</span>
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
		                                        <span class="th" style="min-width:130px;">전달 사항</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<textarea id="reservation_comment" name="reservation_comment" rows="4" cols="" style="height: 200px;">${dto.reservation_comment}</textarea>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item fullWidth">
		                                	<div id="AXGridTarget" style="height: 200px;"></div>
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
		                		 <button id="reservationInsertBtn" type="button" class="AXButton" onclick="fnObj.insert()">등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 <button id="reservationUpdateBtn" type="button" class="AXButton" onclick="fnObj.update()">수정</button>
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