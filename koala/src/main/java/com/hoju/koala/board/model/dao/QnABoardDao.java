package com.hoju.koala.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.Liked;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;

@Repository
public class QnABoardDao {

	//qna 게시글 개수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectListCount");
	}

	//qna 게시글 목록
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectList",null,rowBounds);
	}

	//qna 게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("qnaBoardMapper.increaseCount",boardNo);
	}

	//qna 게시글 상세 조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectBoard",boardNo);
	}

	//qna 게시글 첨부파일 확인
	public ArrayList<BoardAttachment> selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectAttachment",boardNo);
	}


	//qna 게시글 검색 목록 개수
	public int selectBoardCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchInfo) {
		
		return sqlSession.selectOne("qnaBoardMapper.selectBoardCount",searchInfo);
	}

	//qna 게시글 검색 목록
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, HashMap<String, String> searchInfo,
			PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectBoardList",searchInfo,rowBounds);
	}

	//qna 댓글 조회
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("qnaBoardMapper.selectReply",boardNo);
	}

	//qna 댓글 삽입
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("qnaBoardMapper.insertReply",r);
	}

	//qna 글만 등록
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("qnaBoardMapper.insertBoard",b);
	}

	//qna 파일 등록
	public int insertBoardFile(SqlSessionTemplate sqlSession, BoardAttachment at) {
		
		return sqlSession.insert("qnaBoardMapper.insertBoardFile",at);
	}

	//qna 공지 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("qnaBoardMapper.insertNotice",b);
	}

	//qna 게시글 추천 확인
	public int likeChk(SqlSessionTemplate sqlSession, int boardNo, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		
		return sqlSession.selectOne("qnaBoardMapper.likeChk",map);
	}

	//qna like테이블 삽입
	public void insertLike(SqlSessionTemplate sqlSession, int boardNo, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		
		sqlSession.insert("qnaBoardMapper.insertLike",map);
		
	}

	//qna board테이블 like 추가
	public void updateLike(SqlSessionTemplate sqlSession, int boardNo) {
		
		sqlSession.update("qnaBoardMapper.updateLike",boardNo);
		
	}


	//qna 회원포인트 지급
	public void pointUpdate(SqlSessionTemplate sqlSession, int boardNo) {
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("boardWriter", boardWriter);
//		map.put("boardNo", boardNo);
//		
		sqlSession.update("qnaBoardMapper.pointUpdate", boardNo);
		
	}


	//qna like테이블 삭제
//	public void deleteLike(SqlSessionTemplate sqlSession, int boardNo, int userNo) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("userNo", userNo);
//		map.put("boardNo", boardNo);
//		
//		sqlSession.update("qnaBoardMapper.deleteLike",map);
//		
//	}

	//qna 회원포인트 차감
	public void pointDelete(SqlSessionTemplate sqlSession, int boardNo) {
		
		
		sqlSession.update("qnaBoardMapper.pointDelete", boardNo);
		
	}

	//qna 댓글 수
	public int replyCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("qnaBoardMapper.replyCount",boardNo);
	}

	//qna 좋아요 수
	public int getLikeCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("qnaBoardMapper.getLikeCount",boardNo);
	}

	//qna 댓글 채택
	public int qnaSelect(SqlSessionTemplate sqlSession, int boardNo, int replyNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("replyNo", replyNo);
		return sqlSession.insert("qnaBoardMapper.qnaSelect",map);
	}

	//qna 게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("qnaBoardMapper.deleteBoard",boardNo);
	}

	//qna 댓글 채택 여부
	public String chkSelectedReply(SqlSessionTemplate sqlSession, int boardNo, Integer replyNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("replyNo", replyNo);
		return sqlSession.selectOne("qnaBoardMapper.chkSelectedReply",map);
	}

	//qna 게시글 상세보기 시 좋아요 여부 확인
	public int likeYesOrNo(SqlSessionTemplate sqlSession, Liked liked) {
		
		if(sqlSession.selectOne("qnaBoardMapper.likeYesOrNo",liked)!=null) {
			return sqlSession.selectOne("qnaBoardMapper.likeYesOrNo",liked);			
		}else {
			return 0;
		}
	}

	//qna 조아요 취소 시 보드 liked 차감
	public void deleteLike(SqlSessionTemplate sqlSession, int boardNo) {
		
		sqlSession.update("qnaBoardMapper.deleteLike",boardNo);
		
	}

	//qna 좋아요 클릭 여부 확인
	public Integer likeStatus(SqlSessionTemplate sqlSession, int boardNo, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne("qnaBoardMapper.likeStatus",map);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("qnaBoardMaper.updateBoard",b);
	}

	//qna 파일 수정
	public int updateFile(SqlSessionTemplate sqlSession, BoardAttachment at) {
		
		return sqlSession.update("qnaBoardMapper.updateFile",at);
	}

	//qna 좋아요 수
//	public int countLike(SqlSessionTemplate sqlSession, int boardNo) {
//		
//		return sqlSession.selectOne("qnaBoardMapper.countLike",boardNo);
//	}
	
	
	

}
