<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>정산관리</h1>
				<p class="desc">상품등록</p>
			</div>
               <div class="ax-clear"></div>
		</div>
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
					
				<!-- s.CXPage -->
				<div id="CXPage">
                       <div class="ax-unit">
                           <div class="ax-box">
                               <!-- s.본문 시작 -->

                               <div class="ax-section"> <!-- ax-grid, ax-tree, ax-section, ax-form -->
                                   <h2>
                                       <i class="axi axi-bmg-product"></i>
                                       상품 기본정보
                                   </h2>
                                   <p>
                                       상품의 기본정보를 등록하고 등록합니다. 기타 설명해야할 문구를 적어주세요
                                   </p>
                                   <table cellpadding="0" cellspacing="0" class="AXFormTable">
                                       <colgroup>
                                           <col width="100" />
                                           <col />
                                           <col width="100" />
                                           <col />
                                       </colgroup>
                                       <tbody>
                                           <tr>
                                               <th>
                                                   <div class="tdRel">
                                                       상품유형
                                                   </div>
                                               </th>
                                               <td colspan="3">
                                                   <div class="tdRel">
                                                       <label>
                                                           <input type="radio" name="" value="" /> 일반상품
                                                       </label>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th>
                                                   <div class="tdRel">
                                                       표준 카테고리
                                                   </div>
                                               </th>
                                               <td colspan="3">
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel">
                                                           <select name="" class="AXSelect" id="AXSelect_m0" style="width:200px;"></select>
                                                       </label>
                                                       <label class="AXInputLabel">
                                                           <select name="" class="AXSelect" id="AXSelect_m1" style="width:200px;"></select>
                                                       </label>
                                                       <label class="AXInputLabel">
                                                           <select name="" class="AXSelect" id="AXSelect_m2" style="width:200px;"></select>
                                                       </label>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th>
                                                   <div class="tdRel">
                                                       상품명
                                                   </div>
                                               </th>
                                               <td colspan="3">
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel fullWidth">
                                                           <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                           <span>
                                                               - 권장 글자수 공백포함 15자 이내(한글기준)<br/>
                                                               - 브랜드명 기재 불가<br/>
                                                               - 모델명 기재 불가<br/>
                                                               - 특정 지역명 기재 불가
                                                           </span>
                                                       </label>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th>
                                                   <div class="tdRel">
                                                       모델명
                                                   </div>
                                               </th>
                                               <td>
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel">
                                                           <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                           <span>모델명 입력시 상품명 옆에 노출됩니다.</span>
                                                       </label>
                                                   </div>
                                               </td>
                                               <th>
                                                   <div class="tdRel">
                                                       판매자 상품번호
                                                   </div>
                                               </th>
                                               <td>
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel">
                                                           <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                           <span>판매자 상품코드 (SP0011-20292)</span>
                                                       </label>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th>
                                                   <div class="tdRel">
                                                       브랜드
                                                   </div>
                                               </th>
                                               <td>
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel">
                                                           <input type="text" name="" value="" placeholder="" id="selector-0" class="AXInput W250" />
                                                       </label>
                                                   </div>
                                               </td>
                                               <th>
                                                   <div class="tdRel">
                                                       원산지
                                                   </div>
                                               </th>
                                               <td>
                                                   <div class="tdRel">
                                                       <label class="AXInputLabel">
                                                           <input type="text" name="" value="" placeholder="" id="selector-1" class="AXInput W250" />
                                                       </label>
                                                   </div>
                                               </td>
                                           </tr>
                                       </tbody>
                                   </table>
                                   <div class="H10"></div>

                                   <h2>
                                       <i class="axi axi-store-mall-directory"></i>
                                       상품 판매정보
                                   </h2>
                                   <table cellpadding="0" cellspacing="0" class="AXFormTable">
                                       <colgroup>
                                           <col width="100" />
                                           <col />
                                           <col width="100" />
                                           <col />
                                       </colgroup>
                                       <tbody>
                                       <tr>
                                           <th>
                                               <div class="tdRel">
                                                   상품유형
                                               </div>
                                           </th>
                                           <td colspan="3">
                                               <div class="tdRel">
                                                   <label>
                                                       <input type="radio" name="" value="" /> 일반상품
                                                   </label>
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <div class="tdRel">
                                                   상품명
                                               </div>
                                           </th>
                                           <td colspan="3">
                                               <div class="tdRel">
                                                   <label class="AXInputLabel fullWidth">
                                                       <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                           <span>
                                                               - 권장 글자수 공백포함 15자 이내(한글기준)<br/>
                                                               - 브랜드명 기재 불가<br/>
                                                               - 모델명 기재 불가<br/>
                                                               - 특정 지역명 기재 불가
                                                           </span>
                                                   </label>
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <div class="tdRel">
                                                   모델명
                                               </div>
                                           </th>
                                           <td>
                                               <div class="tdRel">
                                                   <label class="AXInputLabel">
                                                       <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                       <span>모델명 입력시 상품명 옆에 노출됩니다.</span>
                                                   </label>
                                               </div>
                                           </td>
                                           <th>
                                               <div class="tdRel">
                                                   판매자 상품번호
                                               </div>
                                           </th>
                                           <td>
                                               <div class="tdRel">
                                                   <label class="AXInputLabel">
                                                       <input type="text" name="" value="" placeholder="" class="AXInput" />
                                                       <span>판매자 상품코드 (SP0011-20292)</span>
                                                   </label>
                                               </div>
                                           </td>
                                       </tr>
                                       </tbody>
                                   </table>
                               </div>

                               <div class="ax-button-group">
                                   <div class="ax-align-center">
                                       <button type="button" class="AXButton W50 Blue" id="ax-grid-btn-regist">
                                           <i class="axi axi-plus-circle"></i> 등록
                                       </button>
                                       <button type="button" class="AXButton W50" id="ax-grid-btn-remove">
                                           <i class="axi axi-minus-circle"></i>
                                           삭제
                                       </button>
                                   </div>
                               </div>

                               <!-- e.본문 -->
                           </div>
                       </div>
				</div>
				<!-- e.CXPage -->					
					
			</div>
			<div class="ax-clear"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
    var page_menu_id = "m04"; // admin.js > topMenu_data 에 정의된 id
