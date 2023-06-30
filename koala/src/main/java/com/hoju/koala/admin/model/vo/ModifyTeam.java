package com.hoju.koala.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyTeam {
	private String teamName;
	private String creatorId;
	private String userId;
	private String nickName;
	private String userNo;
	private String filePath;
	private String changeName;
	private String githubId;
}
