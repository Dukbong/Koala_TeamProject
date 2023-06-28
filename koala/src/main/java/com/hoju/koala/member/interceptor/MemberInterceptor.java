package com.hoju.koala.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hoju.koala.member.model.vo.Member;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		
		//로그인유저가 세션에 안담겨있으면 ->로그인이 안되어있으면
		if(loginUser == null) {
			System.out.println("member 인터셉터 발동!");
			
			request.getSession().setAttribute("msg", "로그인이 필요한 페이지입니다.");
			
			response.sendRedirect("/koala/member/login");
			return false;
		}
		
		System.out.println("인터셉터 통과");
		return true;
	}
	
	
	
	
}
