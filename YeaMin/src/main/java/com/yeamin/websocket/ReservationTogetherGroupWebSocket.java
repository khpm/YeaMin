package com.yeamin.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeamin.dto.UserDto;

@ServerEndpoint(value = "/websocket/reservationTogether.do", configurator=ServletAwareConfig.class)
public class ReservationTogetherGroupWebSocket {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	private Session webSocketSession;
	
	private EndpointConfig webSocketConfig;
	
	private HttpSession httpSession;
	
	private ServletContext servletContext;
	
	private static final AtomicInteger groupIdAtomic = new AtomicInteger(0);
	
	private static final Map<Integer, List<ReservationTogetherGroupWebSocket>> groupListMap
	= new HashMap<Integer, List<ReservationTogetherGroupWebSocket>>();
	
	private static final ObjectMapper mapper = new ObjectMapper();
	
	public ReservationTogetherGroupWebSocket() {
		log.debug("WebSocketTest -------------------------------------------------------");
		log.debug("Thead Name : " + Thread.currentThread().getName());
		log.debug("Thead Id : " + Thread.currentThread().getId());
	}
	
	public Session getWebSocketSession() {
		return this.webSocketSession;
	}
	
	@OnOpen
	public void onOpen(Session webSocketSession, EndpointConfig webSocketConfig) {
		this.webSocketSession = webSocketSession;
		this.webSocketConfig = webSocketConfig;
		this.httpSession = (HttpSession) webSocketConfig.getUserProperties().get(HttpSession.class.getName());
		this.servletContext = (ServletContext) webSocketConfig.getUserProperties().get(ServletContext.class.getName());
		
		log.debug("onOpen -------------------------------------------------------");
		log.debug("Thead Name : " + Thread.currentThread().getName());
		log.debug("Thead Id : " + Thread.currentThread().getId());
		log.debug("WebSocket Session Id : " + this.webSocketSession.getId());
		log.debug("Http Session Id : " + this.httpSession.getId());
	}
	
	@OnClose
	public void onClose() {
		log.debug("onClose -------------------------------------------------------");
		log.debug("Thead Name : " + Thread.currentThread().getName());
		log.debug("Thead Id : " + Thread.currentThread().getId());
		log.debug("WebSocket Session Id : " + this.webSocketSession.getId());
		log.debug("Http Session Id : " + this.httpSession.getId());
	}
	
	@OnMessage
	public void onMessage(String msg) throws JsonParseException, JsonMappingException, IOException {
		log.debug("onMessage -------------------------------------------------------");
		log.debug("Thead Name : " + Thread.currentThread().getName());
		log.debug("Thead Id : " + Thread.currentThread().getId());
		log.debug("WebSocket Session Id : " + this.webSocketSession.getId());
		log.debug("Http Session Id : " + this.httpSession.getId());
		log.debug("msg : " + msg);
		
		Map<String, Object> msgMap = mapper.readValue(msg, new TypeReference<Map<String, Object>>(){});
		String type = msgMap.get("type").toString();
		
		switch (type) {
		case "RESERVATION_TOGETHER_GROUP_CREATE":
			RESERVATION_TOGETHER_GROUP_CREATE(msgMap);
			break;
		case "RESERVATION_TOGETHER_GROUP_ENTER":
			RESERVATION_TOGETHER_GROUP_ENTER(msgMap);
			break;
		case "RESERVATION_TOGETHER_GROUP_CHAT":
			RESERVATION_TOGETHER_GROUP_CHAT(msgMap);
			break;
		case "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK":
			RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK(msgMap);
			break;
		case "RESERVATION_TOGETHER_GROUP_FULLCALENDAR_EVENTS":
			RESERVATION_TOGETHER_GROUP_FULLCALENDAR_EVENTS(msgMap);
			break;
		case "RESERVATION_TOGETHER_GROUP_TAB_CHANGE":
			RESERVATION_TOGETHER_GROUP_TAB_CHANGE(msgMap);
			break;
		}
	}
	
	@OnError
	public void onError(Throwable t) throws Throwable {
		log.debug("onError -------------------------------------------------------");
		log.debug("Thead Name : " + Thread.currentThread().getName());
		log.debug("Thead Id : " + Thread.currentThread().getId());
		log.debug("WebSocket Session Id : " + this.webSocketSession.getId());
		log.debug("Http Session Id : " + this.httpSession.getId());
		log.debug("Throwable Message : " + t.getMessage());
    }
	
