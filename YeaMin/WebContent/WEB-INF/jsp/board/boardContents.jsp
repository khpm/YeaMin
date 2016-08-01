<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>게시판</h1>
				<p class="desc"></p>
			</div>
			<div class="ax-clear"></div>
		</div>
		
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
				<div id="AXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
									<!-- 게시판 출력 부분 -->							
									<div id="AXGridTarget" style="margin:5px; height:400px;"></div>
									<!-- 게시판 출력 부분 -->	
								</div>
							</div>
						</div>
						<div class="ax-clear"></div>
					</div>
				</div>
					
				<div class="ax-modal-footer">
			        <div class="ax-wrap">
			            <div class="ax-col-12">
			            	<div class="ax-button-group">
				                <div class="ax-unit center" style="float:left;">
				                	<c:if test="${!empty user.user_no and user.is_admin == 'N'}">
				                    	<button type="button" class="AXButton" onclick="fnObj.modal.open('INSERT',null)"><i class="axi axi-add"></i>등록</button>			                	          
				                	</c:if>
				                	<c:if test="${user.is_admin == 'Y'}">
				                		<button type="button" class="AXButton" onclick="fnObj.modal.open('INSERT',null)"><i class="axi axi-add"></i>공지등록</button>			                	       
				                	</c:if>				                	
				                </div>
				                <form id="searchForm">
					                <div class="ax-unit right" style="float:right;">
					                <input type="text" name="searchType" id="AXInputSelector_text" value="" class="AXInput" data-axbind="selector" style="height:22px;padding:1.5px;" readonly/>
					                	<input type="text" name="searchMsg" id="AXInputSearch4" class="AXInputSmail" value="" style="padding-bottom:3px"/>
					                	<button type="button" class="AXButton" onclick="fnObj.boardSearch();"><i class="axi axi-search"></i>검색</button>
					                </div>
					            </form>
				            </div> 
			            </div>
			            <div class="ax-clear"></div>
			        </div>
		    	</div>
		    		
			</div>
			<div class="ax-clear"></div>
		</div>	
	</div>
</div>

<script type="text/javascript">

	var fnObj = {	 
 		primaryKey: "board_no",
 		
      	pageStart: function(){
      		fnObj.modal.bind();
      		fnObj.boardSelector();
      		fnObj.boardList.bind();
      		fnObj.select();
      	},
      	boardSearch: function() {		
      		var data = $("#searchForm").serialize();
      		
      		fnObj.boardList.target.setData(
   				fnObj.boardList.target.setList({
           			ajaxUrl: "selectBoardList.json",
           	 	    ajaxPars: data,
           	 	    onLoad: function(){
           	 	    }
           	 	})
           	);
      	},
      	boardSelector: function() {
      		jQuery("#AXInputSelector_text").bindSelector({
				appendable:true,
				options:[
					{optionValue:1, optionText:"제목"},
					{optionValue:2, optionText:"내용"},
					{optionValue:3, optionText:"작성자"},
					{optionValue:4, optionText:"제목+내용"},
				]
			});
      	},
      	boardList: {
      		target: new AXGrid(),
      		get: function(){ return this.target },
      		bind: function() {
      			this.target.setConfig({
      	             targetID : "AXGridTarget",
      	             theme : "AXGrid",
      	             colHeadAlign: "center",
      	             colGroup : [
      	                 {key:"board_no", label:"번호", width:"100", align:"center", formatter: function() {
      	                	 var value = this.value;
      	                	 
      	                	 if(this.item.is_admin == "Y") {
      	                		value = "<span style='color: red; font-weight: bold;'>" + value + "</span>";
      	                	 }
      	                	 
      	                	return value;
      	                 }},
      	                 {key:"board_title", label:"제목", width:"*", formatter: function(){
      	                	var value = this.value;
     	                	 
     	                	 if(this.item.is_admin == "Y") {
     	                		value = "<span style='color: red; font-weight: bold;'>" + value + "</span>";
     	                	 }
     	                	 
     	                	return value;
      	                 }},
      	                 {key:"user_name", label:"작성자", width:"100", align:"center", formatter: function(){
       	                	var value = this.value;
    	                	 
    	                	 if(this.item.is_admin == "Y") {
    	                		value = "<span style='color: red; font-weight: bold;'>" + value + "</span>";
    	                	 }
    	                	 
    	                	return value;
     	                 }},
      	                 {key:"board_reg_time", label:"작성일", width:"120", align:"center", formatter: function(){
       	                	var value = this.value.date().print("yyyy.mm.dd");
    	                	 
    	                	 if(this.item.is_admin == "Y") {
    	                		value = "<span style='color: red; font-weight: bold;'>" + value + "</span>";
    	                	 }
    	                	 
    	                	return value;
     	                 }},
      	                 {key:"board_read_cnt", label:"조회수", width:"70", align:"center", formatter: function(){
        	                	var value = this.value;
       	                	 
       	                	 if(this.item.is_admin == "Y") {
       	                		value = "<span style='color: red; font-weight: bold;'>" + value + "</span>";
       	                	 }
       	                	 
       	                	return value;
        	                 }}
      	             ],	                
      	             body: {
      	                 onclick: function(){ //게시글 클릭시 발생하는 이벤트
      	                 	//var params =this.item; 	                    
      	                 	//fnObj.modal.open("UPDATE",params.board_no);
      	                 	var selectedItem = {"index":0, "item":this.item};
      	                 	fnObj.modal.open("UPDATE",selectedItem.item);
      	                     //toast.push(Object.toJSON(this.item));
      	                     //alert(this.list);
      	                     //alert(this.page);     	                
      	                 }
      	             },     	             
      	             page:{
      	                 paging: true,
      	                 pageNo:1,
      	                 onchange: function(pageNo) {
      	                	var data = $("#searchForm").serialize();
      	                	console.log(pageNo);
     	                	 fnObj.boardList.target.setData(
     	          				fnObj.boardList.target.setList({
     	                 			ajaxUrl: "selectBoardList.json",
     	                 	 	    ajaxPars: "&" +data,
     	                 	 	    onLoad: function(){
     	                 	 	    } 
     	                  		}, false, "", "paging")
     	                  	);
      	                 }
      	             }     	           
				});
			}
		},
		select: function() {
			fnObj.boardList.target.setData(
				fnObj.boardList.target.setList({
          			ajaxUrl: "selectBoardList.json",
          	 	    ajaxPars: "",
          	 	    onLoad: function(){
          	 	    } 
          	 	})
        	);
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
         	open: function(modalType, item){
         		var pars = "modalType=" + modalType;
         	
         		if(modalType === "UPDATE") {
         			pars += ("&" + fnObj.primaryKey + "=" + item[fnObj.primaryKey]);
         		}
         		
         		if(modalType === "REPLY") {
         			pars += ("&" + fnObj.primaryKey + "=" + item);
         		}
         	
             	this.target.open({
                 	url:"/YeaMin/boardModal.do",
                 	pars: pars.queryToObject(),
                 	top:100, width:600,
                 	closeByEscKey:true
             	});
         	}
     	},
     	replyChange: function(board_no) {
     		fnObj.modal.target.close();
     		fnObj.modal.open('REPLY',board_no);
     	}
	};
</script>