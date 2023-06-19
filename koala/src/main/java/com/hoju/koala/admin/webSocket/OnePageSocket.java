package com.hoju.koala.admin.webSocket;

import java.net.InetAddress;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class OnePageSocket extends TextWebSocketHandler {

	private Set<WebSocketSession> list = new CopyOnWriteArraySet<>();
	// 차단 기능을 넣어도 될꺼 같다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		InetAddress inet = InetAddress.getLocalHost();
		String address = inet.getHostAddress();
		list.add(session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 이부분을 페이지 단위로 이동하도록 변경
		TextMessage newMessage = new TextMessage(message.getPayload());
		for(WebSocketSession member : list) {
			member.sendMessage(newMessage);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}

}
