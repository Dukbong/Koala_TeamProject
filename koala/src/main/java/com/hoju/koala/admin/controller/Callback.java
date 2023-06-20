package com.hoju.koala.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hoju.koala.admin.model.service.AdminService;
import com.hoju.koala.admin.model.vo.Client;
import com.hoju.koala.admin.model.vo.Supporters;
import com.hoju.koala.member.model.vo.Member;

@Controller
public class Callback {
	
	
	// 특정 repo의 커밋 기록을 보는 방법은 
	// https://api.github.com/repos/[user_name]/[repo_name]/commits >> 공공 데이터와 같다.
	// repos_url":"https://api.github.com/users/Dukbong/repos"
	
	@Autowired
	Client client;
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/callback")
	public String callback(String code, Model model, HttpServletRequest request) {
		client.code(code);
		String accessToken = getAccessToken(code);
		JsonObject userInfo = getUserInfo(accessToken);
		
		HttpSession session = request.getSession();
		// 해당 UserNo와 받아온 GitHub_Id를 이용해서 Supporters 테이블에 Insert 해준다.
		int loginUserNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String githubId = "";
		String repoUrl = "";
		Supporters supporter = null;
		try {
			githubId = getUserId(userInfo);
			repoUrl = getRepoUrl(userInfo);
			supporter = Supporters.builder().githubId(githubId).refUno(loginUserNo).repoUrl(repoUrl).build();
			adminService.insertSupporterGithubId(supporter);
		}catch(Exception e) {
			
		}
		model.addAttribute("git", userInfo);
		session.removeAttribute("msgc");
		session.setAttribute("msg", "서포터즈가 되신 걸 환영 합니다.");
		return "redirect:/";
	}
	
	private String getAccessToken(String code) {
		// post 요청 코드
		HttpPost post = new HttpPost("https://github.com/login/oauth/access_token");
		NameValuePair nvp = null;
		String beginToken = "";
		String endToken = "";
		System.out.println(client);
		ArrayList<NameValuePair> list = new ArrayList<>();
		list.add(new BasicNameValuePair("client_id", client.getClientId()));
		list.add(new BasicNameValuePair("client_secret", client.getClientSecret()));
		list.add(new BasicNameValuePair("code", client.getCode()));
		try {
			post.setEntity(new UrlEncodedFormEntity(list));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// access Token 가져오기
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpResponse response = httpClient.execute(post);
			HttpEntity entity = response.getEntity();
			beginToken = EntityUtils.toString(entity);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		endToken = beginToken.substring(beginToken.indexOf("=")+1,beginToken.indexOf("&"));
		return endToken;
	}
	
	private JsonObject getUserInfo(String accessToken) {
		// Get요청
		HttpGet get = new HttpGet("https://api.github.com/user");
		String beginUserInfo = "";
		JsonObject EndUserInfo = null;
		get.addHeader("Authorization", "Bearer " + accessToken);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpResponse response = httpClient.execute(get);
			HttpEntity entity = response.getEntity();
			beginUserInfo = EntityUtils.toString(entity);
			// 문자열로 넘어오기 때문에 Json 처리해준다.
			EndUserInfo = new Gson().fromJson(beginUserInfo, JsonObject.class);
		
			/*
			 * 여기서 하고 싶은거
			 * 1. 아이디(login) 받아서 저장 시키기
			 * 2. repos_url와 아이디(login) 받아서 커밋 내역을 확인하여 날짜 순서대로 DB에 저장시키기. >> 새로운 잔디를 만들기 위함
			 * 3. 사진을 가지고 오기.
			 * */		
			
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EndUserInfo;
	}
	
	private String getUserId(JsonObject userInfo) {
		return userInfo.get("login").getAsString();
	}
	private String getRepoUrl(JsonObject userInfo) {
		return userInfo.get("repos_url").getAsString();
	}
}
