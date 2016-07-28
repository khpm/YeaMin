package com.yeamin.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeamin.dao.ReviewDao;
import com.yeamin.dto.ReviewDto;

@Controller
public class ReviewController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ReviewDao reviewDao;
	
	public ReviewController() {
		
	}
	
	@RequestMapping("/insertReview.json")
	public @ResponseBody Map<String, Object> insertReview(@RequestParam Map<String, Object> paramMap) {
		Integer review_re_ref = 0;
		String refCheck; // 글이 없을경우 ref 값이 null이기 때문에 체크하기 위한 변수
		refCheck = reviewDao.selectReviewMaxRef();
		if(refCheck == null || refCheck == ""){
			review_re_ref = 1;
		}else{
			review_re_ref = Integer.parseInt(refCheck) + 1;
		}
		paramMap.put("review_re_ref", review_re_ref);
		
		Integer sqlResult = reviewDao.insertReview(paramMap);		
		Map<String, Object> ret = new HashMap<String, Object>();
		if(sqlResult != 0){
			ret.put("result", "ok");
		}else{
			ret.put("result", "error");
		}
		return ret;
	}
	
	@RequestMapping("/updateReview.json")
	public @ResponseBody Map<String, Object> updateReview(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = reviewDao.updateReview(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		if(sqlResult != 0){
			ret.put("result", "ok");
		}else{
			ret.put("result", "error");
		}
		return ret;
	}
	
	@RequestMapping("/deleteReview.json")
	public @ResponseBody Map<String, Object> deleteReview(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = reviewDao.deleteReview(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		if(sqlResult != 0){
			ret.put("result", "ok");
		}else{
			ret.put("result", "error");
		}
		return ret;
	}
	
	@RequestMapping("/insertReviewAnswerInputForm.json")
	public @ResponseBody Map<String, Object> insertReviewAnswerInputForm(@RequestParam Map<String, Object> paramMap) {
		ReviewDto dto = reviewDao.selectReviewOne(paramMap);
		if(dto != null){
			int review_re_ref = dto.getReview_re_ref();
			
			paramMap.put("review_re_ref", review_re_ref);
			paramMap.put("review_re_step", 1);
			paramMap.put("review_re_level", 1);
		}
		
		Map<String, Object> ret = new HashMap<String, Object>();
		Integer sqlResult = reviewDao.insertReviewAnswerInputForm(paramMap);
		if(sqlResult != 0){
			ret.put("result", "ok");
		}else{
			ret.put("result", "error");
		}
		return ret;
	}	
}
