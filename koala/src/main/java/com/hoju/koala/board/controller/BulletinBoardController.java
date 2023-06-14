package com.hoju.koala.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hoju.koala.board.model.service.BulletinBoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.ErrorSet;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/BulletinBoard")
public class BulletinBoardController {

	@Autowired
	private Board board;
	@Autowired
	private BulletinBoardService bbService;
	
	
	//자유게시판 목록 페이지가기
	@RequestMapping("bulletinboard.bo")
	public String boardListPage(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model) {
		
		int listCount = bbService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Paging.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ErrorSet> bbList = bbService.selectList(pi);
		
		
		model.addAttribute("bbList", bbList);
		return "../views/board/freeBoard/boardListView";
	}
	
	//게시판 상세 보기 페이지
	@RequestMapping()
	public String  boardDetailView(int bno,Model model) {
		
		board = bbService.boardDetailView(bno);
		model.addAttribute("board",board);
		
		return null;
	}
	
	//게시글 입력 메소드
	public String insertBoard(Model model,Board b,BoardAttachment ba, MultipartFile upfile,HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile,session);
			String originName = upfile.getOriginalFilename();
			ba.setOriginName(originName);
			ba.setChangeName("resources/board/"+changeName);
		}
		
		int result = bbService.insertBoard(b);
		if(result>0) {
			model.addAttribute("alertMsg","게시글 작성 성공");
			return "redirect:bulletinboard.bo";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
		
	//글쓰기 페이지
	@RequestMapping()
	public String enrollBoardPage(Board b, Model model) {
		return null;
	}
	
	//글 수정 페이지
	@RequestMapping()
	public String updateBoardPage() {
		return null;
	}
	
	//글 삭제 메소드
	@RequestMapping()
	public String deleteBoard() {
		return null;
	}
	
	public String saveFile(MultipartFile upfile,HttpSession session) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random()*90000+10000); //5자리 랜덤값
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
}
