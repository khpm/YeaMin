<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴 예비 폼 -->
<div style='float: none; display: none;'>
	<div style='float: left;'>
		<div class='ax-rwd-table' style='margin: 30px; border: 3px solid #EFEFEF; border-radius: 5px; border-style:outset;'>
			<div class='item-group'>
             	<div class='item'>
             		<div class='item-lable'>
						<img src='/YeaMin/save/1469602300036.jpg' width='400' height='300' align='center' style='border-radius: 5px;'>							        				
      				</div>
      			</div>
      			<div class='item-clear'></div>
      			<div class='group-clear'></div>
      		</div>
      		<div class='item-group'>
	            <div class='item' style='min-width:400px;'>
	            	<div style='float: right; margin-top: 5px; margin-right: 3px;'>
							<input type='text' class='AXInput W30'/>
					</div>
	             	<div class='item-lable' style='min-width:400px;'>
          				<span class='th' style='max-width:70px;'>상품 이름</span>
						<span class='td' style='font-size:16px; min-width: 100px;'>삼겹살</span><br>
						<span class='th' style='max-width:70px;'>상품 가격</span>
						<span class='td' style='font-size:16px; min-width: 50%;'><i class='axi axi-krw' style='font-size: 14px;'></i>&nbsp;9000</span>
					</div>
				</div>
				<div class='item-clear'></div>
				<div class='group-clear'></div>
			</div>
			<div class='item-group'>
            	<div class='item'>
            		<div class='item-lable' style='height:60px;'>
						<span class='th' style='max-width:70px;'>상품 소개</span>
						<div class='td'>
							<div style='margin-left: 10px; min-height: 100px; max-width: 300px; font-size: 16px; text-align: left;'>
								상품 소개가 들어갈 자리
							</div>
						</div>
					</div>
     			</div>
    			<div class='item-clear'></div>
     			<div class='group-clear'></div>
     		</div>
      	</div>
	</div>
</div>
<div style='clear:both;'></div>
<!-- 메뉴 예비 폼 -->


<div id="menuTabHeaders"></div>
<div id="menuTabContents"></div>
<!-- 예약하기 버튼 , 간이계산 START -->
<div style="height:40px; padding: 5px;">
	<c:if test="${user.is_admin eq 'N'}">
		<div style="float: right;">
			<button class="AXButton" style="width:80px; height:40px; font-size: 15px;" onclick="menuFnObj.modal.openProxy()">
				<i class="axi axi-ion-clipboard" style="font-size:18px;"></i>예약하기
			</button>
		</div>
	</c:if>
	<div style="float: right;">
		<i class='axi axi-krw' style="font-size:25px;"></i>&nbsp;
 	<label id="sum" style="font-size: 30px; font-weight:bold;">합 계 : 0 원</label>
	</div>
</div>
<!-- 예약하기 버튼 , 간이계산 END -->

