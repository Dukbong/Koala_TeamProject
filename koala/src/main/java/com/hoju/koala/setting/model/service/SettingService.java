package com.hoju.koala.setting.model.service;

import java.util.ArrayList;

import com.hoju.koala.setting.model.vo.Setting;

public interface SettingService {

	//리스트 조회
	ArrayList<Setting> selectSettingList();

	//해당 setting조회
	Setting selectSetting(int settingNo);

	//ajax 버전정보와 setting번호
	ArrayList<Setting> selectVersionList(String settingTitle);


}
