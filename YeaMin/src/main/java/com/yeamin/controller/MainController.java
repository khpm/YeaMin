package com.yeamin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ProductDao;
import com.yeamin.dao.ReviewDao;
import com.yeamin.dao.StoreDao;

@Controller
public class MainController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private StoreDao storeDao;
	
	public MainController() {
		
	}
	
	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/example/index.jsp");
		mav.setViewName(AppConstants.TEMPLATE_VIEW_PATH);
		return mav;
	}
	
	@RequestMapping("/content.do")
	public ModelAndView content() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/example/content.jsp");
		mav.setViewName(AppConstants.TEMPLATE_VIEW_PATH);
		return mav;
	}
	
	@RequestMapping("/content-1.do")
	public ModelAndView content1() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/example/content-1.jsp");
		mav.setViewName(AppConstants.TEMPLATE_VIEW_PATH);
		return mav;
	}
	
	@RequestMapping("/content-2.do")
	public ModelAndView content2() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentViewName", "/WEB-INF/jsp/example/content-2.jsp");
		mav.setViewName(AppConstants.TEMPLATE_VIEW_PATH);
		return mav;
	}
	
}
