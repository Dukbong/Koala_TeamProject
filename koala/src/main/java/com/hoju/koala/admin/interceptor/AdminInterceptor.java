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
		
		if(member == null) { // 로그인 회원도 아니고 관리자도 아니다. (부적절한 사용자)
			
			String ip = getClientIp.getClientIp(request);
			BlockIp result = adminService.selectBlockIpUser(ip);
			if(result == null) {
				int insertBlockIp = adminService.insertBlockIpUser(ip);
				if(insertBlockIp > 0) {					
					log.info("{} >> 새로운 부적절 사용자로 지정", ip);
				}
			}else {
				if(result.getCount() >= 5) {
					if(result.getStatus().equals('N')) {
						int block = adminService.blockBlockIpUser(ip);											
					}
					session.setAttribute("BlockUser", "--");
				}else {					
					int updateBlockIp = adminService.updateBlockIpUser(ip);
					log.info("{} >> 부적절 사용자 접근 횟수 증가", ip);
					System.out.println(result.getCount());
				}
			}
			session.setAttribute("alertMsg", "부적절한 접근자로 구분되었습니다.\n남은 경고횟수 : " + 1 + "회 입니다.");
//			return false;
			return true; // 테스트
			
		}
		if(member.getType() != 2) { // 로그인 회원이지만 관리자가 아니다. (경고)
			session.setAttribute("alertMsg", "관리자가 아니므로 접근이 불가능합니다.");
			response.sendRedirect("/koala");
//			return false; 
			return true; // 테스튼
		}else { // 관리자
			return true;
		}
	}
	
}