	private void send(ReservationTogetherGroupWebSocket sendTarget, Map<String, Object> msgMap) {
		try {
			sendTarget.getWebSocketSession().getBasicRemote().sendText(mapper.writeValueAsString(msgMap));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
    private void broadcast(List<ReservationTogetherGroupWebSocket> sendTargetList, Map<String, Object> msgMap) {
        for (int i=0; i<sendTargetList.size(); i++) {
        	ReservationTogetherGroupWebSocket sendTarget = sendTargetList.get(i);
        	
            try {
                synchronized (sendTarget) {
                    // 서버에 접속 중인 모든 이용자에게 메지지를 전송한다
                	sendTarget.getWebSocketSession().getBasicRemote().sendText(mapper.writeValueAsString(msgMap));
                }
            } catch (IllegalStateException ise){
            	// 특정 클라이언트에게 현재 메시지 보내기 작업 중인 경우에 동시에 쓰기작업을 요청하면 오류 발생함
            	if(ise.getMessage().indexOf("[TEXT_FULL_WRITING]")!=-1) {
            		new Thread() {
            			@Override
            			public void run() {
		            		while(true) {
		            			try{
		            				sendTarget.getWebSocketSession().getBasicRemote().sendText(mapper.writeValueAsString(msgMap));
		            				break;
		            			} catch(IllegalStateException _ise){
		            				try {
		            					Thread.sleep(100); // 메시지 보내기 작업을 마치도록 기다려준다
		            				} catch (InterruptedException e) {}
		            			} catch(IOException ioe){
		            				ioe.printStackTrace();
		            			}
		            		}
            			}
            		}.start();
            	}
            } catch (Exception e) {
            	// 메시지 전송 중에 오류가 발생(클라이언트 퇴장을 의미함)하면 해당 클라이언트를 서버에서 제거한다
                System.err.println("Chat Error: Failed to send message to client:"+e);
                sendTargetList.remove(i);
                try {
                	// 접속 종료
                    sendTarget.webSocketSession.close();
                } catch (IOException e1) {
                    // Ignore
                }
            }
        }
    }
	
	private void RESERVATION_TOGETHER_GROUP_CREATE(Map<String, Object> msgMap) {
		int groupId = groupIdAtomic.incrementAndGet();
		List<ReservationTogetherGroupWebSocket> groupList = new ArrayList<ReservationTogetherGroupWebSocket>();
		groupListMap.put(groupId, groupList);
		msgMap.put("groupId", groupId);
		send(this, msgMap);
	}
	
	private void RESERVATION_TOGETHER_GROUP_ENTER(Map<String, Object> msgMap) {
		int groupId = (Integer) msgMap.get("groupId");
		List<ReservationTogetherGroupWebSocket> groupList = groupListMap.get(groupId);
		groupList.add(this);
	}
	
	private void RESERVATION_TOGETHER_GROUP_CHAT(Map<String, Object> msgMap) {
		UserDto user = (UserDto) httpSession.getAttribute("user");
		msgMap.put("userName", user.getUser_name());
		
		int groupId = (Integer) msgMap.get("groupId");
		List<ReservationTogetherGroupWebSocket> groupList = groupListMap.get(groupId);
		
		broadcast(groupList, msgMap);
	}
	
	private void RESERVATION_TOGETHER_GROUP_FULLCALENDAR_CLICK(Map<String, Object> msgMap) {
		UserDto user = (UserDto) httpSession.getAttribute("user");
		msgMap.put("userName", user.getUser_name());
		
		int groupId = (Integer) msgMap.get("groupId");
		List<ReservationTogetherGroupWebSocket> groupListTemp = groupListMap.get(groupId);
		List<ReservationTogetherGroupWebSocket> groupList = new ArrayList<ReservationTogetherGroupWebSocket>();
				
		for (ReservationTogetherGroupWebSocket ws : groupListTemp) {
			UserDto otherUser = (UserDto) ws.httpSession.getAttribute("user");
			if(!user.getUser_id().equals(otherUser.getUser_id())) {
				groupList.add(ws);
			}
		}
		
		broadcast(groupList, msgMap);
	}
	
	private void RESERVATION_TOGETHER_GROUP_FULLCALENDAR_EVENTS(Map<String, Object> msgMap) {
		UserDto user = (UserDto) httpSession.getAttribute("user");
		msgMap.put("userName", user.getUser_name());
		
		int groupId = (Integer) msgMap.get("groupId");
		List<ReservationTogetherGroupWebSocket> groupListTemp = groupListMap.get(groupId);
		List<ReservationTogetherGroupWebSocket> groupList = new ArrayList<ReservationTogetherGroupWebSocket>();
				
		for (ReservationTogetherGroupWebSocket ws : groupListTemp) {
			UserDto otherUser = (UserDto) ws.httpSession.getAttribute("user");
			if(!user.getUser_id().equals(otherUser.getUser_id())) {
				groupList.add(ws);
			}
		}
		
		broadcast(groupList, msgMap);
	}
	
	private void RESERVATION_TOGETHER_GROUP_TAB_CHANGE(Map<String, Object> msgMap) {
		UserDto user = (UserDto) httpSession.getAttribute("user");
		msgMap.put("userName", user.getUser_name());
		
		int groupId = (Integer) msgMap.get("groupId");
		List<ReservationTogetherGroupWebSocket> groupListTemp = groupListMap.get(groupId);
		List<ReservationTogetherGroupWebSocket> groupList = new ArrayList<ReservationTogetherGroupWebSocket>();
				
		for (ReservationTogetherGroupWebSocket ws : groupListTemp) {
			UserDto otherUser = (UserDto) ws.httpSession.getAttribute("user");
			if(!user.getUser_id().equals(otherUser.getUser_id())) {
				groupList.add(ws);
			}
		}
		
		broadcast(groupList, msgMap);
	}
	
}
