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
import com.hoju.koala.admin.model.vo.ErrorDivision;
import com.hoju.koala.admin.model.vo.IssuesAndError;
import com.hoju.koala.admin.model.vo.MemberSearch;
import com.hoju.koala.admin.model.vo.ModifyTeam;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.admin.model.vo.SqlInvite;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
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
	public ArrayList<IssuesAndError> selectErrorBoardCount() {
		return adminDao.selectErrorBoardCount(sqlSession);
	}

	@Override
	public ArrayList<BlockIp> selectBlockIp(PageInfo pi) {
		return adminDao.selectBolckIp(sqlSession, pi);
	}

	@Override
	public ArrayList<Supporters> selectMemberList(PageInfo pi) {
		System.out.println(pi);
		return adminDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public ArrayList<Supporters> selectMembercondition(PageInfo page, MemberSearch ms) {
		return adminDao.selectMembercondition(ms, page, sqlSession);
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

	@Override
	public int updateblockAction(String blackIp) {
		return adminDao.updateblockAction(blackIp, sqlSession);
	}

	@Override
	public int InsertSupporters(int client_No) {
		return adminDao.InsertSupporters(client_No, sqlSession);
	}

	@Override
	public int deleteSupporters(int client_No) {
		return adminDao.deleteSupporters(client_No, sqlSession);
	}

	@Override
	public Supporters selectOneSupport(int userNo) {
		return adminDao.selectOneSupport(userNo, sqlSession);
	}

	@Override
	public int selectCountMemberCondition(MemberSearch ms) {
		return adminDao.selectCountMemberCondition(ms, sqlSession);
	}

	@Override
	public ArrayList<Supporters> selectSupporterWaitList() {
		return adminDao.selectSupporterWaitList(sqlSession);
	}

	@Override
	public int insertSupporterGithubId(Supporters supporter) {
		return adminDao.insertSupporterGithubId(supporter, sqlSession);
	}

	@Override
	public ArrayList<IssuesAndError> selectIssues() {
		return adminDao.selectIssues(sqlSession);
	}

	@Override
	public ErrorBoard selectIssueDetail(String settingTitle) {
		return adminDao.selectIssueDetail(settingTitle, sqlSession);
	}

	@Override
	public ArrayList<ErrorSet> selectErrorDetail(String settingTitle) {
		return adminDao.selectErrorDetail(settingTitle, sqlSession);
	}

	@Override
	public int updateErrorType(ErrorDivision ed) {
		return adminDao.updateErrorType(ed, sqlSession);
	}

	@Override
	public String selectSqlTitle(String string) {
		return adminDao.selectSqlTitle(string, sqlSession);
	}

	@Override
	public ArrayList<SqlCloud> selectTeam(int userNo) {
		return adminDao.selectTeam(userNo, sqlSession);
	}

	@Override
	public ArrayList<Member> selectTeamMember(int teamNo) {
		return adminDao.selectTeamMember(teamNo, sqlSession);
	}

	@Override
	public int selectCreator(int teamNo) {
		return adminDao.selectCreator(teamNo, sqlSession);
	}

	@Override
	public String selectSqlContent(int teamNo) {
		return adminDao.selectSqlContent(teamNo, sqlSession);
	}

	@Override
	public int updateTeamSql(SqlCloud saveSql) {
		return adminDao.updateTeamSql(saveSql, sqlSession);
	}

	@Override
	public SqlCloud selectSqlDate(int teamNo) {
		return adminDao.selectSqlDate(teamNo, sqlSession);
	}

	@Override
	public ArrayList<Member> searchMember(String text) {
		return adminDao.searchMember(text, sqlSession);
	}

	@Override
	public Supporters selectMemberDetailInfo(String userId) {
		return adminDao.selectMemberDetailInfo(userId, sqlSession);
	}

	@Override
	public int insertSQLteam(SqlCloud sql) {
		return adminDao.insertSQLteam(sql, sqlSession);
	}

	@Override
	public int insertSQLteamMember(SqlInvite sqlIn) {
		return adminDao.insertSQLteamMember(sqlIn, sqlSession);
	}

	@Override
	public ArrayList<ModifyTeam> selectOneTeam(int teamNo) {
		return adminDao.selectOneTeam(teamNo, sqlSession);
	}

	@Override
	public int deleteTeamMember(String teamName) {
		return adminDao.deleteTeamMember(teamName, sqlSession);
	}

	@Override
	public int selectTeamTeamNo(String teamName) {
		return adminDao.selectTeamTeamNo(teamName, sqlSession);
	}

	@Override
	public int updateSQLteamMember(SqlInvite sqlIn) {
		return adminDao.updateSQLteamMember(sqlIn, sqlSession);
	}

	@Override
	public int deleteTeam(int teamNo) {
		return adminDao.deleteTeam(teamNo, sqlSession);
	}

	@Override
	public int deleteLastTeamInfo(int teamNo) {
		return adminDao.deleteLastTeamInfo(teamNo, sqlSession);
	}
	@Override
	public int teamQuit(SqlInvite sql) {
		return adminDao.taemQuit(sql, sqlSession);
	}




	/* 보류
	 * @Override public int boardListCount(String board) { return
	 * adminDao.boardListCount(sqlSession, board); }
	 */

}
