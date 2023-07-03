package com.hoju.koala.board.schedule;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hoju.koala.board.model.service.BulletinBoardService;
import com.hoju.koala.board.model.vo.Board;
import com.hoju.koala.board.model.vo.BoardAttachment;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class BulletinBoardSchedule {

	@Autowired
	private BulletinBoardService bbService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void boardAndAttachmentDelete() {
		log.info("스케줄러: 게시글 첨부파일 삭제 기록");
		long startTime = System.currentTimeMillis();
		ArrayList<BoardAttachment> baList = bbService.selectDeleteAttachment();
		ArrayList<Board> bList = bbService.selectDeleteBoard();
		if(boardDelete(bList)&&boardAttachmentDelete(baList)) {
			log.info("스케줄러 실행 실패:");
		}else {
			long endTime = System.currentTimeMillis();
			log.info("스케줄러 완료:"+(endTime - startTime));
		}
	}
	
	public boolean boardDelete(ArrayList<Board> bList) {
		
		if(!bList.isEmpty()) {
			for(Board b:bList) {
				int boardNo = b.getBoardNo();
				if(delete(boardNo)!=1) {
					return false;
				}
			}
		}
		return true;
	}
	
	public int delete(int boardNo) {
		return bbService.deleteScheduledBoard(boardNo);
	}
	
	public boolean boardAttachmentDelete(ArrayList<BoardAttachment> baList) {
		
		if(!baList.isEmpty()) {
			for(BoardAttachment ba:baList) {
				String filePaths = (ba.getFilePath())+"/"+ba.getChangeName();
				File file = new File(filePaths);
				if (file.delete()) {
					log.info("파일이 성공적으로 삭제되었습니다.");
				} else {
					log.info("파일 삭제에 실패했습니다. 파일명:"+ba.getChangeName());
					return false;
				}
			}
		}
		return true;
	}

}
