package com.yeamin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ProductDao;
import com.yeamin.dao.ReviewDao;
import com.yeamin.dao.StoreDao;
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
	public ModelAndView mainContents(@RequestParam Map<String, Object> paramMap) {
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
		
		int pageNo = 0;
		if(paramMap.containsKey("pageNo")){
			pageNo = Integer.parseInt((String)(paramMap.get("pageNo")));
			
		}else{
			pageNo = 1;
		}
		int reviewCnt = reviewList.size();		// 리뷰 수
		int reviewSize = 10;					// 페이지당 리뷰 수
		int page = pageNo / (reviewSize+1) + 1 ;	// 1~9페이지는 1 , 10~19페이지는 2
		int startPage = (page * reviewSize) - 9;	//시작페이지
		int endPage = (page * reviewSize);		//끝페이지
		int allPage = Math.round(reviewCnt / reviewSize); //전체 페이지 수
		ArrayList<ReviewDto> pageList = new ArrayList<ReviewDto>();
		for(int i = (pageNo * reviewSize)-reviewSize; i<(pageNo * reviewSize); i++){
			if(i == reviewCnt)
				break;
			pageList.add(reviewList.get(i));
		}
		mav.addObject("page", page);
		mav.addObject("pageNo", pageNo);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("allPage", allPage);
		mav.addObject("pageList", pageList);
		mav.addObject("reviewCnt", reviewCnt);
		mav.addObject("reviewSize", reviewSize);

		mav.addObject("contentViewName", "/WEB-INF/jsp/main/mainContents.jsp");
		return mav;
	}
	
}
