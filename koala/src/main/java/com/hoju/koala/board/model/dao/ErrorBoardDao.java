package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.board.model.vo.ErrorSet;

@Repository
public class ErrorBoardDao {

	public ArrayList<ErrorSet> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("errorBoardMapper.selectList");
	}
	
	
}
