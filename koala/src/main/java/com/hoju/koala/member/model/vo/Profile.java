package com.hoju.koala.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Profile {
	/*
PROFILE_NO	NUMBER
REF_UNO	NUMBER
ORIGIN_NAME	VARCHAR2(255 BYTE)
CHANGE_NAME	VARCHAR2(255 BYTE)
FILE_PATH	VARCHAR2(1000 BYTE)
	 */
	private int profileNo;
	private int refUno;
	private String originName;
	private String changeName;
	private String filePath;
}
