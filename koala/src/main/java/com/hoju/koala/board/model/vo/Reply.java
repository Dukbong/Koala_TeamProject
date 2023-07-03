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
public class Reply {
	
	private int replyNo; //댓글번호
	private int refBno; //참조게시글번호
	private String replyContent; //댓글내용
	private String replyWriter; //댓글작성자아이디 > 편의상 String으로 변경
	private String createDate; //댓글작성날짜
	private String status; //댓글상태값
	
	private String memberImage; //프로필사진
	private String supporters; //서포터즈 여부

}
