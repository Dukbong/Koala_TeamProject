package com.hoju.koala.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ErrorBoard extends Board{
	
	private int refBno; //참조게시글번호
	private int refSno; //참조세팅번호
	private String solved; //해결여부
	private String errorType; //오류타입
	private String modifiedCode; //수정한코드
	private String modifiedInfo; //수정한설명서

}