package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.admin.model.vo.WebSocketVO;
import com.hoju.koala.member.model.vo.Member;

public class Atest extends TextWebSocketHandler {

	private Set<WebSocketSession> list = Collections.synchronizedSet(new HashSet<>());
	
	private HashMap<Integer, HashSet<WebSocketSession>> map = new HashMap<>(); // 접속 관련
	
//	private HashMap<Integer, String> textMap = new HashMap<>(); // sql 관련
	private HashMap<Integer, String> textMap = new HashMap<>(); // sql 관련
	
	@Autowired
	AdminService adminService;
	
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
		System.out.println(msv);
		System.out.println(textMap);
		if(msv.getMsg() != null) {
			textMap.put(msv.getTeamNo(), msv.getMsg());
		}
		if(msv.getType().equals("Enter")) {
			// 접속시 방에서 작성한 가장 최근의 sql문을 보여줘야한다.
			// 이는 별도의 Map 자료구조로 구성하여 보여주기로 한다.
			if(!map.containsKey(msv.getTeamNo())) {
				map.put(msv.getTeamNo(), new HashSet<WebSocketSession>());
			}
			
			HashSet<WebSocketSession> set = map.get(msv.getTeamNo());
			set.add(session);
			if(map.get(msv.getTeamNo()).size() == 1) {
				String content = adminService.selectSqlContent(msv.getTeamNo());
				textMap.put(msv.getTeamNo(), content);
			}
			ArrayList<String> arraylist = new ArrayList<>();
			for(WebSocketSession preId : set) {
				String userId = ((Member)preId.getAttributes().get("loginUser")).getUserId();
				arraylist.add(userId);
			}
			TextMessage newMessage = null;
			if(textMap.get(msv.getTeamNo()) != null) {
				newMessage = new TextMessage((arraylist.toString()).replace(" ", "") + "MSG:" +textMap.get(msv.getTeamNo()));
			}else {				
				newMessage = new TextMessage((arraylist.toString()).replace(" ", ""));
			}
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				m.sendMessage(newMessage);
			}			
		}else if(msv.getType().equals("Out")) {
			int ref = 0;
			for(int key : map.keySet()) {
				map.get(key).remove(session);
				if(map.get(key).size() == 0) {
					map.remove(key);
					System.out.println(map.get(key));
					ref = key;
				}
			}
			ArrayList<String> arraylist = new ArrayList<>();
			if(ref == 0) {
				for(WebSocketSession preId : map.get(msv.getTeamNo())) {
					String userId = ((Member)preId.getAttributes().get("loginUser")).getUserId();
					arraylist.add(userId);
				}
				TextMessage newMessage = new TextMessage((arraylist.toString()).replace(" ", ""));
				for(WebSocketSession m : map.get(msv.getTeamNo())) {
					m.sendMessage(newMessage);
				}			
			}
		}else if(msv.getType().equals("SEND")) {
			System.out.println("send >> " + msv.getMsg());
			String text = msv.getMsg();
			TextMessage newMessage = new TextMessage("SEND:"+text);
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				m.sendMessage(newMessage);
			}
		} else if(msv.getType().equals("SAVE")) {
			SqlCloud sql = adminService.selectSqlDate(msv.getTeamNo());
			TextMessage newMessage = new TextMessage("SAVE:"+sql.getModifyDate());
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				m.sendMessage(newMessage);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
		System.out.println(map);
		System.out.println("삭제후");
		System.out.println(list);
	}

}
