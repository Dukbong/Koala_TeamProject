package com.hoju.koala.member.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatHandler extends TextWebSocketHandler {

	private List<WebSocketSession> connUsers = new ArrayList<>();
	
	//멀티스레드 환경에서 안전하게 사용할 수 있는 동기화된 해시맵이다.
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.debug("연결된 user : {}", session.getId());
		
		log.debug("세션에트리뷰트 : {}", session.getAttributes());
		
		
		
//		log.debug("가져온 userNo : {}", userNo);
//		users.put(session.getId(), session);
		
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
//		log.debug("{}님의 메세지 {}", session.getId(), message.getPayload());
		
//		String payload = message.getPayload();
//		
//		JSONParser parser = new JSONParser();
//		JSONObject jobj = (JSONObject)parser.parse(payload);
//		
//		String type = (String)jobj.get("type");
//		String roomNum = (String)jobj.get("roomNum");
//		
//		if(type.equals("join")) {
//			
//		}
		
		
	}
	
	
	
	
	
}
