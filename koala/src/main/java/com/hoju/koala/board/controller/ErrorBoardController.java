package com.hoju.koala.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoju.koala.board.model.service.ErrorBoardService;

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
		
		//ArrayList<Board> bList = ebService.selectList();
		
		log.info("리스트 테스트");
		
		return "board/errorBoard/ebListView";
	}
	
	//게시글 상세 조회 메소드
	
	//게시글 작성폼 이동
	
	//게시글 작성 메소드
	
	//게시글 수정폼 이동
	
	//게시글 수정 메소드
	
	//게시글 삭제 메소드
	
	
	
	
	//댓글 목록 조회 메소드
	
	//댓글 작성 메소드
	
	//댓글 수정 메소드
	
	//댓글 삭제 메소드
	
	
}
