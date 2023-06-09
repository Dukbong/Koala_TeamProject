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

	//팔로우가 되어있는지 확인하는 메소드
	@Override
	public int selectFollow(Follow f) {
		
		int cnt = memberDao.selectFollow(sqlSession, f);
		
		return cnt;
	}
	

	//팔로우 하기
	@Override
	public int addFollow(Follow f) {
		
		int result = memberDao.addFollow(sqlSession, f);
		
		return result;
	}


	//팔로우 취소
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


	//비밀번호 변경
	@Override
	public int updatePwd(Member loginUser) {
		
		int result = memberDao.updatePwd(sqlSession, loginUser);
		
		return result;
	}


	//입력한 이메일에 대한 데이터가 있는지 조회 있다면 아이디만 가져오기
	@Override
	public String selectEmail(String userEmail) {

		String userId = memberDao.selectEmail(sqlSession, userEmail);
		
		return userId;
	}


	

}
