package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.QnABoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
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
	

}
