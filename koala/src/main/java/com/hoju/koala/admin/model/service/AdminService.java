package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.member.model.vo.Member;

public interface AdminService {
	AllCount selectAllCount();

	ArrayList<Supporters> selectSupporters();

	ArrayList<CreateSetting> selectCreateSetting();

	ArrayList<ErrorBoard> selectErrorBoard();

	ArrayList<BlockIp> selectBlockIp();

	BlockIp selectBlockIpUser(String ip);
	
	int insertBlockIpUser(String ip);
	
	int updateBlockIpUser(String ip);

	int blockBlockIpUser(String ip);
	
	ArrayList<Member> selectMemberList();
}
