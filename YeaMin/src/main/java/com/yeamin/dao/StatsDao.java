package com.yeamin.dao;

import java.util.List;
import java.util.Map;

public interface StatsDao {
	
	public List<Map<String, Object>> selectReviewCnt(Map<String, Object> paramMap);
	public List<Map<String, Object>> selectProductTop5(Map<String, Object> paramMap);
	public List<Map<String, Object>> selectReservationAges(Map<String, Object> paramMap);
	public List<Map<String, Object>> selectTimeReservationCnt(Map<String, Object> paramMap);
	public List<Map<String, Object>> selectTimeSales(Map<String, Object> paramMap);

	
}
