package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hoju.koala.member.model.vo.Member;

public class OnePageSocket extends TextWebSocketHandler {

	private String text;
	
	private Set<String> conUser = new HashSet<>(); // 접속 종료한 아이디를 찾아서 여기서 제거 하면 접속자를 변하게 할 수 있다.
	
	private Set<WebSocketSession> list = new CopyOnWriteArraySet<>();
	// 차단 기능을 넣어도 될꺼 같다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		list.add(session);
		try {			
			String connectionId = ((Member)map.get("loginUser")).getUserId();
			conUser.add(connectionId);
			ArrayList<String> stringList = new ArrayList<>(conUser);
			String test = "";
 			for(int i = 0; i < stringList.size(); i++) {
				if(i+1 != stringList.size() ) {
					test += stringList.get(i)+",";
				}else {
					test += stringList.get(i);				
				}
			}
			TextMessage newMessage = new TextMessage("###" + test + "///" + text);
			for(WebSocketSession member : list) {
				member.sendMessage(newMessage);
			}
		}catch(Exception e) {
			
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		TextMessage newMessage = new TextMessage(message.getPayload());
		for(WebSocketSession member : list) {
			member.sendMessage(newMessage);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String disconnectionId = ((Member)map.get("loginUser")).getUserId();
		conUser.remove(disconnectionId);
		ArrayList<String> stringList = new ArrayList<>(conUser);
		String test = "";
		for(int i = 0; i < stringList.size(); i++) {
			if(i+1 != stringList.size() ) {
				test += stringList.get(i)+",";
			}else {
				test += stringList.get(i);				
			}
		}
		list.remove(session);
		if(conUser.size() == 0){
			text = "";
		}
		TextMessage newMessage = new TextMessage("###" + test + "///" + text);
		for(WebSocketSession member : list) {
			member.sendMessage(newMessage);
		}
	}

}
