package com.hoju.koala.setting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Setting {
/*
SETTING_NO	NUMBER
REF_UNO	NUMBER
SETTING_TITLE	VARCHAR2(100 BYTE)
SETTING_VERSION	VARCHAR2(100 BYTE)
SORT_DESCRIPTION	VARCHAR2(1000 BYTE)
SETTING_INFO	CLOB
SETTING_CODE	VARCHAR2(4000 BYTE)
INPUT	VARCHAR2(200 BYTE)
STATUS	VARCHAR2(2 BYTE)
CREATE_DATE	DATE
 */

	private int settingNo;
	private int refUno;
	private String settingTitle;
	private String settingVersion;
	private String sortDescription;
	private String settingInfo;
	private String settingCode;
	private String input;
	private String status;
	private Date createDate;
	
}
