package com.hoju.koala.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;

public class BulletinBoardDao {

	//게시글 개수 메소드
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("BoardMapper.selectListCount");
	}

	//게시글 조회 메소드
	public ArrayList<ErrorSet> selectList(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("BoardMapper.selectList",null,rowBounds);
	}

	//게시글 조회 메소드
	public Board boardDetailView(int bno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("BoardMapper.boardDeatailView",bno);
	}

}
