package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.member.model.vo.Member;

public interface AdminService {
	// 관리자가 관리해야 하는 게시판 및 회원 개수 조회
	AllCount selectAllCount();

	// 서포터즈 회원 관리를 위한 전체 조회
	ArrayList<Supporters> selectSupporters();

	// 라이브러리 및 설정 파일 중 대기 상태인 게시글 
	ArrayList<CreateSetting> selectCreateSetting();

	// 에러 게시판 중 해결되지 않은 상태 게시글
	ArrayList<ErrorBoard> selectErrorBoard();

	// 부적절한 접근자 조회
	ArrayList<BlockIp> selectBlockIp();

	// 부적절한 접근자 특정 조회
	BlockIp selectBlockIpUser(String ip);
	
	// 부적절한 접근자 인서트
	int insertBlockIpUser(String ip);
	
	// 부적절한 접근자 업데이트
	int updateBlockIpUser(String ip);

	// 진짜 차단
	int blockBlockIpUser(String ip);
	
	// 회원 관리 (서포터즈 제외)
	ArrayList<Member> selectMemberList();
}
