package com.hoju.koala.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoju.koala.board.model.dao.ErrorBoardDao;

@Service
public class ErrorBoardServiceImpl implements ErrorBoardService {
	
	@Autowired
	private ErrorBoardDao ebDao;

}
