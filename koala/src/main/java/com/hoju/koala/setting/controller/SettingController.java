package com.hoju.koala.setting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.setting.model.service.SettingService;
import com.hoju.koala.setting.model.vo.Setting;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		
		
		return "board/settingBoard/NewFile";
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
			
			model.addAttribute("setting", s);
		}
		
		return "";
	}
	
	
	//메인페이지 search
	@GetMapping("/search")
	public ModelAndView searchSetting(String input,
									  ModelAndView mv) {
		
		ArrayList<Setting> searchList = stService.searchSetting(input);
		
		for(Setting s : searchList) {
			log.debug("검색된 라이브러리 리스트 : {}", s);
		}
		
		if(searchList.size() > 1) {
			mv.addObject("slist", searchList);
			mv.setViewName("board/settingBoard/NewFile");
		}else {
			mv.addObject("slist", searchList.get(0));
			mv.setViewName("디테일");
		}
		
		return mv;
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
	public String createCode(String input) {
		System.out.println(input);
		return null;
	}
	
	
	
}
