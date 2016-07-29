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
				                	<c:if test="${!empty user.user_no}">
				                    	<button type="button" class="AXButton" onclick="fnObj.modal.open('INSERT',null)"><i class="axi axi-add"></i>등록</button>			                	          
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
           	 	    	console.log("조건 검색");
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
      	                 {key:"board_no", label:"번호", width:"100", align:"center"},
      	                 {key:"board_title", label:"제목", width:"*",},
      	                 {key:"user_name", label:"작성자", width:"100", align:"center"},
      	                 {key:"board_reg_time", label:"작성일", width:"120", align:"center",
      	                 	formatter:function(){
      	                 		return this.value.date().print("yyyy.mm.dd");
      	                 	}
      	                 },
      	                 {key:"board_read_cnt", label:"조회수", width:"70", align:"center"}
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
      	                 onchange: function(pageNo) {
      	                     dialog.push(Object.toJSON(this));
      	                     trace(this, pageNo);
      	                 }
      	             }
					 /* var _obj ={
						message_type:"",
						document_list: [
						//게시판의 내용이 들어갈 자리
						],
						page_navigation:{
							total_count:23, total_page:2,
							cur_page:1, page_count:2,
							first_page:1, last_page:2, point:0
						},
						error:0, message:"success"
					};
					    
					var gridData = {
						list: _obj.document_list,
						page:{
					    	pageNo: _obj.page_navigation.cur_page,
					    	pageSize: 20,
					    	pageCount: _obj.page_navigation.page_count,
					    	listCount: _obj.page_navigation.total_count
					    }
					}; 
					fnObj.boardList.target.setData(gridData);*/      	           
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
         	
             	this.target.open({
                 	url:"/YeaMin/boardModal.do",
                 	pars: pars.queryToObject(),
                 	top:100, width:600,
                 	closeByEscKey:true
             	});
         	}
     	}
	};
</script>