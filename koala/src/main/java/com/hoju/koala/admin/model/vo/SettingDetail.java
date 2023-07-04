package com.hoju.koala.admin.model.vo;

import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.ErrorBoard;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.member.model.vo.Member;
import com.hoju.koala.setting.model.vo.Setting;
import com.hoju.koala.setting.model.vo.Setting.SettingBuilder;

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

public class SettingDetail {
	private ErrorBoard errorBoard;
	private Member member;
	private Board board;
	private Setting setting;
	private int page;
}
