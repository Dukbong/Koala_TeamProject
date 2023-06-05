package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/main")
	public String adminMain(Model model) {
		AllCount all = adminService.selectAllCount();
		if(all != null) {
			model.addAttribute("allCount", all);
			System.out.println(all);
			return "admin/admin";
		}else {
			return "common/nullPoint";
		}
	}
	
	@GetMapping("/supporters")
	public ModelAndView adminSupportes(ModelAndView mav) {
		ArrayList<Supporters> supporter = adminService.selectSupporters();
		// log 남기기
		if(supporter == null) {
			log.info("SelectSupporters is NullPoint");
			return new ModelAndView("common/nullPoint");
		}
		mav = new ModelAndView("admin/supportersList");
		mav.addObject("supporterList",supporter);
		
		for(Supporters s : supporter) {
			System.out.println(s);
			System.out.println(s.getNickName()); // getter함수를 사용해서 모두 가져올 수 상속 받은 객체의 필드에 접근 가능
		}
		return mav;
	}
	
	@GetMapping("/waitingLibrary")
	public String adminCreateSetting(Model model) {
		ArrayList<CreateSetting> libraryList = adminService.selectCreateSetting();
		for(CreateSetting c : libraryList) {
			System.out.println(c);
		}
		return "";
	}
	
	@GetMapping("/errorboard")
	public String adminErrorBoard(Model model) {
		ArrayList<ErrorBoard> errorBoardList = adminService.selectErrorBoard();
		for(ErrorBoard e : errorBoardList) {
			System.out.println(e);
		}
		return "";
	}
	
	@GetMapping("/blockiplist")
	public String adminblockip(Model model) {
		ArrayList<BlockIp> blockIpList = adminService.selectBlockIp();
		for(BlockIp b : blockIpList) {
			System.out.println(b);
		}
		return "";
	}
	
	@GetMapping("/memberList")
	public String adminMemberList(Model model) {
		ArrayList<Member> memberList = adminService.selectMemberList();
		for(Member m : memberList) {
			System.out.println(m);
		}
		return "";
	}
}
