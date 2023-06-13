package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

// Bean 처리 된  vo (고정 값이며 보안을 위해 properties로 분리)

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ClientId {
	private String clientId; // 이건 고정값이 기때문에 한다.
}
