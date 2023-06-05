package com.hoju.koala.common.model.vo;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import com.hoju.koala.admin.model.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
/***
 * 기본적으로 사용법은 같으며 DAO에서 RowBounds를 바로 받을 수 있다.
 * @author jkmo2
 *
 */
public class PageInfo {
	private int listCount; // controller >> 변경
	private int currentPage; // controller >> 변경 (param)
	private int pageLimit; // controller >> 고정
	private int boardLimit; // controller >> 고정

	private int maxPage;
	private int startPage;
	private int endPage;
	
	// 강사님에게 질문 후 결정
	// 객체를 계속해서 만들면서 dao에서 제거 할지 어쩔지
	
	// ibatis RowBounds
	public RowBounds rowBounds() {
		int offset = (currentPage - 1) * this.boardLimit;
		int limit = this.boardLimit;
		RowBounds rb = new RowBounds(offset, limit);
		return rb;
	}
}