package com.yeamin.websocket;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class ServletAwareConfig extends ServerEndpointConfig.Configurator {
	
	public ServletAwareConfig() {
		
	}
	
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
    	
    	HttpSession session = (HttpSession) request.getHttpSession();
    	ServletContext ctx = session.getServletContext();
    	
    	sec.getUserProperties().put(HttpSession.class.getName(), session);
    	sec.getUserProperties().put(ServletContext.class.getName(), ctx);
        
    }
    
}
