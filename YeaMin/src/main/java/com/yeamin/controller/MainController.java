package com.yeamin.controller;

import java.util.HashMap;
import java.util.List;

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
import com.yeamin.dto.ProductCategoryDto;
import com.yeamin.dto.ReviewDto;
import com.yeamin.dto.StoreDto;
import com.yeamin.dto.StoreImgDto;

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
	
	@RequestMapping("/main.do")
	public ModelAndView mainContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		List<StoreImgDto> list = storeDao.selectStoreImg(new HashMap<String,Object>());
		if(list != null){
			mav.addObject("list", list);
		}
		
		StoreDto dto = storeDao.selectStore();
		if(dto != null){
			mav.addObject("dto", dto);
		}
		
		List<ReviewDto> reviewList = reviewDao.selectReviewList();
		if(reviewList != null){
			mav.addObject("reviewList", reviewList);
		}
		
		mav.addObject("contentViewName", "/WEB-INF/jsp/mainContents.jsp");
		return mav;
	}
	
	
}
