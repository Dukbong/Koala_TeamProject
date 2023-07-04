package com.hoju.koala.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hoju.koala.member.model.vo.Member;


@Component
public class RankCal {
	// 새로운 데이터  List
	private Properties rankings;//프로퍼티 파일의 랭킹 변수
	private List<Member> previousData; // 이전 데이터 ( 현재 데이터
	
	public RankCal(@Autowired Properties rankings) {
		this.rankings = rankings;
		this.previousData = new ArrayList<>();
	}
	
    public void setPreviousData(List<Member> previousData) {
        this.previousData = previousData;
    }
    
    public List<Member> getPreviousData(){
    	return previousData;
    }

 // 아이디로 갖고오기
    private Member findMemWithRank(String userId) {
    	
    	for(Object key : rankings.keySet()) {
    		String rank = (String) key;
    		String user = rankings.getProperty(rank);
    		
    		if(user.equals(userId)) {
    			//등수에 해당하는 회원을 찾았을 때
    			int rankIndex = Integer.parseInt(rank.substring(5));
    			
    			for(Member m : previousData) {
    				if(m.getUserId().equals(user) && m.getRank() == rankIndex) {
    					return m;
    				}
    			}
    		}
    	}
    	
    	return null;

    }

    public List<Member> calculateRank() {
        List<Member> result = new ArrayList<>();
        int rank = 0; // 순위 만들기

        for (Member newMember : previousData) {
            int currentRank = rank + 1; // 차례로 순위 먹이기
            System.out.println("현재 순위 : " + currentRank);

            String userId = newMember.getUserId();
            Member previousMember = findMemWithRank(userId); // 프로퍼티에서 예전 등수 가져오기

            if (previousMember != null) { // 예전 등수가 있을 때
                int previousRankStored = previousMember.getRank(); // 예전등수 가져오기
                System.out.println("예전 등수 : " + previousRankStored);
                int rankDifference = currentRank - previousRankStored;
//                previousRanks.put(userId, currentRank); // 현재 등수를 맵에 저장

                // 등수 차이 계산 및 처리
                String rankChange = getRankChangeIcon(rankDifference);
                System.out.println("등수 차이 : " + rankDifference);

                newMember.setRank(currentRank);
                newMember.setRankChange(rankChange);
            } else { // 예전 등수가 없을 경우
                System.out.println("예전 등수 없음");
//                previousRanks.put(userId, currentRank);
                newMember.setRank(currentRank);
                newMember.setRankChange("-");
            }

            result.add(newMember);

            rank = currentRank;
            System.out.println("등수 : " + rank);
        }

        return result;
    }

    // 아이콘 적용
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
