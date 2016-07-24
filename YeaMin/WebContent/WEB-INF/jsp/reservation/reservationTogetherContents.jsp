<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>예약 시간 관리</h1>
				<p class="desc">예약할 때 필요한 정보인 예약 수용 정보를 관리합니다.</p>
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
								
									<div id="calendar"></div>
									
									<div style="height: 100%; width: 500px; float: left;">
										<div id="chat" style="height: 100px;">
											<label>그룹 아이디 </label>
											<input id="groupId" type="text" class="AXInput"/>
											<input id="groupEnterBtn" type="button" value="입장" class="AXButton Red" onclick="fnObj.reservationTogether.groupEnter()"/>
											<input id="groupCreateBtn" type="button" value="생성" class="AXButton Red" onclick="fnObj.reservationTogether.groupCreate()"/>
										</div>
										
										<div id="chat" style="height: 400px;">
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
    var page_menu_id = "m0301"; // admin.js > topMenu_data 에 정의된 id
</script>

<script type="text/javascript">
    var fnObj = {
		pageStart: function(){
			fnObj.webSocket.bind();
			fnObj.fullCalendar.bind();
        },
        webSocket: {
        	target: new WebSocket( "ws://localhost:8080/YeaMin/websocket/reservationTogether.do" ),
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
    				defaultDate: new Date(),
    				editable: true,
    				eventLimit: true, // allow "more" link when too many events
    				businessHours: false, // display business hours
    				droppable: true,
    				events: []
    			});
        	}
        }
    };
</script>