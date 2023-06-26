package com.hoju.koala.setting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.setting.model.service.SettingService;
import com.hoju.koala.setting.model.vo.Setting;

@RequestMapping("/setting")
@Controller
public class SettingController {

	@Autowired
	private SettingService stService;
	
	
	
	@GetMapping("/list")
	public String selectList(Model model) {
		
		//굴 리스트 조회
		ArrayList<Setting> slist = stService.selectList();
		
		//버전정보도 추가해야함.
		
		if(!slist.isEmpty()) {
			
			model.addAttribute("slist", slist);
			
		}else {
			System.out.println("ss");
		}
		
		
		return "setting/ex";
	}
	
	
	//디테일 페이지로 보내기
	@GetMapping("/detail")
	public String detail(int settingNo,
						 Model model) {
		
		//해당 setting 모든 버전 조회
		Setting s = stService.selectSetting(settingNo);
		
		System.out.println(s);
		
		//해서 최ㅅ
		
		
		return null; //디테일 페이지 완성되면
	}
	
	
}
