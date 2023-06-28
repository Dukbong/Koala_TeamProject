package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

public interface QnABoardService {

	//qna 게시글 개수
	int selectListCount();

	//qna 게시글 리스트
	ArrayList<Board> selectList(PageInfo pi);

	//qna 게시글 조회수 증가
	int increateCount(int boardNo);

	//qna 게시글 상세보기
	Board selectBoard(int boardNo);

	//qna 게시글 첨부파일 보기
	ArrayList<BoardAttachment> selectAttachment(int boardNo);

	//qna 게시글 검색
	int selectBoardCount(HashMap<String, String> searchInfo);

	//qna 게시글 검색 목록
	ArrayList<Board> selectBoardList(HashMap<String, String> searchInfo, PageInfo pi);

	//qna 댓글 조회
	ArrayList<Reply> selectReply(int boardNo);

	//qna 댓글 삽입
	int insertReply(Reply r);

	//qna 글만 올릴 때
	int insertBoard(Board b);

	//qna 파일 첨부
	int insertBoardFile(BoardAttachment at);

	//qna 공지 게시글
	int insertNotice(Board b);

	//qna 게시글 추천 확인
	int likeChk(int boardNo, int userNo);

	//qna like테이블 삽입
	void insertLike(int boardNo, int userNo);

	//qna board테이블 like 추가
	void updateLike(int boardNo);

	//qna 회원포인트 지급
	void pointUpdate(int boardNo);

	//qna like테이블 삭제
//	void deleteLike(int boardNo, int userNo);

	//qna 회원포인트 차감
	void pointDelete(int boardNo);

	//qna 댓글 수
	int replyCount(int boardNo);

	//qna 좋아요 수
	int getLikeCount(int boardNo);

	//qna 댓글 채택
	int qnaSelect(int boardNo, int replyNo);

	//qna 게시글 삭제
	int deleteBoard(int boardNo);

	//qna 댓글 채택 여부
	String chkSelectedReply(int boardNo, Integer replyNo);

//	//댓글 보여주기
//	ArrayList<Reply> selectReplyList(int boardNo);

//	//qna 좋아요 수
//	int countLike(int boardNo);

	

}
