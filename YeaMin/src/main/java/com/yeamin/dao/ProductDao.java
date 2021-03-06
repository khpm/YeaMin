package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.ProductCategoryDto;
import com.yeamin.dto.ProductDto;


public interface ProductDao {
	
	public List<ProductCategoryDto> selectProductCategoryList(Map<String,Object> paramMap);
	public Integer selectProductCategoryListCnt(Map<String, Object> paramMap);
	public ProductCategoryDto selectProductCategory(Map<String, Object> paramMap);
	public Integer insertProductCategory(Map<String, Object> paramMap);
	public Integer updateProductCategory(Map<String, Object> paramMap);
	public Integer deleteProductCategory(Map<String,Object> paramMap);
	
	public List<ProductDto> selectProductList(Map<String,Object> paramMap);
	public Integer selectProductListCnt(Map<String, Object> paramMap);
	public ProductDto selectProduct(Map<String, Object> paramMap);
	public Integer insertProduct(Map<String, Object> paramMap);
	public Integer updateProduct(Map<String, Object> paramMap);
	public Integer deleteProduct(Map<String, Object> paramMap);
	
}
