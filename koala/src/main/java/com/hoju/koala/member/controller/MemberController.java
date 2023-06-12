package com.hoju.koala.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.common.model.vo.EmailCheck;
import com.hoju.koala.member.model.service.MemberService;
import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	
	
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
		
		if((loginUser != null) && (pwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()))) {
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
		
		String encPwd = pwdEncoder.encode(m.getUserPwd());
		
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
	public ModelAndView ad(String userId,
					 ModelAndView mv) {
		
		System.out.println(userId);
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
		System.out.println(m);
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
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
		
		//좋아요가 등록되어있나 조회
		int cnt = memberService.selectFollow(f);
		
		int result = 0;
		
		if(cnt == 0) { //없다면 추가
			memberService.addFollow(f);
			
			result = 1;
		}else if(cnt == 1) { //있다면 삭제
			memberService.removeFollow(f);
			
			result = 2;
		}
		
		return result;
		
	}
	
	//ID/PWD 찾기 페이지 이동
	@GetMapping("/forget")
	public String forget() {
		
		return "member/forgetPage";
	}
	
	
	// 이메일로 해당 유저의 ID와 임시 패스워드보내기
	@PostMapping("/sendEmail")
	public ModelAndView sendEmail(ModelAndView mv,
									HttpServletRequest request) {
		
		//아이디와 비밀번호를 찾고하자는 유저가 입력한 이메일
		String userEmail = request.getParameter("userEmail");
		
		//입력한 이메일에 대한 데이터가 있는지 조회 있다면 아이디만 가져오기
		String userId = memberService.selectEmail(userEmail);
		
		
		
		
		return null;
	}

	//계정설정 페이지 이동
	@GetMapping("/as")
	public String as(HttpSession session) {
		
		return "member/accountSettingPage";
	}
	
	
	//비밀번호 변경
	@ResponseBody
	@PostMapping("/updatePwd")
	public int updatePwd(HttpServletRequest request) {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		//해쉬함수로인해 암호화된 현재 비밀번호
		String currentPwd = loginUser.getUserPwd();

		//모달창에서 현재 비밀번호 인풋에 사용자 입력값
		String userPwd = request.getParameter("userPwd");
		//모달창에서 사용자가 입력한 새로운비밀번호
		String newPwd = request.getParameter("newPwd");
		
		int result = 0;
		if(pwdEncoder.matches(userPwd, currentPwd) && (!userPwd.equals(newPwd))) { //부합할때 진행
			
			loginUser.setUserPwd(pwdEncoder.encode(newPwd));
			
			result = memberService.updatePwd(loginUser);
			
			if(result>0) { //성공적으로 데이터베이스 업데이트했으면 세션loginUser 바꿔주기
				request.getSession().setAttribute("loginUser", loginUser);
			}
		}
		
		return result;
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("/idCheck")
	public int idCheck(String inputId) {
		
		
		int result = memberService.idCheck(inputId);
		
		//result가 1이면 중복(사용불가) 2이면 중복x(사용가능)
		return result;
	}
	
	//닉네임 중복체크
	@ResponseBody
	@GetMapping("/nickCheck")
	public int nickCheck(String inputNick) {
		
		int result = memberService.nickCheck(inputNick);
		
		return result;
	}
	
	//이메일 인증코드 보내기
	@ResponseBody
	@GetMapping("/emailCheck")
	public String emailCheck(String inputEmail) {
		
		EmailCheck ec = new EmailCheck();
		
		//이메일전송후 인증번호 반환
		String certiCode = ec.joinEmail(inputEmail);
		System.out.println("인증번호 : "+certiCode);
		
		return certiCode;
	}
	
	
}
