package com.yeamin.dao;

import java.util.List;

import com.yeamin.dto.ReservationCapacityDto;

public interface ReservationDao {
	
	public List<ReservationCapacityDto> selectReservationCapacityList();
	
}
