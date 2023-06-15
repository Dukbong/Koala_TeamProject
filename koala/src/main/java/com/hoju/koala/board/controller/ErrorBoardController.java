package com.hoju.koala.board.controller;

import java.util.ArrayList;

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
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/errorBoard")
public class ErrorBoardController {

	@Autowired
	private ErrorBoardService ebService;
	
	//게시글 목록 조회 메소드
	@GetMapping("/list")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 				 Model model) {
		
		int listCount = ebService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Paging.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ErrorSet> ebList = ebService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("ebList", ebList);
		return "board/errorBoard/ebListView";
	}
	
	//게시글 상세 조회 메소드
	@GetMapping("/detail")
	public String enrollForm(int boardNo,
							 Model model) {
		
		ErrorSet eb = ebService.selectBoard(boardNo);
		
		model.addAttribute("eb", eb);
		return "board/errorBoard/ebDetailView2";
	}
	
	
	//게시글 작성폼 이동
	@GetMapping("/enrollForm")
	public String enrollForm(Model model) {
		
		ArrayList<CreateSetting> libList = ebService.selectLibList();  //list로 가져오는법.....
		
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
		
		//세팅테이블 글번호 조회하기
		CreateSetting c = new CreateSetting();
		c.setSettingTitle(settingTitle);
		c.setSettingVersion(settingVersion);
		
		int settingNo = ebService.selectSettingNo(c);
		eb.setRefSno(settingNo);
		
		//세션에 저장된 userNo -- 수정하기
		//String userNo =  (String)session.getAttribute("userNo"); - 확인 필요
		String userNo = "7";
		b.setBoardWriter(userNo);
		
		
		int result = ebService.insertBoard(b,eb);
		
		if(result>0) {
			//session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:list";
		}else { //실패
			return "common/error";
		}
	}
	
	//게시글 작성 시 수정폼 생성
	@ResponseBody
	@RequestMapping(value="modifyForm", produces="text/html; charset=UTF-8")
	public String createModifyForm(String settingTitle, String settingVersion, String category) {
		
		CreateSetting c = new CreateSetting();
		
		c.setSettingTitle(settingTitle);
		c.setSettingVersion(settingVersion);
		String str = ebService.createModifyForm(category, c);
		return str;
		
	}
	
	//게시글 수정폼 이동
	
	//게시글 수정 메소드
	
	//게시글 삭제 메소드
	
	
	
	
	//댓글 목록 조회 메소드
	
	//댓글 작성 메소드
	
	//댓글 수정 메소드
	
	//댓글 삭제 메소드
	
	
}
