package com.hoju.koala.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnASelect {
	private int replyNo;//	댓글 번호
	private int refBno;//	참조 게시글 번호
	private String replySelect;//	채택 여부

}
