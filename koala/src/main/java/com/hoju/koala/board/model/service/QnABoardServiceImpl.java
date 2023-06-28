package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.QnABoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Service
public class QnABoardServiceImpl implements QnABoardService{
	
	@Autowired
	private QnABoardDao qnaDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//qna 게시글 개수
	@Override
	public int selectListCount() {
	
		return qnaDao.selectListCount(sqlSession);
	}

	//qna 게시글 리스트
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return qnaDao.selectList(sqlSession,pi);

	}

	//qna 게시글 조회수 증가
	@Override
	public int increateCount(int boardNo) {
		
		return qnaDao.increaseCount(sqlSession,boardNo);
	}

	//qna 게시글 상세보기
	@Override
	public Board selectBoard(int boardNo) {
		
		return qnaDao.selectBoard(sqlSession,boardNo);
	}

	//qna 게시글 첨부파일 보기
	@Override
	public ArrayList<BoardAttachment> selectAttachment(int boardNo) {
		
		return qnaDao.selectAttachment(sqlSession,boardNo);
	}


	//qna 게시글 검색
	@Override
	public int selectBoardCount(HashMap<String, String> searchInfo) {
		
		return qnaDao.selectBoardCount(sqlSession, searchInfo);
	}

	//qna 게시글 검색 목록
	@Override
	public ArrayList<Board> selectBoardList(HashMap<String, String> searchInfo, PageInfo pi) {
		
		return qnaDao.selectBoardList(sqlSession, searchInfo, pi);
	}

	//qna 댓글 조회
	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		
		return qnaDao.selectReply(sqlSession,boardNo);
	}

	//qna 댓글 삽입
	@Override
	public int insertReply(Reply r) {
		
		return qnaDao.insertReply(sqlSession,r);
	}

	//qna 글만
	@Override
	public int insertBoard(Board b) {
		
		return qnaDao.insertBoard(sqlSession,b);
	}

	//qna 파일 첨부
	@Override
	public int insertBoardFile(BoardAttachment at) {
		
		return qnaDao.insertBoardFile(sqlSession,at);
	}

	//qna 공지 등록
	@Override
	public int insertNotice(Board b) {
		
		return qnaDao.insertNotice(sqlSession,b);
	}

	//qna 게시글 추천 확인
	@Override
	public int likeChk(int boardNo, int userNo) {
		
		return qnaDao.likeChk(sqlSession,boardNo,userNo);
	}

	//qna like테이블 삽입
	@Override
	public void insertLike(int boardNo, int userNo) {
		
		qnaDao.insertLike(sqlSession,boardNo,userNo);
		
	}

	//qna board테이블 like 추가
	@Override
	public void updateLike(int boardNo) {
		
		qnaDao.updateLike(sqlSession,boardNo);
		
	}


	//qna 회원포인트 지급
	@Override
	public void pointUpdate(int boardNo) {
		
		qnaDao.pointUpdate(sqlSession, boardNo);
	}


	//qna like테이블 삭제
//	@Override
//	public void deleteLike(int boardNo, int userNo) {
//		
//		qnaDao.deleteLike(sqlSession,boardNo,userNo);
//	}

	//qna 회원포인트 차감
	@Override
	public void pointDelete(int boardNo) {
		
		qnaDao.pointDelete(sqlSession, boardNo);
		
	}

	//qna 댓글 수 
	@Override
	public int replyCount(int boardNo) {
		
		return qnaDao.replyCount(sqlSession,boardNo);
	}

	//qna 좋아요 수
	@Override
	public int getLikeCount(int boardNo) {
		
		return qnaDao.getLikeCount(sqlSession,boardNo);
	}

	//qna 댓글 채택
	@Override
	public int qnaSelect(int boardNo, int replyNo) {
		
		return qnaDao.qnaSelect(sqlSession,boardNo,replyNo);
	}

	//qna 게시글 삭제
	@Override
	public int deleteBoard(int boardNo) {
		
		return qnaDao.deleteBoard(sqlSession,boardNo);
	}

	//qna 댓글 채택 여부
	@Override
	public String chkSelectedReply(int boardNo, Integer replyNo) {
		
		return qnaDao.chkSelectedReply(sqlSession,boardNo,replyNo);
	}

	//qna 좋아요 수
//	@Override
//	public int countLike(int boardNo) {
//		
//		return qnaDao.countLike(sqlSession,boardNo);
//	}
	

}
