package com.yeamin.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.ProductDao;
import com.yeamin.dto.ProductCategoryDto;
import com.yeamin.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public ProductDaoImpl() {
		
	}
	
	@Override
	public List<ProductCategoryDto> selectproductCategoryList(Map<String, Object> paramMap) {
		if(paramMap.get("inputText")!="" && paramMap.get("inputText2")==""){
			return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_CATEGORY_LIST_ONE, paramMap);
		}else if(paramMap.get("inputText2")!=""){
			return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_CATEGORY_LIST_ONE2, paramMap);
		}else{
			return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_CATEGORY_LIST, paramMap);
		}
	}
	
	@Override
	public List<ProductCategoryDto> deleteproductCategoryList(Map<String,Object> paramMap) {
		int result=sqlSession.delete(QueryConstants.QID_DELETE_PRODUCT_CATEGORY, paramMap);
		if(result==0){
			System.out.println("삭제 실패");
			return new ArrayList<ProductCategoryDto>();
		}else{
			return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_CATEGORY_LIST, paramMap);
		}
	}
	
	@Override
	public ProductCategoryDto selectProductCategory(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_DELETE_PRODUCT_CATEGORY_MODEL,paramMap);
	}
	
	@Override
	public Integer insertProductCategory(Map<String, Object> paramMap){
		Integer result=sqlSession.insert(QueryConstants.QID_INSERT_PRODUCT_CATEGORY,paramMap);
		if(result==0){
			System.out.println("등록 실패");
		}else{
		}
		return result;
	}
	
	@Override
	public Integer updateProductCategory(Map<String, Object> paramMap){
		Integer result=sqlSession.update(QueryConstants.QID_UPDATE_PRODUCT_CATEGORY,paramMap);
		if(result==0){
			System.out.println("수정 실패");
		}else{
		}
		return result;
	}
	
	@Override
	public List<ProductDto> selectProductList(Map<String,Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_LIST, paramMap);
	}
	
	@Override
	public ProductDto selectProduct(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_PRODUCT_MODEL,paramMap);
	}
	
	@Override
	public Integer insertProduct(Map<String, Object> paramMap){
		Integer result=sqlSession.insert(QueryConstants.QID_INSERT_PRODUCT,paramMap);
		if(result==0){
			System.out.println("상품 등록 실패");
		}else{
		}
		return result;
	}
}
