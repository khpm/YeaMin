package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ReviewDto;

public interface ReviewDao {
	
	public List<ReviewDto> selectReviewList();
	
	public ReviewDto selectReview(Map<String, Object> paramMap);
	
	public Integer insertReview(Map<String, Object> paramMap);
	
	public Integer updateReview(Map<String, Object> paramMap);
	
	public Integer deleteReview(Map<String, Object> paramMap);
	
	public String selectReviewMaxRef();
	
	public Integer insertReviewAnswerInputForm(Map<String, Object> paramMap);
}
