package com.hoju.koala.member.chat;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatHandler extends TextWebSocketHandler {

	Map<String, WebSocketSession> users = new HashMap<>();
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		String userNo = (String)map.get("userNo");
		
		log.debug("가져온 userNo : {}", userNo);
//		users.put(session.getId(), session);
		
		log.debug("연결된 user : {}", session.getId());
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.debug("{}님의 메세지 {}", session.getId(), message.getPayload());
		
		
	}
	
	
	
	
	
}
