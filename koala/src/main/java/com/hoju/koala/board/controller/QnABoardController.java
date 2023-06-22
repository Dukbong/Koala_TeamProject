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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hoju.koala.board.model.service.QnABoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;
import com.hoju.koala.board.model.vo.Reply;
import com.hoju.koala.common.model.vo.PageInfo;
import com.hoju.koala.common.template.Paging;
import com.hoju.koala.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qnaBoard")
public class QnABoardController {
	
	//private static final Logger logger = LoggerFactory.getLogger(QnABoardController.class);
	@Autowired
	private QnABoardService qnaService;

	//qna게시글 리스트 이동
	@GetMapping("/list")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							@RequestParam(value="boardNo", defaultValue="0") Integer boardNo,
																					Model model) {
		
		//qna게시글 목록 조회
		int listCount = qnaService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
		ArrayList<Board> list = qnaService.selectList(pi);

		int replyCount = qnaService.replyCount(boardNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("replyCount",replyCount);
		return "board/qnaBoard/qnaBoardList";
	}
	
	//qna게시글 상세 조회
	@GetMapping("/detail")
	public ModelAndView selectBoard(int boardNo,
									ModelAndView mv) {
		
		int result = qnaService.increateCount(boardNo);
		if(result>0) {
			Board b = qnaService.selectBoard(boardNo);
//			ArrayList<BoardAttachment> at = qnaService.selectAttachment(boardNo);

//			mv.addObject("at",at);
			mv.addObject("b",b).setViewName("board/qnaBoard/qnaBoardDetail");
		}else {
			mv.addObject("errorMsg","게시글 조회실패").setViewName("common/error");
		}
		
		return mv;
	}
	
	//qna 게시글 검색
	@GetMapping("/search")
	public ModelAndView searchBoard(@RequestParam(value="currentPage", defaultValue="1")
									int currentPage,
									String types,
									String keyword,
									
									ModelAndView mv) {
		
		HashMap<String, String> searchInfo = new HashMap<>();
		searchInfo.put("keyword", keyword);
		searchInfo.put("types",types);

//		System.out.println("searchQna: " + searchQna);
//		System.out.println("keyword: " + keyword);
//		System.out.println("currentPage: " + currentPage);
//		log.info("=============="+searchInfo.toString());
		int searchCount = qnaService.selectBoardCount(searchInfo);
		System.out.println("몇개가 들어가는지? : "+searchCount);
//		int currentP = Integer.parseInt(currentPage);
//		System.out.println(currentP);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Paging.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = qnaService.selectBoardList(searchInfo,pi);
//		for(Board b : list) {
//			System.out.println(b);
//		}
		mv.addObject("list",list).setViewName("board/qnaBoard/qnaBoardList");
	
		return mv;
	}
	
	//글쓰기 페이지 이동
	@GetMapping("enrollForm")
	public String enrollForm() {
		return "board/qnaBoard/qnaBoardEnrollForm";
	}
	
	//글 작성 
	@RequestMapping("insert")
	public ModelAndView insertBoard(BoardAttachment at,
									Board b,
									ModelAndView mv,
									MultipartFile upFile,
									HttpSession session) {
		
		int result;
//		Member m = (Member)session.getAttribute("loginUser");
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		b.setBoardWriter(userNo);
		b.setTitle(b.getTitle());
		b.setContent(b.getContent());
		System.out.println("====================");
		
		//게시글 작성자 설정
//		if(!b.getNotice().equals("Y")) {
			if(upFile!=null && !upFile.getOriginalFilename().equals("")) {
				String changeName = saveFile(upFile,session);
				at.setOriginName(upFile.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/"+changeName);
				result = qnaService.insertBoardFile(at);//파일 첨부 있을 때
			}else {
				result = qnaService.insertBoard(b);//그냥 글만 있을 때
				System.out.println(b);
			}
////		}else {
//			if(m.getUserId().equals("admin")) {
//				result = qnaService.insertNotice(b);//어드민만 쓸 수 있게				
//			}else {
//				mv.addObject("errorMsg", "공지 게시글은 운영자만 작성 가능합니다.").setViewName("common/error");
//				return mv;
//			}
////		}
		
		
		
		if(result>0) {
			mv.addObject("alertMsg","정상적으로 등록되었습니다.").setViewName("redirect:list");
		}else {
			mv.addObject("errorMSg","등록 실패하였습니다.").setViewName("common/error");
		}
		
		return mv;
	}
	

	//파일 업로드
	public String saveFile(MultipartFile upFile,
						   HttpSession session) {
		
		String originName = upFile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ran = (int)(Math.random()*90000+10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ran+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		try {
			upFile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return changeName;

	}
	
	//댓글 조회
	@ResponseBody
	@RequestMapping(value="selectReply.bo", produces="application/json; charset=UTF-8")
	public String selectReply(int boardNo) {
		
//		System.out.println(boardNo);
		ArrayList<Reply> list = qnaService.selectReply(boardNo);
//		System.out.println("--------------");
//
//		if(list!=null) {
//			for(Reply r : list) {
//				System.out.println(r);
//			}
//		}else {
//			System.out.println("댓글 리스트 비어있음");
//		}
		return new Gson().toJson(list);
	}
	
	//댓글 삽입
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public String insertReply(Reply r) {
		
		int result = qnaService.insertReply(r);
		
		return (result>0)? "success" : "fail";
	}
	
	//게시글 추천
	@ResponseBody
	@RequestMapping(value="updateLike", method=RequestMethod.POST)
	public int updateLike(@RequestParam("boardNo") int boardNo, 
						  @RequestParam("userNo") int userNo, 
						  @RequestParam("boardWriter") String boardWriter) {
		
		int likeChk = qnaService.likeChk(boardNo, userNo);//좋아요 눌렀는지 아닌지 체크
		
//		System.out.println("글 번호 : "+boardNo);
//		System.out.println("userNo : "+userNo);
//		System.out.println("boardWriter : "+boardWriter);
		
		if(likeChk == 0) {
			//처음 좋아요를 눌렀을 때
			qnaService.insertLike(boardNo,userNo); // like테이블 추가
			qnaService.updateLike(boardNo); //board테이블 업데이트
			qnaService.pointUpdate(boardNo); //member테이블 포인트 지급 업데이트
		}else if(likeChk == 1){
			//두번째 좋아요를 눌렀을 때
//			qnaService.deleteLike(boardNo, userNo); //like테이블 삭제
			qnaService.pointDelete(boardNo); //member테이블 포인트 차감 업데이트
		}
		return likeChk;
	}
	


}
