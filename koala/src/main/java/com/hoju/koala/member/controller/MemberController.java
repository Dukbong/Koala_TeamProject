package com.hoju.koala.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberSerivce;
	
	
	
	@GetMapping("/login")
	public String login() {
		
		
		return "member/loginPage";
	}
	
	
	
}
