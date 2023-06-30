package com.hoju.koala.member.scheduler;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Scheduler {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//매일 정시에
	@Scheduled(cron = "0 0 0 * * *")
	public void deleteMemberScheduler() {
		
		ArrayList<Member> outUsers = (ArrayList)sqlSession.selectList("memberMapper.selectDeleteMember");
		
		int result = 0;
		
		if(outUsers.size() != 0) {
			for(Member m : outUsers) {
				log.debug("삭제 요청으로부터 30일 경과 유저 : {}", m);
				
				result = sqlSession.delete("memberMapper.outMember", m);
				
				if(result > 0) {
					log.debug("삭제된 회원 : {}", m);
				}else {
					log.debug("삭제과정에서 오류 발생 : {}", m);
				}
			}
		}else{
			log.debug("삭제 요청으로부터 30일 경과 유저가 없습니다.");
		}
		
	}
	
	//매일 정시에  Level 부여 작업
	@Scheduled(cron = "0 0 0 * * *")
	public void contributionsScheduler() {
		
		int result = sqlSession.update("memberMapper.contributions");
				
		if(result > 0) {
			log.debug("Level 업데이트 작업 "+result+"건 완료");
		}else {
			log.debug("Level 업데이트 내역 없음");
		}
	}
	
}
