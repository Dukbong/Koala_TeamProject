package com.hoju.koala.common.template;

import com.hoju.koala.common.model.vo.PageInfo;

public class Paging {
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		if(currentPage == 0) {
			currentPage = 1;
		}
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
}
