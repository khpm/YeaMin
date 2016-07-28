package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ReviewDto;

public interface ReviewDao {
	
	public Integer insertReview(Map<String, Object> paramMap);
	
	public String selectReviewMaxRef();
	
	public List<ReviewDto> selectReviewList();
	
	public Integer updateReview(Map<String, Object> paramMap);
	
	public Integer deleteReview(Map<String, Object> paramMap);
	
	public ReviewDto selectReviewOne(Map<String, Object> paramMap);
	
	public Integer insertReviewAnswerInputForm(Map<String, Object> paramMap);
}
