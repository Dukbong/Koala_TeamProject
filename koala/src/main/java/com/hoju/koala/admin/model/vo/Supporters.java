package com.hoju.koala.admin.model.vo;

import java.sql.Date;

import com.hoju.koala.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@SuperBuilder
public class Supporters extends Member{
	/*
	 * Member 상속을 통해 별도의 vo 필드 추가 없이 사용이 가능하다.*/
	private int refUno;
	private String githubId;
	private Date createDate;
	private String repoUrl; // 06-16  새로 추가 잔디를 위해
}