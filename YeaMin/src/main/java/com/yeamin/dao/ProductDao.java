package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ProductCategoryDto;


public interface ProductDao {
	public List<ProductCategoryDto> selectproductCategoryList(Map<String,Object> paramMap);

}
