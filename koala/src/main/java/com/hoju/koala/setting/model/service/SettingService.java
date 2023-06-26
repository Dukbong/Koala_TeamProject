package com.hoju.koala.setting.model.service;

import java.util.ArrayList;

import com.hoju.koala.setting.model.vo.Setting;

public interface SettingService {

	//리스트 조회
	ArrayList<Setting> selectList();

}
