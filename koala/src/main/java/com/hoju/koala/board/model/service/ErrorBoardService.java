package com.hoju.koala.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

public interface ErrorBoardService {
	
	//총 게시글 수
	int selectListCount();

	//검색된 게시글 수
	int searchListCount(HashMap<String, String> hashMap);
	
	//게시글 전체 목록 조회 
	ArrayList<ErrorSet> selectList(PageInfo pi);

	//검색된 게시글 목록 조회
	ArrayList<ErrorSet> searchList(PageInfo pi, HashMap<String, String> hashMap);
	
	//라이브러리 리스트 조회 
	ArrayList<CreateSetting> selectLibList();
	
	//조회수 증가
	int increaseCount(int boardNo);
	
	//게시글 상세 조회
	ErrorSet selectBoard(int boardNo);

	//버전 리스트 조회
	ArrayList<String> selectVersionList(String settingTitle);
	
	//최신 버전 조회
	String selectVersion(String settingTitle);

	//세팅 글번호 조회
	int selectSettingNo(CreateSetting c);

	//게시글 작성 시 수정폼 생성 
	String createModifyForm(String category, CreateSetting c);

	//게시글 등록
	int insertBoard(Board b, ErrorBoard eb);

	//게시글 수정
	int updateBoard(Board b, ErrorBoard eb);

	//게시글 삭제
	int deleteBoard(int boardNo);

	//댓글 리스트 조회
	ArrayList<Reply> selectReplyList(int boardNo);
	
	//댓글 작성
	int insertReply(Reply r);
	
	//댓글 수정
	int updateReply(Reply r);
	
	//댓글 삭제
	int deleteReply(int replyNo);

	//닉네임으로 아이디 구하기
	String selectId(String nickName);

	//유저에러 해결완료
	int updateSolved(int boardNo);

}
