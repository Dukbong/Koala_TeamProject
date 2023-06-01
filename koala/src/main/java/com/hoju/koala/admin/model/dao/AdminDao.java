package com.hoju.koala.admin.model.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;

@Repository
public class AdminDao {
	
	// 전체 리스트 카운트 수 조회
	public AllCount selectAllCount(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.allCount");
	}

	// 서포터즈 정보 조회
	public ArrayList<Supporters> selectSupporters(SqlSession sqlSession) {
		ArrayList<Supporters> supporter = new ArrayList<>();
		List<Object> list = sqlSession.selectList("adminMapper.selectSupporters");
		Iterator<Object> it = list.iterator();
		while(it.hasNext()) {
			Object obj = it.next();
			if(obj instanceof Supporters) {
				Supporters support = (Supporters)obj;
				supporter.add(support);
			}
		}
		return supporter;
	}

	public ArrayList<CreateSetting> selectWaitingLibrary(SqlSession sqlSession) {
		ArrayList<CreateSetting> WaitLibrary = new ArrayList<>();
		List<Object> WaitLibraryList = sqlSession.selectList("adminMapper.selectWaitingLibrary");
		Iterator<Object> it = WaitLibraryList.iterator();
		while(it.hasNext()) {
			Object obj = it.next();
			if(obj instanceof CreateSetting) {
				CreateSetting Library = (CreateSetting)obj;
				WaitLibraryList.add(Library);
			}
		}
		return WaitLibrary;
	}
}
