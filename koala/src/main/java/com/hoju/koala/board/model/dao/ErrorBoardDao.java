package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

import lombok.extern.slf4j.Slf4j;

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
	
	//게시글 상세 조회
	public ErrorSet selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("errorBoardMapper.selectBoard", boardNo);
	}
	
	//라이브러리 리스트 조회
	public ArrayList<CreateSetting> selectLibList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectLibList");
	}
	
	//버전 리스트 조회
	public ArrayList<String> selectVersion(SqlSessionTemplate sqlSession, String settingTitle) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectVersion", settingTitle);
		
	}
	
	//세팅 글번호 조회
	public int selectSettingNo(SqlSessionTemplate sqlSession, CreateSetting c) {
		
		return sqlSession.selectOne("errorBoardMapper.selectSettingNo", c);
	}

	//게시글 작성 시 수정폼 생성 - 코드
	public String createCodeForm(SqlSessionTemplate sqlSession, CreateSetting c) {
		
		return sqlSession.selectOne("errorBoardMapper.createCodeForm", c);
	}

	//게시글 작성 시 수정폼 생성 - 설명서
	public String createInfoForm(SqlSessionTemplate sqlSession, CreateSetting c) {
		
		return sqlSession.selectOne("errorBoardMapper.createInfoForm", c);
	}

	//게시글 등록 - Board
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("errorBoardMapper.insertBoard", b);
	}
	//게시글 등록 - ErrorBoard
	public int insertEbBoard(SqlSessionTemplate sqlSession, ErrorBoard eb) {
		
		return sqlSession.insert("errorBoardMapper.insertErrorBoard", eb);		
	}

	//게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.delete("errorBoardMapper.deleteBoard", boardNo);
	}
	
	
}
