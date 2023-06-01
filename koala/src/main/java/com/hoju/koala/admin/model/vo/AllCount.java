package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllCount {
	private int member;
	private int supporters;
	private int createSetting;
	private int errorBoard;
	private int bulletinBoard;
	private int qnaBoard;
//	<result column="member" property="member"/>
//	<result column="supporters" property="supporters"/>
//	<result column="createSetting" property="createSetting"/>
//	<result column="errorBoard" property="errorBoard"/>
//	<result column="bulletinBoard" property="bulletinBoard"/>
//	<result column="qnaBoard" property="qnaBoard"/>
}
