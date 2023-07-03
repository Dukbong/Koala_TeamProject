package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.BulletinBoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.Liked;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService{

	@Autowired
	private BulletinBoardDao bbDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return bbDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return bbDao.selectList(pi, sqlSession);
	}

	@Override
	public Board boardDetailView(int boardNo) {
		
		return bbDao.boardDetailView(boardNo, sqlSession);
	}

	@Override
	public int increaseCount(int boardNo) {
		
		return bbDao.increaseCount(boardNo,sqlSession);
	}

	@Override
	public int insertBoardAttachment(BoardAttachment ba) {
		
		return bbDao.insertBoardAttachment(ba,sqlSession);
	}

	@Override
	public int insertBoard(Board b) {
		
		return bbDao.insertBoard(b,sqlSession);
	}

	@Override
	public int increaseLike(int boardNo) {
		
		return bbDao.increaseLike(boardNo,sqlSession);
	}

	@Override
	public int decreaseLike(int boardNo) {
		
		return bbDao.decreaseLike(boardNo, sqlSession);
	}

	@Override
	public int selectListCount(HashMap<String, String> map) {
		
		return bbDao.selectListCount(map, sqlSession);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return bbDao.selectSearchList(map, pi, sqlSession);
	}

	@Override
	public ArrayList<Reply> selectBoardReply(int boardNo) {
		
		return bbDao.selectBoardReply(boardNo,sqlSession);
	}

	@Override
	public int insertReply(Reply reply) {
		
		return bbDao.insertReply(reply,sqlSession);
	}

	@Override
	public int countLike(int boardNo) {
		
		return bbDao.countLike(boardNo,sqlSession);
	}

	@Override
	public int deleteReply(int replyNo) {
		
		return bbDao.deleteReply(replyNo,sqlSession);
	}

	@Override
	public int updateReply(Reply reply) {
		
		return bbDao.updateReply(reply, sqlSession);
	}

	@Override
	public int deleteBoard(int boardNo) {
		
		return bbDao.deleteBoard(boardNo, sqlSession);
	}

	@Override
	public Board selectBoard(int boardNo) {
		
		return bbDao.selectBoard(boardNo, sqlSession);
	}

	@Override
	public int insertBoardCategory(BulletinBoard bulletinBoard) {

		return bbDao.insertBoardCategory(bulletinBoard,sqlSession);
	}

	@Override
	public BulletinBoard boardCategoryDetailView(int boardNo) {
		
		return bbDao.boardCategoryDetailView(boardNo,sqlSession);
	}

	@Override
	public ArrayList<BoardAttachment> selectBoardAttachment(int boardNo) {
		
		return bbDao.selectBoardAttachment(boardNo,sqlSession);
	}

	@Override
	public int boardLike(Liked liked) {
		
		return bbDao.boardLike(liked,sqlSession);
	}

	@Override
	public int boardDisLike(Liked liked) {

		return bbDao.boardDisLike(liked,sqlSession);
	}

	@Override
	public int selectBoardLike(Liked liked) {
		
		return bbDao.selectBoardLike(liked,sqlSession);
	}

	@Override
	public int selectBoardNo() {
		
		return bbDao.selectBoardNo(sqlSession);
	}

	@Override
	public int deleteAttachment(String existedFiles) {
		
		return bbDao.deleteAttachment(sqlSession, existedFiles);
	}

	@Override
	public int updateBoard(Board b) {
		
		return bbDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<BoardAttachment> selectDeleteAttachment() {
		
		return bbDao.selectDeleteAttachment(sqlSession);
	}

	@Override
	public ArrayList<Board> selectDeleteBoard() {
		
		return bbDao.selectDeleteBoard(sqlSession);
	}

	@Override
	public int deleteScheduledBoard(int boardNo) {
		
		return bbDao.deleteScheduledBoard(sqlSession);
	}

}
