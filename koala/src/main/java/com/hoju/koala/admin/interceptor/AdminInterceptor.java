package com.hoju.koala.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.BlockIp;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	GetClientIp getClientIp;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member == null) {
			String ip = getClientIp.getClientIp(request);
			BlockIp result = adminService.selectBlockIpUser(ip);
			if(result == null) {
				int insertBlockIp = adminService.insertBlockIpUser(ip);
				if(insertBlockIp > 0) {					
					log.info("New Block List >>> {}", ip);
				}
			}else {
				if(result.getCount() >= 5) {
					if(result.getStatus().equals("N")) {
						@SuppressWarnings("unused")
						int block = adminService.blockBlockIpUser(ip);											
					}
					session.setAttribute("BlockUser", "--");
				}else {					
					@SuppressWarnings("unused")
					int updateBlockIp = adminService.updateBlockIpUser(ip);
					log.info("Existing Block List Count++  >>> {}", ip);
				}
			}
			session.setAttribute("alertMsg", "현재 " + (5 - result.getCount()) + "번 후 IP가 차단됩니다.");
//			return false;
			return true; // TEST
		}
		if(member.getType() != 2) { // 회원이지만 관리자 x 
			session.setAttribute("alertMsg", "관리자 외에는 접근이 불가능합니다.");
			response.sendRedirect("/koala");
//			return false; 
			return true; // TEST
		}else { // 관리자
			return true;
		}
	}
	
}
