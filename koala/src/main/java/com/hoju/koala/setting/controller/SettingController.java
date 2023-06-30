package com.hoju.koala.setting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		ArrayList<Setting> slist = stService.selectSettingList();
		
		if(!slist.isEmpty()) {
			
			model.addAttribute("slist", slist);
			
		}
		
		
		return "setting/ex";
	}
	
	//코드 작성 페이지 이동
	@RequestMapping("create")
	public String createCodePage() {
		
		return "board/errorBoard/createSettingForm";
	}
	@GetMapping("/detail")
	public String selectSetting(int settingNo,
								Model model) {
		
		//해당 세팅 들고오기
		Setting s = stService.selectSetting(settingNo);
		
		if(s != null) {
			//해당 세팅과 같은 라이브러리인 정보들 다 가져오기
			model.addAttribute("setting", s);
		}
		
		return "";
	}
	
	
	@ResponseBody
	@GetMapping("/version")
	public ArrayList<Setting> versionList(String settingTitle) {
		
		// settingNo와 version몇인지
		ArrayList<Setting> versionList = stService.selectVersionList(settingTitle);
		
		return versionList;
	}
	
	
	//코드 작성 메소드
	@RequestMapping("insert")
	public String createCode(Setting setting, Model model) {
		
		int result = stService.insertCode(setting);
		
		return null;
	}
	
	
	
}
