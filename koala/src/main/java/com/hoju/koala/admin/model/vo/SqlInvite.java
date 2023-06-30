package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class SqlInvite {
	private int creatorNo;
	private int userNo;
	private int teamNo;
}
