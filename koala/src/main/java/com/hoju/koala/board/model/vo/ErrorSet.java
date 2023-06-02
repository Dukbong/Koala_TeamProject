package com.hoju.koala.board.model.vo;

import com.hoju.koala.admin.model.vo.CreateSetting;

import lombok.Data;

@Data
public class ErrorSet { //에러게시판 조회용
	
	private Board board;
	private ErrorBoard errorBoard;
	private CreateSetting createSetting;

}
