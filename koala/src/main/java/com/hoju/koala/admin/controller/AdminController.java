package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private PageInfo page;
	private AllCount all;
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/main")
	public String adminMain(Model model) {
		model.addAttribute("allCount", allCount());
		return "admin/admin";
	}
	
	// 전체 적인 총 게시글 수를 확인할 수 있는 메서드
	public AllCount allCount() {
		return adminService.selectAllCount();
	}
	
	@GetMapping("/supporters.list")
	// Paging class에서 currentPage가 0이면 1로 변경 해주기 때문에 디폴트 값을 설정할 필요가 없다.
	public ModelAndView adminSupportes(PageInfo p, ModelAndView mav) {
		page = Paging.getPageInfo(allCount().getSupporters(), p.getCurrentPage(), 5, 4);
		ArrayList<Supporters> supporters = adminService.selectSupporters(page);
		mav = new ModelAndView("admin/supportersList");
		mav.addObject("supporterList",supporters);
		mav.addObject("pi", page);
		return mav;
	}
	
	@GetMapping("/supporters.demote")
	@ResponseBody
	public String adminSupportersDelete(String userId, Model model) {
		int result = adminService.deleteSupporter(userId);
		return new Gson().toJson(String.valueOf(result));
	}

	@GetMapping("/waitingLibrary.list")
	public String adminCreateSetting(Model model) {
		ArrayList<CreateSetting> libraryList = adminService.selectCreateSetting();
		for(CreateSetting c : libraryList) {
			System.out.println(c);
		}
		return "";
	}
	
	@GetMapping("/errorcheck.list")
	public String adminErrorBoard(PageInfo p, Model model) {
		page = Paging.getPageInfo(allCount().getSupporters(), p.getCurrentPage(), 10, 10);
		ArrayList<ErrorBoard> errorBoardList = adminService.selectErrorBoard(page);
		model.addAttribute("errorList", errorBoardList);
		model.addAttribute("pi", page);
		return "admin/errorcheckList";
	}
	
	@GetMapping("/blockip.list")
	public String adminblockip(PageInfo p, Model model) {
		page = Paging.getPageInfo(allCount().getBlockIp(), p.getCurrentPage(), 10, 9);
		System.out.println("Class c를 매개변수로 " + page.test(this.getClass()));
		ArrayList<BlockIp> blockIpList = adminService.selectBlockIp(page);
		model.addAttribute("blackList", blockIpList);
		model.addAttribute("pi", page);
		return "admin/blockIpList";
	}
	
	@GetMapping("/blockip.clear")
	@ResponseBody
	public String adminblockipClear(String blackIp) {
		int result = adminService.updateblockClear(blackIp);
		return new Gson().toJson(String.valueOf(result));
	}
	
	@GetMapping("/blockip.action")
	@ResponseBody
	public String adminblockipAction(String blackIp) {
		int result = adminService.updateblockAction(blackIp);
		return new Gson().toJson(String.valueOf(result));
	}
	
	@GetMapping("/member.list")
	public String adminMemberList(PageInfo p, Model model) {
		page = Paging.getPageInfo(allCount().getSupporters(), p.getCurrentPage(), 10, 10);
		ArrayList<Supporters> memberList = adminService.selectMemberList(page);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pi", page);
		return "admin/memberList";
	}
	
	@GetMapping("/promote.waiting")
	@ResponseBody
	public String promoteWait(String client_No) {
		int result = adminService.InsertSupporters(client_No);
		return new Gson().toJson(String.valueOf(result));
	}
	
	@GetMapping("/promote.cancel")
	@ResponseBody
	public String promoteCancel(String client_No) {
		System.out.println(client_No);
		int result = adminService.deleteSupporters(client_No);
		return new Gson().toJson(String.valueOf(result));
	}
	
	// 모드를 쿠키로 저장할 메서드
	@GetMapping("mode.check")
	@ResponseBody
	public String displayMode(String mode, Model model, HttpServletResponse response) {
		Cookie cookie = new Cookie("mode", mode);
		cookie.setMaxAge(24*60*60*1000); //24시간
		cookie.setPath("/");
		response.addCookie(cookie);
		return new Gson().toJson(cookie);
	}
}