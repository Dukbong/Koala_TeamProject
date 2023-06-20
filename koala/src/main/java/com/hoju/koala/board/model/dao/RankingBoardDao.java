package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.member.model.vo.Member;

@Repository
public class RankingBoardDao {

	public ArrayList<Member> rankingList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("rankingBoardMapper.rankingList");
	}

}
