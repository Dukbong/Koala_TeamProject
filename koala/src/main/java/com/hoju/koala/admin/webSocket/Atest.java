package com.hoju.koala.admin.webSocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
		System.out.println("????????????????????????????????????????");
		System.out.println(session.getAttributes().get("loginUser"));
		System.out.println("????????????????????????????????????????");
		list.add(session);
		System.out.println("추가");
		System.out.println(list);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		System.out.println("============================================================");
		System.out.println(list);
		System.out.println("============================================================");
		// Connect
		ObjectMapper om = new ObjectMapper();
		WebSocketVO msv = om.readValue((String)message.getPayload(), WebSocketVO.class); // json을 VO기반으로 읽어서 객체로 저장한다.
		if(msv.getMsg() != null) {
			textMap.put(msv.getTeamNo(), msv.getMsg());
		}
		System.out.println(msv);
		if(msv.getType().equals("Enter")) {
			// 접속시 방에서 작성한 가장 최근의 sql문을 보여줘야한다.
			// 이는 별도의 Map 자료구조로 구성하여 보여주기로 한다.
			if(!map.containsKey(msv.getTeamNo())) {
				map.put(msv.getTeamNo(), new HashSet<WebSocketSession>());
			}
			
			HashSet<WebSocketSession> set = map.get(msv.getTeamNo());
			set.add(session);
			System.out.println("------------------------------------------------------------");
			System.out.println(set);
			System.out.println(set.size());
			System.out.println(set.getClass().getName()); // hashset 문제 : get 함수가 먹히지 않는다.
			Iterator<WebSocketSession> iter = set.iterator();	// Iterator 사용
			while(iter.hasNext()) {//값이 있으면 true 없으면 false
			    System.out.println(iter.next().getAttributes().get("loginUser"));
			}
			System.out.println("------------------------------------------------------------");
			if(map.get(msv.getTeamNo()).size() == 1) {
				String content = adminService.selectSqlContent(msv.getTeamNo());
				textMap.put(msv.getTeamNo(), content);
			}
			ArrayList<String> arraylist = new ArrayList<>();
			System.out.println(arraylist);
			for(WebSocketSession preId : set) {
				try {
					String userId = ((Member)preId.getAttributes().get("loginUser")).getUserId();
					arraylist.add(userId);
				}catch(Exception e) {
					
				}
			}
			System.out.println("최종 접속 유저  : " + arraylist);
			TextMessage newMessage = null;
			if(textMap.get(msv.getTeamNo()) != null) {
				newMessage = new TextMessage((arraylist.toString()).replace(" ", "") + "MSG:" +textMap.get(msv.getTeamNo()));
			}else {				
				newMessage = new TextMessage((arraylist.toString()).replace(" ", ""));
			}
//			System.out.println(">>>>>>>");
//			System.out.println(map.get(msv.getTeamNo()));
			for(WebSocketSession m : map.get(msv.getTeamNo())) {
				try {					
					m.sendMessage(newMessage);
				}catch (IllegalStateException e) {
					map.remove(msv.getTeamNo());
				}
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
			System.out.println("sendMember >> " + map.get(msv.getTeamNo()));
			try {
				for(WebSocketSession m : map.get(msv.getTeamNo())) {
					try {						
						m.sendMessage(newMessage);
					}catch(Exception e) {
						
					}
				}
			}catch(NullPointerException e) {
				System.out.println("SEND Error : msv.getTeamNo() : " + msv.getTeamNo());
			}
		} else if(msv.getType().equals("SAVE:")) {
			SqlCloud sql = adminService.selectSqlDate(msv.getTeamNo());
			TextMessage newMessage = new TextMessage("SAVE:"+sql.getModifyDate());
			try {
				for(WebSocketSession m : map.get(msv.getTeamNo())) {
					m.sendMessage(newMessage);
				}
			}catch(NullPointerException e) {
				System.out.println("SAVE: msv.getTeamNo() : " + msv.getTeamNo());
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
