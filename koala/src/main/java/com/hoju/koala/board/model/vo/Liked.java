package com.hoju.koala.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Liked {
	
	private int refUno; //참조회원번호
	private int refBno; //참조게시글번호
	private int likedType; //좋아요/싫어요

}
