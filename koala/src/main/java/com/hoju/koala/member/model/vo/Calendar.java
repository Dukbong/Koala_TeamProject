package com.hoju.koala.member.model.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Calendar {
	
	private String monthName;
//	private int Month;
//	private int endDate;
	private List<Integer> levelList;

}
