package com.hoju.koala.board.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.board.model.service.RankingBoardService;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@EnableScheduling
@RequestMapping("/rankingBoard")
public class RankingBoardController {

	@Autowired
	private RankingBoardService rnkService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private RankCal rankCal;
	
	@Autowired
	private Properties rankings;
	
	
	// 랭킹페이지
		@GetMapping("rankingPage")
		public String rankingList(Model model) {
			ArrayList<Member> newData = rnkService.rankingList(); // 새로운 데이터 ( 저장된거 불러온거 )

			rankings.clear();//기존 랭킹 데이터 초기화
			
//			//properties 객체 생성 및 초기화
//			rankings = new Properties();
//			rankCal = new RankCal(rankings);
			
			rankCal.setPreviousData(newData);//이전 데이터 설정
			
			
			List<Member> calculatedData = rankCal.calculateRank(); // 순위 및 등락 계산

			model.addAttribute("list", calculatedData);

			return "board/rankingBoard/rankingBoard";
		}
		
		@Scheduled(fixedRate = 3600000) // 1시간
		public void saveRankingsToFile() {
			log.info("스케쥴러 : 등수 저장중");
			try {
				FileOutputStream outputStream = new FileOutputStream("rankings.properties");
				Properties properties = new Properties();
				
				List<Member> previousData = rankCal.getPreviousData();//previousData갖고오기
				int rank = 1;
				
				for(Member m : previousData) {
					String userId = m.getUserId();
					String rankKey = "rank." + rank;
					properties.setProperty(rankKey, userId);
					rank ++;
					log.info("등수 저장 완료!");
				}
				
				properties.store(outputStream, null);
				outputStream.close();
				System.out.println("랭킹 저장됨");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
}