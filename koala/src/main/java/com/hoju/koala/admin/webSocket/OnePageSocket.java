package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hoju.koala.member.model.vo.Member;

public class OnePageSocket extends TextWebSocketHandler {
//
	private Set<WebSocketSession> list = Collections.synchronizedSet(new HashSet<>());
//	
	private HashMap<String, Set<WebSocketSession>> map = new HashMap<>();
//	
//	private Set<String> idSet = new HashSet<>();
//	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		// 접속
//		if(!idSet.contains(((Member)session.getAttributes().get("loginUser")).getUserId())) {
//			idSet.add(((Member)session.getAttributes().get("loginUser")).getUserId());
			list.add(session);
//		}
	}
//
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
//		// 메시지
		String teamNo = (String) message.getPayload();
		if(map.containsKey(teamNo)) {
//			if(!idSet.contains(((Member)session.getAttributes().get("loginUser")).getUserId())) {
//				idSet.add(((Member)session.getAttributes().get("loginUser")).getUserId());
//				map.get(teamNo).add(session);
//			}
		}else {
			map.put(teamNo, new HashSet<WebSocketSession>());
			map.get(teamNo).add(session);
		}
		ArrayList<String> userIdPack = new ArrayList<>();
		for(WebSocketSession ws : map.get(teamNo)) {
			userIdPack.add(((Member)ws.getAttributes().get("loginUser")).getUserId());
		}
		TextMessage newMessage = new TextMessage("Enter:" + teamNo + "/" + userIdPack);
		for(WebSocketSession user : map.get(teamNo)) {
			user.sendMessage(newMessage);
		}
	}
//
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		// 종료
//		String id = ((Member) session.getAttributes().get("loginUser")).getUserId();
		list.remove(session);
//		idSet.remove(id);
	}
//	
}
