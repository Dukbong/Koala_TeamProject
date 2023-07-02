package com.hoju.koala.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.hoju.koala.board.model.vo.Liked;
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

//	    for (Board b : list) {
//	        int replyCount = qnaService.replyCount(b.getBoardNo());
//	        model.addAttribute("replyCount",replyCount);
//	        
//	        System.out.println("댓글수 : "+replyCount);
//	    }
	    
//		int replyCount = qnaService.replyCount(boardNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);

		return "board/qnaBoard/qnaBoardList";
	}
	
	//qna게시글 상세 조회
	@GetMapping("/detail")
	public ModelAndView selectBoard(int boardNo,
									ModelAndView mv,
									HttpSession session) {
		
		int result = qnaService.increateCount(boardNo);//조회수 증가
		
		if(result>0) {
			Board b = qnaService.selectBoard(boardNo);
//			ArrayList<Reply> r = qnaService.selectReplyList(boardNo);			
//			mv.addObject("r", r);
			mv.addObject("b",b).setViewName("board/qnaBoard/qnaBoardDetail");
		
			
			if(session.getAttribute("loginUser")!=null) {
				int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
				Liked liked = Liked.builder().refUno(userNo).refBno(boardNo).build();
				int likeYoN = qnaService.likeYesOrNo(liked);
				mv.addObject("likeYoN",likeYoN);
			}
		if(b.getFileNo()!=0) {

			ArrayList<BoardAttachment> at = qnaService.selectAttachment(boardNo);
			mv.addObject("at",at).setViewName("board/qnaBoard/qnaBoardDetail");;
			
		}
		
		
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
//		b.setTitle(b.getTitle());
//		b.setContent(b.getContent());
		System.out.println("====================");
		
		//게시글 작성자 설정
//		if(!b.getNotice().equals("Y")) {
			if(upFile!=null && !upFile.getOriginalFilename().equals("")) {
				String changeName = saveFile(upFile,session);
				at.setOriginName(upFile.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/"+changeName);
				result = qnaService.insertBoardFile(at);//파일 첨부 있을 때
				
				//filePath확인
				String filePath = at.getFilePath();
				System.out.println(filePath);
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
			System.out.println("글 작성 완료");
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
	public String selectReply(int boardNo,
							  String boardWriter,
							  HttpSession session) {
		

		ArrayList<Reply> list = qnaService.selectReply(boardNo);
		
		return new Gson().toJson(list);	}
	
	//로그인 유저 닉네임 가져가지
	@ResponseBody
	@RequestMapping(value="getUserNick", produces="application/json; charset=UTF-8")
	public String getUserNick(HttpSession session) {
		String userNickName = null;
//		String userNickName = String.valueOf(((Member)session.getAttribute("loginUser")).getNickName());
	    // 로그인 사용자 정보를 가져오기
	    Object loginUserObj = session.getAttribute("loginUser");
	    if (loginUserObj != null && loginUserObj instanceof Member) {
	        Member loginUser = (Member) loginUserObj;
	        userNickName = loginUser.getNickName();
	    }
//	    
	    JSONObject json = new JSONObject();
	    json.put("userNickName", userNickName);
	    return json.toString();
//		return userNickName;
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
	public Map<String, Object> updateLike(@RequestParam("boardNo") int boardNo, 
	                      @RequestParam("userNo") int userNo, 
	                      @RequestParam("boardWriter") String boardWriter) {
		
		Map<String, Object> response = new HashMap<>();
		
	    int likeChk  = qnaService.likeChk(boardNo, userNo); // 좋아요 눌렀는지 아닌지 체크
	    System.out.println(likeChk );
	    
	    if (likeChk  == 0) {
	        // 처음 좋아요를 눌렀을 때
	        System.out.println("처음 추천하는 고야");
	        qnaService.insertLike(boardNo, userNo); // like 테이블 추가
	        qnaService.updateLike(boardNo); // board 테이블 업데이트
	        qnaService.pointUpdate(boardNo); // member 테이블 포인트 지급 업데이트
	        response.put("isLiked", true);
	    } else if (likeChk  == 1) {
	        // 두번째 좋아요를 눌렀을 때
	        System.out.println("두번째 누른 추천 그니까 취소");
	        qnaService.pointDelete(boardNo); // member 테이블 포인트 차감 업데이트
	        qnaService.deleteLike(boardNo); //board 테이블 liked 차감 업데이트
	        response.put("isLiked", false);
	    }
	    
	    int likeCount = qnaService.getLikeCount(boardNo);
	    System.out.println(likeCount);
	    response.put("likeCount", likeCount);
	    
	    return response;
	}
	
//	@ResponseBody
//	@RequestMapping(value="getLikeCount", produces="application/json; charset=UTF-8")
//	public int getLikeCount(@RequestParam("boardNo")int boardNo) {
//		
//		
//		Integer getLikeCount = qnaService.getLikeCount(boardNo);
//		int likeCount = getLikeCount != null ? getLikeCount : 0; //null일때는 0
//		return likeCount;
//	}
	
	//댓글 채택
	@ResponseBody
	@RequestMapping(value="qnaSelect",method=RequestMethod.POST)
	public String qnaSelect(int boardNo,
							Integer replyNo) {
		
		System.out.println("글번호 : "+boardNo);
		System.out.println("댓글번호 : "+replyNo);
		int result = qnaService.qnaSelect(boardNo,replyNo);

//		System.out.println("되는지 안되는지.."+result);
		return (result>0)? "success" : "fail";
	}
	
	//댓글 채택 여부 확인
	@ResponseBody
	@RequestMapping("chkSelectedReply")
	public String chkSelectedReply(int boardNo,
									Integer replyNo) {
		
		System.out.println("채택 확인 댓글 번호 : "+replyNo);
		String result = qnaService.chkSelectedReply(boardNo,replyNo);
		
		return (result.equals("Y"))? "selected" : "notSelected";
	}
	
	//게시글 삭제 
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public ModelAndView deleteBoard(int boardNo,
									String filePath,
									ModelAndView mv,
									HttpSession session) {
		
		int result = qnaService.deleteBoard(boardNo);
		System.out.println("삭제 됐는지"+result);
		if(result>0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "게시글이 삭제 되었습니다!");
			mv.setViewName("redirect:list.bo");
		}else {
			mv.addObject("errorMsg","게시글 삭제 실패").setViewName("common/error");
		}
		
		return mv;
	}
	
	@RequestMapping("updateBoard")
	public String updateForm(int boardNo,
							 Model model) {
		Board b = qnaService.selectBoard(boardNo);
		
		model.addAttribute("b",b);
		return "board/qnaBoard/qnaBoardUpdateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public ModelAndView updateBoard(Board b,
									BoardAttachment at,
									ModelAndView mv,
									MultipartFile upFile,
									HttpSession session) {
		
		int result;
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		b.setBoardWriter(userNo);
		
		if(upFile!= null && !upFile.getOriginalFilename().equals("")) {
			
			if(at.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
			}
			String changeName = saveFile(upFile,session);
			
			at.setOriginName(upFile.getOriginalFilename());
			at.setChangeName("/resources/uploadFiles");
		
			result = qnaService.updateFile(at);
		}else {
			result = qnaService.updateBoard(b);//글만 수정
		}
		
		if(result>0) {
			mv.addObject("alertMsg","수정 완료").setViewName("redirect:list");
		}else {
			mv.addObject("errorMsg","수정 실패").setViewName("common/error");
		}
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="getLikeStatus", produces="application/json; charset=UTF-8")
	public boolean likeStatus(@RequestParam("boardNo") int boardNo,
						  	  @RequestParam("userNo") int userNo) {
		
		Integer likeStatus = qnaService.likeStatus(boardNo,userNo);
		
		return likeStatus != null && likeStatus ==1;//1이면 좋아요 null이면 좋아요를 누르지 않음
	}
	
}
