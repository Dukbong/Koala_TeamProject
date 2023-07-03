package com.hoju.koala.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.member.model.vo.Attendance;
import com.hoju.koala.member.model.vo.Follow;
import com.hoju.koala.member.model.vo.Member;
import com.hoju.koala.member.model.vo.Profile;

@Repository
public class MemberDao {

	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	//회원 정보 조회
	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectMember", userId);
	}

	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	//소개글 수정
	public int updateIntroduce(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateIntroduce", m);
	}

	//팔로우가 되어있는지 확인하는 메소드
	public int selectFollow(SqlSessionTemplate sqlSession, Follow f) {
		
		return sqlSession.selectOne("memberMapper.selectFollow", f);
	}

	
	//팔로우 추가
	public int addFollow(SqlSessionTemplate sqlSession, Follow f) {
		
		return sqlSession.insert("memberMapper.addFollow", f);
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

	//계정 삭제
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}
	
	//입력한 이메일에 대한 데이터가 있는지 조회 있다면 아이디만 가져오기
	public Member selectEmail(SqlSessionTemplate sqlSession, String userEmail) {

		return sqlSession.selectOne("memberMapper.selectEmail", userEmail);
	}

	//아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String inputId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", inputId);
	}

	//닉네임 중복체크
	public int nickCheck(SqlSessionTemplate sqlSession, String inputNick) {
		
		return sqlSession.selectOne("memberMapper.nickCheck", inputNick);
	}

	//유저가쓴 게시글 조회
	public ArrayList<Board> boardList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.boardList", userId, pi.rowBounds());
	}

	//유저가 댓글쓴 게시글 조회
	public ArrayList<Board> replyList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.replyList", userId, pi.rowBounds());
	}

	//유저가 추천누른 게시글조회
	public ArrayList<Board> likedList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.likedList", userId, pi.rowBounds());
	}

	//해당 유저의 팔로잉 리스트 조회
	public ArrayList<Member> followingList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.followingList", userId, pi.rowBounds());
	}
	
	//========================================================= 설희
	//해당 유저의 contributions 조회
	public ArrayList<Attendance> selectContributions(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectContributions", userNo);
	}
	
	//(관리자,서포터즈) libList 조회
	public ArrayList<Board> libList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.libList", userId, pi.rowBounds());
	}
	
	
	//로그인 시 출석 등록
	public void attendance(SqlSessionTemplate sqlSession, int userNo) {
		
		try {
			int result = sqlSession.insert("memberMapper.attendance", userNo);
		} catch(Exception e){   
		    System.out.println("출석 중복");
		}
	}

	//닉네임 변경
	public int updateNick(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateNick", m);
	}

	//프로필 등록
	public int insertProfile(SqlSessionTemplate sqlSession, Profile p) {

		return sqlSession.insert("memberMapper.insertProfile", p);
	}

	//프로필 조회
	public Profile selectProfile(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectProfile", userNo);
	}
	
	//프로필 삭제
	public int deleteProfile(SqlSessionTemplate sqlSession, Profile delProfile) {
		
		return sqlSession.delete("memberMapper.deleteProfile", delProfile);
	}

	//닉네임 조회
	public int selectNick(SqlSessionTemplate sqlSession, String inputNick) {
		
		return sqlSession.selectOne("memberMapper.selectNick", inputNick);
	}

	//메신저 닉네임으로 유저 검색
	public ArrayList<Member> searchUser(SqlSessionTemplate sqlSession, String searchUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchUser", searchUser);
	}

	
	//활동내역페이지 보드리스트 개수
	public int selectblCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectblCount", userId);
	}

	public int selectrlCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectrlCount", userId);
	}

	public int selectllCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectllCount", userId);
	}

	public int selectflCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectflCount", userId);
	}

	public int selectlibCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectlibCount", userId);
	}

	//로그인 유저 서포터즈 판별
	public int selectSup(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectSup", userNo);
	}

	//해당 유저 서포터즈인지 확인
	public Supporters selectSupport(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectSupport", userId);
	}

	





	
	
}
