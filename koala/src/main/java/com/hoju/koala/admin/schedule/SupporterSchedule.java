package com.hoju.koala.admin.schedule;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.Supporters;

public class SupporterSchedule {
	
	@Autowired
	AdminService adminService;
	
	// 0 0 0 * * *     >> 매일 자정마다
	@Scheduled(cron="0 0 0 * * *")
	public void supporterWaitDelete() {
		ArrayList<Supporters> list = adminService.selectSupporterWaitList();
		if(list.size() > 0) listDelete(list); 
	}
	
	public void listDelete(ArrayList<Supporters> list) {
		list.stream().forEach(sup -> resultCheck(delete(sup)));
//		for(Supporters sup : list) {
//			if(!resultCheck(delete(sup))) continue;
//		}
	}
	
	public int delete(Supporters supporter) {
		return adminService.deleteSupporter(supporter.getUserId());
	}
	
	public boolean resultCheck(int result) {
		return result>0?true:false;
	}
	
	
}
