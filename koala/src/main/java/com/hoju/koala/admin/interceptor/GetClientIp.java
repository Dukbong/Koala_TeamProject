package com.hoju.koala.admin.interceptor;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class GetClientIp {
	public String getClientIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
	    log.info("> X-FORWARDED-FOR : " + ip);

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        log.info("> Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        log.info(">  WL-Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        log.info("> HTTP_CLIENT_IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        log.info("> HTTP_X_FORWARDED_FOR : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        log.info("> getRemoteAddr : "+ip);
	    }
	    if (ip.equals("0:0:0:0:0:0:0:1") || ip.equals("127.0.0.1")) {
	    	InetAddress address;
			try {
				address = InetAddress.getLocalHost();
				ip = address.getHostName() + "/" + address.getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
	    }
	    log.info("> Result : IP Address : "+ip);

	    return ip;
	}
}
