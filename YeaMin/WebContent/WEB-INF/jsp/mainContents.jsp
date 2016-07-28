<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 리뷰 댓글 입력 폼 -->
<form class="reviewAnswerInputForm" onsubmit="return false;" style="display: none;">
	<input type="hidden" name="user_no" value="${user.user_no}"/>
	<input type="hidden" id="review_no" name="review_no" value=""/>
	<div class="ax-rwd-table" style="margin:5px;">
		<div class="item-group" style="text-align: center">
            <div class="item-lable">
             <div style="display: inline-block; float: left; width: 10%;">
            		<img src="images/user.PNG" width="100" height="110" >
            	</div>
            	<div style="width: 88%; float: right; margin: 10px;">
            		<div>
            			<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" placeholder="댓글을 작성하세요."></textarea>
            		</div>
            		<div style="float: right;">
            			<input type="button" class="AXButton" value="등록" onclick="fnObj.insertReviewAnswerInputForm();"/>
            			<input type="button" class="AXButton" value="취소" onclick="fnObj.reviewAnswerInputFormDestory();"/>
            		</div>
            	</div>
            </div>		                                    
        	<div class="group-clear"></div>
    	</div>	
    </div>
</form>

<i class="axi axi-reply-all axi-rotate-270"></i>
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
									<div style="height: 378px;">
										<div id="slide-block" style="height: 100%"> <!-- 높이만 지정하고 너비는 자동 상황에 맞게 구현 되도록 -->
											<c:forEach var="storeImg" items="${list}">
												<c:set var="url">
													http://localhost:8080/YeaMin/save/${storeImg.store_img_system_path}
												</c:set>
												<div class="item slide-block-item"
							                     style="background: url(${url}) no-repeat center center;background-size: cover;height: 378px;">
							                     
							                	</div>
											</c:forEach>
							                
							                <a href="#axexec" id="slide-handle-left"
							                   style="display:block;width: 24px;height: 40px;position:absolute;left:10px;top:10px;background: url(http://localhost:8080/YeaMin/images/slider_handle_left.png) no-repeat"></a>
							                <a href="#axexec" id="slide-handle-right"
							                   style="display:block;width: 24px;height: 40px;position:absolute;right:10px;top:10px;background: url(http://localhost:8080/YeaMin/images/slider_handle_right.png) no-repeat"></a>				
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
									<div>
							            <div style="margin-left:5px;">
											<h1><i class="axi axi-home2"></i>&nbsp;가게 정보</h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;가게 지도와 정보를 표시합니다.</p>
										</div>
										
							            <!-- 가게 지도 START -->
							            <div id="map" style="width: 49%; height: 500px; float: left;"></div>
							            <!-- 가게 지도 END -->
							            
							            <!-- 가게 정보 START -->
							            <div class="ax-rwd-table" style="width: 50%; height:500px; display: inline-block;">
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
				                                        <span class="th">가게 소개</span>
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
									<!-- 가게 지도와 가게 정보 END -->
									
									<!-- 통계 START -->
									<!-- 통계 END -->
									
									<!-- 메뉴판 START-->
						            <div>
							            <div style="margin-left:5px;">
											<h1><i class="axi axi-restaurant-menu"></i>&nbsp;메뉴판</h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;메뉴를 선택하고 계산결과를 표시합니다.</p>
										</div>
										
										<div id="menuTab"></div>
										<div id="menuTabContents"></div>
										<!-- 예약하기 버튼 , 간이계산 START -->
										<div style="height:40px; padding: 5px;">
			                           		<div style="float: right;">
			                            		<button class="AXButton" style="width:80px; height:40px; font-size: 15px;" onclick="">
			                            			<i class="axi axi-ion-clipboard" style="font-size:18px;"></i>예약하기
			                            		</button>
			                            	</div>
			                            	<div style="float: right;">
			                            		<i class='axi axi-krw' style="font-size:25px;"></i>&nbsp;
				                            	<label id="sum" style="font-size: 30px; font-weight:bold;">합 계 : 0 원</label>
			                            	</div>
			                            </div>
			                            <!-- 예약하기 버튼 , 간이계산 END -->
						            </div>
		                            <!-- 메뉴판 END -->
		                            
		                            <!-- 리뷰 START -->
		                            <div style="margin-top:5px; width:100%;">
		                            	<div style="margin-left:5px;">
											<h1><i class="axi axi-comment"></i>&nbsp;리뷰 </h1>
											<p class="desc"><i class="axi axi-content-paste"></i>&nbsp;가게에 대한 평을 볼 수 있습니다.</p>
										</div>
										
										<!-- 리뷰 등록 START -->
										<form id="reviewInputform" method="get" onsubmit="return false;">
											<input type="hidden" name="user_no" value="${user.user_no}"/>
				                       		<c:if test="${sessionScope.user.is_admin == 'N'}">
						                       	<div class="ax-rwd-table" style="margin:5px;">
						                       		<div class="item-group" style="text-align: center">
					                                    <div class="item-lable">
					                                    	<div style="width: 88%; float: right; margin: 10px;">
					                                    		<div>
					                                    			<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" placeholder="리뷰를 작성하세요."></textarea>
					                                    		</div>
					                                    		<div style="float: right;">
					                                    			<input type="button" class="AXButton" value="등록" onclick="fnObj.reviewInsert();"/>
					                                    		</div>
					                                    	</div>
					                                    </div>		                                    
					                                	<div class="group-clear"></div>
					                            	</div>	
					                            </div>
					                    	</c:if>
				                        </form>
				                        <!-- 리뷰 등록 END -->
				                        
				                        <!-- 리뷰 리스트 START -->
				                        <div class="ax-rwd-table" style="margin:5px;">
				                        	<c:forEach var="item" items="${reviewList}">
				                        		<!-- 리뷰 하나 START -->
					                    		<div id="review_no_${item.review_no}" class="item-group" style="text-align: center">
				                                    <div class="item-lable">
				                                    	<div style="display: inline-block; float: left; width: 10%;">
				                                    		<img src="images/user.PNG" width="100" height="110" >
				                                    	</div>
				                                    	<div style="width: 88%; float: right; margin: 10px;">
				                                    		<div style="font-size: 15px;">
				                                    			<div style="display: inline-block; float: left;">작성자 : ${item.user_name}</div>
				                                    			<div style="display: inline-block; float: right;">작성일 : ${item.review_reg_time}</div>
				                                    		</div>
				                                    		<div>
					                                    		<c:if test="${sessionScope.user != null}">
					                                    			<c:if test="${sessionScope.user.user_no eq item.user_no}">
				                                    					<textarea id="AXTextArea" name="review_content" class="review_content_${item.review_no}" style="width: 100%; height: 75px;">${item.review_content}</textarea>
				                                    				</c:if>
				                                    			</c:if>
				                                    			<c:if test="${sessionScope.user == null or sessionScope.user.user_no ne item.user_no}">
				                                    				<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" readonly>${item.review_content}</textarea>
				                                    			</c:if>
				                                    		</div>
				                                    		<div style="float: right;">
				                                    			<c:if test="${sessionScope.user.is_admin eq 'Y' and item.review_re_step eq 0}">
				                                    				<input type="button" class="AXButton" value="댓글등록" onclick="fnObj.reviewAnswerInputFormShow(${item.review_no});"/>
				                                    				<input type="button" class="AXButton" value="삭제" onclick="fnObj.reviewDelete(${item.review_no});"/>
				                                    			</c:if>
				                                    			<c:if test="${sessionScope.user != null}">
				                                    				<c:if test="${sessionScope.user.user_no eq item.user_no}">
					                                    				<input type="button" class="AXButton" value="수정" onclick="fnObj.reviewUpdate(${item.review_no});"/>
					                                    				<input type="button" class="AXButton" value="삭제" onclick="fnObj.reviewDelete(${item.review_no});"/>
				                                    				</c:if>
				                                    			</c:if>
				                                    		</div>
				                                    	</div>
				                                    </div>		                                    
					                                <div class="group-clear"></div>
					                            </div>
						                    	<!-- 리뷰 하나 END -->
				                            </c:forEach>
		                            	</div>
		                            	<!-- 리뷰 리스트 END -->
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
		pageStart: function(){
			fnObj.tab.bind();
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
			categoryList : [],
			productList : [],
			// 초기화 함수
			bind: function(){
				$("#menuTab").bindTab({
					theme : "AXTabs",
					value:"",
					overflow:"scroll",
					options:[
					],
					onchange: function(selectedObject, value){
						fnObj.tab.showMenuTab(value);
					}
				});
				fnObj.tab.addTabs();
			},
			// 해당 카테고리 div 영역만 show 하고 나머지는 hide하는 함수, 매개변수는 해당 카테고리의 no값
			showMenuTab: function(value){
				var product_category_no = value;
				$("div[id*=product_category_no_]").hide();
				$("#product_category_no_"+product_category_no).show();	
			},
			//탭에 카테고리가 들어가기 위한 함수
			addTabs: function() {
				$.ajax({
			        url: "/YeaMin/selectproductCategoryList.json",
			        type: "post",
			        data: "",
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		//trace(ret.list);
			        		fnObj.tab.categoryList = ret.list;
							fnObj.tab.createMenuTabContents(ret.list);
							fnObj.tab.menu();
			        	}
			        }
			    });
			},
			//카테고리 내의 메뉴 div를 만드는 함수 , 매개변수는 카테고리데이터가 들어있는 json형태의 배열
			createMenuTabContents: function(categoryList){
				var options = [];
				for(var i = 0; i < categoryList.length; i++){
					var categoryItem = categoryList[i];
					options.push({optionText: categoryItem.product_category_name, optionValue: categoryItem.product_category_no});
					$("#menuTabContents").append("<div id='product_category_no_"+categoryItem.product_category_no+"' style='width:100%; height:500px; overflow-y:scroll; border-bottom: 1px solid #CFCFCF;'>");
				}
				$("#menuTab").addTabs(options);
			},
			changeCount: function(target, product_category_no, product_no) {
				var productList = fnObj.tab.productList;
				var product_cnt = $(target).val();
				
				for ( var index in productList ) {
					var productItem = productList[index];
					
					if(productItem.product_category_no == product_category_no
							&& productItem.product_no == product_no) {
						productItem.product_cnt = product_cnt;
					}
				}
				
				fnObj.tab.sumPrice();
			},
			sumPrice: function(){
				var productList = fnObj.tab.productList;
				var sum = 0;
				
				for ( var index in productList ) {
					var productItem = productList[index];
					
					if(productItem.hasOwnProperty('product_cnt')){
						sum += productItem.product_cnt * productItem.product_price;
					}
				}
				$('#sum').text(" 합계 : "+sum+" 원");
			},
			// 해당 카테고리에 각 상품을 넣는 함수
			menu: function() {
				$.ajax({
			        url: "/YeaMin/selectProductList.json",
			        type: "post",
			        data: "",
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	fnObj.tab.productList = ret.list;// 상품 데이터 넣기(메모리에 들고있기)
			        	if(ret.result === "ok") {
			        		for(var i=0;i<ret.list.length;i++){
			        			var item = ret.list[i];
			        			$("#product_category_no_"+item.product_category_no).html(
			        					$("#product_category_no_"+item.product_category_no).html() + "<br>"	
			        					+"<div style='float: none;'>"
				        				+	"<div style='float: left;'>"
				        				+		"<div class='ax-rwd-table'>"
					        			+			"<div class='item-group'>"
			                            +				"<div class='item'>"
			                            +    				"<label class='item-lable' style=''>"
				                        +       	 			"<span class='th' style='width:100px;'>상품 이미지</span>"
						        		+							"<img src='http://localhost:8080/YeaMin/save/"+item.product_img_system_path+"' width='103' height='103' align='center'>"				        				
										+    					"</span>"
						                +     	           "</label>"
						                +     	       "</div>"
						                +     	       "<div class='item-clear'></div>"
						                +    	        "<div class='group-clear'></div>"
						                +    	    "</div>"
						                +		"</div>"	
				        				+	"</div>"
				        				+	"<div style='float: left; width:40%;'>"
				        				//+		"<br>"				        				
				        				+		"<div class='ax-rwd-table'>"
					        			+			"<div class='item-group'>"
			                            +				"<div class='item'>"
			                            +    				"<label class='item-lable'>"
				                        +       	 			"<span class='th' style='width:60px;'>상품 이름</span>"
				        				+							"<label style='font-size:16px;'>&nbsp;&nbsp;" + item.product_name + "</label><br>"
				        				+    					"</span>"
						                +     	           "</label>"
						                +     	       "</div>"
						                +     	       "<div class='item-clear'></div>"
						                +    	        "<div class='group-clear'></div>"
						                +    	    "</div>"
						                +		"</div>"
						                +		"<div class='ax-rwd-table' style='height:65px;'>"
					        			+			"<div class='item-group'>"
			                            +				"<div class='item'>"
			                            +    				"<label class='item-lable' style='height:60px;'>"
				        				+       	 			"<span class='th' style='width:60px;'>상품 소개</span>"
				        				+							"<label>&nbsp;&nbsp;" + item.product_desc + "</label>"
				        				+    					"</span>"
						                +     	           "</label>"
						                +     	       "</div>"
						                +     	       "<div class='item-clear'></div>"
						                +    	        "<div class='group-clear'></div>"
						                +    	    "</div>"
						                +		"</div>"
				        				+	"</div>"
				        				+	"<div style='float: left;'>"
				        				+		"<br><br><br>"
				        				+		"<label style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='axi axi-krw'></i> " + item.product_price + "</label>"
				        				+	"</div>"
				        				+	"<div style='float: right;'>"
				        				+		"<br><br><br><input type='text' id='product_cnt_"+item.product_no+"' class='AXInput W30' onchange='fnObj.tab.changeCount(this, " + item.product_category_no + ", " + item.product_no + ");'/>" 
				        				+	"</div>"
			        					+"</div>"
			        					+"<div style='clear:both;'></div>"
			        			).hide();
			        		}
			        		
			        		$("#menuTab").setValueTab(fnObj.tab.categoryList[0].product_category_no);
			        		
			        		$("input[id*=product_cnt_]").bindPattern({
			        			pattern: "numberint",
			        			max_length: 1
			        		});
			        	}			     
			        }
			    });
			}
		},
		reviewInsert: function(){
			var data = $("#reviewInputform").serialize();
			//console.log(data);
        	$.ajax({
		        url: "/YeaMin/insertReview.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//리뷰 등록 성공
		        		reviewInputform.review_content.value="";
		        	} else if(ret.result === "error") {
		        		//리뷰 등록 실패
		        	}
		        }
		    });
		},
		reviewUpdate: function(review_no){
			var review_content = $(".review_content_"+review_no).val();
			var data = "review_no="+ review_no +"&review_content="+ review_content;
			$.ajax({
		        url: "/YeaMin/updateReview.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//리뷰 수정 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") {
		        		//리뷰 수정 실패
		        	}
		        }
		    });
		},
		reviewDelete: function(review_no){
			var data = "review_no="+ review_no
			$.ajax({
		        url: "/YeaMin/deleteReview.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//리뷰 삭제 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") {
		        		//리뷰 삭제 실패
		        	}
		        }
		    });
		},
		reviewAnswerInputFormShow: function(review_no) {
			fnObj.reviewAnswerInputFormDestory();
			
			$("#review_no").val(review_no);
			
			var reviewAnswerInputForm = $(".reviewAnswerInputForm").clone();
			reviewAnswerInputForm.attr("id", "reviewAnswerInputForm");
			
			$("#review_no_"+review_no).after(reviewAnswerInputForm);
			reviewAnswerInputForm.show();	
		},
		reviewAnswerInputFormDestory: function() {
			$("#reviewAnswerInputForm").remove();
		},
		insertReviewAnswerInputForm: function() {
			var data = $("#reviewAnswerInputForm").serialize();
			$.ajax({
		        url: "/YeaMin/insertReviewAnswerInputForm.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//댓글 등록 성공
		        		console.log("댓글 등록 성공!");
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") {
		        		//댓글 등록 실패
		        		console.log("댓글 등록 실패!");
		        	}
		        }
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