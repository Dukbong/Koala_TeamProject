package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.member.model.vo.Member;

public interface AdminService {
	AllCount selectAllCount();

	ArrayList<Supporters> selectSupporters(PageInfo pi);

	ArrayList<CreateSetting> selectCreateSetting();

	ArrayList<ErrorBoard> selectErrorBoard(PageInfo page);

	ArrayList<BlockIp> selectBlockIp(PageInfo page);

	BlockIp selectBlockIpUser(String ip);
	
	ArrayList<Member> selectMemberList(PageInfo page);

	int deleteSupporter(String userNo);

	int updateblockClear(String blackIp);

	int updateblockAction(String blackIp);

	// 좀더 쉽게 페이징 처리를 위한 함수 (보류)
	/* int boardListCount(String board); */
	
	
	
	
	// intercepter에서  행해지는 curd
	int insertBlockIpUser(String ip);
		
	int updateBlockIpUser(String ip);

	int blockBlockIpUser(String ip);
	// =======================
}
