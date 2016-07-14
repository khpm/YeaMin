<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				        			<!-- 검색 조건 영역  -->
				           			<div id="page-search-box" style="margin:5px;"></div>
				           			<!-- 버튼 영역 start -->
				           			<div class="ax-button-group">
					           			<div class="left">
					                		<button class="AXButton red" id="btn-search">
					                			<i class="axi axi-search">&nbsp;조회</i>
					                		</button>
					                	</div>
					                	<div class="right">
								            <button class="AXButton red" >
								            	<i class="axi axi-add">&nbsp;등록</i>
								            </button>
								            <button class="AXButton red" >
								                <i class="axi axi-refresh">&nbsp;수정</i>
								            </button>
								            <button class="AXButton red" >
								                <i class="axi axi-minus">&nbsp;삭제</i>
								            </button>
							            </div>
							            <div class="ax-clear"></div>
						            </div>
						            <!-- 버튼 영역 end -->
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

<!-- script -->
<script type="text/javascript">
	var fnObj = {
		pageStart: function(){
			this.grid.bind();
			this.search.bind();
			this.bindEvent();
		},//초기화 작업
		bindEvent: function(){
			//검색
			axdom("#btn-search").bind("click",function(){
				var searchTarget = fnObj.search.target;
            	var gridTarget = fnObj.grid.target;
            	console.log(searchTarget.getParam());
            	gridTarget.setList({
            		ajaxUrl: "selectproductCategoryList.json",
				    ajaxPars: searchTarget.getParam(),
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
					onsubmit: function(){// 버튼을 눌렀을 경우 실행되는 함수
						fnObj.submit();
					},
					rows:[
						{display:true, addClass:"gray", style:"",
							list:[
								{label:"공개설정", labelWidth:"100", type:"link",
								width:"", key:"openType", addClass:"", valueBoxStyle:"", value:"all",
								options:[
										{optionValue:"all", optionText:"전체보기"},
										{optionValue:"open", optionText:"공개"},
										{optionValue:"close", optionText:"비공개"},
								],
								onChange: function(selectedObject, value){
									//아래 3개의 값을 사용 하실 수 있습니다.
									toast.push(Object.toJSON(this));
									//dialog.push(Object.toJSON(selectedObject));
									//dialog.push(value);
								}
							}
						]},
	                    /* {display:false, addClass:"", style:"", list:[
	                        {label:"체크박스류", labelWidth:"100", type:"checkBox", width:"", key:"checkbox", addClass:"asfasd", valueBoxStyle:"", value:"open,close",
	                            options:[{optionValue:"all", optionText:"전체보기", title:"체크박스"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                            onChange: function(selectedObject, value){
	                                //아래 3개의 값을 사용 하실 수 있습니다.
	                                dialog.push(Object.toJSON(this));
	                                dialog.push(Object.toJSON(selectedObject));
	                                dialog.push(value);
	                            }
	                        },
	                        {label:"라디오류", labelWidth:"100", type:"radioBox", width:"", key:"radiobox", addClass:"secondItem", valueBoxStyle:"", value:"close",
	                            options:[{optionValue:"all", optionText:"전체보기", title:"라디오타이틀"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                            onChange: function(selectedObject, value){
	                                //아래 3개의 값을 사용 하실 수 있습니다.
	                                dialog.push(Object.toJSON(this));
	                                dialog.push(Object.toJSON(selectedObject));
	                                dialog.push(value);
	                            }
	                        }
	                    ]},
						{display:false, addClass:"gray", style:"", list:[
							{label:"EXIF정보", labelWidth:"100", type:"link", width:"", key:"exif", addClass:"", valueBoxStyle:"", value:"close",
								options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
								onChange: function(){}
							}
						]},*/
	
						 {display:true, addClass:"", style:"", list:[
							/* {label:"상품 카테고리", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
								options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
								AXBind:{
									type:"select", config:{
										onChange:function(){
											//toast.push(Object.toJSON(this));
											
										}
									}
								}
							}, */
							{label:"카테고리 이름", labelWidth:"", type:"inputText", width:"150", key:"inputText", addClass:"secondItem", valueBoxStyle:"", value:"",
								onChange: function(changedValue){
									//아래 2개의 값을 사용 하실 수 있습니다.
									//dialog.push(Object.toJSON(this));
									//dialog.push(changedValue);//입력란에 적은 텍스트						
								}
							},
							{label:"상품명", labelWidth:"60", type:"inputText", width:"250", key:"inputText2", addClass:"secondItem", valueBoxStyle:"", value:"", title:"타이틀정보",
								onChange: function(){}
							}
						]},
						{display:false, addClass:"gray", style:"",
							list:[
								{label:"정렬", labelWidth:"", type:"radioBox",
								width:"", key:"radiobox2", addClass:"secondItem", valueBoxStyle:"", value:"all",
								options:[
								         {optionValue:"all", optionText:"카테고리 번호"},
								         {optionValue:"open", optionText:"카테고리 이름"},
								         {optionValue:"open2", optionText:"카테고리 순서"},
								         {optionValue:"close", optionText:"상품 개수"}
								        ],
								onChange: function(){}
							}
						]},
						/* {display:false, addClass:"", style:"", list:[
							{label:"생각없이만들기", labelWidth:"100", type:"checkBox", width:"", key:"checkbox3", addClass:"", valueBoxStyle:"", value:"",
								options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
								onChange: function(){}
							},
							{label:"", labelWidth:"", type:"radioBox", width:"", key:"radiobox3", addClass:"secondItem", valueBoxStyle:"", value:"",
								options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
								onChange: function(){}
							}
						]} */
					]
				})
			},
            submit: function(){
    			var pars = this.target.getParam();
    			toast.push("버튼을 눌렀습니다.");
    			trace(pars);
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
        }
	};
</script>