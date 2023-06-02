package com.hoju.koala.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateSetting {
	private int settingNo;
	private int refUno;
	private String settingTitle;
	private String settingVersion;
	private String sortDescription;
	private String settingInfo;
	private String settingCode;
	private String input;
	private String settingPath;
	private String status;
	private Date createDate;
	private Date modifyDate;
}
