package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllCount{
	private int member;
	private int supporters;
	private int createSetting;
	private int errorBoard;
	private int issue;
	private int bulletinBoard;
	private int qnaBoard;
	private int blockIp;
}
