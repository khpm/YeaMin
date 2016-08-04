package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ReservationCapacityDto;
import com.yeamin.dto.ReservationDto;
import com.yeamin.dto.ReservationProductDto;

public interface ReservationDao {
	
	public List<ReservationCapacityDto> selectReservationCapacityList(Map<String, Object> paramMap);
	
	public ReservationCapacityDto selectReservationCapacity(Map<String, Object> paramMap);
	
	public Integer insertReservationCapacity(Map<String, Object> paramMap);
	
	public Integer updateReservationCapacity(Map<String, Object> paramMap);
	
	public Integer deleteReservationCapacity(Map<String, Object> paramMap);
	
	public Integer selectReservationNoSeq();
	
	public List<ReservationDto> selectReservationList(Map<String, Object> paramMap);
	
	public ReservationDto selectReservation(Map<String, Object> paramMap);
	
	public Integer insertReservation(Map<String, Object> paramMap);
	
	public Integer updateReservation(Map<String, Object> paramMap);
	
	public Integer deleteReservation(Map<String, Object> paramMap);
	
	public List<ReservationProductDto> selectReservationProductList(Map<String, Object> paramMap);
	
	public Integer insertReservationProduct(Map<String, Object> paramMap);
	
	public List<ReservationDto> selectReservationPeople(Map<String, Object> paramMap);
	
}
