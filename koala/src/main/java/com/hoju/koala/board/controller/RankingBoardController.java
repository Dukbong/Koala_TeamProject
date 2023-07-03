package com.hoju.koala.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.PropertiesLoaderUtils;
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
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 랭킹페이지
		@GetMapping("rankingPage")
		public String rankingList(Model model) {
			ArrayList<Member> newData = rnkService.rankingList(); // 새로운 데이터 ( 저장된거 불러온거 )

			//properties 객체 생성 및 초기화
			Properties rankings = new Properties();
			
			rankings.put("1", "User1");
			rankings.put("2", "User2");
			rankings.put("3", "User3");
			rankings.put("4", "User4");
			rankings.put("5", "User5");
			rankings.put("6", "User6");
			rankings.put("7", "User7");
			rankings.put("8", "User8");
			rankings.put("9", "User9");
			rankings.put("10", "User10");

			/*
			try {
				Resource resource = resourceLoader.getResource("classpath:src/main/webapp/resources/css/ranking.properties");
				rankings.load(resource.getInputStream());
				
				//rankings = PropertiesLoaderUtils.loadAllProperties("classpath:/src/webapp/resources/css/ranking.properties");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
*/			
			//RankCal인스턴스 생성
			RankCal rankCal = new RankCal(rankings);
			rankCal.setPreviousData(newData);//이전 데이터 설정
			
			List<Member> calculatedData = rankCal.calculateRank(); // 순위 및 등락 계산

			model.addAttribute("list", calculatedData);

			return "board/rankingBoard/rankingBoard";
		}
		
		
}