package com.hoju.koala.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.Client;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.member.model.vo.Member;

@Component
public class SupporterInterceptor  extends HandlerInterceptorAdapter {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	Client client;

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		try {
			Supporters support = adminService.selectOneSupport(member.getUserNo()); // 여기 된다는 거 자체가 null이 아니라는 뜻.
			if(support.getGithubId().equals(" "))
				session.setAttribute("msgc", "서포트즈 초대");
		}catch(NullPointerException e) {
			return;
		}
	}
}
