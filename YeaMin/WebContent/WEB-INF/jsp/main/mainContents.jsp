<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>KH Restaurant 엄선된 최고급  식자 재료를 사용하여 7성급 호텔에서 일한 "이재준" 쉐프가 요리합니다.</h1>
				<p class="desc"></p>
			</div>
			<div class="ax-clear"></div>
		</div>
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
				<div id="AXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
									<form id="form">
										<input type="hidden" id="store_addr" name="store_addr" value="${dto.store_addr}">
									</form>
									
									<!-- 스크롤 START -->
									<div style="height: 378px;">
										<div id="slide-block" style="height: 100%"> <!-- 높이만 지정하고 너비는 자동 상황에 맞게 구현 되도록 -->
											<c:forEach var="storeImg" items="${list}">
												<c:set var="url">
													/YeaMin/save/${storeImg.store_img_system_path}
												</c:set>
												<div class="item slide-block-item"
							                     style="background: url(${url}) no-repeat center center;background-size: cover;height: 378px;">
							                     
							                	</div>
											</c:forEach>
							                
							                <a href="#axexec" id="slide-handle-left"
							                   style="display:block;width: 24px;height: 40px;position:absolute;left:10px;top:10px;background: url(/YeaMin/images/slider_handle_left.png) no-repeat"></a>
							                <a href="#axexec" id="slide-handle-right"
							                   style="display:block;width: 24px;height: 40px;position:absolute;right:10px;top:10px;background: url(/YeaMin/images/slider_handle_right.png) no-repeat"></a>				
							            </div>
							            
							            <div id="slide-handles" style="display:2none; text-align: center;"> <!-- 핸들은 사용 하지 않으면 display:none -->
							                                                《
							                <c:forEach var="i" begin="1" end="${list.size()}" step="1">
							                	<c:if test="${i eq 1}">
							                		<a href="#" class="slide-handle-item on" style="font-size: 16px;">${i}</a>
							                	</c:if>
							                	<c:if test="${i ne 1}">
							                		<a href="#" class="slide-handle-item" style="font-size: 16px;">${i}</a>
							                	</c:if>
							                </c:forEach>   
							                                                  》
							            </div>
									</div>
						            <!-- 스크롤 END -->
		                            
									<!-- 가게 지도와 가게 정보 START -->
									<div id="storeInfo">
							            <div style="margin-left:5px;">
											<h1><i class="axi axi-home2"></i>&nbsp;가게 정보</h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;가게 지도와 정보를 표시합니다.</p>
										</div>
										
							            <!-- 가게 지도 START -->
							            <div id="map" style="width: 49%; height: 500px; float: left;"></div>
							            <!-- 가게 지도 END -->
							            
							            <!-- 가게 정보 START -->
							            <div class="ax-rwd-table" style="width: 50%; height:auto; display: inline-block;">
								            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">가게 이름</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	${dto.store_name}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="group-clear"></div>	                                
				                            </div>
				                            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">가게 전화번호</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	<i class="axi axi-phone"></i>&nbsp;${dto.store_tel}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">가게 주소</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	${dto.store_addr}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">주중 영업시간</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	<i class="axi axi-query-builder"></i>&nbsp;${dto.store_week_business_time}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="group-clear"></div>
				                            </div>	
				                            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">주말 영업시간</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	<i class="axi axi-query-builder"></i>&nbsp;${dto.store_weekend_business_time}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="group-clear"></div>
				                            </div>	
				                            <div class="item-group" style="font-size: 16px;">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="height: 294px;">가게 소개</span>
				                                        <span class="td inputText" style="" title="">		                                        
				                                            <label>
				                                            	${dto.store_desc}
				                                            </label>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
			                            </div>
			                            <!-- 가게 정보 END -->
									</div>
									<div style="clear: both;"></div>
									<!-- 가게 지도와 가게 정보 END -->
									
									<!-- 통계 START -->
									<div id="statsInfo">
							            <div style="margin-left:5px;">
											<h1><i class="axi axi-bar-graph"></i>&nbsp;통계</h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;예약 통계를 표시합니다.</p>
										</div>
										
										<jsp:include page="/WEB-INF/jsp/main/statsContents.jsp"/>
						            </div>
									<!-- 통계 END -->
									
									<!-- 메뉴판 START-->
						            <div id="menuInfo">
							            <div style="margin-left:5px;">
											<h1><i class="axi axi-restaurant-menu"></i>&nbsp;메뉴판</h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;메뉴를 선택하고 계산결과를 표시합니다.</p>
										</div>
										
										<jsp:include page="/WEB-INF/jsp/main/menuContents.jsp"/>
						            </div>
		                            <!-- 메뉴판 END -->
		                            
		                            <!-- 리뷰 START -->
		                            <div id="reviewInfo" style="margin-top:5px; width:100%;">
		                            	<div style="margin-left:5px;">
											<h1><i class="axi axi-comment"></i>&nbsp;리뷰 </h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;리뷰와 댓글을 표시합니다.</p>
										</div>
										
										<jsp:include page="/WEB-INF/jsp/main/reviewContents.jsp"/>
		                            </div>
		                            <!-- 리뷰 END -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ax-clear"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var pageID = "AXDivSlider";
	var fnObj = {
		pageStart: function() {
			menuFnObj.bind();
			statsContentsFnObj.pageStart();
		},
		slider: {
            target : new AXDivSlider(),
            get : function(){ return this.target },
            bind : function(){
            	this.target.setConfig({
                    effect:"slide", // fade|slideup|slide

                    autoSlide: true,
                    autoSlideDelayTime: 3000,

                    slideSpeed: 300,
                    touchMove: true,

                    moveLeftHandleID:"slide-handle-left",
                    moveRightHandleID:"slide-handle-right",

                    selectedClassName:"on",
                    targetID:"slide-block",
                    targetClassName:"slide-block-item",
                    handleTargetID:"slide-handles",
                    handleClassName:"slide-handle-item"
                });
			}
		},
		map: function(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };

		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
	        var address = form.store_addr.value // 최종 주소 변수	               

	        // 주소로 좌표를 검색
	        geocoder.addr2coord(address, function(status, result) {
	        // 해당 주소에 대한 좌표를 받아서
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        // 지도를 보여준다.
	        mapContainer.style.display = "block";
	        map.relayout();
	        // 지도 중심을 변경한다.
	        map.setCenter(coords);
	        // 마커를 결과값으로 받은 위치로 옮긴다.
	        marker.setPosition(coords)
	        });
		}
	}
	
	$(document.body).ready(function(){
		setTimeout(fnObj.slider.bind(), 1);
	});
	$(document).ready(function(){
		if($("#store_addr").val()){
   			fnObj.map();
   		}
	});
</script>