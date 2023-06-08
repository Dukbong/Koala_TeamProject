package com.hoju.koala.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;

@Repository
public class MemberDao {

	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	//회원 정보 조회
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember", userNo);
	}

	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	//소개글 수정
	public int updateIntroduce(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateIntroduce", m);
	}

	//팔로우 추가
	public int addFollow(SqlSessionTemplate sqlSession, Follow f) {
		
		int result = 0;
		
		try {
			result = sqlSession.insert("memberMapper.addFollow", f);
		} catch (Exception e) {
			result = 0;
		}
		
		return result;
	}

	//팔로우 취소하기
	public int removeFollow(SqlSessionTemplate sqlSession, Follow f) {
		
		return sqlSession.delete("memberMapper.removeFollow", f);
	}

	//팔로우 수 조회
	public int selectFollowCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectFollowCount", userNo);
	}

	//비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.update("memberMapper.updatePwd", loginUser);
	}
	
	
}
