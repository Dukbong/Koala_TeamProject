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
	private String sqlTitle;
	private String sqlContent;
	private String createDate;
	private String modifyDate;
}
