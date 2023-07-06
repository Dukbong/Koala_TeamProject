package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.Liked;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

public interface BulletinBoardService {

	//게시글 개수 메소드
	int selectListCount();

	//게시글 조회 메소드
	ArrayList<Board> selectList(PageInfo pi);

	//게시글 상세 조회 메소드
	Board boardDetailView(int boardNo);

	//게시글 조회수 증가 메소드
	int increaseCount(int boardNo);

	//게시글 첨부파일 입력 메소드
	int insertBoardAttachment(BoardAttachment ba);

	//게시글 입력 메소드
	int insertBoard(Board b);
	
	//좋아요 증가 메소드
	int increaseLike(int boardNo);

	//좋아요 저감 메소드
	int decreaseLike(int boardNo);

	//검색 결과 리스트 개수 메소드
	int selectListCount(HashMap<String, String> map);

	//검색 결과 리스트 메소드
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);

	//게시글 댓글 조회 메소드
	ArrayList<Reply> selectBoardReply(int boardNo);

	//게시글 댓글 작성 메소드
	int insertReply(Reply reply);

	//좋아요 개수 메소드
	int countLike(int boardNo);

	//댓글 삭제 메소드
	int deleteReply(int replyNo);

	//댓글 수정 메소드
	int updateReply(Reply reply);

	//게시글 삭제 메소드
	int deleteBoard(int boardNo);

	//게시글 조회 메소드
	Board selectBoard(int boardNo);

	//게시글 종류 추가 메소드
	int insertBoardCategory(BulletinBoard bulletinBoard);

	//게시글 카테고리 조회 메소드
	BulletinBoard boardCategoryDetailView(int boardNo);

	//게시글 첨부파일 조회 메소드
	ArrayList<BoardAttachment> selectBoardAttachment(int boardNo);

	//게시글 좋아요 기록 메소드
	int boardLike(Liked liked);

	//게시글 좋아요 취소 기록 메소드
	int boardDisLike(Liked liked);

	//사용자 좋아요 확인 메소드
	int selectBoardLike(Liked liked);

	//게시글 번호 가져오기 메소드
	int selectBoardNo();

	//첨부파일 삭제 메소드
	int deleteAttachment(String existedFiles);

	//게시글 수정 메소드
	int updateBoard(Board b);

	//첨부파일 삭제 예정 조회 메소드
	ArrayList<BoardAttachment> selectDeleteAttachment();

	//게시글 삭제 예정 조회 메소드
	ArrayList<Board> selectDeleteBoard();

	//게시글 삭제 예정 삭제 메소드
	int deleteScheduledBoard(int boardNo);

	//공지글 조회 메소드
	ArrayList<Board> selectNoticeList();

}
