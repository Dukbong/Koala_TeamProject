package com.hoju.koala.setting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.setting.model.vo.Setting;
import com.hoju.koala.setting.model.vo.Version;

@Repository
public class SettingDao {

	//리스트 조회
	public ArrayList<Setting> selectSettingList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("settingMapper.selectSettingList");
	}

	//해당 Setting 조회
	public Setting selectSetting(SqlSessionTemplate sqlSession, int settingNo) {
		
		return sqlSession.selectOne("settingMapper.selectSetting", settingNo);
	}

	//해당 Setting의 Version리스트 조회
	public ArrayList<Version> selectVersionList(SqlSessionTemplate sqlSession, int settingNo) {
		
		return (ArrayList)sqlSession.selectList("settingMapper.selectVersionList", settingNo);
	}
	

}
