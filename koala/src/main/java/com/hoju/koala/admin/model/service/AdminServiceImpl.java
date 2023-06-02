package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.admin.model.dao.AdminDao;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;

@Service
@RequestMapping("/admin")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	AdminDao adminDao;
	
	@Override
	public AllCount selectAllCount() {
		return adminDao.selectAllCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<Supporters> selectSupporters() {
		return adminDao.selectSupporters(sqlSession);
	}


	@Override
	public ArrayList<CreateSetting> selectCreateSetting() {
		return adminDao.selectCreateSetting(sqlSession);
	}


	@Override
	public ArrayList<ErrorBoard> selectErrorBoard() {
		return adminDao.selectErrorBoard(sqlSession);
	}

}
