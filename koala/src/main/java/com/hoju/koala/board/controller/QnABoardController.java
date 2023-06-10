package com.hoju.koala.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.board.model.service.QnABoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qnaBoard")
public class QnABoardController {
	
	@Autowired
	private QnABoardService qnaService;

	//qna게시글 리스트 이동
	@GetMapping("/list")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
																					Model model) {
		
		//qna게시글 목록 조회
		int listCount = qnaService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
		ArrayList<Board> list = qnaService.selectList(pi);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);

		return "board/qnaBoard/qnaBoardList";
	}
	
	//qna게시글 상세 조회
	@GetMapping("/detail")
	public ModelAndView selectBoard(int boardNo,
									ModelAndView mv) {
		
		int result = qnaService.increateCount(boardNo);
		if(result>0) {
			Board b = qnaService.selectBoard(boardNo);
//			ArrayList<BoardAttachment> at = qnaService.selectAttachment(boardNo);

//			mv.addObject("at",at);
			mv.addObject("b",b).setViewName("board/qnaBoard/qnaBoardDetail");
		}else {
			mv.addObject("errorMsg","게시글 조회실패").setViewName("common/error");
		}
		
		return mv;
	}

}
