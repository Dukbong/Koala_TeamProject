package com.hoju.koala.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.board.model.service.RankingBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rankingBoard")
public class RankingBoardController {

	@Autowired
	private RankingBoardService rnkService;
	
	//랭킹페이지
		@GetMapping("rankingPage")
		public String rankingPage() {
			return "board/rankingBoard/rankingBoard";
		}
		
		
}
