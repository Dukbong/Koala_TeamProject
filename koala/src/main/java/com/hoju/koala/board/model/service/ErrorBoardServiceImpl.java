package com.hoju.koala.board.model.service;

import java.awt.List;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.board.model.dao.ErrorBoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ErrorBoardServiceImpl implements ErrorBoardService {
	
	@Autowired
	private ErrorBoardDao ebDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override //총 게시글 수
	public int selectListCount() {

		return ebDao.selectListCount(sqlSession);
	}
	
	@Override //게시글 전체 목록 조회
	public ArrayList<ErrorSet> selectList(PageInfo pi) {
		
		return ebDao.selectList(sqlSession, pi);
	}
	
	@Override //게시글  상세조회
	public ErrorSet selectBoard(int boardNo) {
		
		return ebDao.selectBoard(sqlSession, boardNo);
	}
	
	@Override //라이브러리 리스트 조회
	public ArrayList<CreateSetting> selectLibList() {
		
		return ebDao.selectLibList(sqlSession);
	}
	
	@Override//버전 리스트 조회
	public ArrayList<String> selectVersion(String settingTitle) {
		
		return ebDao.selectVersion(sqlSession, settingTitle);
	}
	
	@Override //세팅 글번호 조회
	public int selectSettingNo(CreateSetting c) {
		
		return ebDao.selectSettingNo(sqlSession, c);
	}

	@Override //게시글 작성 시 수정폼 생성
	public String createModifyForm(String category, CreateSetting c) {
		
		if(category.equals("code")) { //코드라면
			return ebDao.createCodeForm(sqlSession, c);
		}else { //설명서라면
			return ebDao.createInfoForm(sqlSession, c);
		}
		
	}

	@Override //게시글 등록
	@Transactional
	public int insertBoard(Board b, ErrorBoard eb) {
		
		int result1 = ebDao.insertBoard(sqlSession, b);
		int result2 = ebDao.insertEbBoard(sqlSession, eb);
	
		return result1*result2;
	}





}
