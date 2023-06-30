package com.hoju.koala.member.calendar;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.hoju.koala.member.model.vo.Attendance;
import com.hoju.koala.member.model.vo.Calendar;

import lombok.extern.slf4j.Slf4j;

//맞나?
@Component
@Slf4j
public class CalendarController {
	
	public ArrayList<Calendar> selectCalendar(ArrayList<Attendance> attList){
		
		LocalDate today = LocalDate.now();
		LocalDate start = (today.minusMonths(11)).withDayOfMonth(1);
		
		String monthName = "";
		ArrayList<Calendar> calList = new ArrayList<>();
        
        while(!start.getMonth().equals(today.getMonth())){ //달마다 반복

        	monthName = start.getMonth().toString();
        	List<Integer> levelList = new ArrayList<>();
        	
        	LocalDate startDate =  start.withDayOfMonth(1);
        	LocalDate endDate = start.withDayOfMonth(start.lengthOfMonth());
        	
        	while(!startDate.equals(endDate.plusDays(1))) { //해당 월 일수만큼 반복
        		
        		int level = 0;
        		
        		for (Attendance att : attList) { //해당 유저의 출석일 반복 (2년 전 데이터는 어떻게?)
        			
        			if(att.getAttDate().toLocalDate().toString().equals(startDate.toString())) {
        				level = att.getAttLevel();
        			}
        		}
        		
    			levelList.add(level);
        		
        		startDate = startDate.plusDays(1);
        	}
        	calList.add(new Calendar(monthName,levelList));
            
            start = start.plusMonths(1);
        }
        
        //마지막 해당 달 반복문은 따로 작성해주기
    	monthName = today.getMonth().toString();
    	
    	List<Integer> levelList = new ArrayList<>();
    	LocalDate startDate =  today.withDayOfMonth(1);
    	
    	while(!startDate.equals(today.plusDays(1))) { //당월 당일까지 반복
    		
    		int level = 0;
    		for (Attendance att : attList) { //해당 유저의 출석일 반복 (2년 전 데이터는 어떻게?)
    			
    			if(att.getAttDate().toLocalDate().toString().equals(startDate.toString())) {
    				level = att.getAttLevel();
    			}
    		}
			levelList.add(level);
    		startDate = startDate.plusDays(1);
    	}
    	calList.add(new Calendar(monthName,levelList));
    	
    	System.out.println("calList : "+calList);
    	
    	
		return calList;
	}
	
	

}
