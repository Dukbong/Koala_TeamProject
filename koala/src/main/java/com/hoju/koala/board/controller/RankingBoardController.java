package com.hoju.koala.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			ArrayList<Member> newData = rnkService.rankingList(); // 새로운 데이터

			RankCal rankCal = new RankCal(newData);

			List<Member> calculatedData = rankCal.calculateRank(); // 순위 및 등락 계산

			model.addAttribute("list", calculatedData);

			return "board/rankingBoard/rankingBoard";
		}

		// 등락 계산
				class RankCal {

					private List<Member> previousData; // 이전 데이터
					private Map<String,Integer> previousRanks;//예전 등수 저장 맵
					
					public RankCal(List<Member> previousData) {
						this.previousData = previousData;
						this.previousRanks = new HashMap<>();
						
						// 이전 데이터의 등수 정보를 previousRanks 맵에 설정
					    for (Member m : previousData) {
					        previousRanks.put(m.getUserId(), m.getRank());
					    }
					    
//					    for (Member m : previousData) {
//					        System.out.println("회원 아이디: " + m.getUserId() + ",등수 : " + m.getRank());
//					    }
					}
					

					//예전 등수 저장 맵
					private Member findMemWithRank(Map<String,Integer> previousRanks,String userId) {
						Integer previousRankStored = previousRanks.get(userId);
					    if(previousRankStored != null) {
					    	for(Member m : previousData) {
					    		if(m.getRank() == previousRankStored) {
					    			return m;
					    		}
					    	}
					    }
					    return null;
					}
					
					public List<Member> calculateRank() {
					    List<Member> result = new ArrayList<>();
					    int rank = 0;//순위 만들기

					    for (Member newMember : previousData) {
					        int currentRank = rank + 1; //차례로 순위 먹이기
					        System.out.println("현재 순위 : "+currentRank);
					        
					        String userId = newMember.getUserId();
					        Member previousMember = findMemWithRank(previousRanks,userId);// previousRanks 맵에서 예전 등수를 가져옴
					        
					        if(previousMember != null) {//예전 등수가 있을 때
					        	int previousRankStored = previousMember.getRank();//예전등수 가져오기
					        	System.out.println("예전 등수 : "+previousRankStored);
					        	int rankDifference = currentRank - previousRankStored;
					        	previousRanks.put(userId, currentRank);//현재 등수를 맵에 저장
					        	
					        	//등수 차이 계산 및 처리
					        	String rankChange = getRankChangeIcon(rankDifference);
					        	System.out.println("등수 차이 : "+rankDifference);
					        	
					        	newMember.setRank(currentRank);
					        	newMember.setRankChange(rankChange);					        	
					        }else {//예전 등수가 없을 경우
					        	System.out.println("예전 등수 없음");
					        	previousRanks.put(userId, currentRank);
					        	newMember.setRank(currentRank);
					        	newMember.setRankChange("-");
					        }
					        
					        result.add(newMember);

					        rank = currentRank;
					        System.out.println("등수 : "+rank);
					    }

					    return result;
					}
			

			//아이콘 적용
			private String getRankChangeIcon(int rankDifference) {
				if (rankDifference < 0) {
					return "<i class='fa-solid fa-down-long'></i>";
				} else if (rankDifference > 0) {
					return "<i class='fa-solid fa-up-long'></i>";
				} else {
					return "-";
				}
			}
		}
	}