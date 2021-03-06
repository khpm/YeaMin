<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
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
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/cocker/AXJ.min.css" id="axu-theme-axisj"/>
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
		var fnObj = {
			pageStart: function(){
				$("#product_category_order_by").bindNumber({
					min: 1,
					onChange: function(){
						$.ajax({
			        		url: "/YeaMin/productCategoryOrderByDuplicationCheck.json",
					        type: "post",
					        data: "product_category_order_by="+$("#product_category_order_by").val(),
					        success: function(data) {
								var ret = JSON.parse(data);
								
								if(ret.result === "ok") {
			        				$("#productCategoryOrderByCheckRetMsg").hide();
					        		$("#insertBtn").attr("disabled",false);
					        		$("#updateBtn").attr("disabled",false);
					        	} else {
					        		$("#productCategoryOrderByCheckRetMsg").show();
					        		$("#productCategoryOrderByCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
			        				$("#insertBtn").attr("disabled",true);
					        		$("#updateBtn").attr("disabled",true);
					        	}
					        }
					    });
					}
				});
				
				$("#product_category_name").bind("keyup", function(event) {
					if($("#product_category_name").val() != ''){
						var data = $("#form").serialize();
			        	
			        	$.ajax({
					        url: "/YeaMin/productCategoryNameDuplicationCheck.json",
					        type: "post",
					        data: "product_category_name=" + $("#product_category_name").val(),
					        success: function(data) {
								var ret = JSON.parse(data);
					        	
					        	if(ret.result === "ok") {
					        		$("#productCategoryNameDuplicationCheckRetMsg").hide();
					        		$("#insertBtn").attr("disabled",false);
					        		$("#updateBtn").attr("disabled",false);
					        	} else if(ret.result === "error") {
					        		$("#productCategoryNameDuplicationCheckRetMsg").show();
					        		$("#productCategoryNameDuplicationCheckRetMsg").html("<i class='axi axi-exclamation-triangle'></i> " + ret.msg);
					        		$("#insertBtn").attr("disabled",true);
					        		$("#updateBtn").attr("disabled",true);
					        	}
					        }
					    });
					}
				});
			},
			pageResize: function(){
	            parent.productCategoryModal.resize();
	        },
	        insert: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
	        	var data = $("#form").serialize();
	        	
	        	$.ajax({
	        		url: "/YeaMin/insertProductCategory.json",
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
	        update: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
				var data = $("#form").serialize();
	        	
	        	$.ajax({
	        		 url: "/YeaMin/updateProductCategory.json",
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
	        close: function() {
	        	parent.productCategoryModal.close();
	        }
		};
	    ;
		</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>상품 카테고리 정보 관리
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
		                    	<input type="hidden" name="product_category_no" value="${dto.product_category_no}"/>
		                        <div class="ax-rwd-table">
									<div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:130px;">상품 카테고리 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                        	${dto.product_category_no}
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_category_name">
		                                        <span class="th" style="min-width:130px;">상품 카테고리 이름</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<input type="text" id="product_category_name" name="product_category_name" class="AXInput W150" value="${dto.product_category_name}" />
		                                        	<span id="productCategoryNameDuplicationCheckRetMsg" class="ret-msg"></span>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="product_category_order_by">
		                                        <span class="th" style="min-width:130px;">상품 카테고리 순서</span>
		                                        <span class="td inputText" style="" title="">
													<input type="tel" id="product_category_order_by" name="product_category_order_by" value="${dto.product_category_order_by}" class="AXInput W50" />
													<span id="productCategoryOrderByCheckRetMsg" class="ret-msg"></span>
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
		                		 <button id="insertBtn" type="button" class="AXButton" onclick="fnObj.insert()">등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		 <button id="updateBtn" type="button" class="AXButton" onclick="fnObj.update()">수정</button>
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