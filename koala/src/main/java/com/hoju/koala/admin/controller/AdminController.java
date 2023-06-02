package com.hoju.koala.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.Supporters;

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
		System.out.println(all);
		model.addAttribute("allCount", all);
		return "admin/admin";
	}
	
	@GetMapping("/supporters")
	public String adminSupportes(Model model) {
		ArrayList<Supporters> supporter = adminService.selectSupporters();
		
		// 오류 발생 시 로그 파일로 남기기
		if(supporter == null) {
			log.info("SelectSupporters is NullPoint");
			return "common/nullPoint";
		}
		
		model.addAttribute("supporterList",supporter);
		
		// view로 전달 전 확인 작업
		for(Supporters s : supporter) {
			System.out.println(s);
		}
		
		return "admin/supportersList";
	}
}
