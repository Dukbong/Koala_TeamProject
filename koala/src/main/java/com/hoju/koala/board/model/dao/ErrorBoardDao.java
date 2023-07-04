package com.hoju.koala.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Repository
public class ErrorBoardDao {
	
	//총 게시글 수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("errorBoardMapper.selectListCount");
	}
	
	//검색된 게시글 수
	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> hashMap) {
		
		return sqlSession.selectOne("errorBoardMapper.searchListCount", hashMap);
	}

	//게시글 전체 목록 조회
	public ArrayList<ErrorSet> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectList", null, pi.rowBounds());
	}
	
	//검색된 게시글 목록 조회
	public ArrayList<ErrorSet> searchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> hashMap) {

		return (ArrayList)sqlSession.selectList("errorBoardMapper.searchList", hashMap, pi.rowBounds());
	}
	
	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("errorBoardMapper.increaseCount", boardNo);
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
	public ArrayList<String> selectVersionList(SqlSessionTemplate sqlSession, String settingTitle) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectVersionList", settingTitle);
	}
	
	//최신 버전 조회
	public String selectVersion(SqlSessionTemplate sqlSession, String settingTitle) {
		
		return sqlSession.selectOne("errorBoardMapper.selectVersion", settingTitle);
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

	//게시글 수정 - Board
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("errorBoardMapper.updateBoard", b);
	}

	//게시글 수정 - ErrorBoard
	public int updateEbBoard(SqlSessionTemplate sqlSession, ErrorBoard eb) {
		
		return sqlSession.update("errorBoardMapper.updateErrorBoard", eb);
	}
	
	//게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.delete("errorBoardMapper.deleteBoard", boardNo);
	}

	//댓글 리스트 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectReplyList", boardNo);
	}

	//댓글 작성
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("errorBoardMapper.insertReply", r);
	}

	//댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.update("errorBoardMapper.updateReply", r);
	}

	//댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		
		return sqlSession.delete("errorBoardMapper.deleteReply", replyNo);
	}

	//닉네임으로 아이디 구하기
	public String selectId(SqlSessionTemplate sqlSession, String nickName) {
		
		return sqlSession.selectOne("errorBoardMapper.selectId", nickName);
	}

	//유저에러 해결완료
	public int updateSolved(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("errorBoardMapper.updateSolved", boardNo);
	}
	
}
