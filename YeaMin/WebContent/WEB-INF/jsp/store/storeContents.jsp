<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>가게 정보 관리</h1>
				<p class="desc">가게 정보를 관리합니다.</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">
			
				<!-- s.CXPage -->
				<div id="CXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
								
									<form id="form" method="get" onsubmit="return false;">
		                       			<div class="ax-rwd-table" style="margin:5px;">
											<div class="item-group">
				                                <div class="item">
				                                    <label class="item-lable" for="store_name">
				                                        <span class="th" style="min-width:100px;">가게 이름</span>
				                                        <span class="td inputText" style="" title="">
				                                            <input type="text" id="store_name" name="store_name" title="" placeholder="" value="${dto.store_name}" class="AXInput av-required W150"/>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable" for="store_tel">
				                                        <span class="th" style="min-width:100px;">가게 전화번호</span>
				                                        <span class="td inputText" style="" title="">
				                                            <input type="tel" id="store_tel" name="store_tel" title="" placeholder="" value="${dto.store_tel}" class="AXInput av-required W150" />
				                                        </span>		                                      
				                                    </label>		                                    
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable" for="store_addr">
				                                        <span class="th" style="min-width:100px;">가게 주소</span>
				                                        <span class="td inputText" style="" title="">
				                                            <input type="text" id="store_addr" name="store_addr" title="" placeholder="" value="${dto.store_addr}" class="AXInput av-required W400" readonly/>
				                                            <input type="button" class="AXButton" onclick="sample5_execDaumPostcode()" value="주소 검색">
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable" for="store_desc">
				                                        <span class="th" style="min-width:100px;">가게 설명</span>
				                                        <span class="td inputText" style="" title="">
				                                            <textarea id="store_desc" name="store_desc" class="AXInput W150" style="width:470px; height:130px;">${dto.store_desc}</textarea>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable" for="store_week_business_time">
				                                        <span class="th" style="min-width:100px;">주중 영업 시간</span>
				                                        <span class="td inputText" style="" title="">
				                                            <input type="text" id="store_week_business_time" name="store_week_business_time" title="" value="${dto.store_week_business_time}" class="AXInput av-required W400"/>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable" for="store_weekend_business_time">
				                                        <span class="th" style="min-width:100px;">주말 영업 시간</span>
				                                        <span class="td inputText" style="" title="">
				                                            <input type="text" id="store_weekend_business_time" name="store_weekend_business_time" title="" value="${dto.store_weekend_business_time}" class="AXInput av-required W400"/>
				                                        </span>
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>
				                            <div class="item-group" style="">
				                                <div class="item">
				                                    <label class="item-lable">
				                                        <span class="th" style="min-width:100px;">가게 이미지</span>		                                        
				                                        	<!-- 이미지 부분 -->
				                                        <span class="td">												            
														    <div class="AXdemoPageContent">
														    	<div class="AXUpload5" id="AXUpload5"></div>
														    	<div class="H10"></div>
														    	<div id="uploadQueueBox" class="AXUpload5QueueBox" style="height:188px; width:490px;"></div>
														    	<div class="H10"></div>
															</div>
														</span>				                                        
				                                    </label>
				                                </div>
				                                <div class="item-clear"></div>
				                                <div class="group-clear"></div>
				                            </div>		                            
		                        		</div>
		                    		</form>
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
			                <div class="ax-unit center">
			                	<c:if test="${empty dto.store_name}">
			                    <button type="button" class="AXButton" onclick="fnObj.storeInsert();">등록</button>
			                    </c:if>
			                    <c:if test="${!empty dto.store_name}">
			                    <button type="button" class="AXButton" onclick="fnObj.storeUpdate();">수정</button>
			                    </c:if>
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
	var page_menu_id = "m0101"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
	function sample5_execDaumPostcode() {
	 	new daum.Postcode({
	 		oncomplete: function(data) {
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = data.address; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 기본 주소가 도로명 타입일때 조합한다.
	            if(data.addressType === 'R'){
	            	//법정동명이 있을 경우 추가한다.
	            	if(data.bname !== ''){
	                	extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("store_addr").value = fullAddr;	            
	    	}
		}).open();
	}
	var fnObj = {
		pageStart: function(){				
			fnObj.upload.bind();
		},			
	    pageResize: function(){
	    	//parent.userInsertModal.resize();
	    },
		load : function(){
	    	var uploadedList = [];
	       	$.ajax({
		        url: "/YeaMin/selectStoreImg.json",
		        type: "post",
		        data: "" ,
		        success: function(data) {
					var ret = JSON.parse(data);
					trace(ret);
		        	if(ret.result === "ok") {
		        		trace("이미지 조회 수행")
		        		for(var i=0;i<ret.listDto.length;i++){
			        		var tmp={
			        			_id_: i,
								name: ret.listDto[i].store_img_origin_path,
								type:"jsp",
								saveName: ret.listDto[i].store_img_system_path,
								fileSize: 2097152,
								uploadedPath:"C:/ExpertJava/YM/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/YeaMin/save",
								thumbUrl:"http://localhost:8080/YeaMin/save/" + ret.listDto[i].store_img_system_path
			        		};
			        		uploadedList.push(tmp);
		        		}//for문
		        		fnObj.upload.target.setUploadedList(uploadedList);        		
		        	} else if(ret.result === "error") {
		        		//이미지 조회 실패
		        	}
		        }
		    });
		},
	    storeInsert: function(){
	    	if(emptyRequiredValueCheck()) return;
	    	
	    	var data = $("#form").serialize();
	       	$.ajax({
		        url: "/YeaMin/insertStore.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//등록 성공
		        		fnObj.insertStoreImg();
		        		setTimeout(function() {
		        			location.href="/YeaMin/storeContents.do";
		        		}, 500);
		        	} else if(ret.result === "error") {
		        		//등록 실패
		        		location.href="/YeaMin/main.do";
		        	}
		        }
		    });
		},
		storeUpdate: function() {
			if(emptyRequiredValueCheck()) return;
			
	       	var data = $("#form").serialize();
	       	trace(data);
	       	trace("수정 수행");
	       	$.ajax({
		        url: "/YeaMin/updateStore.json",
		        type: "post",
		        data: data ,
		        success: function(data) {
					var ret = JSON.parse(data);
		        	if(ret.result === "ok") {
		        		//수정 성공
		        		fnObj.insertStoreImg();
		        		setTimeout(function() {
		        			location.href="/YeaMin/storeContents.do";
		        		}, 500);
		        	} else if(ret.result === "error") {
		        		//수정 실패
		        	}
		        }
		    });
		},
		insertStoreImg: function() {
	       	trace("이미지 등록 수행");
	       	
	       	var uploadedList = fnObj.upload.target.getUploadedList();
	       	
	       	for(var i=0;i<uploadedList.length;i++){				
				$.ajax({
			        url: "/YeaMin/insertStoreImg.json",
			        type: "post",
			        data: "store_img_origin_path=" + uploadedList[i].name + "&store_img_system_path=" + uploadedList[i].saveName ,
			        success: function(data) {
						var ret = JSON.parse(data);							
			        	if(ret.result === "ok") {
			        		//수정 성공	
			        	} else if(ret.result === "error") {
			        		//수정 실패
			        		console.log("error");
			        	}
			        }
			    });
			}
		},
		close: function() {   	
		},
		upload: {
			target: new AXUpload5(),
			bind: function() {
				this.target.setConfig({
					targetID:"AXUpload5",
					targetButtonClass:"Green",
					uploadFileName:"fileData",
					file_types:"image/*",  //audio/*|video/*|image/*|MIME_type (accept)
					dropBoxID:"uploadQueueBox",
					queueBoxID:"uploadQueueBox", // upload queue targetID
					//openMode: "view",
					//queueBoxAppendType:"(prepend || append)",
					queueBoxAppendType:"prepend",
					// html 5를 지원하지 않는 브라우저를 위한 swf upload 설정 원치 않는 경우엔 선언 하지 않아도 됩니다. ------- s
					//flash_url : pageObj.host+"lib/swfupload.swf",
					//flash9_url : pageObj.host+"lib/swfupload_fp9.swf",
	                   //flash_file_types:"*.jpg;*.jpeg;*.gif;*.bmp;*.png",
	                   //flash_file_types_description:"image",
					// --------- e
					onClickUploadedItem: function(){ // 업로드된 목록을 클릭했을 때.
						window.open(this.uploadedPath.dec() + this.saveName.dec(), "_blank", "width=500,height=500");						
					},
					
					uploadMaxFileSize:(20*1024*1024), // 업로드될 개별 파일 사이즈 (클라이언트에서 제한하는 사이즈 이지 서버에서 설정되는 값이 아닙니다.)
					uploadMaxFileCount:10, // 업로드될 파일갯수 제한 0 은 무제한
					uploadUrl:"fileUpload.do",
					uploadPars:{},
					deleteUrl:"fileDelete.do",
					deletePars:{},
	
					buttonTxt:"upload",
					fileKeys:{ // 서버에서 리턴하는 json key 정의 (id는 예약어 사용할 수 없음)
						//id:"id",
						name:"name",
						type:"type",
						saveName:"saveName",
						fileSize:"fileSize",
						uploadedPath:"uploadedPath",
						thumbPath:"thumbUrl" // 서버에서 키값을 다르게 설정 할 수 있다는 것을 확인 하기 위해 이름을 다르게 처리한 예제 입니다.
					},
					
					onbeforeFileSelect: function(){	
						
						return true;
					},
					
					onUpload: function(){					
						//trace(this);
						//trace(fnObj.upload.target.uploadedList);
						//trace("onUpload");
					},
					onComplete: function(){	
						//fnObj.upload.target.setUploadedList(list); //list형식이 json이여야하고 모든 값들이 넘어와야 표시된다.
						//trace("onComplete");
					},
					onStart: function(){
						
						//trace(this);
						//trace("onStart");
					},
					onDelete: function(){
						//trace("onDelete");
					},
					onError: function(errorType, extData){
						if(errorType == "html5Support"){
							//dialog.push('The File APIs are not fully supported in this browser.');
						}else if(errorType == "fileSize"){
							//trace(extData);
							alert("파일사이즈가 초과된 파일을 업로드 할 수 없습니다. 업로드 목록에서 제외 합니다.\n("+extData.name+" : "+extData.size.byte()+")");
						}else if(errorType == "fileCount"){
							alert("업로드 갯수 초과 초과된 아이템은 업로드 되지 않습니다.");
						}
					}
				});
			},
			printMethodReturn: function(method, type){
				var list = myUpload[method](type);
				trace(list);
				toast.push(Object.toJSON(list));
			}
		}
	};
	//axdom(window).ready(fnObj.pageStart);
	//axdom(window).resize(fnObj.pageResize);
	$(document).ready(function(){
   		if($("#store_name").val()){
   			fnObj.load();
   		}
   	});
</script>