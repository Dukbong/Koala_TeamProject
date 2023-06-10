package com.hoju.koala.common.model.vo;

import org.apache.ibatis.session.RowBounds;

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
 * currentPage에 default값을 줄 필요가 없다.
 * Paging Class에 있는 getPageInfo 메소드를 통해 디폴트값을 지정해줄 수 있다.
 * 
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
	
	// ibatis RowBounds
	public RowBounds rowBounds() {
		int offset = (currentPage - 1) * this.boardLimit;
		int limit = this.boardLimit;
		RowBounds rb = new RowBounds(offset, limit);
		return rb;
	}
	
	public PageInfo test(Class<?> c) {
		System.out.println(c.toString().toLowerCase()); // class Name lower
		String className = c.toString().toLowerCase();
		
		/*
		 * 여기서 객체로 반환시키고
		 * sercvice에서 의존성 낮추고
		 * className으로는 해당 메서드를 찾아주고
		 * 다형성으로 통해 확장성을 부여하고
		 * 메퍼 실행..... 고럼 완료
		 * */
		
		return this;
	}
}