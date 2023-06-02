package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.board.model.vo.ErrorSet;

public interface ErrorBoardService {
	
	//게시글 목록 조회 메소드 (페이징 전)
	ArrayList<ErrorSet> selectList();

}
