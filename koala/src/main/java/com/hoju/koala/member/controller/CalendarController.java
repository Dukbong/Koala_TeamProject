package com.hoju.koala.member.controller;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.stereotype.Component;

import com.hoju.koala.member.model.vo.Attendance;
import com.hoju.koala.member.model.vo.Calendar;

@Component
public class CalendarController {
	
	public ArrayList<Calendar> selectCalendar(ArrayList<Attendance> attList){
		
		LocalDate today = LocalDate.now();
		LocalDate start = (today.minusMonths(11)).withDayOfMonth(1);
		
		String monthName = "";
		ArrayList<Calendar> calList = new ArrayList<>();
        
        while(!start.getMonth().equals(today.getMonth())){ //달마다 반복

        	monthName =  start.getMonth().toString().substring(0,3);
        	ArrayList<HashMap<String,String>> dayList = new ArrayList<>();
        	
        	LocalDate startDate =  start.withDayOfMonth(1);
        	LocalDate endDate = start.withDayOfMonth(start.lengthOfMonth());
        	
        	while(!startDate.equals(endDate.plusDays(1))) { //해당 월 일수만큼 반복
        		
        		int level = 0;
        		int addPoint =0;
        		String date = startDate.toString() + " " + startDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.US).toString();
        		HashMap<String, String> map = new HashMap<>();
        		
        		for (Attendance att : attList) { //해당 유저의 출석일 반복 (2년 전 데이터는 어떻게?)
        			
        			if(att.getAttDate().toLocalDate().toString().equals(startDate.toString())) {
        				level = att.getAttLevel();
        				addPoint = att.getPrePoint();
        			}
        		}
        		
        		map.put("level", Integer.toString(level));
        		map.put("addPoint", Integer.toString(addPoint));
        		map.put("date", date);
        		
        		dayList.add(map);
        		
        		startDate = startDate.plusDays(1);
        	}
        	calList.add(new Calendar(monthName,dayList));
            
            start = start.plusMonths(1);
        }
        
        //마지막 해당 달 반복문은 따로 작성해주기
//    	monthName = today.getMonth().toString().substring(0,3);
    	monthName = start.getMonth().toString().substring(0,3);
    	ArrayList<HashMap<String,String>> dayList = new ArrayList<>();
    	LocalDate startDate =  today.withDayOfMonth(1);
    	
    	while(!startDate.equals(today.plusDays(1))) { //당월 당일까지 반복
    		
    		int level = 0;
    		int addPoint =0;
    		String date = startDate.toString() + " " + startDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.US).toString();
    		
    		HashMap<String, String> map = new HashMap<>();
    		
    		for (Attendance att : attList) { //해당 유저의 출석일 반복 (2년 전 데이터는 어떻게?)
    			
    			if(att.getAttDate().toLocalDate().toString().equals(startDate.toString())) {
    				
    				level = att.getAttLevel();
    				if(!att.getAttDate().toLocalDate().toString().equals(today.toString())) {
    					addPoint = att.getPrePoint();
    				}
    			}
    		}
    		
    		map.put("level", Integer.toString(level));
    		map.put("addPoint", Integer.toString(addPoint));
    		map.put("date", date);
    		
    		dayList.add(map);
    		
    		startDate = startDate.plusDays(1);
    	}
    	calList.add(new Calendar(monthName,dayList));
    	
		return calList;
	}
	
}
