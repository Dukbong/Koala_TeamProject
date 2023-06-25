package com.hoju.koala.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hoju.koala.member.model.vo.Member;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		//리턴값 true로 초기화
		boolean accept = true;
		
		//로그인유저가 세션에 안담겨있으면 ->로그인이 안되어있으면
		if(loginUser != null) {
			accept = false;
		}
		
		return accept;
	}
	
	
}
