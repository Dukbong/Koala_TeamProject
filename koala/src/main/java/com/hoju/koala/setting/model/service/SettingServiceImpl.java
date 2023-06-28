package com.hoju.koala.setting.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.setting.model.dao.SettingDao;
import com.hoju.koala.setting.model.vo.Setting;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private SettingDao stDao;
	
	//리스트 조회
	@Override
	public ArrayList<Setting> selectSettingList() {

		ArrayList<Setting> slist = stDao.selectSettingList(sqlSession);
				
		return slist;
	}

	//해당 Setting 조회
	@Override
	public Setting selectSetting(int settingNo) {

		Setting s = stDao.selectSetting(sqlSession, settingNo);
		
		return s;
	}

	//ajax 버전정보와 setting번호
	@Override
	public ArrayList<Setting> selectVersionList(String settingTitle) {
		
		ArrayList<Setting> versionList = stDao.selectVersionList(sqlSession, settingTitle);
		
		return versionList;
	}

	
	
}
