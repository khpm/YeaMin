<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>상품 카테고리 정보 관리</h1>
				<p class="desc">상품 카테고리 정보를 관리합니다</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
			
				<!-- s.AXPageBody -->
				<div id="AXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
								
									<!-- 검색 조건 영역 -->
				           			<div id="page-search-box" style="margin:5px;"></div>
				           			
									<!-- 컨트롤 버튼 영역 -->
									<div class="ax-button-group">
										<div class="left">
											<button id="btn-search" type="button" class="AXButton">
												<i class="axi axi-search"></i> 검색
											</button>
										</div>
										<div class="right">
											<button id="btn-insert" type="button" class="AXButton">
												<i class="axi axi-add"></i> 등록
											</button>
											<button id="btn-update" type="button" class="AXButton">
												<i class="axi axi-edit"></i> 수정
											</button>
											<button id="btn-delete" type="button" class="AXButton">
												<i class="axi axi-remove"></i> 삭제
											</button>
										</div>
										<div class="ax-clear"></div>
									</div>
									
									<!-- 검색 결과 영역 -->
									<div class="ax-grid" id="page-grid-box"></div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- e.AXPageBody -->
				
			</div>
			<div class="ax-clear"></div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	var page_menu_id = "m0102"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	var fnObj = {
		primaryKey: "product_category_no",
		pageStart: function(){
			this.grid.bind();
			this.search.bind();
			this.bindEvent();
			this.modal.bind();
		},//초기화 작업
		bindEvent: function(){
			//검색
			axdom("#btn-search").bind("click",function(){
				var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	console.log(searchTarget.getParam());
            	gridTarget.setList({
            		ajaxUrl: "selectProductCategoryList.json",
				    ajaxPars: searchTarget.getParam(),
				    onLoad: function(){
				    	
				    }
            	});
			});
			
			//등록
			axdom("#btn-insert").bind("click",function(){
				fnObj.modal.open("INSERT", null);
			});
			
			//수정
			axdom("#btn-update").bind("click",function(){
				var gridTarget = fnObj.grid.target;
				var selectedItem = gridTarget.getSelectedItem();
				//trace(selectedItem);
				if(selectedItem.hasOwnProperty("error")) {
					dialog.push({
            			top: "350",
            			title: "항목 미선택",
            			body: "<b>경고</b> - 수정할 항목을 선택해 주세요.",
            			type: "Caution"
            		});
				} else {
            		fnObj.modal.open("UPDATE", selectedItem.item);
            	}
			});
			
			//삭제
			axdom("#btn-delete").bind("click",function(){
				var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	var checked=eval(Object.toJSON(gridTarget.getCheckedParams(0)));
            	//console.log(Object.toJSON(gridTarget.getCheckedParams(0)));
            	//dialog.push(checked[0].value); //선택된 카테고리 번호 출력됨

            	gridTarget.setList({
            		ajaxUrl: "deleteproductCategoryList.json",
				    ajaxPars: "no="+checked[0].value,
				    onLoad: function(){
				    	
				    }
            	});
			});
		},
		search :{
			target: new AXSearch(), //객체 생성
            get : function(){ return this.target },
			bind: function(){ 
				this.target.setConfig({
					targetID:"page-search-box",//"AXSearchTarget"
					theme : "AXSearch",
	                mediaQuery: {
	                    mx:{min:0, max:767}, dx:{min:767}
	                },
					onsubmit: function(){
						fnObj.submit();
					},
					rows:[					
						 {display:true, addClass:"gray", style:"", list:[
							{label:"카테고리 이름", labelWidth:"", type:"inputText", width:"150", key:"product_category_name", addClass:"secondItem", valueBoxStyle:"", value:"",
								onChange: function(changedValue){
									//아래 2개의 값을 사용 하실 수 있습니다.
									//dialog.push(Object.toJSON(this));
									//dialog.push(changedValue);//입력란에 적은 텍스트						
								}
							},
							{label:"상품명", labelWidth:"60", type:"inputText", width:"250", key:"product_name", addClass:"secondItem", valueBoxStyle:"", value:"", title:"타이틀정보",
								onChange: function(){}
							}
						]},
					]
				})
			},
			submit: function(){
            	var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	console.log(searchTarget.getParam());
            	gridTarget.setList({
				    ajaxUrl: "selectProductCategoryList.json",
				    ajaxPars: searchTarget.getParam(),
				    onLoad: function(){
				        // trace(this);
				    } 
				});
            }
		},
		grid: {
            target: new AXGrid(),
            get: function(){ return this.target },
            bind: function(){
            	var _this = this;
                this.target.setConfig({
                    targetID: "page-grid-box",
                    theme: "AXGrid",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    colGroup: [
                        {key:"product_category_no", label:"번호", width:"30", align:"center", formatter:"checkbox"},
                        {key:"product_category_no", label:"카테고리 번호", width:"120", align:"center"},
                        {key:"product_category_name", label:"카테고리 이름", width:"200", align:"center"},
                        {key:"product_category_order_by", label:"카테고리 순서", width:"120", align:"center"},
                        {key:"product_category_cnt", label:"상품 수", width:"100", align:"center"}
                    ],
                    page: {
                        paging: true	//페이징 처리 유무
                    }
                });
            }
        },
        modal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.productCategoryModal = this.target;
                this.target.setConfig({
                    windowID:"myModalContainer",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    displayLoading:true
                });
            },
            open: function(modalType, item){
            	var pars = "modalType=" + modalType;
            	
            	if(modalType === "UPDATE") {
            		pars += ("&" + fnObj.primaryKey + "=" + item[fnObj.primaryKey]);
            	}
            	
                this.target.open({
                    url:"/YeaMin/productCategoryModal.do",
                    pars: pars.queryToObject(),
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        }
	};
</script>