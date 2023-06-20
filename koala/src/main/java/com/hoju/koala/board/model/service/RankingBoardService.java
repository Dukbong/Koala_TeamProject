package com.hoju.koala.board.model.service;

import java.util.ArrayList;

import com.hoju.koala.member.model.vo.Member;

public interface RankingBoardService {

	//랭킹 보여주기
	ArrayList<Member> rankingList();

}
