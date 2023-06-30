package com.hoju.koala.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.member.model.dao.MemberDao;
import com.hoju.koala.member.model.vo.Attendance;
import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;
import com.hoju.koala.member.model.vo.Profile;

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
	public Member selectMember(String userId) {

		Member m = memberDao.selectMember(sqlSession, userId);
		
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
	
	//계정삭제
	@Override
	public int deleteMember(String userId) {
		
		int result = memberDao.deleteMember(sqlSession, userId);
		
		return result;
	}


	//입력한 이메일에 대한 데이터가 있는지 조회 있다면 아이디만 가져오기
	@Override
	public Member selectEmail(String userEmail) {

		Member m = memberDao.selectEmail(sqlSession, userEmail);
		
		return m;
	}


	//아이디 중복체크
	@Override
	public int idCheck(String inputId) {
		
		int result = memberDao.idCheck(sqlSession, inputId);
		
		return result;
	}


	//닉네임 중복체크
	@Override
	public int nickCheck(String inputNick) {
		
		int result = memberDao.nickCheck(sqlSession, inputNick);
		
		return result;
	}


	//유저가 쓴 게시글 조회
	@Override
	public ArrayList<Board> boardList(String userId) {
		
		ArrayList<Board> blist = memberDao.boardList(sqlSession, userId);
		
		return blist;
	}


	//유저가 쓴 댓글쓴 게시글 조회
	@Override
	public ArrayList<Board> replyList(String userId) {
		
		ArrayList<Board> rlist = memberDao.replyList(sqlSession, userId);
		
		return rlist;
	}


	//유저가 추천누른 게시글 조회
	@Override
	public ArrayList<Board> likedList(String userId) {
		
		ArrayList<Board> lList = memberDao.likedList(sqlSession, userId);
		
		return lList;
	}


	//해당 유저의 팔로잉 조회
	@Override
	public ArrayList<Member> followingList(String userId) {
		
		ArrayList<Member> fList = memberDao.followingList(sqlSession, userId);
		
		return fList;
	}
	
	
	//========================================================= 설희
	//해당 유저의 contributions 조회
	@Override
	public ArrayList<Attendance> selectContributions(int userNo) {
		
		return memberDao.selectContributions(sqlSession, userNo);
	}
	//로그인 시 출석 등록
	@Override
	public void attendance(int userNo) {
		
		memberDao.attendance(sqlSession, userNo);
	}


	//닉네임 변경
	@Override
	public int updateNick(Member m) {

		int result = memberDao.updateNick(sqlSession, m);
		
		return result;
	}


	//프로필 등록
	@Override
	public int insertProfile(Profile p) {
		
		int result = memberDao.insertProfile(sqlSession, p);
		
		return result;
	}


	//프로필 조회
	@Override
	public Profile selectProfile(int userNo) {

		Profile delProfile = memberDao.selectProfile(sqlSession, userNo);
		
		return delProfile;
	}
	
	
	//프로필 삭제
	@Override
	public int deleteProfile(Profile delProfile) {

		int result = memberDao.deleteProfile(sqlSession, delProfile);
		
		return result;
	}


	//닉네임 조회
	@Override
	public int selectNick(String inputNick) {

		int cnt = memberDao.selectNick(sqlSession, inputNick);
		
		return cnt;
	}








	
	


	
	

}
