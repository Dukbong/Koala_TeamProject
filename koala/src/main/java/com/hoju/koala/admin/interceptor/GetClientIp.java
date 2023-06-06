package com.hoju.koala.admin.interceptor;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
public class GetClientIp {
	public String getClientIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
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
	    return ip;
	}
}
