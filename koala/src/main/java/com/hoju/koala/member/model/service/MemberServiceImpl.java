package com.hoju.koala.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.member.model.dao.MemberDao;
import com.hoju.koala.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//로그인
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}


	//회원 정보 조회
	@Override
	public Member selectMember(int userNo) {

		Member m = memberDao.selectMember(sqlSession, userNo);
		
		return m;
	}

}
