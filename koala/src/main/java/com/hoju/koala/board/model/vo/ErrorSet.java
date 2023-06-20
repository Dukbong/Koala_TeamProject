package com.hoju.koala.board.model.vo;

import com.hoju.koala.admin.model.vo.CreateSetting;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ErrorSet { //에러게시판 조회용
	
	private Board board;
	private ErrorBoard errorBoard;
	private CreateSetting createSetting;

}
