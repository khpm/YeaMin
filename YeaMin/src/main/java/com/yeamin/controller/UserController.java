package com.yeamin.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main.do")
	public ModelAndView aaa() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/main.jsp");
		mav.setViewName("/WEB-INF/jsp/template/template.jsp");
		
		int count = sqlSession.selectOne("user.QID_SELECT_USER_COUNT");
		System.out.println(count);
		
		return mav;
	}
	
}
