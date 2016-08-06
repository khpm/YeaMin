package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.StoreDto;
import com.yeamin.dto.StoreImgDto;

public interface StoreDao {
	
	public StoreDto selectStore();
	public Integer insertStore(Map<String, Object> paramMap);
	public Integer updateStore(Map<String, Object> paramMap);
	
	public List<StoreImgDto> selectStoreImg(Map<String, Object> paramMap);
	public Integer insertStoreImg(Map<String, Object> paramMap);
	public Integer deleteStoreImg();
	
}
