package com.hoju.koala.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.member.model.vo.Member;

@Repository
public class MemberDao {

	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	
}
