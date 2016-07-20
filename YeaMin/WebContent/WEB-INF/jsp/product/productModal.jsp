<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>${title}</title>
		
		<link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
		<link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
	
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css"/>
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/AXJ.min.css" id="axu-theme-axisj"/>
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/page.css"/>
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/AXButton.css"/>
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/AXJ.css"/>
		
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/lib/AXUpload5.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/lib/AXJ.js"></script>
	
		<link rel="stylesheet" href="/YeaMin/ui/cacao/admin.css" id="axu-theme-admin"/>
		<link rel="stylesheet" href="/YeaMin/ui/custom.css"/>
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		<script type="text/javascript" src="/YeaMin/resource/Chart.min.js"></script>

		<script type="text/javascript">
		
		var fnObj = {
				pageStart: function(){
					$("#product_order_by").bindNumber({
						min: 1,
						onChange: function(){
							// trace(this);
						}
					});
				},
		        pageResize: function(){
		            parent.myModal.resize();
		        },
		        insert: function() {
		        	var data = $("#form").serialize();
		        	
		        	$.ajax({
				        url: "",
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
					var data = $("#form").serialize();
		        	
		        	$.ajax({
				        url: "",
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
		        	parent.myModal.close();
		        }		     
			};
		   axdom(window).ready(fnObj.pageStart);
		   axdom(window).resize(fnObj.pageResize);
		</script>
	</head>
	<body>
		<div id="AXPage" class="bodyHeightDiv">
			
		    <div class="ax-modal-header">
		        <div class="ax-col-12">
		            <div class="ax-unit">
		                <h1>컨텐츠 제목</h1>
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
		                        <div class="ax-rwd-table">
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                        	${dto.product_no}
		                                        	<input type="hidden" name="product_category_no" value="${dto.product_no}"/>
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
		                                        	<input type="text" name="product_category_name" class="AXInput W150" id="product_category_name" value="${dto.product_category_name}" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 이름</span>
		                                        <span class="td inputText" style="" title="">
													<input type="tel" name="product_name" id="product_name" value="${dto.product_name}" class="AXInput W50" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 가격</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<input type="text" name="product_price" class="AXInput W150" id="product_price" value="${dto.product_price}" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 소개</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<textarea name="product_desc" class="AXInput W150" id="product_desc" style="width:400px; height:130px;">${dto.product_desc}</textarea>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">상품 순서</span>
		                                        <span class="td inputText" style="" title="">
													<input type="tel" name="product_order_by" id="product_order_by" value="${dto.product_order_by}" class="AXInput W50" />
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
												    <button type="button" class="AXButton" onclick="">업로드</button>										
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