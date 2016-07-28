<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 리뷰 댓글 입력 폼 START -->
<form class="reviewAnswerInputForm" onsubmit="return false;" style="display: none;">
	<input type="hidden" name="user_no" value="${user.user_no}"/>
	<input type="hidden" id="review_no" name="review_no" value=""/>
	<div class="ax-rwd-table" style="margin:5px;">
		<div class="item-group" style="text-align: center">
            <div class="item-lable">
             <div style="display: inline-block; float: left; width: 10%;">
            		<img src="images/user.PNG" width="100" height="110" >
            	</div>
            	<div style="width: 88%; float: right; margin: 10px;">
            		<div>
            			<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" placeholder="댓글을 작성하세요."></textarea>
            		</div>
            		<div style="float: right;">
            			<input type="button" class="AXButton" value="등록" onclick="reviewFnObj.insertReviewAnswerInputForm();"/>
            			<input type="button" class="AXButton" value="취소" onclick="reviewFnObj.reviewAnswerInputFormDestory();"/>
            		</div>
            	</div>
            </div>		                                    
        	<div class="group-clear"></div>
    	</div>	
    </div>
</form>
<!-- 리뷰 댓글 입력 폼 END -->
<!-- 리뷰 등록 START -->
<form id="reviewInputform" method="get" onsubmit="return false;">
	<input type="hidden" name="user_no" value="${user.user_no}"/>
	<c:if test="${sessionScope.user.is_admin == 'N'}">
       	<div class="ax-rwd-table" style="margin:5px;">
       		<div class="item-group" style="text-align: center">
                   <div class="item-lable">
                   	<div style="width: 88%; float: right; margin: 10px;">
                   		<div>
                   			<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" placeholder="리뷰를 작성하세요."></textarea>
                   		</div>
                   		<div style="float: right;">
                   			<input type="button" class="AXButton" value="등록" onclick="reviewFnObj.reviewInsert();"/>
                   		</div>
                   	</div>
                   </div>		                                    
               	<div class="group-clear"></div>
           	</div>
        </div>
	</c:if>
</form>
<!-- 리뷰 등록 END -->
                  
<!-- 리뷰 리스트 START -->
<div class="ax-rwd-table" style="margin:5px;">
	<c:forEach var="item" items="${reviewList}">
		<!-- 리뷰 하나 START -->
		<div id="review_no_${item.review_no}" class="item-group" style="text-align: center">
			<div class="item-lable">
				<div style="display: inline-block; float: left; width: 10%;">
					<img src="images/user.PNG" width="100" height="110" >
				</div>
				<div style="width: 88%; float: right; margin: 10px;">
					<div style="font-size: 15px;">
						<div style="display: inline-block; float: left;">작성자 : ${item.user_name}</div>
							<div style="display: inline-block; float: right;">작성일 : ${item.review_reg_time}</div>
						</div>
					<div>
						<c:if test="${sessionScope.user != null}">
							<c:if test="${sessionScope.user.user_no eq item.user_no}">
								<textarea id="AXTextArea" name="review_content" class="review_content_${item.review_no}" style="width: 100%; height: 75px;">${item.review_content}</textarea>
							</c:if>
						</c:if>
						<c:if test="${sessionScope.user == null or sessionScope.user.user_no ne item.user_no}">
							<textarea id="AXTextArea" name="review_content" style="width: 100%; height: 75px;" readonly>${item.review_content}</textarea>
						</c:if>
					</div>
					<div style="float: right;">
						<c:if test="${sessionScope.user.is_admin eq 'Y' and item.review_re_step eq 0}">
							<c:if test="${item.review_answer_cnt eq 0}">
								<input type="button" class="AXButton" value="댓글등록" onclick="reviewFnObj.reviewAnswerInputFormShow(${item.review_no});"/>
							</c:if>
							<input type="button" class="AXButton" value="삭제" onclick="reviewFnObj.reviewDelete(${item.review_no});"/>
						</c:if>
						<c:if test="${sessionScope.user != null}">
							<c:if test="${sessionScope.user.user_no eq item.user_no}">
								<input type="button" class="AXButton" value="수정" onclick="reviewFnObj.reviewUpdate(${item.review_no});"/>
									<input type="button" class="AXButton" value="삭제" onclick="reviewFnObj.reviewDelete(${item.review_no});"/>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>		                                    
			<div class="group-clear"></div>
		</div>
	<!-- 리뷰 하나 END -->
	</c:forEach>
</div>
<!-- 리뷰 리스트 END -->

<script type="text/javascript">
	var reviewFnObj = {
		reviewInsert: function() {
			var data = $("#reviewInputform").serialize();
			
        	$.ajax({
		        url: "/YeaMin/insertReview.json",
		        type: "post",
		        data: data,
		        success: function(data) {
					var ret = JSON.parse(data);
					
		        	if(ret.result === "ok") { //리뷰 등록 성공
		        		fnHeaderObj.goMain();
		        		reviewInputform.review_content.value="";
		        	} else if(ret.result === "error") { //리뷰 등록 실패
		        		
		        	}
		        }
		    });
		},
		reviewUpdate: function(review_no) {
			var review_content = $(".review_content_"+review_no).val();
			var data = "review_no="+ review_no +"&review_content="+ review_content;
			
			$.ajax({
		        url: "/YeaMin/updateReview.json",
		        type: "post",
		        data: data,
		        success: function(data) {
					var ret = JSON.parse(data);
					
		        	if(ret.result === "ok") { //리뷰 수정 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") { //리뷰 수정 실패
		        		
		        	}
		        }
		    });
		},
		reviewDelete: function(review_no) {
			var data = "review_no="+ review_no;
			
			$.ajax({
		        url: "/YeaMin/deleteReview.json",
		        type: "post",
		        data: data,
		        success: function(data) {
					var ret = JSON.parse(data);
					
		        	if(ret.result === "ok") { //리뷰 삭제 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") { //리뷰 삭제 실패
		        		
		        	}
		        }
		    });
		},
		reviewAnswerInputFormShow: function(review_no) {
			reviewFnObj.reviewAnswerInputFormDestory();
			
			$("#review_no").val(review_no);
			
			var reviewAnswerInputForm = $(".reviewAnswerInputForm").clone();
			reviewAnswerInputForm.attr("id", "reviewAnswerInputForm");
			
			$("#review_no_"+review_no).after(reviewAnswerInputForm);
			reviewAnswerInputForm.show();	
		},
		reviewAnswerInputFormDestory: function() {
			$("#reviewAnswerInputForm").remove();
		},
		insertReviewAnswerInputForm: function() {
			var data = $("#reviewAnswerInputForm").serialize();
			
			$.ajax({
		        url: "/YeaMin/insertReviewAnswerInputForm.json",
		        type: "post",
		        data: data,
		        success: function(data) {
					var ret = JSON.parse(data);
					
		        	if(ret.result === "ok") { //댓글 등록 성공
		        		fnHeaderObj.goMain();
		        	} else if(ret.result === "error") { //댓글 등록 실패
		        		
		        	}
		        }
		    });
		}
	};
</script>