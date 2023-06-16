package com.hoju.koala.board.model.vo;

import java.sql.Date;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {

	private int boardNo; //게시글번호
	private String category; //게시판종류
	private String boardWriter; //작성자번호 > 편의상 String으로 변경
	private String title; //게시판제목
	private String content; //게시판내용
	private String contentCode; //코드내용
	private int count; //조회수
	private int liked; //좋아요수
	private Date createDate; //작성일
	private Date modifyDate; //수정일
	private String notice; //공지사항여부
	private String status; //상태값(Y/N)

}
