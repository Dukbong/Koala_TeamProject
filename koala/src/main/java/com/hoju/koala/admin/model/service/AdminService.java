package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;

public interface AdminService {
	// 관리자가 관리해야 하는 게시판 및 회원 개수 조회
	AllCount selectAllCount();

	// 서포터즈 회원 관리를 위한 전체 조회
	ArrayList<Supporters> selectSupporters();

	// 라이브러리 및 설정 파일 중 대기 상태인 게시글 
	ArrayList<CreateSetting> selectWaitingLibrary();
}
