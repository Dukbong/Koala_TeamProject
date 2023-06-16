package com.hoju.koala.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/multi")
public class MultiQuiz {
	
	@GetMapping("/play")
	public String multiPlay() {
		return "admin/multiPlay";
	}
}
