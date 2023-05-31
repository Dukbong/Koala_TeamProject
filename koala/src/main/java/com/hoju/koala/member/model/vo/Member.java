package com.hoju.koala.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private String email;
	private int userLevel;
	private int point;
	private int type;
	private Date createDate;
	private Date deleteDate; //삭제요청일
	private String status;
}
