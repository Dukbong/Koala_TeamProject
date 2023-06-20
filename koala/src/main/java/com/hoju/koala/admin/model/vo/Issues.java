package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder

public class Issues {
	private String settingTitle;
	private int count;
	private String sortDescription;
}