<script type="text/javascript">
	var menuFnObj = {
		showMenuTabHeadersHandler: function(optionValue) { },
		changeCountHandler: function(productList) { },
		bind: function() {
			$("#menuTabHeaders").empty();
			$("#menuTabContents").empty();
			menuFnObj.tab.bind();
			menuFnObj.modal.bind();
		},
		tab: {
			categoryList: [],
			productList: [],
			// 초기화 함수
			bind: function() {
				$("#menuTabHeaders").bindTab({
					theme: "AXTabs",
					value: "",
					overflow: "scroll",
					options: [],
					onchange: function(selectedObject, optionValue) {
						var product_category_no = optionValue;
						$("div[id*=product_category_no_]").hide();
						$("#product_category_no_"+product_category_no).show();	
						menuFnObj.showMenuTabHeadersHandler(optionValue);
					}
				});
				menuFnObj.tab.addTabs();
			},
			setProductList: function(productList) {
				menuFnObj.tab.productList = productList;
				
				for ( var index in productList) {
					var item = productList[index];
					
					if(item.hasOwnProperty("product_cnt")) {
						$("#product_cnt_"+item.product_no).val(item.product_cnt);
					} else {
						$("#product_cnt_"+item.product_no).val("");
					}
				}
				
				menuFnObj.tab.sumPrice();
			},
			// 해당 카테고리 div 영역만 show 하고 나머지는 hide하는 함수, 매개변수는 해당 카테고리의 no값
			setValueTab: function(value) {
				$("#menuTabHeaders").setValueTab(value);
			},
			//탭에 카테고리가 들어가기 위한 함수
			addTabs: function() {
				$.ajax({
			        url: "/YeaMin/selectProductCategoryList.json",
			        type: "post",
			        data: "",
			        success: function(data) {
			        	var ret = JSON.parse(data);
			        	
			        	if(ret.result === "ok") {
			        		menuFnObj.tab.categoryList = ret.list;
							menuFnObj.tab.createMenuTabContents(ret.list);
							menuFnObj.tab.menu();
			        	}
			        }
			    });
			},
			//카테고리 내의 메뉴 div를 만드는 함수 , 매개변수는 카테고리데이터가 들어있는 json형태의 배열
			createMenuTabContents: function(categoryList) {
				var options = [];
				for(var i=0; i < categoryList.length; i++) {
					var categoryItem = categoryList[i];
					options.push({optionText: categoryItem.product_category_name, optionValue: categoryItem.product_category_no});
					$("#menuTabContents").append("<div id='product_category_no_"+categoryItem.product_category_no+"' style='width:100%; height:500px; overflow-y:scroll; border-bottom: 1px solid #CFCFCF;'>");
				}
				$("#menuTabHeaders").addTabs(options);
				console.log("createMenuTabContents");
			},
			changeCount: function(target, product_category_no, product_no) {
				var productList = menuFnObj.tab.productList;
				var product_cnt = $(target).val();
				
				for ( var index in productList ) {
					var productItem = productList[index];
					
					if(productItem.product_category_no == product_category_no
							&& productItem.product_no == product_no) {
						productItem.product_cnt = product_cnt;
					}
				}
				
				menuFnObj.changeCountHandler(menuFnObj.tab.productList);
				menuFnObj.tab.sumPrice();
			},
			sumPrice: function() {
				var productList = menuFnObj.tab.productList;
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
			        	
			        	if(ret.result === "ok") {
			        		console.log("menu");
			        		for(var i=0; i<ret.list.length; i++){
			        			var item = ret.list[i];
			        			$("#product_category_no_"+item.product_category_no).html(
			        					$("#product_category_no_"+item.product_category_no).html()
			        					+"<div style='float: none;'>"
										+	"<div style='float: left;'>"
										+		"<div class='ax-rwd-table' style='margin: 30px; border: 3px solid #EFEFEF; border-radius: 5px; border-style:outset;'>"
										+			"<div class='item-group'>"
										+             	"<div class='item'>"
										+             		"<div class='item-lable'>"
										+						"<img src='/YeaMin/save/"+item.product_img_system_path+"' width='400' height='300' align='center' style='border-radius: 5px;'>"							        				
										+      				"</div>"
										+      			"</div>"
										+      			"<div class='item-clear'></div>"
										+      			"<div class='group-clear'></div>"
										+      		"</div>"
										+      		"<div class='item-group'>"
										+	            "<div class='item' style='min-width:400px;'>"
										+	            	"<div style='float: right; margin-top: 5px; margin-right: 3px;'>"
										+							"<input type='text' id='product_cnt_"+item.product_no+"' class='AXInput W30' onchange='menuFnObj.tab.changeCount(this, " + item.product_category_no + ", " + item.product_no + ");'/>"
										+					"</div>"
										+	             	"<div class='item-lable' style='min-width:400px;'>"
										+         				"<span class='th' style='max-width:70px;'>상품 이름</span>"
										+						"<span class='td' style='font-size:16px; min-width: 100px;'>" + item.product_name + "</span><br>"
										+						"<span class='th' style='max-width:70px;'>상품 가격</span>"
										+						"<span class='td' style='font-size:16px; min-width: 50%;'><i class='axi axi-krw' style='font-size: 14px;'></i>&nbsp;" + item.product_price + "</span>"
										+					"</div>"
										+				"</div>"
										+				"<div class='item-clear'></div>"
										+				"<div class='group-clear'></div>"
										+			"</div>"
										+			"<div class='item-group'>"
										+           	"<div class='item'>"
										+            		"<div class='item-lable' style='height:60px;'>"
										+						"<span class='th' style='max-width:70px;'>상품 소개</span>"
										+						"<div class='td'>"
										+							"<div style='margin-left: 10px; min-height: 100px; max-width: 300px; font-size: 16px; text-align: left;'>"
										+								item.product_desc
										+							"</div>"
										+						"</div>"
										+					"</div>"
										+     			"</div>"
										+    			"<div class='item-clear'></div>"
										+     			"<div class='group-clear'></div>"
										+     		"</div>"
										+      	"</div>"
										+	"</div>"
										+"</div>"										
			        			).hide();
			        		}
			        		
			        		menuFnObj.tab.setValueTab(menuFnObj.tab.categoryList[0].product_category_no);
			        		
			        		$("input[id*=product_cnt_]").bindPattern({
			        			pattern: "numberint",
			        			max_length: 1
			        		});
			        		
			        		if(menuFnObj.tab.productList.length == 0) {
				        		menuFnObj.tab.productList = ret.list;// 상품 데이터 넣기(메모리에 들고있기)
				        	} else {
				        		menuFnObj.tab.setProductList(menuFnObj.tab.productList);
				        	}
			        	}			     
			        }
			    });
			}
		},
		modal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.reservationModal = this.target;
                this.target.setConfig({
                    windowID:"myModalContainer",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    displayLoading:true
                });
            },
            openProxy: function() {
            	var isOpenable = false;
            	var productList = menuFnObj.tab.productList;
            	
            	for(var index in productList) {
            		var item = productList[index];
            		
            		if(item.hasOwnProperty("product_cnt") && item.product_cnt > 0) {
            			isOpenable = true;
            			break;
            		}
            	}
            	
            	if(isOpenable) {
            		menuFnObj.modal.open('INSERT', null);
            	} else {
            		dialog.push({
            			top: 350,
            			title: "항목 미선택",
            			body: "<b>경고</b> - 예약할 항목을 선택하세요.",
            			type: "Caution"
            		});
            	}
            },
            open: function(modalType, item) {
            	var pars = "modalType=" + modalType;
            	
            	if(modalType === "UPDATE") {
            		pars += ("&" + fnObj.primaryKey + "=" + item[fnObj.primaryKey]);
            	}
            	
                this.target.open({
                    url:"/YeaMin/reservationModal.do",
                    pars: pars.queryToObject(),
                    top: $("#menuTabHeaders").position().y, width:800,
                    closeByEscKey:true
                });
            }
        }
	};
</script>