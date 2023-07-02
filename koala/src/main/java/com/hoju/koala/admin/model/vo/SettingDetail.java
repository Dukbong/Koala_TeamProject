package com.hoju.koala.admin.model.vo;

import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.setting.model.vo.Setting;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SettingDetail {
	private ErrorBoard errorBoard;
	private Reply reply;
	private Setting setting;
}
