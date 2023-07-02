package com.hoju.koala.member.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.common.model.vo.EmailCheck;
import com.hoju.koala.member.cookie.MemberCookie;
import com.hoju.koala.member.model.service.MemberService;
import com.hoju.koala.member.model.vo.Attendance;
import com.hoju.koala.member.model.vo.Calendar;
import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;
import com.hoju.koala.member.model.vo.Profile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private EmailCheck ec;
	
	@Autowired
	private MemberCookie mCookie;
	
	@Autowired
	private CalendarController calendar;
	
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public String login(@CookieValue(value = "saveId", required = false) String saveId,
						Model model,
						HttpServletResponse response) {
		
		if (saveId != null) {
	        model.addAttribute("savedId", saveId);
	    }
	    return "member/loginPage";
	}
	
	//로그인
	@PostMapping("/login")
	public ModelAndView login(HttpSession session,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  Member m,
							  ModelAndView mv) {
		
		//아이디저장 
		String keepId = request.getParameter("keepId");
		
		//아이디 값에 대한 유저 정보 가져오기
		Member loginUser = memberService.loginMember(m);
		

		log.debug("아이디 저장 상태 : {}", request.getParameter("keepId"));

		
		//로그인 시 출석 등록 ======================================== 설희

		int userNo =  loginUser.getUserNo();
		memberService.attendance(userNo);
		//======================================================

		
		//가져온 유저정보와 사용자가 로그인창에 입력한 아이디 비밀번호가 일치하는지 확인
		if((loginUser != null) && ((pwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) || m.getUserPwd().equals(loginUser.getUserPwd())) ) {
			
			//loginUser세션에 그 유저에 대한 프로필정보도 넣기
//			Profile profile = memberService.selectProfile(loginUser.getUserNo());
//			//System.out.println(profile);
//			
//			loginUser.setProfile(profile);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("msg", "로그인 완료");
			
			if (keepId != null && keepId.equals("on")) { //뷰의 체크박스가 체크된상태로 넘어오면
	            // 아이디를 쿠키에 저장
	            mCookie.setCookie(response, "saveId", loginUser.getUserId(), 604800); //쿠키수명 7일
	        } else {
	            // 쿠키에서 아이디 삭제
	            mCookie.deleteCookie(response, "saveId");
	        }
			
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
		
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
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
			
			mv.setViewName("redirect:/member/ad?userId="+m.getUserId());
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
	@PostMapping("/forget")
	public ModelAndView forget(ModelAndView mv,
									HttpServletRequest request) {
		
		//아이디와 비밀번호를 찾고하자는 유저가 입력한 이메일
		String userEmail = request.getParameter("userEmail");
		
		//입력한 이메일에 대한 데이터가 있는지 조회 있다면 회원정보 가져오기
		Member m = memberService.selectEmail(userEmail);
		
		log.debug("이메일에 대한 회원 정보 : {}", m);
		
		String newPwd = null;
		
		if(m != null) {
			//이메일에대한 아이디가 존재하면 임시비밀번호 생성하고 아이디와 함꼐 이메일보내기
			newPwd = ec.forgetUserEmail(userEmail, m.getUserId());
			
			log.debug("임시비밀번호 : {}", newPwd);
			//임시비밀번호 암호화
			String encPwd = pwdEncoder.encode(newPwd);
			
			m.setUserPwd(encPwd);
			
			//회원정보도 업데이트
			int result = memberService.updatePwd(m);
			
			if(result > 0) { //임시비밀번호 암호화하고 회원정보 업데이트까지 완료되었다면
				request.getSession().setAttribute("msg", "이메일 발송이 완료되었습니다. 이메일을 확인해주세요.");
				mv.setViewName("redirect:/member/login");
			}else {
				request.getSession().setAttribute("msg", "이메일 전송처리 과정에서  오류");
				mv.setViewName("redirect:/member/login");
			}
		}else {
			//없다면
			request.getSession().setAttribute("msg", "존재하지 않는 이메일입니다.");
			
			mv.setViewName("redirect:/member/forget");
		}
		
		return mv;
	}

	//계정설정 페이지 이동
	@GetMapping("/as")
	public String as(HttpSession session) {
		
		//다시 보내기전에 세션값 최신화하고 보내기
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("로그인 유저임니다."+loginUser);
		
		return "member/accountSettingPage";
	}
	
	//닉네임 변경
	@ResponseBody
	@GetMapping("/updateNick")
	public int updateNick(String inputNick,
						  HttpServletRequest request) {
		
		//변경전
		Member m = (Member)request.getSession().getAttribute("loginUser");
		//입력한 닉네임이 이미 존재하는지 확인
		int cnt = memberService.selectNick(inputNick);
		
		int result = 0;
		
		if(cnt == 0) {
			//사용가능
			m.setNickName(inputNick);
			result = memberService.updateNick(m);
			
			if(result>0) {
				//변경후 로그인유저 세션업데이트
				Member loginUser = memberService.selectMember(m.getUserId());
				request.getSession().setAttribute("loginUser", loginUser);
			}
			
		}
	
		//닉네임 중복되면 자동으로 result에 0이 담김
		
		return result;
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
	
	//계정삭제
	@ResponseBody
	@PostMapping("/deleteMember")
	public int deleteMember(String userId) {

		log.debug("삭제 요청 ID : {}", userId);
		//상태값만 N변경, DELETE_DATE 추가 최종삭제는 DELETE_DATE로부터 스케줄러를 통해 30일 이후에 삭제될 예정
		int result = memberService.deleteMember(userId);
		
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
		
		
		//이메일전송후 인증번호 반환(현재 전송 막아논 상태)
		String certiCode = ec.joinEmail(inputEmail);
		
		log.debug("인증 번호  : {}", certiCode);
		
		return certiCode;
	}
	
	
	//활동내역 boardList
	@GetMapping("/boardList")
	public ModelAndView boardList(ModelAndView mv,
								  String userId) {
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
		ArrayList<Board> bList = memberService.boardList(userId);
		
		mv.addObject("user", m);
		mv.addObject("followCnt", cnt);
		mv.addObject("bList", bList);
		mv.setViewName("member/activityDetailPage");
		
		
		return mv;
	}
	
	//활동내역 replyList
	@GetMapping("/replyList")
	public ModelAndView replyList(ModelAndView mv,
								  String userId) {
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
		ArrayList<Board> rList = memberService.replyList(userId);
		
		mv.addObject("user", m);
		mv.addObject("followCnt", cnt);
		mv.addObject("rList", rList);
		mv.setViewName("member/activityDetailPage");
		
		
		return mv;
	}
	
	//활동내역 LikedList
	@GetMapping("/likedList")
	public ModelAndView likedList(ModelAndView mv,
								  String userId) {
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
		ArrayList<Board> lList = memberService.likedList(userId);
		
		mv.addObject("user", m);
		mv.addObject("followCnt", cnt);
		mv.addObject("lList", lList);
		mv.setViewName("member/activityDetailPage");
		
		
		return mv;
	}
	
	
	//활동내역 Following
	@GetMapping("/followingList")
	public ModelAndView followingList(ModelAndView mv,
								  String userId) {
		
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
		
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
		ArrayList<Member> fList = memberService.followingList(userId);
		
		mv.addObject("user", m);
		mv.addObject("followCnt", cnt);
		mv.addObject("fList", fList);
		mv.setViewName("member/activityDetailPage");
		
		
		return mv;
	}
	
	//해당 유저의 contributions 조회 ======================================== 설희
	@GetMapping("/contributions")
	public ModelAndView selectContributions(ModelAndView mv,
											String userId) {
		//조회해온 유저담기
		Member m = memberService.selectMember(userId);
				
		//해당 유저팔로우수 조회
		int cnt = memberService.selectFollowCount(m.getUserNo());
		
		int userNo = m.getUserNo();
		ArrayList<Attendance> attList = memberService.selectContributions(userNo);
		ArrayList<Calendar> calList = calendar.selectCalendar(attList);
		
		mv.addObject("user", m);
		mv.addObject("followCnt", cnt);
		mv.addObject("calList", calList);
		mv.setViewName("member/activityDetailPage");
		
		return mv;
	}
	
	//프로필 관련
	@ResponseBody
	@PostMapping("/profile")
	public int profile(MultipartFile upFile,
					   HttpServletRequest request
					   ) {
		//세션에서 로그인유저 꺼내기
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		if (!upFile.isEmpty()) {
			//넘어온 파일이 있다면
			
			String filePath = "/resources/memberImage/";
			
			//실제 저장경로
			String savePath = request.getSession().getServletContext().getRealPath(filePath);
			log.debug("실제 저장 경로 : {}", savePath);
			
			//원본 파일명
			String originName = upFile.getOriginalFilename();
			
			//확장자 떼오기
			String extension = originName.substring(originName.lastIndexOf("."));
			
			//변경된 파일명
			String changeName = System.currentTimeMillis()+extension;
			
			log.debug("바뀐 파일명 : {}", changeName);
			
			
			Profile p = Profile.builder().refUno(loginUser.getUserNo()).originName(originName).changeName(changeName).filePath(filePath).build();
			
			result1 = memberService.insertProfile(p);
			
			if(result1>0) { //DB에 등록이 됐으면
				try {
					//MultipartFile을 이용해 실제 경로에 파일 저장
					upFile.transferTo(new File(savePath+changeName));
					//다 성공적으로 되었으면 최종결과에 1 대입
					result = 1;
					
				} catch (IOException e) {
					e.printStackTrace();
					result = 2; //2는 db에 등록은 햇지만 서버에 파일등록을 못한경우
				}
			}else {
				result = 3; //3은 db에 등록조차 안되었을때
			}
                
        } else {
            log.debug("넘어온 파일 없음");
            //넘어온파일이 없으면 유저번호로 프로필 삭제를 해버리자
            log.debug("빈 파일 넘긴 유저 번호 : {}", loginUser.getUserNo());
            Profile delProfile = memberService.selectProfile(loginUser.getUserNo());
            
            System.out.println("delProfile 불러오기"+delProfile);
            
            
            result2 = memberService.deleteProfile(delProfile);
            
            if(result2>0) { //DB파일 삭제햇으면
            	System.out.println("db삭제완료");
            	File file = new File(request.getSession().getServletContext().getRealPath(delProfile.getFilePath())+delProfile.getChangeName());
            	
            	//서버에서도 파일 삭제
            	file.delete();
            	
            	// -1은 넘어온파일이 없어 db에서 delte수행하고 서버에서도 파일삭제를 했을때
            	result = -1;
            }else {
            	System.out.println("db삭제실패");
            	result = -2; // -2는 db삭제과정에서 오류
            }
            
        }
		//다시 보내기전에 세션값 최신화하고 보내기
		Profile p = memberService.selectProfile(loginUser.getUserNo());
		
		loginUser.setProfile(p);
		
		request.setAttribute("loginUser", loginUser);
		
		return result;
	}
	
	
	//메신저에서 닉네임으로 유저 찾기
	@ResponseBody
	@GetMapping("/searchUser")
	public ArrayList<Member> searchUser(String searchUser) {
		
		log.debug("입력한 유저 닉네임 : {}", searchUser);
		
		ArrayList<Member> mlist = memberService.searchUser(searchUser);
		
		System.out.println(mlist);
//		for(Member m : mlist) {
//			System.out.println(m);
//		}
		
		
		return mlist;
	}
}
