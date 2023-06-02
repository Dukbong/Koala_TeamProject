package com.hoju.koala.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.member.model.service.MemberService;
import com.hoju.koala.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		
		
		return "member/loginPage";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(HttpSession session,
						Member m,
						Model model) {
		
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:/";
		}else {
			model.addAttribute("msg", "로그인 실패");
			
			return "member/loginPage";
		}
		
		
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	
	//회원가입페이지이동
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/enrollPage";
	}
	
	
	//활동 내역페이지 이동
	@GetMapping("/ad")
	public String ad() {
		
		return "member/activityDetailPage";
	}
	
	
	
	
	
}
