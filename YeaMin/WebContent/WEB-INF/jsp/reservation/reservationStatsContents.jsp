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
												<h1 style="margin-top: 0px;">Inline 테이블</h1>
												<p>
													테이블의 기본 형을 정의 합니다.<br/>
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
						<div class="ax-clear"></div>
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
		}
	}
</script>