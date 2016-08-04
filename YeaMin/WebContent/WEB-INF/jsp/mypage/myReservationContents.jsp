<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col12 ax-content">
				<h1>예약 이력 및 현황</h1>
				<p class="desc">모든 예약 이력과 현황을 확인 및 관리할 수 있습니다.</p>
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
									<div id="page-search-box" class="ax-search"></div>
									
									<!-- 컨트롤 버튼 영역 -->
									<div class="ax-button-group">
										<div class="left">
											<button id="btn-search" type="button" class="AXButton">
												<i class="axi axi-search"></i> 검색
											</button>
										</div>
										<div class="right">
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
									
									<input id="user_no" type="hidden" value="${user.user_no}"/>
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
	var page_menu_id = "m09"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
    var fnObj = {
    	primaryKey: "reservation_no",
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
				        url: "/YeaMin/deleteReservation.json",
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
                            {label:"예약 일자", labelWidth:"", type:"inputText", width:"90", key:"reservation_time_start", addClass:"secondItem", valueBoxStyle:"", value:"",
                                onChange: function(){}
                            },
                            {label:"", labelWidth:"", type:"inputText", width:"90", key:"reservation_time_end", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"",
                                AXBind:{
                                    type:"twinDate", config:{
                                        align:"right", valign:"top", startTargetID:"reservation_time_start",
                                        onChange:function(){

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
				    ajaxUrl: "selectReservationList.json",
				    ajaxPars: searchTarget.getParam() + "&user_no=" + $("#user_no").val(),
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
                        {key:"reservation_no", label:"예약 번호", width:"200", align:"center"},
                        {key:"user_name", label:"예약자", width:"200", align:"center"},
                        {key:"reservation_time", label:"예약 일자", width:"200", align:"center", formatter: function(){
	  	                	return this.value.date().print('yyyy년 mm월 dd일 hh시 mi분(dw)');
    	                 }},
                        {key:"reservation_people", label:"예약 인원 수", width:"200", align:"center"},
                        {key:"product_total_cnt", label:"상품 전체 개수", width:"200", align:"center"},
                        {key:"product_sum_price", label:"상품 합계 금액", width:"200", align:"center", formatter: function() {
                        	return this.value.money();
                        }},
                        {key:"reservation_comment", label:"전달 사항", width:"200", align:"center"}
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
                window.reservationModal = this.target;
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
                    url:"/YeaMin/reservationModal.do",
                    pars: pars.queryToObject(),
                    top:100, width:800,
                    closeByEscKey:true
                });
            }
        }
    };
</script>