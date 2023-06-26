package com.hoju.koala.setting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void selectList() {
		
		ArrayList<Setting> slist = stService.selectList();
		
		
		
	}
	
}
