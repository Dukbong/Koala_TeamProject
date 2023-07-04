package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.dao.ErrorBoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Service
public class ErrorBoardServiceImpl implements ErrorBoardService {
	
	@Autowired
	private ErrorBoardDao ebDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override //총 게시글 수
	public int selectListCount() {

		return ebDao.selectListCount(sqlSession);
	}
	
	@Override //검색된 게시글 수
	public int searchListCount(HashMap<String, String> hashMap) {
		
		return ebDao.searchListCount(sqlSession, hashMap);
	}
	
	@Override //게시글 전체 목록 조회
	public ArrayList<ErrorSet> selectList(PageInfo pi) {
		
		return ebDao.selectList(sqlSession, pi);
	}
	
	@Override //검색된 게시글 목록 조회
	public ArrayList<ErrorSet> searchList(PageInfo pi, HashMap<String, String> hashMap) {
		
		return ebDao.searchList(sqlSession, pi, hashMap);
	}
	
	@Override //조회수 증가
	public int increaseCount(int boardNo) {
		
		return ebDao.increaseCount(sqlSession, boardNo);
	}
	
	@Override //게시글  상세조회
	public ErrorSet selectBoard(int boardNo) {
		
		return ebDao.selectBoard(sqlSession, boardNo);
	}
	
	@Override //라이브러리 리스트 조회
	public ArrayList<CreateSetting> selectLibList() {
		
		return ebDao.selectLibList(sqlSession);
	}
	
	@Override //버전 리스트 조회
	public ArrayList<String> selectVersion(String settingTitle) {
		
		return ebDao.selectVersion(sqlSession, settingTitle);
	}
	
	@Override //세팅 글번호 조회
	public int selectSettingNo(CreateSetting c) {
		
		return ebDao.selectSettingNo(sqlSession, c);
	}

	@Override //게시글 작성 시 수정폼 생성
	public String createModifyForm(String category, CreateSetting c) {
		
		if(category.equals("code")) { //코드라면
			return ebDao.createCodeForm(sqlSession, c);
		}else { //설명서라면
			return ebDao.createInfoForm(sqlSession, c);
		}
	}

	@Override //게시글 등록
	@Transactional
	public int insertBoard(Board b, ErrorBoard eb) {
		
		int result1 = ebDao.insertBoard(sqlSession, b);
		int result2 = ebDao.insertEbBoard(sqlSession, eb);
	
		return result1*result2; //굳이 이렇게 안해도 될듯
	}
	
	@Override //게시글 수정
	public int updateBoard(Board b, ErrorBoard eb) {
		
		int result1 = ebDao.updateBoard(sqlSession, b);
		int result2 = ebDao.updateEbBoard(sqlSession, eb);
		
		return result1*result2; //굳이 이렇게 안해도 될듯
	}

	@Override //게시글 삭제
	public int deleteBoard(int boardNo) {
		
		return ebDao.deleteBoard(sqlSession, boardNo);
	}

	@Override //댓글 리스트 조회
	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		return ebDao.selectReplyList(sqlSession, boardNo);
	}

	@Override //댓글 작성
	public int insertReply(Reply r) {
		
		return ebDao.insertReply(sqlSession, r);
	}

	@Override //댓글 수정
	public int updateReply(Reply r) {
		
		return ebDao.updateReply(sqlSession, r);
	}

	@Override //댓글 삭제
	public int deleteReply(int replyNo) {
		
		return ebDao.deleteReply(sqlSession, replyNo);
	}

	@Override //닉네임으로 아이디 구하기
	public String selectId(String nickName) {
		
		return ebDao.selectId(sqlSession, nickName);
	}

	@Override //유저에러 해결완료
	public int updateSolved(int boardNo) {
		
		return ebDao.updateSolved(sqlSession, boardNo);
	}

}
