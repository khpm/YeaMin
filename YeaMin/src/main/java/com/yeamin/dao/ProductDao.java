package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ProductCategoryDto;


public interface ProductDao {
	
	public List<ProductCategoryDto> selectproductCategoryList(Map<String,Object> paramMap);
	public List<ProductCategoryDto> deleteproductCategoryList(Map<String,Object> paramMap);
	public ProductCategoryDto selectProductCategory(Map<String, Object> paramMap);
	public Integer insertProductCategory(Map<String, Object> paramMap);
	
}
