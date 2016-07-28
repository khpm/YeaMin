package com.yeamin.dao;

import java.util.Map;

public interface ReviewDao {
	
	public Integer insertReview(Map<String, Object> paramMap);
	
	public String selectReviewMaxRef();
}
