package com.hoju.koala.common.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {

	//400 오류
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView error404Handler(HttpServletRequest request,
										NoHandlerFoundException ex) {
		
		//@ExceptionHandler 어노테이션은 매개변수로 ModelAndview를 지원하지 않는다고 함.
		ModelAndView mv = new ModelAndView();
		
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
}
