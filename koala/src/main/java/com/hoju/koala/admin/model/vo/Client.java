package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

// Bean 처리 된  vo (고정 값이며 보안을 위해 properties로 분리)
// 깃허브 로그인 시 필요한 ClientId이며 해당 값은 app관리자만 부여받을 수 있고 공유할 수 없다.
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Client {
	private String clientId; // 이건 고정값이 기때문에 한다.
	private String clientSecret; // 이건 고정값이 기때문에 한다.
	private String code;
}
