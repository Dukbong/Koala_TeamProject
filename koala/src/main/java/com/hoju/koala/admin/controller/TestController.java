package com.hoju.koala.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/together")
public class TestController {
	/*
	 * https://api.github.com/users/Dukbong/repos
	 * > repo 내역을 java단에게 list에 담는다.
	 * 객체 : repo이름 / 생성일 / 마지막 업데이트 일 / 마지막 푸시 일
	 * 
	 *  1. 게시판을 만든다.
	 *  2. 작은 깃허브를 만들꺼다.
	 * */
	
	// Supporters 게시판에서 
	
	@GetMapping("/ssss")
	public String qqqq() {
		return "fun/onePage";
	}
}