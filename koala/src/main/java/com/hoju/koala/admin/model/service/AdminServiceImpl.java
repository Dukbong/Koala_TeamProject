package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoju.koala.admin.model.dao.AdminDao;
import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.member.model.vo.Member;

@Service
@RequestMapping("/admin")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	AdminDao adminDao;
	
	@Override
	public AllCount selectAllCount() {
		return adminDao.selectAllCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<Supporters> selectSupporters(PageInfo pi) {
		return adminDao.selectSupporters(sqlSession, pi);
	}


	@Override
	public ArrayList<CreateSetting> selectCreateSetting() {
		return adminDao.selectCreateSetting(sqlSession);
	}


	@Override
	public ArrayList<ErrorBoard> selectErrorBoard(PageInfo pi) {
		return adminDao.selectErrorBoard(sqlSession, pi);
	}


	@Override
	public ArrayList<BlockIp> selectBlockIp(PageInfo pi) {
		return adminDao.selectBolckIp(sqlSession, pi);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public BlockIp selectBlockIpUser(String ip) {
		return adminDao.selectBlockIpUser(ip, sqlSession);
	}


	@Override
	public int insertBlockIpUser(String ip) {
		return adminDao.insertBlockIpUser(ip, sqlSession);
	}


	@Override
	public int updateBlockIpUser(String ip) {
		return adminDao.updateBlockIpUser(ip, sqlSession);
	}


	@Override
	public int blockBlockIpUser(String ip) {
		return adminDao.blockBlockIpUser(ip, sqlSession);
	}


	@Override
	public int deleteSupporter(String userNo) {
		return adminDao.deleteSupporter(userNo, sqlSession);
	}


	@Override
	public int updateblockClear(String blackIp) {
		return adminDao.updateblockClear(blackIp, sqlSession);
	}




	/* 보류
	 * @Override public int boardListCount(String board) { return
	 * adminDao.boardListCount(sqlSession, board); }
	 */

}
