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
public class Attendance {
	
	private Date attDate; //해당날짜 //Date로 바꾸는게 낫나?
	private int refUno; //참조회원번호
	private int attLevel; //참여도(3단계)
	private int prePoint; //이전 포인트

}
