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
											<form id="reviewCntChart2SearchForm" onsubmit="return false;">
												<div style="display: inline-block; float: right;">
													<select name="top_n" class="AXSelect">
									                    <option value="5">TOP 5</option>
									                    <option value="10">TOP 10</option>
									                </select>
													<button type="button" class="AXButton" id="btn-search" onclick="fnObj.reviewCntChart2.search()">
														<i class="axi axi-search"></i> 검색
													</button>
												</div>
											</form>
										</div>
										<!-- content -->
										<div id="reviewCntChart2" style="width: 100%; height: 400px;"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
						<!--  -->						
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box">
									<div class="ax-box-wrap">
										<h1>
											AXGrid 출력
											<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
										</h1>
										<p>그리드를 이용한 목록 출력</p>
										<div id="page-grid-box"></div>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
						</div>
					</div>

					<div class="ax-layer">
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box">
									<div class="ax-box-wrap">
										<h1>
											Chart Doughnut
											<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
										</h1>
										<p>Chart.js를 이용한 차트 Canvas태그를 사용가능해야 합니다.</p>
										<canvas id="chart-canvas-doughnut" height="200" style="min-height: 256px;"></canvas>
									</div>
								</div>
								<div class="ax-clear"></div>
								<div class="H20"></div>
							</div>
							<div class="ax-clear"></div>
						</div>
						
						<div class="ax-col-6">
							<div class="ax-unit">
								<div class="ax-box">
									<div class="ax-box-wrap">
										<h1>
											Chart Line
											<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
										</h1>
										<p>Chart.js를 이용한 차트 Canvas태그를 사용가능해야 합니다.</p>
										<canvas id="chart-canvas-line" height="200" style="min-height: 256px;"></canvas>
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
			fnObj.reviewCntChart2.bind();
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
		reviewCntChart2: {
			target: null,
			bind: function() {
				fnObj.reviewCntChart2.target = AmCharts.makeChart("reviewCntChart2", {
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
				fnObj.reviewCntChart2.search();
			},
			search: function() {
				var data = $("#reviewCntChart2SearchForm").serialize();
				
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
			        		fnObj.reviewCntChart2.target.valueAxes[0].maximum = max;
			        		fnObj.reviewCntChart2.target.dataProvider = ret.list;
			        		fnObj.reviewCntChart2.target.validateData();
			        		fnObj.reviewCntChart2.target.animateAgain();
			        	}
			        }
			    });
			}
		}
	}
</script>