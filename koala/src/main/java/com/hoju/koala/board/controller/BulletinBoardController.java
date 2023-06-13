package com.hoju.koala.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BulletinBoardController {

	@RequestMapping("bulletinboard.bo")//currentPage 넣어주기
	public String selectBoard() {
		return "../views/board/freeBoard/boardListView";
	}
	
	@RequestMapping("test.do")//currentPage 넣어주기
	public String Board() {
		return "../views/board/freeBoard/test";
	}
}
