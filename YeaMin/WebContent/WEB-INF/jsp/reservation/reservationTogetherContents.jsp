<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ax-body">
	<div class="ax-wrap">
	
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>함께 예약하기</h1>
				<p class="desc">다른 사용자와 함께 일정 및 메뉴를 공유하여 예약을 진행할 수 있습니다.</p>
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
								
									<div id="tab"></div>
									<div id="calendar"></div>
									
									<div style="height: 100%; width: 500px; float: left;">
									
										<!-- 그룹 영역 -->
										<div id="reservationTogetherGroupController" class="grayBox" style="height: 90px;">
											<div class="ax-rwd-table" style="margin:5px;">
												<div class="item-group">
					                                <div class="item">
					                                    <label class="item-lable" for="groupId">
					                                        <span class="th" style="min-width:100px;">그룹 아이디</span>
					                                        <span class="td inputText" style="" title="">
					                                            <input type="text" id="groupId" title="" placeholder="" value="" class="AXInput av-required W150"/>
					                                        </span>
					                                    </label>
					                                </div>
					                                <div class="item-clear"></div>
					                                <div class="group-clear"></div>
					                            </div>
					                            <div class="ax-modal-footer">
											        <div class="ax-wrap">
											            <div class="ax-col-12">
											                <div class="ax-unit center">
											                    <button type="button" class="AXButton" onclick="fnObj.reservationTogether.groupEnter()">그룹 입장</button>
											                    <button type="button" class="AXButton" onclick="fnObj.reservationTogether.groupCreate()">그룹 생성</button>
											                </div>
											            </div>
											            <div class="ax-clear"></div>
											        </div>
											    </div>
					                    	</div>
										</div>
									
										<!-- 일정 영역 -->
										<div id="scheduleController" class="grayBox" style="height: 190px;">
											<div class="ax-rwd-table" style="margin:5px;">
												<div class="item-group">
					                                <div class="item">
					                                    <label class="item-lable" for="schedule_title">
					                                        <span class="th" style="min-width:100px;">일정 제목</span>
					                                        <span class="td inputText" style="" title="">
					                                            <input type="text" id="schedule_title" title="" placeholder="" value="" class="AXInput av-required W150"/>
					                                        </span>
					                                    </label>
					                                </div>
					                                <div class="item-clear"></div>
					                                <div class="group-clear"></div>
					                            </div>
					                            <div class="item-group">
					                                <div class="item">
					                                    <label class="item-lable" for="AXInputDateTimeST">
					                                        <span class="th" style="min-width:100px;">일정 기간</span>
					                                        <span class="td inputText" style="" title="">
					                                            <input type="text" name="" id="AXInputDateTimeST" class="AXInput W140" /> ~ 
		                                           				<input type="text" name="" id="AXInputDateTimeED" class="AXInput W140" />
					                                        </span>
					                                    </label>
					                                </div>
					                                <div class="item-clear"></div>
					                                <div class="group-clear"></div>
					                            </div>
					                            <div class="item-group">
					                                <div class="item">
					                                    <label class="item-lable" for="schedule_color">
					                                        <span class="th" style="min-width:100px;">색상</span>
					                                        <span class="td inputText" style="" title="">
					                                        	<input id="schedule_color" type="color"/>
					                                        </span>
					                                    </label>
					                                </div>
					                                <div class="item-clear"></div>
					                                <div class="group-clear"></div>
					                            </div>
					                            <div class="ax-modal-footer">
											        <div class="ax-wrap">
											            <div class="ax-col-12">
											                <div class="ax-unit center">
											                    <button type="button" class="AXButton" onclick="fnObj.fullCalendar.insertEvent();">등록</button>
											                    <button type="button" class="AXButton" onclick="fnObj.fullCalendar.updateEvent();">수정</button>
											                    <button type="button" class="AXButton" onclick="fnObj.fullCalendar.deleteEvent();">삭제</button>
											                </div>
											            </div>
											            <div class="ax-clear"></div>
											        </div>
											    </div>
					                    	</div>
										</div>
										
										<!-- 채팅 영역 -->
										<div id="chat" class="grayBox" style="height: 340px;">
											<textarea id="groupChatDisplayTa" style="width: 97%; height: 80%;" readonly="readonly"></textarea>
											<div style="width: 100%; height: 17%;">
												<textarea id="groupChatWriteTa" style="width: 72%; height: 97%; float: left; margin-right: 5px;" placeholder="채팅 내용을 입력하세요."></textarea>
												<input id="groupChatSendBtn" style="height: 100%; width: 17%" type="button" value="전송" class="AXButton Red" onclick="fnObj.reservationTogether.groupChat()"/>
											</div>
										</div>
										
									</div>
									
									<div style='clear:both'></div>
									
								</div>
							</div>
						</div>
						<div class="ax-clear"></div>
					</div>
				</div>
				<!-- e.CXPage -->
				
			</div>
			<div class="ax-clear"></div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	var page_menu_id = "m05"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
    var fnObj = {
		pageStart: function(){
			fnObj.webSocket.bind();
			fnObj.tab.bind();
			fnObj.fullCalendar.bind();
			
			$("#AXInputDateTimeED").bindTwinDateTime({align:"right", valign:"top", separator:"-", startTargetID:"AXInputDateTimeST", onChange:function() {
                // console.log(this);
            }});
			
			$("#groupId").bindPattern({pattern: "numberint"});
        },
        webSocket: {
        	target: new WebSocket("ws://192.168.0.114:8080/YeaMin/websocket/reservationTogether.do"),
        	bind: function() {
        		fnObj.webSocket.target.onopen = fnObj.webSocket.onopen;
        		fnObj.webSocket.target.onmessage = fnObj.webSocket.onmessage;
        		fnObj.webSocket.target.onclose = fnObj.webSocket.onclose;
        	},
        	onopen: function() {
        		console.log("onopen");
        	},
        	onmessage: function(msg) {
        		console.log("onmessage");
        		var data = JSON.parse(msg.data);
        		console.log(data);
        		
        		switch (data.type) {
				case "RESERVATION_TOGETHER_GROUP_CREATE":
					$("#groupId").val(data.groupId);
					break;
				case "RESERVATION_TOGETHER_GROUP_CHAT":
					var groupChat = "[" + data.userName + "] " + data.groupChat + "\n";
					$('#groupChatDisplayTa').val($('#groupChatDisplayTa').val() + groupChat);
					break;
				case "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK":
					fnObj.fullCalendar.clickHandler("unbind");
					$("." + data.clickCalss).trigger("click");
					fnObj.fullCalendar.clickHandler("bind");
					break;
	        	case "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_EVENTS":
	        		fnObj.fullCalendar.eventControllerInit();
	        		$('#calendar').fullCalendar( 'removeEvents' );
	        		$('#calendar').fullCalendar( 'addEventSource', data.events );
					break;
	        	case "RESERVATION_TOGETHER_GROUP_TAB_CHANGE":
	        		fnObj.tab.setValueTab(data.optionValue);
					break;
				}
        	},
        	onclose: function() {
        		console.log("onclose");
        	},	
        	send: function(msg) {
        		fnObj.webSocket.target.send(msg);
        	}
        },
        reservationTogether: {
        	groupCreate: function() {
        		var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_CREATE";
        		fnObj.webSocket.send(JSON.stringify(req));
        	},
        	groupEnter: function() {
        		if(emptyRequiredValueCheck("reservationTogetherGroupController")) return;
        		
        		var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_ENTER";
        		req.groupId = parseInt($("#groupId").val());
        		fnObj.webSocket.send(JSON.stringify(req));
        	},
        	groupChat: function() {
        		var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_CHAT";
        		req.groupId = parseInt($("#groupId").val());
        		req.groupChat = $("#groupChatWriteTa").val();
       			fnObj.webSocket.send(JSON.stringify(req));
       			$('#groupChatWriteTa').val("");
        	}
        },
        tab: {
        	bind: function() {
				$("#tab").bindTab({
					theme : "AXTabsLarge",
					value:"calendar",
					overflow:"scroll",
					options:[
						{optionText: "STEP 1 일정 정하기", optionValue: "calendar"},
						{optionText: "STEP 2 메뉴 정하기", optionValue: "menu"}
					],
					onchange: function(selectedObject, optionValue) {
						fnObj.tab.changeHandler(optionValue);
					}
				});
				fnObj.tab.setValueTab("calendar");
			},
			setValueTab: function(tabValue) {
				$("#tab").setValueTab(tabValue);
			},
			changeHandler: function(optionValue) {
				var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_TAB_CHANGE";
        		req.groupId = parseInt($("#groupId").val());
        		req.optionValue = optionValue;
       			fnObj.webSocket.send(JSON.stringify(req));
			}
        },
        fullCalendar: {
        	targetID: "calendar",
        	bind: function() {
        		$('#calendar').fullCalendar({
    				theme: true,
    				header: {
    					left: 'prev,next today',
    					center: 'title',
    					right: 'month,agendaWeek,agendaDay'
    				},
    				lang: "ko",
    				defaultDate: new Date(),
    				editable: true,
    				eventLimit: true, // allow "more" link when too many events
    				businessHours: false, // display business hours
    				droppable: true,
    				events: [],
    				eventClick: function(clientEvent, jsEvent, view) {
    					fnObj.fullCalendar.selectedEvent = clientEvent;
    					
    					var title = clientEvent.title;
    					var start = $.fullCalendar.moment(clientEvent.start).format();
    					start = start.replace("T", " ");
    					start = start.substr(0, start.length-3);
    					var end = $.fullCalendar.moment(clientEvent.end).format();
    					end = end.replace("T", " ");
    					end = end.substr(0, end.length-3);
    					var color = clientEvent.color;
    					
    					$("#schedule_title").val(title);
    					$("#AXInputDateTimeST").val(start);
    					$("#AXInputDateTimeED").val(end);
    					$("#schedule_color").val(color);
    			    },
    				eventDragStop: function(event, delta, revertFunc) {
    					fnObj.fullCalendar.sendEvents();
    			    },
    			    eventResizeStop: function(event, delta, revertFunc) {
    			    	fnObj.fullCalendar.sendEvents();
    			    }
    			});
        		fnObj.fullCalendar.clickHandler("bind");
        	},
        	eventControllerInit: function() {
        		fnObj.fullCalendar.selectedEvent = null;
        		$("#schedule_title").val("");
				$("#AXInputDateTimeST").val("");
				$("#AXInputDateTimeED").val("");
				$("#schedule_color").val("#000000");
        	},
        	selectedEvent: null,
        	insertEvent: function() {
        		if(emptyRequiredValueCheck("scheduleController")) return;
        		
        		var event = {};
        		
        		var title = $("#schedule_title").val();
				var start = $("#AXInputDateTimeST").val();
				start = start.replace(" ", "T") + ":00";
				var end = $("#AXInputDateTimeED").val();
				end = end.replace(" ", "T") + ":00";
				var color = $("#schedule_color").val();
                 
				event.title = title;
				event.start = start;
				event.end = end;
				event.color = color;
				
                $('#calendar').fullCalendar( 'renderEvent', event, true);
                fnObj.fullCalendar.sendEvents();
        	},
        	updateEvent: function() {
        		if(emptyRequiredValueCheck("scheduleController")) return;
        		
        		if(fnObj.fullCalendar.selectedEvent != null) {
        			fnObj.fullCalendar.insertEvent();
	        		fnObj.fullCalendar.deleteEvent();
	        		fnObj.fullCalendar.sendEvents();
        		}
        	},
			deleteEvent: function() {
				if(fnObj.fullCalendar.selectedEvent != null) {
					$('#calendar').fullCalendar('removeEvents', function (event) {
						return event == fnObj.fullCalendar.selectedEvent;
				    });
					
					fnObj.fullCalendar.sendEvents();
					fnObj.fullCalendar.eventControllerInit();
				}
        	},
        	sendEvents: function() {
				setTimeout(function () {
					
					var events = [];
					$('#calendar').fullCalendar("clientEvents", function(clientEvent) {
						var event = {};
						event.title = clientEvent.title;
						event.start = $.fullCalendar.moment(clientEvent.start).format();
						event.end = $.fullCalendar.moment(clientEvent.end).format();
						event.color = clientEvent.color;
						events.push(event);
  					});
					
					var req = new Object();
	        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_EVENTS";
	        		req.groupId = parseInt($("#groupId").val());
	        		req.events = events;
	       			fnObj.webSocket.send(JSON.stringify(req));
					
				}, 100);
        	},
        	clickHandler: function(type) {
        		if(type === "bind") {
        			$(".fc-prev-button").bind("click", fnObj.fullCalendar.prevClickHandler);
            		$(".fc-next-button").bind("click", fnObj.fullCalendar.nextClickHandler);
            		$(".fc-today-button").bind("click", fnObj.fullCalendar.todayClickHandler);
            		$(".fc-month-button").bind("click", fnObj.fullCalendar.monthClickHandler);
            		$(".fc-agendaWeek-button").bind("click", fnObj.fullCalendar.agendaWeekClickHandler);
            		$(".fc-agendaDay-button").bind("click", fnObj.fullCalendar.agendaDayClickHandler);
        		} else if(type === "unbind") {
        			$(".fc-prev-button").unbind("click", fnObj.fullCalendar.prevClickHandler);
            		$(".fc-next-button").unbind("click", fnObj.fullCalendar.nextClickHandler);
            		$(".fc-today-button").unbind("click", fnObj.fullCalendar.todayClickHandler);
            		$(".fc-month-button").unbind("click", fnObj.fullCalendar.monthClickHandler);
            		$(".fc-agendaWeek-button").unbind("click", fnObj.fullCalendar.agendaWeekClickHandler);
            		$(".fc-agendaDay-button").unbind("click", fnObj.fullCalendar.agendaDayClickHandler);
        		}
        	},
        	prevClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-prev-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		},
    		nextClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-next-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		},
   			todayClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-today-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		},
   			monthClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-month-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		},
    		agendaWeekClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-agendaWeek-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		},
   			agendaDayClickHandler: function(event) {
    			var req = new Object();
        		req.type = "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK";
        		req.groupId = parseInt($("#groupId").val());
        		req.clickCalss = "fc-agendaDay-button";
       			fnObj.webSocket.send(JSON.stringify(req));
    		}
        }
    };
</script>