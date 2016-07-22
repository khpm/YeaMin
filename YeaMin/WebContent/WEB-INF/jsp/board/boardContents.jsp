<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
	
	    <title></title>
	
	    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	
	    <link rel="stylesheet" type="text/css" href="http://cdno.axisj.com/axicon/axicon.min.css" />
	    <link rel="stylesheet" type="text/css" href="http://cdno.axisj.com/axisj/ui/kakao/AXJ.min.css" id="axu-theme-axisj" />
	
	    <script type="text/javascript" src="http://cdno.axisj.com/axisj/jquery/jquery.min.js"></script>
	    <script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
	
	    <link rel="stylesheet" href="ui/cacao/admin.css" id="axu-theme-admin" />
	    <link rel="stylesheet" href="ui/custom.css" />
	    <link rel="stylesheet" href="css/yeamin.css" />
	    
	    <script type="text/javascript">
	    /**
	     * Require Files for AXISJ UI Component...
	     * Based        : jQuery
	     * Javascript   : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
	     * CSS          : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelector.css
	     */    
	    var pageID = "setData";
	    var myGrid = new AXGrid();
	    var itemSum = 0;

	    var fnObj = {	 
	    	primaryKey: "board_no",
		        pageStart: function(){
		        	this.modal.bind();
		        	jQuery("#AXInputSelector_text").bindSelector({
						appendable:true,
						options:[
							{optionValue:1, optionText:"제목"},
							{optionValue:2, optionText:"내용"},
							{optionValue:3, optionText:"작성자"},
							{optionValue:4, optionText:"제목+내용"},
						]
					}
		        );
	            myGrid.setConfig({
	                targetID : "AXGridTarget",
	                theme : "AXGrid",
	                colHeadAlign: "center", // 헤드의 기본 정렬 값
	                colGroup : [
	                    {key:"board_no", label:"번호", width:"100", align:"center"},
	                    {key:"board_title", label:"제목", width:"*",
	                        /* formatter:function(){
	                            //return this.item.title;
	                        } */
	                    },
	                    {key:"user_name", label:"작성자", width:"100", align:"center"},
	                    {key:"board_reg_time", label:"작성일", width:"120", align:"center",
	                         formatter:function(){
	                            return this.value.date().print("yyyy.mm.dd");
	                        }
	                    },
	                    {key:"board_read_cnt", label:"조회수", width:"70", align:"center"}
	                ],	                
	                body : {
	                    marker: function(){
	                        
	                    },
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
	                    paging:true,
	                    onchange: function(pageNo){
	                        dialog.push(Object.toJSON(this));
	                        trace(this, pageNo);
	                    }
	                }
	            });
		        myGrid.setData(
			        myGrid.setList({
					    ajaxUrl: "selectBoardList.json",
					    ajaxPars: "",
					    onLoad: function(){
					    } 
					})
				);

	            var _obj ={
	                message_type:"",
	                document_list: [
	     			//게시판의 내용이 들어갈 자리
	                ],
	                page_navigation:{
	                    total_count:23, total_page:2, cur_page:1, page_count:2, first_page:1, last_page:2, point:0
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
	            myGrid.setData(gridData);
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
	        },
	        select: function(){
	        	myGrid.setData(
					myGrid.setList({
						ajaxUrl: "selectBoardList.json",
						ajaxPars: "",
						onLoad: function(){
						} 
					})
				);
	        }
	    };
	    //axdom(window).ready(fnObj.pageStart);
	    </script>	    
	</head>
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
					
				<!-- s.CXPage -->
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
				<!-- e.CXPage -->					
				<div class="ax-modal-footer">
		        <div class="ax-wrap">
		            <div class="ax-col-12">
		            	<div class="ax-button-group">
			                <div class="ax-unit center" style="float:left;">
			                    <button type="button" class="AXButton" onclick="fnObj.modal.open('INSERT',null)"><i class="axi axi-add"></i>등록</button>			                	          
			                </div>
			                <div class="ax-unit right" style="float:right;">
			                <input type="text" name="inputSelector_text" id="AXInputSelector_text" value="" class="AXInput" data-axbind="selector" style="height:22px;padding:1.5px;" readonly/>
			                	<input type="text" name="search" id="AXInputSearch4" class="AXInputSmail" style="padding-bottom:3px"/>
			                	<button type="button" class="AXButton" onclick=""><i class="axi axi-search"></i>검색</button>
			                </div>
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
</html>