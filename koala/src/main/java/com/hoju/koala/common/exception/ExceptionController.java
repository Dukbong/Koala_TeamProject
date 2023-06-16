package com.hoju.koala.common.exception;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.server.MethodNotAllowedException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {

	//404 오류
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView error404Handler(HttpServletRequest request,
										NoHandlerFoundException ex) {
		
		//@ExceptionHandler 어노테이션은 매개변수로 ModelAndview를 지원하지 않는다고 함.
		ModelAndView mv = new ModelAndView();
		String[] types = {"admin", "member", "errorboard", "qna", "free"}; // 이건 각자 알아서 들....
		List<String> typesList = new ArrayList<>(Arrays.asList(types)); // 그냥 심심하니깐 배열을 list로 바꾸고
		String type = request.getServletPath().substring(1).split("/")[0]; // root를 제외한 가장 첫 url
		if(typesList.contains(type)) {
			// 여기서 어디로 돌아갈지 결정
		}else {
			// 여기는 무지성 오류
		}
		
		mv.addObject("errorMsg", ex.getMessage());
		mv.addObject("url", request.getRequestURL());
		mv.setViewName("common/error");
		
		return mv;
	}
	
	
	//500 오류
	@ExceptionHandler(HttpServerErrorException.class)
	public ModelAndView error500Handler(HttpServletRequest request,
										HttpServerErrorException ex) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("errorMsg", ex.getMessage());
		mv.addObject("url", request.getRequestURL());
		mv.setViewName("common/error");
		
		return mv;
	}
	
	
//	
//	//400 오류 살짝 변경
//	@ExceptionHandler(NoHandlerFoundException.class)
//	public ModelAndView error404Handlers(HttpServletRequest request,
//										NoHandlerFoundException ex) {
//		
//		//@ExceptionHandler 어노테이션은 매개변수로 ModelAndview를 지원하지 않는다고 함.
//		ModelAndView mv = new ModelAndView();
//		String url = request.getRequestURL().toString();
//		System.out.println(url);
//		mv.addObject("errorMsg", ex.getMessage());
//		mv.addObject("url", request.getRequestURL());
//		mv.setViewName("common/error");
//		
//		return mv;
//	}
}
