package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

@Repository
public class ErrorBoardDao {
	
	//총 게시글 수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("errorBoardMapper.selectListCount");
	}

	//게시글 전체 목록 조회
	public ArrayList<ErrorSet> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectList", null, pi.rowBounds());
	}

	//게시글 작성 시 수정폼 생성 - 코드
	public String createCodeForm(SqlSessionTemplate sqlSession, CreateSetting c) {
		
		return sqlSession.selectOne("errorBoardMapper.createCodeForm", c);
	}

	//게시글 작성 시 수정폼 생성 - 설명서
	public String createInfoForm(SqlSessionTemplate sqlSession, CreateSetting c) {
		
		return sqlSession.selectOne("errorBoardMapper.createInfoForm", c);
	}
	
	
}
