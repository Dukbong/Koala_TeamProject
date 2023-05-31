package com.hoju.koala.admin.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.admin.model.dao.AdminDao;
import com.hoju.koala.admin.model.vo.AllCount;

@Service
@RequestMapping("/admin")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	AdminDao adminDao;
	
	@Override
	public AllCount selectAllCount() {
		AllCount allCount = adminDao.selectAllCount(sqlSession);
		return allCount;
	}

}
