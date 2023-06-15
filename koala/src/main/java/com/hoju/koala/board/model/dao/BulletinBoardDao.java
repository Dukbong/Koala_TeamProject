package com.hoju.koala.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

public class BulletinBoardDao {

	//게시글 개수 메소드
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("BoardMapper.selectListCount");
	}

	//게시글 조회 메소드
	public ArrayList<Board> selectList(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("BoardMapper.selectList",null,rowBounds);
	}

	//게시글 조회 메소드
	public Board boardDetailView(int bno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("BoardMapper.boardDeatailView",bno);
	}

	//게시글 조회수 증가 메소드
	public int increaseCount(int bno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("BoardMapper.increaseCount",bno);
	}

	//게시글 입력 메소드
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("BoardMapper.insertBoard",b);
	}

	//게시글 첨부파일 입력 메소드
	public int insertBoardAttachment(BoardAttachment ba, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("BoardMapper.insertBoardAttachment",ba);
	}

	//좋아요 증가 메소드
	public int increaseLike(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("BoardMapper.increaseLike", boardNo);
	}

	//좋아요 저감 메소드
	public int decreaseLike(int boardNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("BoardMapper.decreaseLike", boardNo);
	}

	//검색 결과 리스트 개수 메소드
	public int selectListCount(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectSearchCount",map);
	}

	//검색 결과 리스트 메소드
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi, SqlSessionTemplate sqlSession) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("BoardMapper.selectSearchList",map,rowBounds);
	}

	//게시글 댓글 조회 메소드
	public ArrayList<Reply> selectBoardReply(int boardNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("BoardMapper.selectReply",boardNo);
	}

	//댓글 달기 메소드
	public int insertReply(Reply reply, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("BoardMapper.insertReply",reply);
	}

	//좋아요 개수 메소드
	public int countLike(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("BoardMapper.countLike",boardNo);
	}

	//댓글 수정 메소드
	public int updateReply(Reply reply, SqlSessionTemplate sqlSession) {

		return sqlSession.update("BoardMapper.updateReply",reply);
	}

	//댓글 삭제 메소드
	public int deleteReply(int replyNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("BoardMapper.deleteReply",replyNo);
	}

	//게시글 삭제 메소드
	public int deleteBoard(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("BoardMapper.deleteBoard",boardNo);
	}

	//게시글 조회 메소드
	public Board selectBoard(int boardNo, SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("BoardMapper.selectBoard",boardNo);
	}

	//게시글 카테고리 추가 메소드
	public int insertBoardCategory(BulletinBoard bulletinBoard, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("BoardMapper.insertBoardCategory",bulletinBoard);
	}

	//게시글 카테고리 조회 메소드
	public BulletinBoard boardCategoryDetailView(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("BoardMapper.boardCategoryDetailView",boardNo);
	}

	//게시글 첨부파일 조회 메소드
	public ArrayList<BoardAttachment> selectBoardAttachment(int boardNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("BoardMapper.selectBoardAttachment",boardNo);
	}

}
