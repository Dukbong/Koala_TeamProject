package com.hoju.koala.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.board.model.service.RankingBoardService;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rankingBoard")
public class RankingBoardController {

	@Autowired
	private RankingBoardService rnkService;
	
	// 랭킹페이지
		@GetMapping("rankingPage")
		public String rankingList(Model model) {
			ArrayList<Member> newData = rnkService.rankingList(); // 새로운 데이터 ( 저장된거 불러온거 )

			//properties 객체 생성 및 초기화
			Properties rankings = new Properties();
			
			//RankCal인스턴스 생성
			RankCal rankCal = new RankCal(rankings);
			rankCal.setPreviousData(newData);//이전 데이터 설정
			
			List<Member> calculatedData = rankCal.calculateRank(); // 순위 및 등락 계산

			model.addAttribute("list", calculatedData);

			return "board/rankingBoard/rankingBoard";
		}
		
		
}