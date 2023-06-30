package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SqlCloud {
	private int teamNo;
	private String teamName;
	private String sqlContent;
	private int creatorNo;
	private String createDate;
	private String modifyDate;
}
