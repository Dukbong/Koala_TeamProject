package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
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

}
