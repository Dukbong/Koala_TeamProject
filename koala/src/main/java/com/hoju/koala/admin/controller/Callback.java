package com.hoju.koala.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hoju.koala.admin.model.vo.Client;

@Controller
public class Callback {
	
	@Autowired
	Client client;
	
	@GetMapping("/callback")
	public String callback(String code, Model model) {
		client.setCode(code);
		model.addAttribute("github", client);
		return "common/testing";
	}
}
