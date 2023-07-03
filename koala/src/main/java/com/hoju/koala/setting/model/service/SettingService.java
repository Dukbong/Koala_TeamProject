package com.hoju.koala.setting.model.service;

import java.util.ArrayList;

import com.hoju.koala.setting.model.vo.Setting;

public interface SettingService {

	//리스트 조회
	ArrayList<Setting> selectSettingList();

	//해당 setting조회
	Setting selectSetting(int settingNo);
	Setting selectSetting(String settingTitle);

	//ajax 버전정보와 setting번호
	ArrayList<Setting> selectVersionList(String settingTitle);

	//메인페이지 search
	ArrayList<Setting> searchSetting(String input);

	//라이브러리 작성 메소드
	int insertSetting(Setting setting);

	//기존 버전 찾기
	String selectVersion(String settingTitle);


}
