package com.yeamin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.UserDao;

@Controller
public class UserController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/main.do")
	public ModelAndView aaa() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/main.jsp");
		mav.setViewName(AppConstants.TEMPLATE_VIEW_PATH);
		
		log.info("회원 수 : " + userDao.userCount());
		
		return mav;
	}
	
}
