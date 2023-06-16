package com.hoju.koala.admin.schedule;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.Supporters;

import lombok.extern.slf4j.Slf4j;


// Supporters 초대 이후 7일간 연락이 없으면 삭제하는 스케줄러
// 매일 자정에 실행되며 조회 후 삭제 한다.

@Component
@Slf4j
public class SupporterSchedule {
	
	@Autowired
	AdminService adminService;
	
	@Scheduled(cron="0 0 0 * * *")
//	@Scheduled(fixedDelay = 1000) // 테스트 1~2초 마다 실행
	public void supporterWaitDelete() {
		log.info("삭제 스케줄러");
		ArrayList<Supporters> list = adminService.selectSupporterWaitList();
		if(list.size() > 0) listDelete(list); 
	}
	
	public void listDelete(ArrayList<Supporters> list) {
		for(Supporters sup : list) {
			if(!resultCheck(delete(sup))) continue;
		}
	}
	
	public int delete(Supporters supporter) {
		return adminService.deleteSupporter(supporter.getUserId());
	}
	
	public boolean resultCheck(int result) {
		return result>0?true:false;
	}
	
	
}
