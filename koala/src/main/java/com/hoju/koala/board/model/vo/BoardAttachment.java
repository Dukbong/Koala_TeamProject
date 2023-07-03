package com.hoju.koala.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardAttachment {
	
	private int fileNo; //파일번호
	private int refBno; //참조게시글번호
	private String originName; //원본파일명
	private String changeName; //변경된파일명
	private String filePath; //파일경로
	private Date uploadDate; //업로드일
	private Date deleteDate; //삭제일
	private int fileLevel; //파일레벨(썸네일)
	private String status; //활성화

}
