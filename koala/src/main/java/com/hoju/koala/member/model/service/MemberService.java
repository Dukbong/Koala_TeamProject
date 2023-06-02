package com.hoju.koala.member.model.service;

import com.hoju.koala.member.model.vo.Member;

public interface MemberService {

	//로그인
	Member loginMember(Member m);

	//회원조회 활동내역
	Member selectMember(int userNo);

}
