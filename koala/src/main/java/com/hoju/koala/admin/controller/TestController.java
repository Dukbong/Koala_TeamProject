package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.ModifyTeam;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.admin.model.vo.SqlInvite;
import com.hoju.koala.admin.model.vo.Supporters;
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
			SqlCloud sqlInfo = adminService.selectSqlDate(teamNo);
			int creatorNo = adminService.selectCreator(teamNo);
			model.addAttribute("memberList", memberList);
			model.addAttribute("sqlInfo", sqlInfo);
			session.setAttribute("teamNo", teamNo);
			model.addAttribute("teamNo", teamNo);
			model.addAttribute("creatorNo",creatorNo);
		}
		return "fun/test";
	}
	
	@PostMapping("/sqlSave")
	@ResponseBody
	public int sqlSave(int teamNo, String sqlContent) {
		SqlCloud saveSql = SqlCloud.builder().teamNo(teamNo).sqlContent(sqlContent).build();
		return adminService.updateTeamSql(saveSql);
	}
	
	@GetMapping("/ShowcreateTeam")
	public String showCreatTeam(HttpServletRequest request, Model model) {
		Supporters owner = adminService.selectMemberDetailInfo(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		model.addAttribute("owner", owner);
		System.out.println(owner);
		return "fun/createTeam";
	}
	
	@GetMapping("/searchMember")
	@ResponseBody
	public ArrayList<Member> searchMember(String text) {
		ArrayList<Member> memberList = adminService.searchMember(text);
		ArrayList<String> arrList = new ArrayList<>();
		for(Member m : memberList) {
			arrList.add(m.getUserId());
		}
		return memberList;
	}
	
	@GetMapping("/userInfo")
	@ResponseBody
	public Supporters userInfo(String userId) {
		Supporters info = adminService.selectMemberDetailInfo(userId);
		return info;
	}
	
	@GetMapping("/createTeam")
	@ResponseBody
	public int createTeam(String team, String teamName) {
		System.out.println(team);
		String[] arr = team.split(",");
		SqlCloud sql = SqlCloud.builder().teamName(teamName).sqlContent(" ").creatorNo(Integer.parseInt(arr[0])).build();
		int createTeam = adminService.insertSQLteam(sql); // teamCreate
		int insertMember = 0;
		if(createTeam > 0) {
			for(int i = 0; i < arr.length; i++) {
				SqlInvite sqlIn = SqlInvite.builder().creatorNo(Integer.parseInt(arr[0])).userNo(Integer.parseInt(arr[i])).build();
				insertMember = adminService.insertSQLteamMember(sqlIn);
			}
		}
		return insertMember;
	}
	
	@PostMapping("/modifyTeam")
	public String modifyTeam(int teamNo, Model model) {
		System.out.println(teamNo);
		// 필요한거 팀이름 / 오너아이디 / 유저 이름, 유저번호, 사진, 닉네임, 서포터즈 유무
		// sqlCloud, sqlinvite, member, supporter, profile 조인...
		// 30일날 하기
		ArrayList<ModifyTeam> mt = adminService.selectOneTeam(teamNo);
		model.addAttribute("modify", mt.get(0));
		ArrayList<String> arr = new ArrayList<>();
		ObjectMapper om = new ObjectMapper();
		for(int i = 1; i < mt.size(); i++) {
			try {
				String jsonTest = om.writeValueAsString(mt.get(i));
				arr.add(jsonTest);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("test",arr);
		return "fun/modifyTeam";
	}
}