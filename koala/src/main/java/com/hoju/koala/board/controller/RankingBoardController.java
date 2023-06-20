package com.hoju.koala.board.controller;

import java.util.ArrayList;
import java.util.List;

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

			public RankCal(List<Member> previousData) {
				this.previousData = previousData;
				System.out.println(previousData);
			}

			public List<Member> calculateRank() {
				//새로운 등수 정보 저장
			    List<Member> result = new ArrayList<>();
			    int previousRank = 1; //첫번째 회원의 등수로 초기화

			    for (Member newMember : previousData) {
			        Member previousMember = findMemWithRank(previousData, newMember.getUserId());
			        
			        if (previousMember != null) {
			            previousRank = previousMember.getRank();
			        }

			        int currentRank = previousRank + 1;
			        int rankDifference = currentRank - previousRank;

			        System.out.println("자기 등수: " + newMember.getRank());
			        String rankChange = getRankChangeIcon(rankDifference);

			        newMember.setRank(currentRank);
			        newMember.setRankChange(rankChange);
			        result.add(newMember);

			        previousRank = currentRank;
			    }

			    return result;
			}
			
			//이전 데이터에서 특정 회원의 등수 정보를 찾아오는 메소드
			private Member findMemWithRank(List<Member> members,String userId) {
				for(Member m : members) {
					if(m.getUserId().equals(userId)) {
						return m;
					}
				}
				return null;
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