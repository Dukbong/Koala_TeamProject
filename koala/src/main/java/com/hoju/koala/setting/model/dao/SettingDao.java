package com.hoju.koala.setting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.setting.model.vo.Setting;

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

	//버전정보와 
	public ArrayList<Setting> selectVersionList(SqlSessionTemplate sqlSession, String settingTitle) {
		
		return (ArrayList)sqlSession.selectList("settingMapper.selectVersionList", settingTitle);
	}

<<<<<<< HEAD
	//코드 입력 메소드
	public int insertCode(SqlSessionTemplate sqlSession, Setting setting) {
		
		return sqlSession.insert("settingMapper.insertCode",setting);
=======
	//메인페이지 search
	public ArrayList<Setting> searchSetting(SqlSessionTemplate sqlSession, String input) {
		
		return (ArrayList)sqlSession.selectList("settingMapper.searchSetting", input);
>>>>>>> refs/remotes/origin/main
	}

	
	

}
