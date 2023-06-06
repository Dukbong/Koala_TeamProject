package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;
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
		AllCount all = allCount();
		if(all != null) {
			model.addAttribute("allCount", all);
			System.out.println(all);
			return "admin/admin";
		}else {
			return "common/nullPoint";
		}
	}
	public AllCount allCount() {
		return adminService.selectAllCount();
	}
	
	@GetMapping("/supporters.list")
	public ModelAndView adminSupportes(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mav) {
		PageInfo pi = Paging.getPageInfo(allCount().getSupporters(), 1, 5, 4);
		ArrayList<Supporters> supporters = adminService.selectSupporters(pi);
		// log 남기기
		if(supporters == null) {
			log.info("SelectSupporters is NullPoint");
			return new ModelAndView("common/nullPoint");
		}
		mav = new ModelAndView("admin/supportersList");
		mav.addObject("supporterList",supporters);
		mav.addObject("pi", pi);
		
		for(Supporters s : supporters) {
			System.out.println(s);
			System.out.println(s.getNickName()); // getter함수를 사용해서 모두 가져올 수 상속 받은 객체의 필드에 접근 가능
		}
		return mav;
	}
	
	@GetMapping("/waitingLibrary.list")
	public String adminCreateSetting(Model model) {
		ArrayList<CreateSetting> libraryList = adminService.selectCreateSetting();
		for(CreateSetting c : libraryList) {
			System.out.println(c);
		}
		return "";
	}
	
	@GetMapping("/errorboard.list")
	public String adminErrorBoard(Model model) {
		ArrayList<ErrorBoard> errorBoardList = adminService.selectErrorBoard();
		for(ErrorBoard e : errorBoardList) {
			System.out.println(e);
		}
		return "";
	}
	
	@GetMapping("/blockip.list")
	public String adminblockip(Model model) {
		ArrayList<BlockIp> blockIpList = adminService.selectBlockIp();
		for(BlockIp b : blockIpList) {
			System.out.println(b);
		}
		return "";
	}
	
	@GetMapping("/member.list")
	public String adminMemberList(Model model) {
		ArrayList<Member> memberList = adminService.selectMemberList();
		for(Member m : memberList) {
			System.out.println(m);
		}
		return "";
	}
}
