package com.hoju.koala.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;


// rawtypes : 제네릭타입이 불특정일 때
@SuppressWarnings({ "unchecked", "rawtypes" })
@Repository
public class AdminDao {
	
	// 전체 리스트 카운트 수 조회
	public AllCount selectAllCount(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.allCount");
	}

	// 서포터즈 정보 조회
	public ArrayList<Supporters> selectSupporters(SqlSession sqlSession) {
		return (ArrayList) sqlSession.selectList("adminMapper.selectSupporters");
	}
	// 대기중인 라이브러 및 세팅 조회
	public ArrayList<CreateSetting> selectCreateSetting(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectWaitingLibrary");
	}

	public ArrayList<ErrorBoard> selectErrorBoard(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectErrorBoard");
	}
}
