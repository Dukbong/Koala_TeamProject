package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class WebSocketVO {
	private String type;
	private int teamNo;
	private String userId;
	private String msg;
}
