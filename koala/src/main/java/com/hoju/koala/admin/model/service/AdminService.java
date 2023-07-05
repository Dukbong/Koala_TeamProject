package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

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

public interface AdminService {
	AllCount selectAllCount();

	ArrayList<Supporters> selectSupporters(PageInfo pi);

	ArrayList<CreateSetting> selectCreateSetting();

	ArrayList<IssuesAndError> selectErrorBoardCount();

	ArrayList<BlockIp> selectBlockIp(PageInfo page);

	BlockIp selectBlockIpUser(String ip);
	
	ArrayList<Supporters> selectMemberList(PageInfo page);

	ArrayList<Supporters> selectMembercondition(PageInfo page, MemberSearch ms);
	
	ArrayList<Supporters> selectSupporterWaitList();
	
	ArrayList<IssuesAndError> selectIssues();
	
	int deleteSupporter(String userNo);

	int updateblockClear(String blackIp);

	int updateblockAction(String blackIp);

	int InsertSupporters(int client_No);
	
	int deleteSupporters(int client_No);
	
	Supporters selectOneSupport(int userNo);
	
	int selectCountMemberCondition(MemberSearch ms);
	
	int insertSupporterGithubId(Supporters supporter);
	
	ArrayList<SettingDetail> selectIssueDetail(String settingTitle);
	
	
	// intercepter에서  행해지는 curd
	int insertBlockIpUser(String ip);
		
	int updateBlockIpUser(String ip);

	int blockBlockIpUser(String ip);
	// =======================

	ArrayList<ErrorSet> selectErrorDetail(String settingTitle);

	int updateErrorType(ErrorDivision ed);

	
	// sql Cloud 제목 조회
	String selectSqlTitle(String string);

	
	ArrayList<SqlCloud> selectTeam(int userNo);

	ArrayList<Member> selectTeamMember(int teamNo);

	int selectCreator(int teamNo);

	// 저장 된 sql문 가져오기
	String selectSqlContent(int teamNo);
	
	// sql문 저장하기
	int updateTeamSql(SqlCloud saveSql);

	// 처음에 해당 자료가 언제 저장된 자료인지 확인
	SqlCloud selectSqlDate(int teamNo);

	// 초기 팀원 초대하기
	ArrayList<Member> searchMember(String text);

	// 팀원 초대시 그래프를 보여주기 위한 정보
	Supporters selectMemberDetailInfo(String userId);

	// 팀 생성
	int insertSQLteam(SqlCloud sql);

	// 팀 인원 추가
	int insertSQLteamMember(SqlInvite sqlIn);

	// 팀원 수정
	ArrayList<ModifyTeam> selectOneTeam(int teamNo);

	// 팀원 삭제 후 다시 입력
	int deleteTeamMember(String teamName);

	// 팀번호 찾기
	int selectTeamTeamNo(String teamName);

	int updateSQLteamMember(SqlInvite sqlIn);
	
	// Team Delete
	int deleteTeam(int teamNo);

	// Team Member Delete
	int deleteLastTeamInfo(int teamNo);

	// member >> quit Team
	int teamQuit(SqlInvite sql);

	// waitinglib
	ArrayList<Setting> selectWaitingLib();

	// lig approve
	int approvelib(int settingNo);

	// lib disapprove
	int disapprovelib(int settingNo);

	// 라이브러리 수정 완료
	int updateIssueSuccess(int boardNo);
	int updateSetting(Setting setting);
	int updateIssueDate(int boardNo);
	int updateSettingEtc(Setting setting);

	Setting listDetail(int settingNo);


	SettingDetail selectOneError(SettingDetail sd);

	int updateSettingN(int settingNo);

	Setting selectprevSetting(String settingTitle);










}
