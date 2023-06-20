package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.RankingBoardDao;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RankingBoardServiceImpl implements RankingBoardService{

	@Autowired
	private RankingBoardDao rnkDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//랭킹 리스트 조회
	@Override
	public ArrayList<Member> rankingList() {
		
		return rnkDao.rankingList(sqlSession);
	}
	
	
}
