<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ax-layer">
	<div class="ax-col-12">
	
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
											<button type="button" class="AXButton" id="btn-search" onclick="statsContentsFnObj.reviewCntChart.search()">
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
											<button type="button" class="AXButton" id="btn-search" onclick="statsContentsFnObj.productTopNChart.search()">
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
				
			</div>
		</div>
	<div class="ax-clear"></div>	
	</div>
</div>
<div style="clear: both;"></div>

<script type="text/javascript">
	var statsContentsFnObj = {
		pageStart: function() {
			statsContentsFnObj.reviewCntChart.bind();
			statsContentsFnObj.productTopNChart.bind();
		},
		reviewCntChart: {
			target: null,
			bind: function() {
				statsContentsFnObj.reviewCntChart.target = AmCharts.makeChart("reviewCntChart", {
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
				statsContentsFnObj.reviewCntChart.search();
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
			        		statsContentsFnObj.reviewCntChart.target.dataProvider = ret.list;
							statsContentsFnObj.reviewCntChart.target.validateData();
							statsContentsFnObj.reviewCntChart.target.animateAgain();
			        	}
			        }
			    });
			}
		},
		productTopNChart: {
			target: null,
			bind: function() {
				statsContentsFnObj.productTopNChart.target = AmCharts.makeChart("productTopNChart", {
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
				statsContentsFnObj.productTopNChart.search();
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
			        		statsContentsFnObj.productTopNChart.target.valueAxes[0].maximum = max;
			        		statsContentsFnObj.productTopNChart.target.dataProvider = ret.list;
			        		statsContentsFnObj.productTopNChart.target.validateData();
			        		statsContentsFnObj.productTopNChart.target.animateAgain();
			        	}
			        }
			    });
			}
		}
	}
</script>