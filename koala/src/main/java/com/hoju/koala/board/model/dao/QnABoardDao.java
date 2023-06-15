package com.hoju.koala.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.Reply;
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
		
		return sqlSession.update("qnaBoardMapper.increaseCount",boardNo);
	}

	//qna 게시글 상세 조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectBoard",boardNo);
	}

	//qna 게시글 첨부파일 확인
	public ArrayList<BoardAttachment> selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectAttachment",boardNo);
	}


	//qna 게시글 검색 목록 개수
	public int selectBoardCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchInfo) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectBoardCount",searchInfo);
	}

	//qna 게시글 검색 목록
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, HashMap<String, String> searchInfo,
			PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectBoardList",searchInfo,rowBounds);
	}

	//qna 댓글 조회
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectReply",boardNo);
	}

	//qna 댓글 삽입
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("qnaBoardMapper.insertReply",r);
	}

	//qna 글만 등록
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("qnaBoardMapper.insertBoard",b);
	}

	//qna 파일 등록
	public int insertBoardFile(SqlSessionTemplate sqlSession, BoardAttachment at) {
		
		return sqlSession.insert("qnaBoardMapper.insertBoardFile",at);
	}

	//qna 공지 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("qnaBoardMapper.insertNotice",b);
	}

}
