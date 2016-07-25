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
					
				},
		        pageResize: function(){
		            parent.myModal.resize();
		        },
		        insert: function() {
		        	var data = $("#form").serialize();
		        	//trace(data);
		        	$.ajax({
				        url: "/YeaMin/insertBoard.json",
				        type: "post",
				        data: data,
				        success: function(data) {
							var ret = JSON.parse(data);
				        	
				        	if(ret.result === "ok") {				    
				        		fnObj.close();
				        		//등록 후 게시글 리스트 뿌려주기~
				        		parent.fnObj.select();
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
		                <h1>게시글</h1>
		                <p class="desc"></p>
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
		                                        <span class="th" style="min-width:100px;">글 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                        	${dto.board_no}
		                                        	<input type="hidden" id="board_no" name="board_no" value="${dto.board_no}"/>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">제목</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<input type="text" id="board_title" name="board_title" class="AXInput W200" id="board_title" value="${dto.board_title}" />
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">작성자</span>
		                                        <span class="td inputText" style="" title="">
													<input type="text" value="${user.user_name}" class="AXInput W70" readonly/>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>		                           
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">글 내용</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<textarea name="board_content" class="AXInput W150" id="board_content" style="width:450px; height:130px;">${dto.board_content}</textarea>
		                                        	<input type="hidden" id="user_no" name="user_no" value="${user.user_no}"/>
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