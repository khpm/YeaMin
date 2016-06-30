package com.yeamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@RequestMapping("/main.do")
	public ModelAndView aaa() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/main.jsp");
		mav.setViewName("/WEB-INF/jsp/template/template.jsp");
		return mav;
	}
	
}
