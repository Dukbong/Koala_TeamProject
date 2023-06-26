package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.member.model.vo.Member;

public class OnePageSocket3 extends TextWebSocketHandler {
	// 종료시 세션 정리 하기....
	private String text; // 내용 저장

	@Autowired
	AdminService adminService;

	private Set<String> conUser = new HashSet<>(); // 접속 종료한 아이디를 찾아서 여기서 제거 하면 접속자를 변하게 할 수 있다.
	private HashMap<String, ArrayList<String>> conMember = new HashMap<>(); // 방 별로
	private Set<WebSocketSession> list = new CopyOnWriteArraySet<>();
//	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	// 차단 기능을 넣어도 될꺼 같다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("2");
		
//		HttpSession sessions = request.getSession();
//		System.out.println((String)sessions.getAttribute("bang"));
		Map<String, Object> map = session.getAttributes();
		System.out.println(map);
		list.add(session);
		try {
			String connectionId = ((Member) map.get("loginUser")).getUserId();
			conUser.add(connectionId);
			ArrayList<String> stringList = new ArrayList<>(conUser);
			String test = "";
			for (int i = 0; i < stringList.size(); i++) {
				if (i + 1 != stringList.size()) {
					test += stringList.get(i) + ",";
				} else {
					test += stringList.get(i);
				}
			}
//			System.out.println("이게 맞낭?");
//			System.out.println(conMember);
			TextMessage newMessage = new TextMessage("###" + test + "///" + text);
//			System.out.println(newMessage);
			for (WebSocketSession member : list) {
				member.sendMessage(newMessage);
			}
		} catch (Exception e) {

		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("1");
		String messageIn = message.getPayload();
		Map<String, Object> map = session.getAttributes();
		String userId = "";
		String teamNo = "";
		if(messageIn.contains("saveFile::")) {
			String[] pack = messageIn.replace("saveFile::", "").split("/");
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
		}else if(messageIn.contains("connect::")) { // 몇번방에 누가 접속했는지
			teamNo = messageIn.replace("connect::", ""); // 방번호
			if(conMember.containsKey(teamNo)) {
				
			}else { // 몇번 방의 최초 접속자
				conMember.put(teamNo, new ArrayList<String>());
				ArrayList<String> teamMember = conMember.get(teamNo);
				list.add(session);
				userId = ((Member) map.get("loginUser")).getUserId();
				System.out.println(userId);
				teamMember.add(((Member)map.get("loginUser")).getUserId());
			}
			System.out.println("00000000000000000000000");
			System.out.println(conMember);
			TextMessage newMessage = new TextMessage(">>>" + teamNo + "/" + userId);
			String[] testarr = (">>>"+teamNo+"/"+userId).split("/");
			System.out.println("???????????????????????");
			System.out.println(testarr[0]);
			System.out.println(testarr[1]);
			for(WebSocketSession mem : list) {
				if((conMember.get(teamNo)).contains(((Member)map.get("loginUser")).getUserId())) {
					mem.sendMessage(newMessage);
				}
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
		String disconnectionId = ((Member) map.get("loginUser")).getUserId();
		conUser.remove(disconnectionId);
		ArrayList<String> stringList = new ArrayList<>(conUser);
		String test = "";
		for (int i = 0; i < stringList.size(); i++) {
			if (i + 1 != stringList.size()) {
				test += stringList.get(i) + ",";
			} else {
				test += stringList.get(i);
			}
		}
		list.remove(session);
		if (conUser.size() == 0) {
			text = "";
		}
		TextMessage newMessage = new TextMessage("###" + test + "///" + text);
		for (WebSocketSession member : list) {
			member.sendMessage(newMessage);
		}
	}

}
