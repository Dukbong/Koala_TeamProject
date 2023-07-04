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
	public Setting selectSetting(Setting setting) {

		Setting s = stDao.selectSetting(sqlSession, setting);
		
		return s;
	}

	//ajax 버전정보와 setting번호
	@Override
	public ArrayList<Setting> selectVersionList(String settingTitle) {
		
		ArrayList<Setting> versionList = stDao.selectVersionList(sqlSession, settingTitle);
		
		return versionList;
	}


	//메인페이지 search
	@Override
	public ArrayList<Setting> searchSetting(String input) {
		
		ArrayList<Setting> searchList = stDao.searchSetting(sqlSession, input);
		
		return searchList;
	}

	@Override
	public int deletelib(int settingNo) {
		return stDao.deletelib(sqlSession, settingNo);
	}

	//라이브러리 작성 메소드
	@Override
	public int insertSetting(Setting setting) {
		
		int result = stDao.insertSetting(sqlSession, setting);
		
		return result;
	}

	//기존 버전 찾기
	@Override
	public String selectVersion(String settingTitle) {
		
		String preVersion = stDao.selectVersion(sqlSession, settingTitle);
		
		return preVersion;
	}

	

	
	
}
