package com.yeamin.dao.impl;

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
	
}
