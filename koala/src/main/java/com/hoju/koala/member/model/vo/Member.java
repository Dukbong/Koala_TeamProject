package com.hoju.koala.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private String email;
	private String introduce;
	private int userLevel;
	private int point;
	private int type;
	private Date createDate;
	private Date deleteDate; //삭제요청일
	private String status;
	
	private int rank;//랭킹페이지 등수 필드 추가
	private int previousRank;//예전 등수 필드 추가
	private String rankChange;//랭킹 페이지 등수 변동 필드 추가
	
	private Profile profile;
}
