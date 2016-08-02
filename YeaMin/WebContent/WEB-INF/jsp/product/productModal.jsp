<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
		
		<title>${title}</title>
		
		<!-- jquery -->
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		
		<!-- axicon -->
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css"/>
		
		<!-- axisj -->
		<c:if test="${user == null or user.is_admin eq 'N'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/bulldog/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark/admin.css" id="axu-theme-admin"/>
		</c:if>
		<c:if test="${user.is_admin eq 'Y'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/kakao/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark-red/admin.css" id="axu-theme-admin"/>
		</c:if>
		
		<link rel="stylesheet" href="/YeaMin/ui/custom.css"/>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/lib/AXDivSlider.js"></script>
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>

		<!-- yeamin -->
		<link rel="stylesheet" href="/YeaMin/css/yeamin.css" />
		<script type="text/javascript" src="/YeaMin/js/yeamin.js"></script>
	    
		<script type="text/javascript">
		var orderby = []; // 상품 순서를 저장하고 있는 배열
		var fnObj = {
			pageStart: function(){
				$("#product_order_by").bindNumber({
					min: 1,
					onChange: function(){
						trace(orderby[0]);
						var change = this;
						var bool = false;
						for(var i=0;i<orderby.length;i++){
							if(change.value == orderby[i]){
								bool = true;
								break;
							}
						}
						if(bool){
							$("#productOrderByCheckRetMsg").show();
			        		$("#productOrderByCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + "해당 순서는 사용할 수 없습니다.");
						}else{
							$("#productOrderByCheckRetMsg").hide();
						}
					}
				});
				
				fnObj.upload.bind();
				if(form.product_img_origin_path.value){
					var tmplist=[];
					var tmp={
		        			_id_: "0",
							name: form.product_img_origin_path.value,
							type:".jsp",
							saveName: form.product_img_system_path.value,
							fileSize: 2097152,
							uploadedPath:"C:/ExpertJava/YM/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/YeaMin/save",
							thumbUrl:"/YeaMin/save/" + form.product_img_system_path.value
					};
					tmplist.push(tmp);
		    		fnObj.upload.target.setUploadedList(tmplist);
				}
			},
			pageResize: function(){
			    parent.productModal.resize();
			},
			insert: function() {
				if(emptyRequiredValueCheck()) return;
				
				var data = $("#form").serialize();
				   	
				$.ajax({
					url: "/YeaMin/insertProduct.json",
					type: "post",
					data: data ,
					success: function(data) {
						var ret = JSON.parse(data);
						     	
						if(ret.result === "ok") {
							parent.fnObj.search.submit();
							fnObj.close();
						}
					}
				});
			},
			update: function() {
				if(emptyRequiredValueCheck()) return;
				
				var data = $("#form").serialize();
				       	
				$.ajax({
					url: "/YeaMin/updateProduct.json",
					type: "post",
					data: data,
					success: function(data) {
						var ret = JSON.parse(data);
						
						if(ret.result === "ok") {
						parent.fnObj.search.submit();
						fnObj.close();
						}
					}
				});
       		},
			upload: {
				target: new AXUpload5(),
				bind: function() {
					this.target.setConfig({
						isSingleUpload:true,
						targetID:"AXUpload5",
						targetButtonClass:"Blue",
						
						onClickUploadedItem: function(){
							// trace(this);
							window.open("/YeaMin/fileDownload.do?name=" + this.name.dec() + "&saveName=" + this.saveName.dec(), "_self");
						},
						uploadMaxFileSize:(10*1024*1024),
						uploadMaxFileCount:0,
						uploadUrl:"fileUpload.do",
						uploadPars:{},
						deleteUrl:"fileDelete.do",
						deletePars:{},
						fileKeys:{
							name:"name",
							type:"type",
							saveName:"saveName",
							fileSize:"fileSize",
							uploadedPath:"uploadedPath",
							thumbPath:"thumbUrl" // 서버에서 키값을 다르게 설정 할 수 있다는 것을 확인 하기 위해 이름을 다르게 처리한 예제 입니다.
						},
						onComplete: function(){
							trace(fnObj.upload.target.getUploadedList());
							var img=this;
							var name=img[0].name;
							var saveName=img[0].saveName;
							$('input[name=product_img_origin_path]').val(name);
							$('input[name=product_img_system_path]').val(saveName);					
						},
						onStart: function(){
							// trace(this);
						},
						onDelete: function(){
							//trace(this);
													
						},
						onError: function(errorType, extData) {
							trace("------------------ onError");
							if(errorType == "html5Support"){
								//dialog.push('The File APIs are not fully supported in this browser.');
							} else if(errorType == "fileSize") {
								trace(extData);
								alert("파일사이즈가 초과된 파일을 업로드 할 수 없습니다. 업로드 목록에서 제외 합니다.\n("+extData.name+" : "+extData.size.byte()+")");
							} else if(errorType == "fileCount") {
								alert("업로드 갯수 초과 초과된 아이템은 업로드 되지 않습니다.");
							}
						}
					});
				}
			},
       		close: function() {
       			parent.productModal.close();
			}		     
		};
		//axdom(window).ready(fnObj.pageStart);
		axdom(window).resize(fnObj.pageResize);
		$(document).ready(function(){
			$.ajax({
		        url: "/YeaMin/selectProductList.json",
		        type: "post",
		        data: "",
		        success: function(data) {
		        	var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
						for(var i=0;i<ret.list.length;i++){
							orderby[i] = ret.list[i].product_order_by;
						}
		        	}
		        }
		    });
		});

		</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>상품 정보 관리
		                	<c:if test="${modalType eq 'INSERT'}">
		                		 - 등록
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 - 수정
		                	</c:if>
		                </h1>
		                <p class="desc">컨텐츠 상세 설명을 넣어주세요.</p>
		            </div>
		        </div>
		        <div class="ax-clear"></div>
		    </div>
		    
			<div class="ax-modal-body">
		        <div class="ax-wrap">
		            <div class="ax-layer">
		                <div class="ax-col-12">
		
		                    <form id="form" method="get" onsubmit="return false;">
		                    	<input type="hidden" name="product_no" value="${dto.product_no}"/>
		                    	<input type="hidden" name="product_img_origin_path" value="${dto.product_img_origin_path}"/>
								<input type="hidden" name="product_img_system_path" value="${dto.product_img_system_path}"/>
		                        <div class="ax-rwd-table">
									<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                        	${dto.product_no}
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">카테고리 이름</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<%-- <input type="text" name="product_category_name" class="AXInput W150" id="product_category_name" value="${dto.product_category_name}" /> --%>
		                                        	<select name="product_category_no">
		                                        		<c:forEach var="category" items="${productCategoryList}">
			                                        		<option value="${category.product_category_no}">${category.product_category_name}</option>
			                                        	</c:forEach>
		                                        	</select>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_name">
		                                        <span class="th" style="min-width:100px;">상품 이름</span>
		                                        <span class="td inputText" style="" title="">
													<input type="tel" id="product_name" name="product_name" value="${dto.product_name}" class="AXInput W50" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_price">
		                                        <span class="th" style="min-width:100px;">상품 가격</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<input type="text" id="product_price" name="product_price" class="AXInput W150" value="${dto.product_price}" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_desc">
		                                        <span class="th" style="min-width:100px;">상품 소개</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<textarea id="product_desc" name="product_desc" class="AXInput W150" style="width:400px; height:130px;">${dto.product_desc}</textarea>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_order_by">
		                                        <span class="th" style="min-width:100px;">상품 순서</span>
		                                        <span class="td inputText" style="" title="">
													<input type="tel" id="product_order_by" name="product_order_by" value="${dto.product_order_by}" class="AXInput W50" />
		                                        	<span id="productOrderByCheckRetMsg" class="ret-msg"></span>	
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품이미지</span>
		                                        <span class="td inputText" style="" title="">																							       
												    <span class="AXUpload5" id="AXUpload5"></span>										 
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                        </div>
		                    </form>
		
		                </div>
		                <div class="ax-clear"></div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		                <div class="ax-unit center">
		                	<c:if test="${modalType eq 'INSERT'}">
		                		 <button type="button" class="AXButton" onclick="fnObj.insert()">등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 <button type="button" class="AXButton" onclick="fnObj.update()">수정</button>
		                	</c:if>
		                    <button type="button" class="AXButton" onclick="fnObj.close()">닫기</button>
		                </div>
		            </div>
		            <div class="ax-clear"></div>
		        </div>
		    </div>
		    
		</div>
	</body>
</html>