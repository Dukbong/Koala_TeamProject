package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.BulletinBoardDao;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService{

	@Autowired
	private BulletinBoardDao bbDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return bbDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<ErrorSet> selectList(PageInfo pi) {
		
		return bbDao.selectList(pi, sqlSession);
	}

	@Override
	public Board boardDetailView(int bno) {
		
		return bbDao.boardDetailView(bno, sqlSession);
	}

}
