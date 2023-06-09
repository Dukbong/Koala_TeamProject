package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

public interface ErrorBoardService {
	
	//총 게시글 수
	int selectListCount();
	
	//게시글 전체 목록 조회 
	ArrayList<ErrorSet> selectList(PageInfo pi);

	//게시글 작성 시 수정폼 생성 
	String createModifyForm(String category, CreateSetting c);


}
