package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.ErrorBoardDao;
import com.hoju.koala.board.model.vo.ErrorSet;

@Service
public class ErrorBoardServiceImpl implements ErrorBoardService {
	
	@Autowired
	private ErrorBoardDao ebDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<ErrorSet> selectList() {
		
		return ebDao.selectList(sqlSession);
	}

}
