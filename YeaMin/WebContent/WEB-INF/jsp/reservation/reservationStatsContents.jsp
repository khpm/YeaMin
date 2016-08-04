<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>예약 통계</h1>
				<p class="desc">예약에 관련된 통계를 확인할 수 있습니다.</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
			
				<!-- s.CXPage -->
				<div id="CXPage">
					<div class="ax-layer">
					
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">남녀 리뷰</h1>
												<p>
													성별마다 리뷰의 개수를 표시합니다.<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="reviewCntChartSearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="user_gender" class="AXSelect">
									                    <option value="ALL">전체</option>
									                    <option value="M">남자</option>
									                    <option value="F">여자</option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.reviewCntChart.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="reviewCntChart" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">상품 TOP N</h1>
												<p>
													가장 많이 예약하는 상품의 순위입니다.<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="productTopNSearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="top_n" class="AXSelect">
									                    <option value="5">TOP 5</option>
									                    <option value="10">TOP 10</option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.productTopNChart.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="productTopNChart" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
					
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">연령별 예약 수</h1>
												<p>
													연령별 예약 수를 표시합니다.<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="ageGroupReservationCntSearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.reviewCntChart3.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="ageGroupReservationCntChart" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">통계명</h1>
												<p>
													상세정보<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="" class="AXSelect">
									                    <option value=""></option>
									                    <option value=""></option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">시간별 매출액</h1>
												<p>
													시간별 매출액을 표시합니다.<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="timeSalesSearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="" class="AXSelect">
									                    <option value=""></option>
									                    <option value=""></option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.timeSalesChart.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="timeSalesChart" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box sample-01">
									<div class="ax-box-wrap">
										<!-- head -->
										<div style="width: 100%; height: 65px; border-bottom: 1px solid #CFCFCF;">
											<!-- 통계 제목 및 설명 -->
											<div style="display: inline-block; float: left;">
												<h1 style="margin-top: 0px;">시간별 예약 수</h1>
												<p>
													시간별 예약 수를 표시합니다.<br/>
												</p>
											</div>
											<!-- 통계 검색 조건 -->
											<form id="timeReservationCntSearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="reservation_capacity_dw" class="AXSelect">
									                    <option value="D">주중</option>
									                    <option value="W">주말</option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.timeReservationCntChart.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="timeReservationCntChart" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						<div class="ax-clear"></div>
					</div>
				</div>
				<!-- e.CXPage -->
				
			</div>
			<div class="ax-clear"></div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	var page_menu_id = "m0203"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	var fnObj = {
		pageStart: function() {
			fnObj.reviewCntChart.bind();
			fnObj.productTopNChart.bind();
			fnObj.ageGroupReservationCntChart.bind();
			//fnObj.timeSalesChart.bind();
			fnObj.timeReservationCntChart.bind();
		},
		reviewCntChart: {
			target: null,
			bind: function() {
				fnObj.reviewCntChart.target = AmCharts.makeChart("reviewCntChart", {
			        "type": "pie",
			        "titleField": "USER_GENDER",
			        "valueField": "REVIEW_CNT",
			        "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
			        "legend": {
			            "align": "center",
			            "markerType": "circle"
			        },
					"colors": ["#0054FF", "#FF00DD"]
			    });
				fnObj.reviewCntChart.search();
			},
			search: function() {
				var data = $("#reviewCntChartSearchForm").serialize();
				
				$.ajax({
			        url: "/YeaMin/selectReviewCnt.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {				    
			        		fnObj.reviewCntChart.target.dataProvider = ret.list;
							fnObj.reviewCntChart.target.validateData();
							fnObj.reviewCntChart.target.animateAgain();
			        	}
			        }
			    });
			}
		},
		productTopNChart: {
			target: null,
			bind: function() {
				fnObj.productTopNChart.target = AmCharts.makeChart("productTopNChart", {
					"type": "serial",
					"titleField": "PRODUCT_NAME",
					"categoryField": "PRODUCT_NAME",
					"rotate": true,
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start"
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "PRODUCT_CNT",
							"fillColorsField": "color",
							"lineAlpha":0
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "PRODCUT_CNT",
							"autoGridCount": false,
						    "axisAlpha": 1, //step
						    "minimum": 0 // min
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": false,
						"useGraphSettings": false
					},
					"titles": [
					],
					"dataProvider": [
					]
			    });
				fnObj.productTopNChart.search();
			},
			search: function() {
				var data = $("#productTopNSearchForm").serialize();
				
				$.ajax({
			        url: "/YeaMin/selectProductTop5.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);

			        	if(ret.result === "ok") {
			        		color = ["red", "orange", "yellow", "green", "blue", "navy", "purple", "silver", "pink", "black"];
			        		var max = 0;
			        		for(var i=0;i<ret.list.length;i++){
			        			ret.list[i].color = color[i];
			        			if(ret.list[i].PRODUCT_CNT > max){
			        				max = ret.list[i].PRODUCT_CNT;
			        			}
			        		}
			        		fnObj.productTopNChart.target.valueAxes[0].maximum = max;
			        		fnObj.productTopNChart.target.dataProvider = ret.list;
			        		fnObj.productTopNChart.target.validateData();
			        		fnObj.productTopNChart.target.animateAgain();
			        	}
			        }
			    });
			}
		},
		ageGroupReservationCntChart: {
			target: null,
			bind: function() {
				fnObj.ageGroupReservationCntChart.target = AmCharts.makeChart("ageGroupReservationCntChart", {
					"type": "serial",
					"categoryField": "USER_AGE_GROUP",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						categoryFunction : function(value,item,axis){
							return item.USER_AGE_GROUP + " 대";
						}
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[USER_AGE_GROUP]]대 : [[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "RESERVATION_SUM",
							"fillColorsField": "color",
							"lineAlpha":0
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": ""
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": false,
						"useGraphSettings": false
					},
					"titles": [
						{
							"id": "Title-1",
							"text": ""
						}
					],
					"dataProvider": [
					]
				});
				fnObj.ageGroupReservationCntChart.search();
			},
			search: function() {
				var data = $("#ageGroupReservationCntSearchForm").serialize();
				
				 $.ajax({
			        url: "/YeaMin/selectReservationAges.json",
			        type: "post",
			        data: null,
			        success: function(data) {
						var ret = JSON.parse(data);

			        	if(ret.result === "ok") {
			        		color = ["#90E4FF", "#6CC0FF", "#489CFF", "#2478FF", "#0054FF", "#0030DB"];
			        		for(var i=0;i<ret.list.length;i++){
			        			ret.list[i].color = color[i];			        			
			        		}
			        		
			        		fnObj.ageGroupReservationCntChart.target.dataProvider = ret.list;
			        		fnObj.ageGroupReservationCntChart.target.validateData();
			        		fnObj.ageGroupReservationCntChart.target.animateAgain();
			        	}
			        }
			    });
			}
		},
		timeSalesChart: {
			target: null,
			bind: function() {
				fnObj.timeSalesChart.target = AmCharts.makeChart("timeSalesChart", {
					
				});
				fnObj.timeSalesChart.search();
			},
			search: function() {
				//var data = $("").serialize();

			}
		},
		timeReservationCntChart: {
			target: null,
			bind: function() {
				fnObj.timeReservationCntChart.target = AmCharts.makeChart("timeReservationCntChart", {
					"type": "serial",
					"categoryField": "RESERVATION_CAPACITY_TIME",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start"
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[RESERVATION_CAPACITY_TIME]] : [[value]]",
							"bullet": "round",
							"id": "AmGraph-1",
							"title": "graph 1",
							"valueField": "RESERVATION_CNT"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": ""
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": false,
						"useGraphSettings": false
					},
					"titles": [
						{
							"id": "Title-1",
							"text": ""
						}
					],
					"dataProvider": [

					]
				});
				fnObj.timeReservationCntChart.search();
			},
			search: function() {
				var data = $("#timeReservationCntSearchForm").serialize();
				console.log(data);
				$.ajax({
			        url: "/YeaMin/selectTimeReservationCnt.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
						console.log(ret.list);
			        	if(ret.result === "ok") {
			        		fnObj.timeReservationCntChart.target.dataProvider = ret.list;
			        		fnObj.timeReservationCntChart.target.validateData();
			        		fnObj.timeReservationCntChart.target.animateAgain();
			        	}
			        }
			    });
			}
		}
	}
</script>