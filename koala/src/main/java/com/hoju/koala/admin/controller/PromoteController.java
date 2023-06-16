package com.hoju.koala.admin.controller;

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
		return client.getClientId();
	}
}
