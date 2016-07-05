package com.yeamin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yeamin.dao.ReviewDao;

@Controller
public class ReviewController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ReviewDao reviewDao;
	
	public ReviewController() {
		
	}
	
}
