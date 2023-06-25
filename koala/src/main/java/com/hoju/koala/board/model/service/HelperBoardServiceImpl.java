package com.hoju.koala.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.HelperBoardDao;

@Service
public class HelperBoardServiceImpl implements HelperBoardService {
	
	@Autowired
	private HelperBoardDao hbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
