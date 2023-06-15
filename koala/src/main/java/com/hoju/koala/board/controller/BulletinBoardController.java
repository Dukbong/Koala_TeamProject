package com.hoju.koala.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hoju.koala.board.model.service.BulletinBoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/BulletinBoard")
public class BulletinBoardController {
	//글수정 글삭제 첨부파일 관한 문제
	//첨부파일 arraylist로 받아오는 문제
	//자동 객체 생성 문제
	//안녕
	@Autowired
	private Board board;
	@Autowired
	private BulletinBoard bulletinBoard;
	@Autowired
	private BoardAttachment boardAttachment;
	@Autowired
	private BulletinBoardService bbService;
	
	//자유게시판 목록 페이지가기
	@RequestMapping("bulletinboard.bo")
	public String boardListPage(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model) {
		
		int listCount = bbService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Paging.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> bbList = bbService.selectList(pi);
		
		
		model.addAttribute("bbList", bbList);
		return "../views/board/freeBoard/boardListView";
	}
	
	//게시글 검색어로 검색 메소드
	@RequestMapping()
	public ModelAndView searchList(int currentPage, String keyword,String status, ModelAndView mv){
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("status",status);
		
		int searchCount = bbService.selectListCount(map);
		int boardLimit = 5;
		int pageLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = bbService.selectSearchList(map,pi);
		
		mv.addObject("pi",pi).addObject("list", list).addObject("keyword", keyword).addObject("status", status).setViewName("");
		
		return mv;
	}
	
	//게시판 상세 보기 페이지
	@RequestMapping()
	public String  boardDetailView(int boardNo,Model model) {
		
		int result = bbService.increaseCount(boardNo);
		
		if(result>0) {
			board = bbService.boardDetailView(boardNo);
			bulletinBoard = bbService.boardCategoryDetailView(boardNo);
			ArrayList<Reply> rList = bbService.selectBoardReply(boardNo);
			model.addAttribute("board",board);
			model.addAttribute("bulletinBoard",bulletinBoard);
			model.addAttribute("rList",rList);
			
			ArrayList<BoardAttachment> baList = bbService.selectBoardAttachment(boardNo);
			
			if(baList.isEmpty()) {
				model.addAttribute(baList);
			}
			
		}else {
			model.addAttribute("errorMsg","게시글을 불러오는데 실패했습니다.");
		}
		
		return null;
	}
	
	//게시글 댓글 달기 메소드
	@ResponseBody
 	@RequestMapping(value="",produces="application/json;charset=UTF-8")
 	public String insertReply(int boardNo,Reply reply, HttpSession session) {
 		
		String userNo = String.valueOf(((Member)(session.getAttribute("loginUser"))).getUserNo());
		reply.builder().refBno(boardNo).replyWriter(userNo).build();
		
		int result = bbService.insertReply(reply);
		
		if(result>0) {
			ArrayList<Reply> rList = bbService.selectBoardReply(boardNo);
			return new Gson().toJson(rList);
		}else {
			return null;
		}
	}
	
	//좋아요 
	@ResponseBody
 	@RequestMapping(value="",produces="application/json;charset=UTF-8")
 	public int Like(int boardNo,int select) {
 		
		if(select==1) {
			bbService.increaseLike(boardNo);
		}else {
			bbService.decreaseLike(boardNo);
		}
		
		int count = bbService.countLike(boardNo);
		
		return count;
 	}
	
	//게시글 입력 메소드
	public String insertBoard(int category, Model model,Board b,BoardAttachment ba,ArrayList<MultipartFile> upfiles,HttpSession session) {
		
		for(int i=0; i<upfiles.size(); i++) {
			if(!upfiles.get(i).getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfiles.get(i),session);
				String originName = (upfiles.get(i)).getOriginalFilename();
				String savePath = session.getServletContext().getRealPath("/resources/board/bulletinBoard");
				ba.builder().originName(originName).changeName(changeName).refBno(b.getBoardNo()).fileLevel(i).filePath(savePath).build();
				int result = bbService.insertBoardAttachment(ba);
				
				if(result<=0) {
					model.addAttribute("errorMsg","첨부파일 저장 실패");
					return "common/errorPage";
				}
			}
		}
		
		b.builder().boardWriter(String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo())).build();
		int result = bbService.insertBoard(b);
		bulletinBoard.builder().boardNo(b.getBoardNo()).boardType(category).build();
		int result2 = bbService.insertBoardCategory(bulletinBoard);
		
		if(result*result2!=0) {
			model.addAttribute("alertMsg","게시글 작성 성공");
			return "redirect:bulletinboard.bo";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
		
	//글쓰기 페이지
	@RequestMapping()
	public String enrollBoardPage(Model model) {
		return null;
	}
	
	//글 수정 페이지
	@RequestMapping()
	public String updateBoardPage(int boardNo,Model model) {
		
		Board b = bbService.selectBoard(boardNo);
		model.addAttribute(b);
		return null;
	}
	
	//글 삭제 메소드
	@RequestMapping()
	public ModelAndView deleteBoard(int boardNo,String filePath, HttpSession session,ModelAndView mv) {
		
		//삭제대해서 물어보기
 		int result = bbService.deleteBoard(boardNo);
 		
 		if(result>0) {
 			if(!filePath.equals("")) {//넘어온 파일정보가 있을때
 				new File(session.getServletContext().getRealPath(filePath)).delete();
 			}
 			session.setAttribute("alertMsg", "게시글 삭제 완료");
 			mv.setViewName("redirect:bulletinboard.bo");
 		}else {
 			mv.addObject("errorMsg","게시글 삭제 실패").setViewName("common.errorPage");
 		}
 		return mv;
	}
	
	//댓글 삭제 수정 메소드
	@ResponseBody
	@RequestMapping(value="",produces="application/json;charset=UTF-8")
 	public String deleteAndUpdateReply(int boardNo, Reply reply, int select) {
		
		int result = 0;
		
		if(select == 1) {
			int replyNo = reply.getReplyNo();
			result = bbService.deleteReply(replyNo);
		}else {
			result = bbService.updateReply(reply);
		}
		
		ArrayList<Reply> rList = bbService.selectBoardReply(boardNo);
		return new Gson().toJson(rList);
	}
	
	//파일 이름 바꾸는 메소드
	public String saveFile(MultipartFile upfile,HttpSession session) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random()*90000+10000); //5자리 랜덤값
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/board/bulletinBoard");
		
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
