<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>메인(main)</h1>
				<p class="desc">가게 정보, 리뷰, 통계, 메뉴를 볼 수 있습니다.</p>
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
						            <div id="slide-block" style="height: 378px;"> <!-- 높이만 지정하고 너비는 자동 상황에 맞게 구현 되도록 -->
										<c:forEach var="storeImg" items="${list}">
											<c:set var="url">
												http://localhost:8080/YeaMin/save/${storeImg.store_img_system_path}
											</c:set>
											<div class="item slide-block-item"
						                     style="background: url(${url}) no-repeat center center;background-size: cover;height: 378px;">
						                     
						                	</div>
										</c:forEach>
						                
						                <a href="#axexec" id="slide-handle-left"
						                   style="display:block;width: 24px;height: 40px;position:absolute;left:10px;top:10px;background: url(http://localhost:8080/YeaMin/save/slider_handle_left.png) no-repeat"></a>
						                <a href="#axexec" id="slide-handle-right"
						                   style="display:block;width: 24px;height: 40px;position:absolute;right:10px;top:10px;background: url(http://localhost:8080/YeaMin/save/slider_handle_right.png) no-repeat"></a>				
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
						            <!-- 스크롤 END -->
						            <!-- 가게 지도와 정보 START -->
						            <div style="margin-left:5px;">
										<h1><i class="axi axi-home2"></i>&nbsp;가게 정보</h1>
										<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;가게 지도와 정보를 표시합니다.</p>
									</div>
						            <!-- 지도 출력 부분 START-->
						            <div id="map" style="width:50%;height:500px;display:none;float:left;"></div>
						            <!-- 지도 출력 부분 END -->
						            <div class="ax-rwd-table" style="margin:10px;">
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
			                            </div>	
			                            <div class="item-group" style="font-size: 16px;">
			                                <div class="item">
			                                    <label class="item-lable">
			                                        <span class="th" style="min-width:100px;">가게 소개</span>
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
		                            <!-- 가게 지도와 정보 END -->
		                            <!-- 메뉴판 START-->
						            <div style="margin-left:5px;">
										<h1><i class="axi axi-restaurant-menu"></i>&nbsp;메뉴판</h1>
										<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;메뉴들을 볼 수 있습니다.</p>
									</div>
									<div id="menuTab"></div>
		                            <!-- 메뉴판 END -->
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
		pageStart: function(){

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
		},
		tab: {
			bind: function(){
				$("#menuTab").bindTab({
					theme : "AXTabs",
					value:"",
					overflow:"scroll",
					options:[

					],
					onchange: function(selectedObject, value){
						var product_category_no = Object.toJSON(value);
						var data = new Object();
						data["product_category_no"] = product_category_no;
						$.ajax({
					        url: "/YeaMin/selectProductMain.json",
					        type: "post",
					        data: data,
					        success: function(data) {
					        	var ret = JSON.parse(data);
					        	if(ret.result === "ok") {
					        		console.log(ret);
					        	}
					        }
					    });
					}
				});
			},
			addTabs: function() {
				$.ajax({
			        url: "/YeaMin/selectproductCategoryList.json",
			        type: "post",
			        data: "",
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
							var options = [];
							for(var i = 0; i < ret.list.length; i++){
								options.push({optionText: ret.list[i].product_category_name, optionValue: ret.list[i].product_category_no});
							}
							$("#menuTab").addTabs(options);
			        	}
			        }
			    });
			}
		}
	}
	$(document.body).ready(function(){
		setTimeout(fnObj.slider.bind(), 1);
	});
	$(document).ready(function(){
		if($("#store_addr").val()){
   			fnObj.map();
   		}
		fnObj.tab.bind();
		fnObj.tab.addTabs();
	});
</script>