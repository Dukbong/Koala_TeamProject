package com.hoju.koala.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.service.ErrorBoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/errorBoard")
public class ErrorBoardController {

	@Autowired
	private ErrorBoardService ebService;
	
	//게시글 목록 조회 메소드
	@GetMapping("/list")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 @RequestParam(value="category", defaultValue="") String category,
							 @RequestParam(value="keyword", defaultValue="") String keyword,
							 @RequestParam(value="sort", defaultValue="") String sort,
			 				 Model model) {
		
		int listCount = 0;
		HashMap<String,String> hashMap = new HashMap<>();
		ArrayList<ErrorSet> ebList = new ArrayList<>();
		
		if((category.equals("") || keyword.equals("")) && sort.equals("")) {
			listCount = ebService.selectListCount();
		}else {
			hashMap.put("category", category);
			hashMap.put("keyword", keyword);
			hashMap.put("sort", sort);
			
			listCount = ebService.searchListCount(hashMap);
		}
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		if((category.equals("") || keyword.equals("")) && sort.equals("")) {
			ebList = ebService.selectList(pi);
		}else {
			ebList = ebService.searchList(pi, hashMap);
		}
		
		listCount = listCount - (currentPage-1)*boardLimit;
		
		model.addAttribute("pi", pi);
		model.addAttribute("ebList", ebList);
		model.addAttribute("listCount", listCount);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		
		return "board/errorBoard/ebListView";
	}
	
	//게시글 상세 조회 메소드
	@GetMapping("/detail")
	public String enrollForm(int boardNo,
							 Model model) {
		//조회수 증가 메소드
		int result = ebService.increaseCount(boardNo);
		
		if(result>0) {
			
			ErrorSet eb = ebService.selectBoard(boardNo);
			
			//댓글 목록 조회 메소드
			ArrayList<Reply> reList = ebService.selectReplyList(boardNo);
			
			model.addAttribute("eb", eb);
			model.addAttribute("reList", reList);
			return "board/errorBoard/ebDetailView";
			
		}else {
			
			model.addAttribute("errorMsg", "게시글 조회에 실패했습니다.");
			return "common/error";
		}
	}
	
	//게시글 작성폼 이동
	@GetMapping("/enrollForm")
	public String enrollForm(Model model) {
		
		ArrayList<CreateSetting> libList = ebService.selectLibList();
		
		model.addAttribute("libList", libList);
		return "board/errorBoard/ebEnrollForm";
	}
	
	//버전 리스트 조회
	@ResponseBody
	@RequestMapping(value="version", produces="text/json; charset=UTF-8")
	public String selectVersion(String settingTitle) {
		
		ArrayList<String> vList = ebService.selectVersion(settingTitle);
		
		return new Gson().toJson(vList);  //이게 맞나?
	}
	
	//게시글 작성 메소드
	@PostMapping("/insert")
	public String insertBoard(String settingTitle,
							  String settingVersion,
							  Board b,
							  ErrorBoard eb,
							  ModelAndView mv,
							  HttpSession session) {
		
		//로그인 유저 번호 가져오기
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		b.setBoardWriter(userNo);
		
		//세팅테이블 글번호 조회하기
		CreateSetting c = new CreateSetting();
		c.setSettingTitle(settingTitle);
		c.setSettingVersion(settingVersion);
		
		int settingNo = ebService.selectSettingNo(c);
		eb.setRefSno(settingNo);
		
		int result = ebService.insertBoard(b,eb);
		
		if(result>0) {
			session.setAttribute("msg", "게시글 작성이 완료되었습니다.");
			return "redirect:list";
		}else { //실패
			return "common/error";
		}
	}
	
	//게시글 작성 시 수정폼 생성
	@ResponseBody
	@RequestMapping(value="modifyForm", produces="text/html; charset=UTF-8")
	public String createModifyForm(String settingTitle, 
								   String settingVersion,
								   String category) {
		
		CreateSetting c = new CreateSetting();
		c.setSettingTitle(settingTitle);
		c.setSettingVersion(settingVersion);
		
		String str = ebService.createModifyForm(category, c);
		
		return str;
	}
	
	//게시글 수정폼 이동
	@GetMapping("updateForm")
	public String updateForm(int boardNo,
							  Model model) {
		
		ErrorSet eb = ebService.selectBoard(boardNo);
		
		model.addAttribute("eb", eb);
		return "board/errorBoard/ebUpdateForm";
	}
	
	//게시글 수정 메소드
	@PostMapping("updateBoard")
	public String updateBoard(Board b,
							  ErrorBoard eb,
							  HttpSession session) {
		
		int result = ebService.updateBoard(b,eb);
		
		if(result>0) {
			session.setAttribute("msg", "게시글이 성공적으로 수정되었습니다.");
			return "redirect:detail?boardNo="+b.getBoardNo(); //이게 맞나..
		}else {	
			session.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
			return "common/error";
		}
	}
	
	//게시글 삭제 메소드
	@GetMapping("deleteBoard")
	public String deleteBoard(int boardNo,
							  HttpSession session) {
		
		int result = ebService.deleteBoard(boardNo);
		
		if(result>0) {
			session.setAttribute("msg", "게시글이 삭제되었습니다.");
			return "redirect:list";
		}else {	
			session.setAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			return "common/error";
		}
	}

	//댓글 작성 메소드
	@ResponseBody
	@PostMapping("insertReply")
	public int insertReply(Reply r) {

		return ebService.insertReply(r);
	}
	
	//댓글 수정 메소드
	@ResponseBody
	@PostMapping("updateReply")
	public int updateReply(Reply r) {
		
		return ebService.updateReply(r); 
	}
	
	//댓글 삭제 메소드
	@ResponseBody
	@GetMapping("deleteReply")
	public int deleteReply(int replyNo) {
		
		return ebService.deleteReply(replyNo);
	}
	
	//닉네임으로 아이디 구하기
	@ResponseBody
	@GetMapping("selectId")
	public String selectId(String nickName) {
		
		return ebService.selectId(nickName);
	}
	
	//유저에러 해결완료
	@GetMapping("updateSolved")
	public String updateSolved(int boardNo,
							   HttpSession session) {
		
		int result =  ebService.updateSolved(boardNo);
		String userId = String.valueOf(((Member)session.getAttribute("loginUser")).getUserId());
		
		if(result>0) {
			session.setAttribute("msg", "해당 게시글의 상태값이 해결완료로 변경되었습니다.");
			return "redirect:/member/boardList?userId="+userId;
		}else {	
			session.setAttribute("errorMsg", "게시글 상태값 변경에 실패했습니다.");
			return "common/error";
		}
	}
	
}
