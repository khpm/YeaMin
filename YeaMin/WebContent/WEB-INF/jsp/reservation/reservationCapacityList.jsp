<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>주문/배송관리</h1>
				<p class="desc">주문관리</p>
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
												<button type="button" class="AXButton Blue" id="ax-search-btn-search">
													<i class="axi axi-search"></i> 검색
												</button>
											</div>
											<div class="right">
												<button type="button" class="AXButton Blue" id="ax-grid-btn-regist">
													<i class="axi axi-add"></i> 등록
												</button>
												<button type="button" class="AXButton Blue" id="ax-grid-btn-update">
													<i class="axi axi-refresh"></i> 수정
												</button>
												<button type="button" class="AXButton Blue" id="ax-grid-btn-remove">
													<i class="axi axi-minus"></i> 삭제
												</button>
											</div>
											<div class="ax-clear"></div>
										</div>
										<!-- 검색 조건 영역 -->
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
		pageStart: function(){
            this.search.bind();
            this.grid.bind();
            this.modal.bind();
            this.bindEvent();
        },
        bindEvent: function(){
            var _this = this;
            // 검색
            axdom("#ax-search-btn-search").bind("click", function(){
            	var searchTarget = _this.search.target;
            	var gridTarget = _this.grid.target;

            	gridTarget.setList({
				    ajaxUrl: "selectReservationCapacityList.json",
				    ajaxPars: searchTarget.getParam(),
				    onLoad: function(){
				        trace(this);
				    }
				});
            });
            
            // 등록
            axdom("#ax-grid-btn-regist").bind("click", function(){
            	fnObj.modal.open("regist", null);
            });
            
            // 수정
            axdom("#ax-grid-btn-update").bind("click", function(){
            	var gridTarget = _this.grid.target;
            	
            	if(gridTarget.item == undefined) {
            		dialog.push({
            			top: "350",
            			title: "항목 미선택",
            			body:"<b>경고</b> - 수정할 항목을 선택해 주세요.",
            			type:"Caution"
            		});
            	} else {
            		fnObj.modal.open("update", null);
            	}
            });
            
            // 삭제
            axdom("#ax-grid-btn-remove").bind("click", function(){
				var gridTarget = _this.grid.target;
            	
            	if(gridTarget.item == undefined) {
            		dialog.push({
            			top: "350",
            			title: "항목 미선택",
            			body:"<b>경고</b> - 삭제할 항목을 선택해 주세요.",
            			type:"Caution"
            		});
            	} else {
            		
            	}
            });
        },
        search: {
            target: new AXSearch(),
            get: function(){ return this.target },
            bind: function(){
                var _this = this;
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
                            {label:"채널", labelWidth:"100", type:"link", width:"", key:"openType", addClass:"", valueBoxStyle:"", value:"open",
                                options:[
                                    {optionValue:"all", optionText:"전체보기"},
                                    {optionValue:"open", optionText:"공개"},
                                    {optionValue:"close", optionText:"채널기본"},
                                    {optionValue:"close2", optionText:"채널선택", display:false},
                                    {optionValue:"close3", optionText:"채널A", display:false},
                                    {optionValue:"close4", optionText:"채널B", display:false}
                                ],
                                onChange: function(selectedObject, value){
                                    //아래 3개의 값을 사용 하실 수 있습니다.
                                    //dialog.push(Object.toJSON(this));
                                    //dialog.push(Object.toJSON(selectedObject));
                                    //dialog.push(value);
                                }
                            }
                        ]},
                        {display:true, addClass:"", style:"", list:[
                            {label:"브랜드", labelWidth:"100", type:"inputText", width:"150", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                            {label:"결제번호", labelWidth:"100", type:"inputText", width:"150", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""},
                            {label:"주문번호", labelWidth:"100", type:"inputText", width:"150", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                        ]},
                        {display:true, addClass:"gray", style:"", list:[
                            {label:"상태", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
                                options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                AXBind:{
                                    type:"select", config:{
                                        onChange:function(){
                                            //toast.push(Object.toJSON(this));

                                        }
                                    }
                                }
                            },
                            {label:"일자", labelWidth:"", type:"inputText", width:"70", key:"inputText1", addClass:"secondItem", valueBoxStyle:"", value:"",
                                onChange: function(){}
                            },
                            {label:"", labelWidth:"", type:"inputText", width:"90", key:"inputText2", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"",
                                AXBind:{
                                    type:"twinDate", config:{
                                        align:"right", valign:"top", startTargetID:"inputText1",
                                        onChange:function(){
                                            toast.push(Object.toJSON(this));
                                        }
                                    }
                                }
                            },
                        ]},
                        {display:true, addClass:"gray", style:"", list:[
                            {label:"구매자 이메일", labelWidth:"100", type:"inputText", width:"200", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                            {label:"구매자 전화번", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                        ]},
                        {display:false, addClass:"", style:"", list:[
                            {label:"마스터아이디", labelWidth:"100", type:"inputText", width:"", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                            {label:"채널아이디", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                        ]},
                        {display:false, addClass:"gray", style:"", list:[
                            {label:"상품명", labelWidth:"100", type:"inputText", width:"", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                            {label:"모델명", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""},
                            {label:"브랜드명", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                        ]}
                    ]
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
                        {key:"reservation_capacity_dw", label:"예약 수용 요일", width:"200", align:"center"},
                        {key:"reservation_capacity_time", label:"예약 수용 시간", width:"200", align:"center"},
                        {key:"reservation_capacity_people", label:"예약 수용 인원 수", width:"200", align:"center"}
                    ],
                    body: {
                        onclick: function(){
                            //toast.push(Object.toJSON({index:this.index, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                            fnObj.modal.open("gridView", this.item);
                        }
                    },
                    page: {
                        paging:true,
                        pageNo:1,
                        pageSize:100,
                        status:{formatter: null}
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
            open: function(type, item){
                this.target.open({
                    url:"modal.php",
                    pars:"a=1&b=2&c=3".queryToObject(),
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        }
    };
</script>