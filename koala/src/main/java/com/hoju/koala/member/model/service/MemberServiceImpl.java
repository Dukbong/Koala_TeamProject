package com.hoju.koala.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.member.model.dao.MemberDao;
import com.hoju.koala.member.model.vo.Follow;
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


	//회원가입
	@Override
	public int insertMember(Member m) {

		int result = memberDao.insertMember(sqlSession, m);
		
		return result;
	}


	//소개글 수정
	@Override
	public int updateIntroduce(Member m) {
		
		int result = memberDao.updateIntroduce(sqlSession, m);
		
		return result;
	}


	//팔로우 하기
	@Override
	public int addFollow(Follow f) {
		
		int result = memberDao.addFollow(sqlSession, f);
		
		return result;
	}


	@Override
	public int removeFollow(Follow f) {

		int result = memberDao.removeFollow(sqlSession, f);
		
		return result;
	}


	//팔로우 수 조회
	@Override
	public int selectFollowCount(int userNo) {
		
		int cnt = memberDao.selectFollowCount(sqlSession, userNo);
		
		return cnt;
	}

}
