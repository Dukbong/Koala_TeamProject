package com.hoju.koala.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		ArrayList<Board> nbList = bbService.selectNoticeList();
		
		model.addAttribute("pi",pi);
		model.addAttribute("nbList",nbList);
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
	public String insertBoard(@RequestParam("upfiles") MultipartFile[] files, Model model,Board b,String subContent,HttpSession session) {
		ArrayList<String> list = new ArrayList<>();
		ArrayList<BoardAttachment> aList = new ArrayList<>();
		int result = 1;
		
		for(int i=0; i<files.length; i++) {
			if(!files[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(files[i],session);
				String originName = (files[i]).getOriginalFilename();
				String savePath = session.getServletContext().getRealPath("/resources/board/bulletinBoard");
				BoardAttachment ba = BoardAttachment.builder().refBno(b.getBoardNo()).originName(originName).changeName(changeName).fileLevel(i+1).filePath(savePath).build();
				
				String replacement = "src='/koala/resources/board/bulletinBoard/" + changeName + "\'";
	            list.add(replacement);
	            aList.add(ba);
			}
		}
		
		String pattern = "src=\"([^\\\"]*)\""; 
		String content = subContent;
		
		if(!list.isEmpty()) {
			for (String replacement : list) {
				content = content.replaceFirst(pattern, replacement);
			}
		}
		
		b.setCategory("B");
		b.setContent(content);
		BulletinBoard bulletinBoard = null;
		
		if(b.getContentCode().equals("")||b.getContentCode()==null) {
			b.setContentCode("비어있습니다.");
		}
		
		if(b.getNotice()==null) {
			b.setNotice("N");
		}
		
		int result2 = bbService.insertBoard(b);
		int boardNo = bbService.selectBoardNo();
		if(b.getContentCode().equals("비어있습니다.")) {
			bulletinBoard = BulletinBoard.builder().boardNo(boardNo).boardType(2).build();
		}else {
			bulletinBoard = BulletinBoard.builder().boardNo(boardNo).boardType(1).build();
		}
		int result3 = bbService.insertBoardCategory(bulletinBoard);
		
		if(result2*result3!=0) {
			for(BoardAttachment ba: aList) {
				ba.setRefBno(boardNo);
				result = bbService.insertBoardAttachment(ba);
				if(result!=1) {
					if(new File(session.getServletContext().getRealPath(ba.getChangeName())).delete()){
						System.out.println("파일이 성공적으로 삭제되었습니다.");
					}else {
						System.out.println("파일 삭제에 실패했습니다.");
					}
					model.addAttribute("errorMsg","첨부파일 저장 실패");
					return "common/errorPage";
				}
			}
			model.addAttribute("alertMsg","게시글 작성 성공");
			return "redirect:/bulletinBoard/list";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
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
		model.addAttribute("b",b);
		
		if(b.getFileNo()!=0) {
			ArrayList<BoardAttachment> baList = bbService.selectBoardAttachment(boardNo);
			model.addAttribute("baList",baList);
		}
		return "../views/board/freeBoard/boardUpdateForm";
	}
	
	//글 수정 메소드
	@RequestMapping(value = "updateboard", method = RequestMethod.POST)
	public String updateBoard(@RequestParam("upfiles") MultipartFile[] files,Board b,String[] filePath, String[] existedFiles,String subContent,int[] fileNos, Model model,HttpSession session) {
		//filelevel 처리하기
		int result = 1;
		int result2 = 1;
		ArrayList<String> list = new ArrayList<>();
		ArrayList<BoardAttachment> baList = new ArrayList<>();
		for(MultipartFile file: files) {
			if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file,session);
				String originName = (file).getOriginalFilename();
				String savePath = session.getServletContext().getRealPath("/resources/board/bulletinBoard");
				BoardAttachment ba = BoardAttachment.builder().refBno(b.getBoardNo()).originName(originName).changeName(changeName).filePath(savePath).build();
				baList.add(ba);
				String replacement = "src='/koala/resources/board/bulletinBoard/" + changeName + "\'";
	            list.add(replacement);
			}
		}
		String pattern = "src=\"(?!\\/koala\\/)[^\"]*\""; 
		String content = subContent;
		
		if(!list.isEmpty()) {
			for (String replacement : list) {
				content = content.replaceFirst(pattern, replacement);
			}
		}
		
		if(existedFiles!=null) {
			for(int i = 0; i<existedFiles.length; i++) {
				if(!subContent.contains(existedFiles[i])) {
					if(new File(filePath[i]+"/"+existedFiles[i]).delete()) {
						System.out.println("파일이 성공적으로 삭제되었습니다.");
					}else {
						System.out.println("파일 삭제에 실패했습니다.");
					}
					result = bbService.deleteAttachment(existedFiles[i]);
				}
			}
		}
		if(!baList.isEmpty()) {
			for(BoardAttachment ba: baList) {
				result2 = bbService.insertBoardAttachment(ba);
			}
		}
		
		b.setContent(content);
		int result3 = 0;
		
		if(result*result2!=0) {
			result3 = bbService.updateBoard(b);
			if(result2==0) {
				model.addAttribute("errorMsg","게시글 작성 실패");
				return "common/errorPage";
			}else {
				model.addAttribute("alertMsg","게시글 작성 성공");
				return "redirect:/bulletinBoard/detail?boardNo="+b.getBoardNo();
			}
		}else {
			model.addAttribute("errorMsg","첨부파일 저장 실패");
			return "common/errorPage";
		}
	}
	
	//글 삭제 메소드
	@RequestMapping("delete")
	public String deleteBoard(int boardNo, HttpSession session, Model model) {
		
 		int result = bbService.deleteBoard(boardNo);
 		ArrayList<BoardAttachment> baList = bbService.selectBoardAttachment(boardNo);
 		if(result>0) {
 			if(!baList.isEmpty()) {
 				for(BoardAttachment ba:baList) {
 					System.out.println(ba);
 					String existedFiles = ba.getChangeName();
 					int result2 = bbService.deleteAttachment(existedFiles);
 					//스케줄러가 처리
// 					new File(session.getServletContext().getRealPath(ba.getFilePath())+"/"+ba.getChangeName()).delete();
// 					String filePaths = (ba.getFilePath())+"/"+ba.getChangeName();
// 					File file = new File(filePaths);
// 					if (file.delete()) {
// 			            System.out.println("파일이 성공적으로 삭제되었습니다.");
// 			        } else {
// 			            System.out.println("파일 삭제에 실패했습니다.");
// 			        }
 				}
 			}
 			model.addAttribute("alertMsg", "게시글 삭제 완료");
 			return "redirect:/bulletinBoard/list";
 		}else {
 			model.addAttribute("errorMsg", "게시글 삭제 실패");
 			return "common.errorPage";
 		}
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
			upfile.transferTo(new File(savePath+"/"+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
}
