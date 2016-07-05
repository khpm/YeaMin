package com.yeamin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yeamin.dao.BoardDao;

@Controller
public class BoardController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BoardDao boardDao;
	
	public BoardController() {
		
	}
	
}
