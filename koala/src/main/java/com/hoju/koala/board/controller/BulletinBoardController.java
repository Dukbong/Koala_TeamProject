package com.hoju.koala.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hoju.koala.board.model.service.BulletinBoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.BulletinBoard;
import com.hoju.koala.board.model.vo.Liked;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/bulletinBoard")
public class BulletinBoardController {
	//글수정 글삭제 첨부파일 관한 문제
	//첨부파일 arraylist로 받아오는 문제
	//자동 객체 생성 문제
	//안녕
	
	@Autowired
	private BulletinBoardService bbService;
	
	//자유게시판 목록 페이지가기
	@RequestMapping("list")
	public String boardListPage(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model) {
		
		int listCount = bbService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> bbList = bbService.selectList(pi);

		model.addAttribute("pi",pi);
		model.addAttribute("bbList", bbList);
		return "board/freeBoard/boardListView";
	}
	
	//게시글 검색어로 검색 메소드
	@RequestMapping(value="search", method = RequestMethod.GET)
	public ModelAndView searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String types, String keyword, ModelAndView mv){
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("types",types);
		
		int searchCount = bbService.selectListCount(map);
		int boardLimit = 10;
		int pageLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> bbList = bbService.selectSearchList(map,pi);
		
		mv.addObject("pi",pi).addObject("bbList", bbList).addObject("keyword", keyword).addObject("types", types).setViewName("board/freeBoard/boardListView");
		
		return mv;
	}
	
	//게시판 상세 보기 페이지
	@RequestMapping("detail")
	public String  boardDetailView(int boardNo,Model model,HttpSession session) {
		
		int result = bbService.increaseCount(boardNo);
		
		if(result>0) {
			Board board = bbService.boardDetailView(boardNo);
			BulletinBoard bulletinBoard = bbService.boardCategoryDetailView(boardNo);
			ArrayList<Reply> rList = bbService.selectBoardReply(boardNo);
			
			model.addAttribute("b",board);
			model.addAttribute("bulletinBoard",bulletinBoard);
			model.addAttribute("rList",rList);
			
			if(session.getAttribute("loginUser")!=null) {
				int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
				Liked liked = Liked.builder().refUno(userNo).refBno(boardNo).build();
				int userDoLike = bbService.selectBoardLike(liked);
				model.addAttribute("userDoLike",userDoLike);
			}

			if(board.getFileNo()!=0) {
				ArrayList<BoardAttachment> baList = bbService.selectBoardAttachment(boardNo);
				model.addAttribute(baList);
			}
			
		}else {
			model.addAttribute("errorMsg","게시글을 불러오는데 실패했습니다.");
			return "common/error";
		}
		
		return "board/freeBoard/boardDetailView";
	}
	
	//게시글 댓글 달기 메소드
	@ResponseBody
 	@RequestMapping(value="reply",produces="application/json;charset=UTF-8")
 	public String insertReply(Reply reply,Model model) {
 		System.out.println(reply);
		
		int result = bbService.insertReply(reply);
		
		if(result>0) {
			return null;
		}else {
			model.addAttribute("errorMsg","게시글을 불러오는데 실패했습니다.");
			return "common/error";
		}
	}
	
	//좋아요 
	@ResponseBody
 	@RequestMapping(value="like",produces="application/json;charset=UTF-8")
 	public int Like(int boardNo,int select,int loginUser) {	

		Liked liked = Liked.builder().refUno(loginUser).refBno(boardNo).build();
		
		if(select==1) {
			int result = bbService.increaseLike(boardNo);
			int result2 = bbService.boardLike(liked);
		}else {
			int result = bbService.decreaseLike(boardNo);
			int result2 = bbService.boardDisLike(liked);
		}
		
		int count = bbService.countLike(boardNo);
	
		return count;
 	}
	
	//게시글 입력 메소드
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertBoard(@RequestParam("upfiles") MultipartFile[] files, Model model,Board b,String subContent, HttpSession session) {
		String pattern = "<img.*?>";
		String content = subContent.replaceAll(pattern, "&^*&");
		System.out.println(content);
		for(int i=0; i<files.length; i++) {
			if(!files[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(files[i],session);
				String originName = (files[i]).getOriginalFilename();
				String savePath = session.getServletContext().getRealPath("/resources/board/bulletinBoard");
				BoardAttachment ba = BoardAttachment.builder().originName(originName).changeName(changeName).refBno(b.getBoardNo()).fileLevel(i).filePath(savePath).build();
				System.out.println(ba);
//				int result = bbService.insertBoardAttachment(ba);
//				
//				if(result<=0) {
//					new File(session.getServletContext().getRealPath(ba.getFilePath())).delete();
//					model.addAttribute("errorMsg","첨부파일 저장 실패");
//					return "common/errorPage";
//				}
			}
		}
//		
//		b.builder().boardWriter(String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo())).build();
//		int result = bbService.insertBoard(b);
//		BulletinBoard bulletinBoard = BulletinBoard.builder().boardNo(b.getBoardNo()).boardType(category).build();
//		int result2 = bbService.insertBoardCategory(bulletinBoard);
//		
//		if(result*result2!=0) {
//			model.addAttribute("alertMsg","게시글 작성 성공");
//			return "redirect:bulletinboard.bo";
//		}else {
//			model.addAttribute("errorMsg","게시글 작성 실패");
//			return "common/errorPage";
//		}
		return null;
	}
		
	//글쓰기 페이지
	@RequestMapping("enroll")
	public String enrollBoardPage(Model model) {
		return "../views/board/freeBoard/boardEnrollForm";
	}
	
	//글 수정 페이지
	@RequestMapping("update")
	public String updateBoardPage(int boardNo,Model model) {
		
		Board b = bbService.selectBoard(boardNo);
		model.addAttribute(b);
		return "../views/board/freeBoard/boardUpdateForm";
	}
	
	//글 삭제 메소드
	@RequestMapping("delete")
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
	@RequestMapping(value="updatereply",produces="application/json;charset=UTF-8")
 	public String deleteAndUpdateReply(Reply reply, int select,Model model) {
		
		int result = 0;
		
		if(select == 1) {
			int replyNo = reply.getReplyNo();
			result = bbService.deleteReply(replyNo);
		}else {
			result = bbService.updateReply(reply);
		}
		
		if(result>0) {
			return null;
		}else {
			model.addAttribute("errorMsg","게시글을 불러오는데 실패했습니다.");
			return "common/error";
		}
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
