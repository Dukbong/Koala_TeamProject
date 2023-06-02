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


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Supporters extends Member{
	/*
	 * Member 상속 받은 이유
	 * Supporters는 데이터 베이스에서 Member를 참조하고 있다.
	 * view로 보여줘야 하는 내용은 USER_NO(= refUNO), NICKNAME, GITHUB_ID, CREATE_DATE
	 * NICKNAME을 받을 수 있을 수 있는 변수가 필요하지만 이런식으로 만들다 보면 VO끼리의 경계가 모호해질거 같다.
	 * 그러기 때문에 "상속"을 생각했고 Mybatis의 resultMap 또한 상속이 가능할 것으로 생각했고 생각이 맞았다.*/
	private int refUno;
	private String githubId;
	private Date createDate;
}