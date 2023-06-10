package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.common.model.vo.PageInfo;

@Repository
public class QnABoardDao {

	//qna 게시글 개수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectListCount");
	}

	//qna 게시글 목록
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectList",null,rowBounds);
	}

	//qna 게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("qnaBoardMapper.increateCount",boardNo);
	}

	//qna 게시글 상세 조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectBoard",boardNo);
	}

	//qna 게시글 첨부파일 확인
	public ArrayList<BoardAttachment> selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectAttachment",boardNo);
	}

}
