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
	var fnObj = {
			pageStart: function(){
				
			},
	        pageResize: function(){
	            parent.myModal.resize();
	        },
	        boardInsert: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
	        	var data = $("#form").serialize();
	        	trace(data);
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
	        boardUpdate: function() {
	        	if(emptyRequiredValueCheck()) return;
	        	
				var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/updateBoard.json",
			        type: "post",
			        data: data,
			        success: function(data) {
			        	var ret = JSON.parse(data);
			     		
			        	if(ret.result === "ok") {
			        		fnObj.close();
			        		parent.fnObj.select();
			        	}
			        }
			    });
	        },	        
	        boardDelete: function() {
	        	var data = $("#form").serialize();
	        	
	        	$.ajax({
			        url: "/YeaMin/deleteBoard.json",
			        type: "post",
			        data: data,
			        success: function(data) {
						var ret = JSON.parse(data);
			     		
			        	if(ret.result === "ok") {
			        		fnObj.close();
			        		parent.fnObj.select();
			        	}else{
			        		dialog.push("삭제 할 수 없습니다.");
			        	}
			        }
			    });
	        },
	        replyModal: function(board_no){
	        	parent.fnObj.replyChange(board_no);
	        },
	        replyInsert: function() {
				if(emptyRequiredValueCheck()) return;
	        	
	        	var data = $("#form").serialize();

	        	 $.ajax({
			        url: "/YeaMin/insertReply.json",
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
	        close: function() {
	        	parent.myModal.close();
	        }		     
		};
	   //axdom(window).ready(fnObj.pageStart);
	   //axdom(window).resize(fnObj.pageResize);
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
		                    	<input type="hidden" id="user_no" name="user_no" value="${user.user_no}"/>
		                    	<input type="hidden" name="board_re_ref" value="${dto.board_re_ref}"/>
		                    	<input type="hidden" name="board_re_step" value="${dto.board_re_step}"/>
		                    	<input type="hidden" name="board_re_level" value="${dto.board_re_level}"/>
		                        <div class="ax-rwd-table">
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable">
		                                        <span class="th" style="min-width:100px;">글 번호</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<c:if test="${modalType ne 'REPLY'}">
		                                        		${dto.board_no}
		                                        		<input type="hidden" id="board_no" name="board_no" value="${dto.board_no}"/>
		                                        	</c:if>
		                                        	<c:if test="${modalType eq 'REPLY'}">
		                                        		<input type="hidden" id="board_no" name="board_no" value="${board_no}"/>
		                                        	</c:if>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="board_title">
		                                        <span class="th" style="min-width:100px;">제목</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<c:if test="${user.user_name == dto.user_name or modalType eq 'INSERT' or modalType eq 'REPLY'}">
		                                        		<input type="text" id="board_title" name="board_title" class="AXInput W200" value="${dto.board_title}" />
		                                        	</c:if>
		                                        	<c:if test="${user.user_name != dto.user_name}">
		                                        		<c:if test="${modalType eq 'UPDATE'}">
		                                        			<input type="text" id="board_title" name="board_title" class="AXInput W200" value="${dto.board_title}" readonly/>
		                                        		</c:if>
		                                        	</c:if>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_name">
		                                        <span class="th" style="min-width:100px;">작성자</span>
		                                        <span class="td inputText" style="" title="">
		                                        <c:if test="${modalType eq 'INSERT' or modalType eq 'REPLY'}">
							                		 <input type="text" id="user_name" name="user_name" value="${user.user_name}" class="AXInput W70" readonly/>
							                	</c:if>
							                	<c:if test="${modalType eq 'UPDATE'}">
							                		 <input type="text" id="user_name" name="user_name" value="${dto.user_name}" class="AXInput W70" readonly/>
							                	</c:if>
		                                        </span>
		                                    </label>
		                                </div>
		                                <div class="item-clear"></div>
		                                <div class="group-clear"></div>
		                            </div>		                           
		                            <div class="item-group" style="">
		                                <div class="item">
		                                    <label class="item-lable" for="user_name">
		                                        <span class="th" style="min-width:100px;">글 내용</span>
		                                        <span class="td inputText" style="" title="">
		                                        	<c:if test="${user.user_name == dto.user_name or modalType eq 'INSERT' or modalType eq 'REPLY'}">
		                                        		<textarea id="board_content" name="board_content" class="AXInput W150" style="width:450px; height:130px;">${dto.board_content}</textarea>
		                                        	</c:if>
		                                        	<c:if test="${user.user_name != dto.user_name}">
		                                        		<c:if test="${modalType eq 'UPDATE'}">
		                                        			<textarea id="board_content" name="board_content" class="AXInput W150" style="width:450px; height:130px;" readonly>${dto.board_content}</textarea>
		                                        		</c:if>
		                                        	</c:if>
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
		                		<button type="button" class="AXButton" onclick="fnObj.boardInsert()">등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'REPLY'}">
		                		<button type="button" class="AXButton" onclick="fnObj.replyInsert(${board_no})">댓글등록</button>
		                	</c:if>
		                	<c:if test="${modalType eq 'UPDATE'}">
		                		<c:if test="${user.user_name == dto.user_name}">
			                		<button type="button" class="AXButton" onclick="fnObj.boardUpdate()">수정</button>
			                		<c:if test="${user.is_admin == 'N'}">
			                			<button type="button" class="AXButton" onclick="fnObj.boardDelete()">삭제</button>
			                		</c:if>
			                	</c:if>
			                	<c:if test="${user.user_name != dto.user_name and user.is_admin == 'N'}">
			                		<c:if test="${!empty user.user_name and dto.user_name ne '사장님'}">
			                			<button type="button" class="AXButton" onclick="fnObj.replyModal(${dto.board_no})">댓글</button>
			                		</c:if>
			                	</c:if>
		                	</c:if>
		                	<c:if test="${user.is_admin == 'Y' and modalType ne 'INSERT'}">
		                		<button type="button" class="AXButton" onclick="fnObj.boardDelete()">삭제</button>
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