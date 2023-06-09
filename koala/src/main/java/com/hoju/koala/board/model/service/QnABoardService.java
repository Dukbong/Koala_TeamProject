package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.common.model.vo.PageInfo;

public interface QnABoardService {

	//qna 게시글 개수
	int selectListCount();

	//qna게시글 리스트
	ArrayList<Board> selectList(PageInfo pi);

}
