package com.yeamin.dao;

import java.util.List;
import java.util.Map;

public interface StatsDao {
	
	public List<Map<String, Object>> selectReviewCnt(Map<String, Object> paramMap);
	
}
