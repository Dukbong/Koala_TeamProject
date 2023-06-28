package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.member.model.vo.Member;

@Controller
@RequestMapping("/together")
public class TestController {
	/*
	 * https://api.github.com/users/Dukbong/repos
	 * > repo 내역을 java단에게 list에 담는다.
	 * 객체 : repo이름 / 생성일 / 마지막 업데이트 일 / 마지막 푸시 일
	 * 
	 *  1. 게시판을 만든다.
	 *  2. 작은 깃허브를 만들꺼다.
	 * */
	
	// Supporters 게시판에서 

	@Autowired
	AdminService adminService;
	
	@GetMapping("/sqlCloud")
	public String sqlCloud(HttpSession session, Model model,
						   @RequestParam(value="teamNo", required = false, defaultValue = "0") int teamNo) {
		// 현재 팀이 있는지 확인
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		ArrayList<SqlCloud> teamList = adminService.selectTeam(userNo); 
		model.addAttribute("teamList", teamList); 
		
		if(teamNo != 0) {
			ArrayList<Member> memberList = adminService.selectTeamMember(teamNo);
			int creatorNo = adminService.selectCreator(teamNo);
			model.addAttribute("memberList", memberList);
			session.setAttribute("teamNo", teamNo);
			model.addAttribute("teamNo", teamNo);
			model.addAttribute("creatorNo",creatorNo);
		}
//		return "fun/onePage4";
		return "fun/test";
	}
}