package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.member.model.vo.Member;

public class OnePageSocket extends TextWebSocketHandler {

	private String text; // 내용 저장
	
	@Autowired
	AdminService adminService;
	
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
		if(message.getPayload().contains("saveFile::")) {
			String[] pack = message.getPayload().replace("saveFile::", "").split("/");
			SqlCloud sql = SqlCloud.builder().sqlTitle(pack[0]).sqlContent(pack[1]).build();
			// Insert or Update
			// title로 조회 한 후 결과 값이 있다면 수정
			// title로 조회 한 후 결과 값이 없다면 삽입
			
			String title = adminService.selectSqlTitle(pack[0]);
			if(title==null) {
				// 삽입
				System.out.println("새로운 저장 객체 ");
			}else {
				// 수정
			}
		}else {
			// TextMessage
			TextMessage newMessage = new TextMessage(message.getPayload());			
			text = message.getPayload();
			for(WebSocketSession member : list) {
				member.sendMessage(newMessage);
			}
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
