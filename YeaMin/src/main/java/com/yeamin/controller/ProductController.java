package com.yeamin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ProductDao;
import com.yeamin.dto.ProductCategoryDto;
import com.yeamin.dto.ProductDto;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@Controller
public class ProductController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ProductDao productDao;
	
	public ProductController() {
		
	}
	//상품 카테고리 화면
	@RequestMapping("/productCategoryContents.do")
	public ModelAndView productCategoryContents(){
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/product/productCategoryContents.jsp");
		return mav;
	}
	
	//상품 카테고리 조회
	@RequestMapping("/selectproductCategoryList.json")
	public @ResponseBody Map<String,Object> selectproductCategoryList(@RequestParam Map<String, Object> paramMap){
		List<ProductCategoryDto> list=productDao.selectproductCategoryList(paramMap);
		return getSelectListResult(paramMap,list);
	}
	
	
	
	//상품 카테고리 Model
	@RequestMapping("/productCategoryModal.do")
	public ModelAndView productCategoryModal(@RequestParam Map<String, Object> paramMap) {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/product/productCategoryModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			ProductCategoryDto dto = productDao.selectProductCategory(paramMap);
			mav.addObject("dto", dto);
		}
		return mav;
	}
	
	//상품 카테고리 등록
	@RequestMapping("/insertProductCategory.json")
	public @ResponseBody Map<String, Object> insertProductCategory(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = productDao.insertProductCategory(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	//상품 카테고리 수정
	@RequestMapping("/updateProductCategory.json")
	public @ResponseBody Map<String, Object> updateProductCategory(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = productDao.updateProductCategory(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	//상품 카테고리 삭제
	@RequestMapping("/deleteproductCategoryList.json")
	public @ResponseBody Map<String,Object> deleteproductCategoryList(@RequestParam Map<String, Object> paramMap){
		List<ProductCategoryDto> list=productDao.deleteproductCategoryList(paramMap);
		
		return getSelectListResult(paramMap,list);
	}
	
	//상품 정보 화면
	@RequestMapping("/productContents.do")
	public ModelAndView productContents(){
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/product/productContents.jsp");
		return mav;
	}
	
	//상품 정보 Model
	@RequestMapping("/productModal.do")
	public ModelAndView productModal(@RequestParam Map<String, Object> paramMap) {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/product/productModal.jsp");
		//카테고리 이름 가져오기 위해서 
		List<ProductCategoryDto> productCategoryList=productDao.selectproductCategoryList(null);
		
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			ProductDto dto = productDao.selectProduct(paramMap);
			mav.addObject("dto", dto);
		}
		mav.addObject("productCategoryList",productCategoryList);
		return mav;
	}
	
	//상품 정보 등록
	@RequestMapping("/insertProduct.json")
	public @ResponseBody Map<String, Object> insertProduct(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = productDao.insertProduct(paramMap);
		if(sqlResult!=0){
			System.out.println("등록 성공");
		}else{
			System.out.println("등록 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	//상품 정보 수정
	@RequestMapping("/updateProduct.json")
	public @ResponseBody Map<String, Object> updateProduct(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = productDao.updateProduct(paramMap);
		if(sqlResult!=0){
			System.out.println("수정 성공");
		}else{
			System.out.println("수정 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	//상품 정보 삭제
	@RequestMapping("/deleteProduct.json")
	public @ResponseBody Map<String, Object> deleteProduct(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = productDao.deleteProduct(paramMap);
		if(sqlResult!=0){
			System.out.println("삭제 성공");
		}else{
			System.out.println("삭제 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	//상품 정보 조회
	@RequestMapping("/selectProductList.json")
	public @ResponseBody Map<String,Object> selectProductList(@RequestParam Map<String, Object> paramMap){
		List<ProductDto> list=null;
		if(paramMap.containsKey("categoryName") || paramMap.containsKey("productName")){
			list=productDao.selectProductListOne(paramMap);
		}else{
			list=productDao.selectProductList(paramMap);
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		ret.put("list", list);
		
		return ret;
	}
	
	public Map<String, Object> getSelectListResult(Map<String, Object> paramMap, List<?> list) {
		int listCount = list.size();
		int pageCount = 1; // 전체 페이지 개수
		int pageSize = 100; // 한 페이지에 들어갈 개수
		int mok = listCount / pageSize;
		int nmg = listCount % pageSize;
		
		if(nmg == 0) {
			pageCount = mok;
		} else if(nmg > 0) {
			pageCount = mok + 1;
		}
		
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("pageNo", paramMap.get("pageNo"));
		page.put("pageCount", pageCount);
		page.put("listCount", listCount);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "ok");
		result.put("list", list);
		result.put("page", page);
		result.put("msg", "");
		return result;
	}
}
