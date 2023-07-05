package com.hoju.koala.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.ErrorDivision;
import com.hoju.koala.admin.model.vo.IssuesAndError;
import com.hoju.koala.admin.model.vo.MemberSearch;
import com.hoju.koala.admin.model.vo.ModifyTeam;
import com.hoju.koala.admin.model.vo.SettingDetail;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.admin.model.vo.SqlInvite;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.member.model.vo.Member;
import com.hoju.koala.setting.model.vo.Setting;


// rawtypes : 제네릭 타입이 불완전하다
@SuppressWarnings({ "unchecked", "rawtypes" })
@Repository
public class AdminDao {
	
	public AllCount selectAllCount(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.allCount");
	}

	public ArrayList<Supporters> selectSupporters(SqlSession sqlSession, PageInfo pi) {
		return (ArrayList) sqlSession.selectList("adminMapper.selectSupporters",null, pi.rowBounds());
	}
	
	public ArrayList<CreateSetting> selectCreateSetting(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectWaitingLibrary");
	}

	public ArrayList<IssuesAndError> selectErrorBoardCount(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectErrorBoardCount");
	}

	public ArrayList<BlockIp> selectBolckIp(SqlSession sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBolckIp",null, pi.rowBounds());
	}
	
	public ArrayList<Supporters> selectMemberList(SqlSession sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList",null, pi.rowBounds());
	}

	public ArrayList<Supporters> selectMembercondition(MemberSearch ms, PageInfo pi, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMembercondition",ms, pi.rowBounds());
	}
	
	public ArrayList<IssuesAndError> selectIssues(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectIssues");
	}
	
	public BlockIp selectBlockIpUser(String ip, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBlockIpUser", ip);
	}

	public int insertBlockIpUser(String ip, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.insertBlockIpUser", ip);
	}

	public int updateBlockIpUser(String ip, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateBlockIpUser", ip);
	}

	public int blockBlockIpUser(String ip, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.blockBlockIpUser", ip);
	}

	public int updateblockClear(String blackIp, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateblockClear", blackIp);
	}
	
	public int updateblockAction(String blackIp, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateblockAction", blackIp);
	}
	
	public int deleteSupporter(String userNo, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.deleteSupporter", userNo);
	}

	public int InsertSupporters(int client_No, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.InsertSupporters", client_No);
	}

	public int deleteSupporters(int client_No, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.deleteSupporters", client_No);
	}

	public Supporters selectOneSupport(int userNo, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectOneSupport", userNo);
	}

	public int selectCountMemberCondition(MemberSearch ms, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectCountMemberCondition", ms);
	}

	public ArrayList<Supporters> selectSupporterWaitList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectSupporterWaitList");
	}

	public int insertSupporterGithubId(Supporters supporter, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.insertSupporterGithubId", supporter);
	}

	public ArrayList<SettingDetail> selectIssueDetail(String settingTitle, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectIssueDetail", settingTitle);
	}

	public ArrayList<ErrorSet> selectErrorDetail(String settingTitle, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectErrorDetail", settingTitle);
	}

	public int updateErrorType(ErrorDivision ed, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateErrorType", ed);
	}

	public String selectSqlTitle(String string, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectSqlTitle", string);
	}

	public ArrayList<SqlCloud> selectTeam(int userNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTeam", userNo);
	}

	public ArrayList<Member> selectTeamMember(int teamNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTeamMember", teamNo);
	}

	public int selectCreator(int teamNo, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectCreator", teamNo);
	}

	public String selectSqlContent(int teamNo, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectSqlContent", teamNo);
	}

	public int updateTeamSql(SqlCloud saveSql, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateTeamSql", saveSql);
	}

	public SqlCloud selectSqlDate(int teamNo, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectSqlDate", teamNo);
	}

	public ArrayList<Member> searchMember(String text, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchMember", text);
	}

	public Supporters selectMemberDetailInfo(String userId, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberDetailInfo", userId);
	}

	public int insertSQLteam(SqlCloud sql, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.insertSQLteam", sql);
	}

	public int insertSQLteamMember(SqlInvite sqlIn, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.insertSQLteamMember", sqlIn);
	}

	public ArrayList<ModifyTeam> selectOneTeam(int teamNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectOneTeam", teamNo);
	}

	public int deleteTeamMember(String teamName, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.deleteTeamMember", teamName);
	}
	

	public int selectTeamTeamNo(String teamName, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectTeamTeamNo", teamName);
	}

	public int updateSQLteamMember(SqlInvite sqlIn, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.updateSQLteamMember", sqlIn);
	}

	public int deleteTeam(int teamNo, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.deleteTeam", teamNo);
	}

	public int deleteLastTeamInfo(int teamNo, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.deleteLastTeamInfo", teamNo);
	}

	public int taemQuit(SqlInvite sql, SqlSession sqlSession) {
		return sqlSession.delete("adminMapper.taemQuit", sql);
	}

	public ArrayList<Setting> selectWaitingLib(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectWaitingLib");
	}

	public int approvelib(int settingNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.approvelib", settingNo);
	}

	public int disapprovelib(int settingNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.disapprovelib", settingNo);
	}

	public int updateIssueSuccess(int boardNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateIssueSuccess", boardNo);
	}

	public int updateSetting(Setting setting, SqlSession sqlSession) {
		return sqlSession.insert("adminMapper.updateSetting", setting);
	}

	public Setting listDetail(int settingNo, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.listDetail", settingNo);
	}

	public int updateIssueDate(int boardNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateIssueDate", boardNo);
	}

	public int updateSettingEtc(Setting setting, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateSettingEtc", setting);
	}

	public Setting selectprevSetting(String settingTitle, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectprevSetting", settingTitle);
	}

	public SettingDetail selectOneError(SettingDetail sd, SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.selectOneError", sd);
	}

	public int updateSettingN(int settingNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateSettingN", settingNo);
	}

	public int updateStatueSetting(int settingNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.updateStatueSetting", settingNo);
	}

	public int settingDisApprove(int settingNo, SqlSession sqlSession) {
		return sqlSession.update("adminMapper.settingDisApprove", settingNo);
	}
}
