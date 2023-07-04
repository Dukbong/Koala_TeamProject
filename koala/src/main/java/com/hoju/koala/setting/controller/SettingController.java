package com.hoju.koala.setting.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.setting.model.service.SettingService;
import com.hoju.koala.setting.model.vo.Setting;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.GetProxy;

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
		
		
		return "setting/libList";
	}
	
	//코드 작성 페이지 이동
	@GetMapping("/create")
	public String createCodePage() {
		
		return "setting/createSettingForm";
	}
	
	
	@GetMapping("/detail")
	public String selectSetting(int settingNo,
								Model model) {
		//해당 세팅 들고오기
		Setting s = stService.selectSetting(settingNo);
<<<<<<< HEAD
		s.setInput("input/driverClassName,url,username,password");
=======
>>>>>>> 31570aa13b24612278ff93965002bc2b1a0862e1
		if(s != null) {
			model.addAttribute("setting", s);
		}

		//해당 세팅의 버전 정보(settingNo, settingVersion)
		ArrayList<Setting> versionList = stService.selectVersionList(s.getSettingTitle());
		
<<<<<<< HEAD
		return "setting/choice";
//		return "setting/description";
=======
		if(!versionList.isEmpty()) {
			model.addAttribute("vList", versionList);
		}
		

		return "setting/choice";

>>>>>>> 31570aa13b24612278ff93965002bc2b1a0862e1
	}
	
	
	//메인페이지 search
	@GetMapping("/search")
	public ModelAndView searchSetting(String input,
									  ModelAndView mv) {
		
		ArrayList<Setting> searchList = stService.searchSetting(input);
		
		for(Setting s : searchList) {
			log.debug("검색된 라이브러리 리스트 : {}", s);
		}
		
		if(!searchList.isEmpty()) {
			mv.addObject("slist", searchList);
			
			if(searchList.size() == 1) {
				mv.setViewName("setting/description");
			}else {
				mv.setViewName("setting/libList");
			}
		}else {
			//없음
			mv.setViewName("setting/libList");
		}
		
		return mv;
	}
	
	
	//라이브러리 작성 메소드
	@PostMapping("/insert")
	public ModelAndView insertSetting(Setting setting,
								ModelAndView mv) {
		
		System.out.println(setting);
		
		//있나 조회
		Setting s = stService.selectSetting(setting.getSettingTitle());

		if(s != null) { //이미 기존의 버전이 있다면
			String newVersion = VersionUp(setting.getSettingTitle());
			setting.setSettingVersion(newVersion);
		}
		
		int result = stService.insertSetting(setting);
		
		if(result>0) {
			//라이브러리 등록 성공
			mv.addObject("msg", "라이브러리 등록이 완료되었습니다.");
			mv.setViewName("redirect:/setting/list");
			
		}else {
			mv.addObject("msg", "등록 실패");
			mv.setViewName("/koala");
		}
		
		return mv;
	}
	
	

	//버전 업 메소드
	public String VersionUp(String settingTitle) {


		String preVersion = stService.selectVersion(settingTitle);
	    
	    // 버전 분리
	    String[] versionNum = preVersion.split("\\.");
	    
	    //첫번째 숫자
	    int firstNum = Integer.parseInt(versionNum[0]);
	    // 중간 숫자
	    int middleNum = Integer.parseInt(versionNum[1]);
	    // 끝 숫자
	    int lastNum = Integer.parseInt(versionNum[2]);
	    
	   
    	lastNum++;
    	
        if (lastNum > 9) {
        	lastNum = 0; // 마지막 버전 컴포넌트가 9를 넘으면 0으로 초기화
        	middleNum++; // 중간 버전 업데이트
        	if(middleNum > 9) {
        		middleNum = 0;
        		firstNum++;
        	}
        }
	    
	    
	    // 새로운 버전 생성
	    String newVersion = firstNum + "." + middleNum + "." + lastNum;
	    
	    return newVersion;

	}
	
<<<<<<< HEAD
	@GetMapping("/delete")
	public String deletelib(int settingNo, Model model) {
		int result = stService.deletelib(settingNo);
		if(result > 0) {
			return "redirect:list";
		}else {
			model.addAttribute("deleteError","오류로 인해 삭제가 되지 않았습니다.");
			return "setting/libList";
		}
	}
	
	
=======
>>>>>>> 31570aa13b24612278ff93965002bc2b1a0862e1
}
