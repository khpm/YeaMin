<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>상품관리</h1>
				<p class="desc">상품관리</>
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

                                       <div class="ax-search" id="page-search-box"></div>
                                       <div class="ax-button-group">
                                           <div class="left">
                                               <button type="button" class="AXButton Blue" id="ax-grid-btn-regist">등록</button>
                                               <button type="button" class="AXButton" id="ax-grid-btn-remove">삭제</button>
                                           </div>
                                           <div class="right">
                                               <button type="button" class="AXButton Blue" id="ax-search-btn-search">검색</button>
                                           </div>
                                           <div class="ax-clear"></div>
                                       </div>
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
    var page_menu_id = "m02"; // admin.js > topMenu_data 에 정의된 id
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
            axdom("#ax-search-btn-search").bind("click", function(){
                _this.search.submit();
            });
        },
        search: {
            target: new AXSearch(),
            get: function(){ return this.target },
            bind: function(){
                var _this = this;
                this.target.setConfig({
                    targetID:"page-search-box",
                    theme : "AXSearch",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    onsubmit: function(){
                        // 버튼이 선언되지 않았거나 submit 개체가 있는 경우 발동 합니다.
                    },
                    rows:[
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
                                    //dialog.push();
                                    //dialog.push(Object.toJSON(selectedObject));
                                    //dialog.push(value);
                                }
                            }
                        ]},
                        {display:true, addClass:"", style:"", list:[
                            {label:"상태", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
                                options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                AXBind:{
                                    type:"select", config:{
                                        onChange:function(){
                                            //toast.push();

                                        }
                                    }
                                }
                            },
                            {label:"등록일자", labelWidth:"", type:"inputText", width:"70", key:"inputText1", addClass:"secondItem", valueBoxStyle:"", value:"",
                                onChange: function(){}
                            },
                            {label:"", labelWidth:"", type:"inputText", width:"90", key:"inputText2", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"",
                                AXBind:{
                                    type:"twinDate", config:{
                                        align:"right", valign:"top", startTargetID:"inputText1",
                                        onChange:function(){

                                        }
                                    }
                                }
                            }
                        ]},
                        {display:true, addClass:"gray", style:"", list:[
                            {label:"판매자명", labelWidth:"100", type:"inputText", width:"", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                            {label:"판매자 상품코드", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
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
            },
            submit: function(){
                var pars = this.target.getParam();
                toast.push("콘솔창에 파라미터 정보를 출력하였습니다.");
                trace(pars);
            }
        },
        grid: {
            target: new AXGrid(),
            get: function(){ return this.target },
            bind: function(){

                this.target.setConfig({
                    targetID : "page-grid-box",
                    theme : "AXGrid",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    colGroup : [
                        {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
                        {key:"title", label:"제목", width:"200"},
                        {key:"writer", label:"작성자", width:"90", align:"center"},
                        {key:"regDate", label:"작성일", width:"90", align:"center"},
                        {key:"desc", label:"비고", width:"*"}
                    ],
                    view: {
                        label:true,
                        column: [ // col 은 4
                            {key:"title", label:"제목", col:4, addClass:"underLine"},
                            {key:"no", label:"번호", col:1},
                            {key:"desc", label:"비고", col:3},
                            {key:"writer", label:"작성자"},
                            {key:"regDate", label:"작성일"},
                            {key:"", label:"사용자연산", formatter: function(){
                                return (this.item.no * 987).money();
                            }}
                        ],
                        buttons: [
                            {addClass:"handle", onclick:function(){
                                toast.push("handle Click");
                                trace(this.item);
                            }}
                        ]
                    },
                    body : {
                        onclick: function(){
                            //toast.push(Object.toJSON({index:this.index, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                            fnObj.modal.open("gridView", this.item);
                        }
                    },
                    page:{
                        paging:true,
                        pageNo:1,
                        pageSize:100,
                        status:{formatter: null}
                    }
                });

                this.target.setList({
                    ajaxUrl:"data/loadGrid.php", ajaxPars:"param1=1&param2=2", onLoad:function(){
                        //trace(this);
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