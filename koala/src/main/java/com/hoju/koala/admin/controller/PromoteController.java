package com.hoju.koala.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.Client;


@Controller
@RequestMapping("/promote")
public class PromoteController {
	
	@Autowired
	Client client;
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/promote.waiting")
	@ResponseBody
	public String promoteWait(int client_No) {
		int result = adminService.InsertSupporters(client_No);
		return String.valueOf(result);
	}

	@GetMapping("/promote.cancel")
	@ResponseBody
	public String promoteCancel(int client_No) {
		int result = adminService.deleteSupporters(client_No);
		return String.valueOf(result);
	}

	@GetMapping("/promote.approve")
	@ResponseBody
	public String promoteApprove(String scope) {
//		HttpGet get = new HttpGet("https://github.com/login/oauth/authorize");
//		ArrayList<NameValuePair> list = new ArrayList<>();
//		list.add(new BasicNameValuePair("client_id", client.getClientId()));
//		list.add(new BasicNameValuePair("scope", scope));
//		CloseableHttpClient httpClient = HttpClients.createDefault();
//		try {
//			HttpResponse response = httpClient.execute(get);
//			HttpEntity entity = response.getEntity();
//			String test = EntityUtils.toString(entity);
//		} catch (ClientProtocolException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return client.getClientId();
	}
}
