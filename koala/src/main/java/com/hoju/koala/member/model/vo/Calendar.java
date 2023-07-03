package com.hoju.koala.member.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

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
	private ArrayList<HashMap<String,String>> dayList;

}
