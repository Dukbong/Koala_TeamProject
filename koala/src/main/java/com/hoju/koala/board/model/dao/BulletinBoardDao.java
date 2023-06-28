package com.hoju.koala.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.Liked;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Repository
public class BulletinBoardDao {

	//게시글 개수 메소드
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.selectListCount");
	}

	//게시글 조회 메소드
	public ArrayList<Board> selectList(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("bulletinBoardMapper.selectList",null,rowBounds);
	}

	//게시글 조회 메소드
	public Board boardDetailView(int bno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.boardDetailView",bno);
	}

	//게시글 조회수 증가 메소드
	public int increaseCount(int bno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("bulletinBoardMapper.increaseCount",bno);
	}

	//게시글 입력 메소드
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("bulletinBoardMapper.insertBoard",b);
	}

	//게시글 첨부파일 입력 메소드
	public int insertBoardAttachment(BoardAttachment ba, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("bulletinBoardMapper.insertBoardAttachment",ba);
	}

	//좋아요 증가 메소드
	public int increaseLike(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("bulletinBoardMapper.increaseLike", boardNo);
	}

	//좋아요 저감 메소드
	public int decreaseLike(int boardNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("bulletinBoardMapper.decreaseLike", boardNo);
	}

	//검색 결과 리스트 개수 메소드
	public int selectListCount(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.selectSearchCount",map);
	}

	//검색 결과 리스트 메소드
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi, SqlSessionTemplate sqlSession) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("bulletinBoardMapper.selectSearchList",map,rowBounds);
	}

	//게시글 댓글 조회 메소드
	public ArrayList<Reply> selectBoardReply(int boardNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("bulletinBoardMapper.selectReply",boardNo);
	}

	//댓글 달기 메소드
	public int insertReply(Reply reply, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("bulletinBoardMapper.insertReply",reply);
	}

	//좋아요 개수 메소드
	public int countLike(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.countLike",boardNo);
	}

	//댓글 수정 메소드
	public int updateReply(Reply reply, SqlSessionTemplate sqlSession) {

		return sqlSession.update("bulletinBoardMapper.updateReply",reply);
	}

	//댓글 삭제 메소드
	public int deleteReply(int replyNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("bulletinBoardMapper.deleteReply",replyNo);
	}

	//게시글 삭제 메소드
	public int deleteBoard(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("bulletinBoardMapper.deleteBoard",boardNo);
	}

	//게시글 조회 메소드
	public Board selectBoard(int boardNo, SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("bulletinBoardMapper.selectBoard",boardNo);
	}

	//게시글 카테고리 추가 메소드
	public int insertBoardCategory(BulletinBoard bulletinBoard, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("bulletinBoardMapper.insertBoardCategory",bulletinBoard);
	}

	//게시글 카테고리 조회 메소드
	public BulletinBoard boardCategoryDetailView(int boardNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.boardCategoryDetailView",boardNo);
	}

	//게시글 첨부파일 조회 메소드
	public ArrayList<BoardAttachment> selectBoardAttachment(int boardNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("bulletinBoardMapper.selectBoardAttachment",boardNo);
	}

	//게시글 좋아요 기록 메소드
	public int boardLike(Liked liked, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("bulletinBoardMapper.boardLike",liked);
	}

	//게시글 좋아요 취소 기록 메소드
	public int boardDisLike(Liked liked, SqlSessionTemplate sqlSession) {

		return sqlSession.delete("bulletinBoardMapper.boardDisLike",liked);
	}

	//사용자 좋아요 조회 메소드
	public int selectBoardLike(Liked liked, SqlSessionTemplate sqlSession) {
		
		if(sqlSession.selectOne("bulletinBoardMapper.selectBoardLike",liked)!=null) {;
			return sqlSession.selectOne("bulletinBoardMapper.selectBoardLike",liked);
		}else {
			return 0;
		}
	}

	//게시글 번호 가져오기 메소드
	public int selectBoardNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("bulletinBoardMapper.selectBoardNo");
	}

}
