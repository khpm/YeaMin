package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ReservationCapacityDto;

public interface ReservationDao {
	
	public List<ReservationCapacityDto> selectReservationCapacityList(Map<String, Object> paramMap);
	
	public ReservationCapacityDto selectReservationCapacity(Map<String, Object> paramMap);
	
	public Integer insertReservationCapacity(Map<String, Object> paramMap);
	
	public Integer updateReservationCapacity(Map<String, Object> paramMap);
	
	public Integer deleteReservationCapacity(Map<String, Object> paramMap);
	
}
