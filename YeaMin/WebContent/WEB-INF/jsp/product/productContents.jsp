<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>상품 정보 관리</h1>
				<p class="desc">상품 정보를 관리합니다.</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
					
				<!-- s.CXPage -->
				<div id="CXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
								
										<!-- 검색 조건 영역 -->
										<div class="ax-search" id="page-search-box"></div>
										
										<!-- 컨트롤 버튼 영역 -->
										<div class="ax-button-group">
											<div class="left">
												<button type="button" class="AXButton Green" id="btn-search">
													<i class="axi axi-search"></i> 검색
												</button>
											</div>
											<div class="right">
												<button type="button" class="AXButton Green" id="btn-insert">
													<i class="axi axi-add"></i> 등록
												</button>
												<button type="button" class="AXButton Green" id="btn-update">
													<i class="axi axi-edit"></i> 수정
												</button>
												<button type="button" class="AXButton Green" id="btn-delete">
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
    var page_menu_id = "m0301"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
    var fnObj = {
    	primaryKey: "product_no",
		pageStart: function(){
            this.search.bind();
            this.grid.bind();
            this.modal.bind();
            this.bindEvent();
        },
        bindEvent: function(){
            // 검색
            axdom("#btn-search").bind("click", function(){
            	fnObj.search.submit();
            });
            
            // 등록
            axdom("#btn-insert").bind("click", function(){
            	fnObj.modal.open("INSERT", null);
            });
            
            // 수정
            axdom("#btn-update").bind("click", function(){
            	var gridTarget = fnObj.grid.target;
				var selectedItem = gridTarget.getSelectedItem();
				
				// trace(selectedItem);
				
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
            
            // 삭제
            axdom("#btn-delete").bind("click", function(){
				var gridTarget = fnObj.grid.target;
				var selectedItem = gridTarget.getSelectedItem();
				
				if(selectedItem.hasOwnProperty("error")) {
					dialog.push({
            			top: "350",
            			title: "항목 미선택",
            			body: "<b>경고</b> - 삭제할 항목을 선택해 주세요.",
            			type: "Caution"
            		});
				} else {
					var data = new Object();
					data[fnObj.primaryKey] = selectedItem.item[fnObj.primaryKey];
					
					$.ajax({
				        url: "/YeaMin/deleteProduct.json",
				        type: "post",
				        data: data,
				        success: function(data) {
				        	var ret = JSON.parse(data);
				        	
				        	if(ret.result === "ok") {
				        		fnObj.search.submit();
				        	}
				        }
				    });
				}
            });
        },
        search: {
            target: new AXSearch(),
            get: function(){ return this.target },
            bind: function(){
                this.target.setConfig({
                    targetID:"page-search-box",
                    theme: "AXSearch",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    onsubmit: function(){
                    	console.log("search.onsubmit()");
                        // 버튼이 선언되지 않았거나 submit 개체가 있는 경우 발동 합니다.
                    },
                    rows: [
                        {display:true, addClass:"", style:"", list:[
                            {label:"상품 이름", labelWidth:"", type:"inputText", width:"150", key:"inputText", addClass:"secondItem", valueBoxStyle:"", value:"",
                                  onChange: function(changedValue){
                                      //아래 2개의 값을 사용 하실 수 있습니다.
                                      //dialog.push(Object.toJSON(this));
                                      //dialog.push(changedValue);//입력란에 적은 텍스트						
                                  }
                            },
                            {label:"상품 가격", labelWidth:"60", type:"inputText", width:"100", key:"startprice", addClass:"secondItem", valueBoxStyle:"", value:"", title:"",
                                  onChange: function(){}
                            },
                            {label:"~", labelWidth:"60", type:"inputText", width:"100", key:"endprice", addClass:"secondItem", valueBoxStyle:"", value:"", title:"",
                                onChange: function(){}
                          	}
                        ]}
                    ]
                });
            },
            submit: function(){
            	var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	//console.log(searchTarget.getParam());
            	
            	gridTarget.setList({
				    ajaxUrl: "selectProductList.json",
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
                this.target.setConfig({
                    targetID: "page-grid-box",
                    theme: "AXGrid",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    colGroup: [
                        {key:"product_no", label:"상품 번호", width:"80", align:"center"},
                        {key:"product_category_name", label:"카테고리", width:"100", align:"center"},
                        {key:"product_name", label:"상품 이름", width:"200", align:"center"},
                        {key:"product_price", label:"상품 가격", width:"200", align:"center"},
                        {key:"product_desc", label:"상품 소개", width:"200", align:"center"},
                        {key:"product_order_by", label:"상품 순서", width:"80", align:"center"}
                    ],
                    body: {
                        ondblclick: function(){
                        	// trace(this.index);
                        	// trace(this.item);
                        	// trace(this.list);
                        	// trace(this.page);
                            fnObj.modal.open("UPDATE", this.item);
                        }
                    },
                    page: {
                        paging: false
                    }
                });
            }
        },
        modal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.myModal = this.target;
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
                    url:"/YeaMin/productModal.do",
                    pars: pars.queryToObject(),
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        }
    };
</script>