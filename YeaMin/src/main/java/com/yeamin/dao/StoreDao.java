package com.yeamin.dao;

import java.util.Map;

import com.yeamin.dto.StoreDto;

public interface StoreDao {
	public Integer insertStore(Map<String, Object> paramMap);
	public StoreDto selectStore();
	public Integer updateStore(Map<String, Object> paramMap);
	public Integer insertStoreImg(Map<String, Object> paramMap);
}
