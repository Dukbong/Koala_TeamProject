package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.admin.model.vo.CreateSetting;
import com.hoju.koala.admin.model.vo.ErrorDivision;
import com.hoju.koala.admin.model.vo.IssuesAndError;
import com.hoju.koala.admin.model.vo.MemberSearch;
import com.hoju.koala.admin.model.vo.SqlCloud;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.member.model.vo.Member;

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
	
	ErrorBoard selectIssueDetail(String settingTitle);
	
	
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








}
