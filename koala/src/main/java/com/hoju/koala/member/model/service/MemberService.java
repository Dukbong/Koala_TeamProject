package com.hoju.koala.member.model.service;

import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;

public interface MemberService {

	//로그인
	Member loginMember(Member m);

	//회원조회 활동내역
	Member selectMember(int userNo);

	//회원가입
	int insertMember(Member m);

	//소개글 수정
	int updateIntroduce(Member m);

	//팔로우 하기
	int addFollow(Follow f);

	//팔로우 취소하기
	int removeFollow(Follow f);

	//팔로우 수 조회
	int selectFollowCount(int userNo);

	//비밀번호 변경
	int updatePwd(Member loginUser);

}