</script>
<script type="text/javascript">
    var fnObj = {
        pageStart: function(){

            this.bindEvent();
        },
        bindEvent: function(){
            var _this = this;

            $("#AXSelect_m0").bindSelect({
                ajaxUrl: "data/selectData.php", ajaxPars: "", ajaxAsync:false,
                isspace: true, isspaceTitle: "선택하세요",
                setValue:"",
                alwaysOnChange: true,
                onchange: function(){
                    //toast.push(Object.toJSON(this));

                    $("#AXSelect_m1").bindSelect({
                        ajaxUrl: "data/selectData.php", ajaxPars: "", ajaxAsync:false,
                        isspace: true, isspaceTitle: "선택하세요",
                        setValue:this.optionValue,
                        alwaysOnChange: true,
                        onchange: function(){
                            //toast.push(Object.toJSON(this));

                            $("#AXSelect_m2").bindSelect({
                                ajaxUrl: "data/selectData.php", ajaxPars: "", ajaxAsync:false,
                                isspace: true, isspaceTitle: "선택하세요",
                                setValue:this.optionValue,
                                alwaysOnChange: true,
                                onchange: function(){
                                    //toast.push(Object.toJSON(this));
                                }
                            });
                        }
                    });
                }
            });

            $("#selector-0").bindSelector({
                appendable:false,
                options:[
                    {optionValue:1, optionText:"Seoul"},
                    {optionValue:2, optionText:"대구"},
                    {optionValue:3, optionText:"대전"},
                    {optionValue:4, optionText:"창원"},
                    {optionValue:5, optionText:"마산"},
                    {optionValue:6, optionText:"구례"},
                    {optionValue:7, optionText:"제주도"},
                    {optionValue:8, optionText:"전주"},
                    {optionValue:4, optionText:"창원"},
                    {optionValue:5, optionText:"마산"},
                    {optionValue:6, optionText:"구례"},
                    {optionValue:7, optionText:"제주도"},
                    {optionValue:8, optionText:"전주"},
                    {optionValue:9, optionText:"Gwangju"}
                ],
                finder:{
                    onclick: function(){
                        AXUtil.alert(this);
                    }
                }
            });
            $("#selector-1").bindSelector({
                appendable:false,
                options:[
                    {optionValue:1, optionText:"Seoul"},
                    {optionValue:2, optionText:"대구"},
                    {optionValue:3, optionText:"대전"},
                    {optionValue:4, optionText:"창원"},
                    {optionValue:5, optionText:"마산"},
                    {optionValue:6, optionText:"구례"},
                    {optionValue:7, optionText:"제주도"},
                    {optionValue:8, optionText:"전주"},
                    {optionValue:4, optionText:"창원"},
                    {optionValue:5, optionText:"마산"},
                    {optionValue:6, optionText:"구례"},
                    {optionValue:7, optionText:"제주도"},
                    {optionValue:8, optionText:"전주"},
                    {optionValue:9, optionText:"Gwangju"}
                ],
                finder:{
                    onclick: function(){
                        AXUtil.alert(this);
                    }
                }
            });
        }
    };
</script>