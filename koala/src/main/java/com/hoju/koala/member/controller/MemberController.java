package com.hoju.koala.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.member.model.service.MemberService;
import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		
		
		return "member/loginPage";
	}
	
	//로그인
	@PostMapping("/login")
	public ModelAndView login(HttpSession session,
						Member m,
						ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
		if((loginUser != null) && (bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()))) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("msg", "로그인 완료");
			
			mv.setViewName("redirect:/");
		}else {
			session.setAttribute("msg", "로그인 실패");
			mv.setViewName("member/loginPage");
		}
		
		return mv;
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
	
	
	//회원가입
	@PostMapping("/insert")
	public ModelAndView insertMember(HttpSession session,
								Member m,
								ModelAndView mv) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			session.setAttribute("msg", "회원가입이 완료되었습니다.");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "회원가입 실패");
			mv.setViewName("redirect:/");
		}
		
		
		return mv;
	}
	
	
	//회원 정보 조회 (활동내역)
	@GetMapping("/ad")
	public ModelAndView ad(int userNo,
					 ModelAndView mv) {
		
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userNo);
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(userNo);
		
		if(m != null) {
			mv.addObject("user", m);
			mv.addObject("followCnt", cnt);
			
			mv.setViewName("member/activityDetailPage");
		}
		
		
		return mv;
	}
	
	//자기소개 업데이트
	@PostMapping("/update.intro")
	public ModelAndView updateIntroduce(ModelAndView mv,
										String introduce,
										HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		m.setIntroduce(introduce);
		
		int result = memberService.updateIntroduce(m);
		
		if(result>0) {
			session.setAttribute("loginUser", m);
			session.setAttribute("user", m);
			session.setAttribute("msg", "소개글이 수정되었습니다.");
			
			mv.setViewName("redirect:/member/ad?userNo="+m.getUserNo());
		}else {
			session.setAttribute("msg", "소개글 수정이 실패하였습니다.");
			mv.setViewName("member/activityDetailPage");
		}
		
		return mv;
	}
	
	
	//팔로우
	@ResponseBody
	@GetMapping("/follow")
	public int follow(Follow f) {
		
		int result = memberService.addFollow(f);
		
		if(result>0) {
			result = 1;
		}else {
			int result2 = memberService.removeFollow(f);
			
			if(result2>0) {
				result = 2;
				
			}
		}
		
		return result;
		
	}
	
	
	
}
