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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoju.koala.admin.model.vo.WebSocketVO;
import com.hoju.koala.member.model.vo.Member;

public class Atest extends TextWebSocketHandler {

	private Set<WebSocketSession> list = Collections.synchronizedSet(new HashSet<>());
	
	private HashMap<Integer, HashSet<WebSocketSession>> map = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		System.out.println("추가");
		System.out.println(list);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// Connect
		ObjectMapper om = new ObjectMapper();
		WebSocketVO msv = om.readValue((String)message.getPayload(), WebSocketVO.class); // json을 VO기반으로 읽어서 객체로 저장한다.
		if(msv.getType().equals("Enter")) {
			if(!map.containsKey(msv.getTeamNo())) {
				map.put(msv.getTeamNo(), new HashSet<WebSocketSession>());
			}
			HashSet<WebSocketSession> set = map.get(msv.getTeamNo());
			set.add(session);
			ArrayList<String> arraylist = new ArrayList<>();
			for(WebSocketSession preId : set) {
				String userId = ((Member)preId.getAttributes().get("loginUser")).getUserId();
				arraylist.add(userId);
			}
			TextMessage newMessage = new TextMessage(arraylist.toString());
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				m.sendMessage(newMessage);
			}			
		}else if(msv.getType().equals("Out")) {
			System.out.println("1");
			for(int key : map.keySet()) {
				map.get(key).remove(session);
				if(map.get(key).size() == 0) {
					map.remove(key);
				}
			}
			
			ArrayList<String> arraylist = new ArrayList<>();
			for(WebSocketSession preId : map.get(msv.getTeamNo())) {
				String userId = ((Member)preId.getAttributes().get("loginUser")).getUserId();
				arraylist.add(userId);
			}
			TextMessage newMessage = new TextMessage(arraylist.toString());
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				m.sendMessage(newMessage);
			}			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("2");
		
		list.remove(session);
		
		System.out.println("삭제후");
		System.out.println(list);
	}

}
