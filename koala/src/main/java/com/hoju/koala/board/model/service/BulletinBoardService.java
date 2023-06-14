package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

public interface BulletinBoardService {

	//게시글 개수 메소드
	int selectListCount();

	//게시글 조회 메소드
	ArrayList<ErrorSet> selectList(PageInfo pi);

	//게시글 상세 조회 메소드
	Board boardDetailView(int bno);

}
