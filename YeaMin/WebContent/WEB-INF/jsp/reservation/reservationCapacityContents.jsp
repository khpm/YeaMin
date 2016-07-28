<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>예약 시간 관리</h1>
				<p class="desc">예약할 때 필요한 정보인 예약 수용 정보를 관리합니다.</p>
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
												<button type="button" class="AXButton Blue" id="btn-search">
													<i class="axi axi-search"></i> 검색
												</button>
											</div>
											<div class="right">
												<button type="button" class="AXButton Blue" id="btn-insert">
													<i class="axi axi-add"></i> 등록
												</button>
												<button type="button" class="AXButton Blue" id="btn-update">
													<i class="axi axi-edit"></i> 수정
												</button>
												<button type="button" class="AXButton Blue" id="btn-delete">
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
    	primaryKey: "reservation_capacity_no",
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
				        url: "/YeaMin/deleteReservationCapacity.json",
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
                        {display:true, addClass:"gray", style:"", list:[
                            {label:"예약 수용 요일", labelWidth:"100", type:"selectBox", width:"160", key:"reservation_capacity_dw", addClass:"secondItem", valueBoxStyle:"", value:"all",
                                options:[
									{optionValue:"all", optionText:"전체"},
									{optionValue:"D", optionText:"평일"},
									{optionValue:"W", optionText:"주말"}
								],
                                AXBind:{
                                    type:"select", config:{
                                        onChange:function(){
                                        	// trace(this);
                                        }
                                    }
                                }
                            }
                        ]}
                    ]
                });
            },
            submit: function(){
            	var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	
            	// trace(searchTarget.getParam());
            	
            	gridTarget.setList({
				    ajaxUrl: "selectReservationCapacityList.json",
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
                        {key:"reservation_capacity_no", label:"예약 수용 번호", width:"200", align:"center"},
                        {key:"reservation_capacity_dw", label:"예약 수용 요일", width:"200", align:"center", formatter: function() {
                            return (this.item.reservation_capacity_dw === "D" ? "주말" : "평일");
                        }},
                        {key:"reservation_capacity_time", label:"예약 수용 시간", width:"200", align:"center"},
                        {key:"reservation_capacity_people", label:"예약 수용 인원 수", width:"200", align:"center"}
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
                window.reservationCapacityModal = this.target;
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
                    url:"/YeaMin/reservationCapacityModal.do",
                    pars: pars.queryToObject(),
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        }
    };
</script>