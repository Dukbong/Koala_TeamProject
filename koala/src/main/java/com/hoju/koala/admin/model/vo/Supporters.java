package com.hoju.koala.admin.model.vo;

import java.sql.Date;

import com.hoju.koala.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class Supporters extends Member{
	private int refUno;
	private String githubId;
	private Date createDate;
	@Override
	public void setNickName(String nickName) {
		// TODO Auto-generated method stub
		super.setNickName(nickName);
	}
	@Override
	public String getNickName() {
		// TODO Auto-generated method stub
		return super.getNickName();
	}
	
	
}