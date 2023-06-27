package com.hoju.koala.setting.model.service;

import java.util.ArrayList;

import com.hoju.koala.setting.model.vo.Setting;
import com.hoju.koala.setting.model.vo.Version;

public interface SettingService {

	//리스트 조회
	ArrayList<Setting> selectSettingList();

	//해당 setting조회
	Setting selectSetting(int settingNo);

	//해당 setting에 대한 버전리스트와 정보 조회
	ArrayList<Version> selectVersionList(int settingNo);

}
