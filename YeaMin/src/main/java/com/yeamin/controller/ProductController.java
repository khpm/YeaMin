package com.yeamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ProductDao;
import com.yeamin.dto.ProductCategoryDto;
import com.yeamin.dto.ProductDto;
import com.yeamin.util.YmUtil;


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
	@RequestMapping("/selectProductCategoryList.json")
	public @ResponseBody Map<String,Object> selectProductCategoryList(@RequestParam Map<String, Object> paramMap){
		String result = "";
		String msg = "";
		
		YmUtil.setPagingInfo(paramMap);
		List<ProductCategoryDto> list = productDao.selectProductCategoryList(paramMap);
		Integer totCnt = productDao.selectProductCategoryListCnt(paramMap);
		
		result = "ok";
		
		return YmUtil.getSelectListResult(result, msg, paramMap, list, totCnt);
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
	@RequestMapping("/deleteProductCategory.json")
	public @ResponseBody Map<String,Object> deleteProductCategory(@RequestParam Map<String, Object> paramMap){
		Integer sqlResult = productDao.deleteProductCategory(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
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
		List<ProductCategoryDto> productCategoryList=productDao.selectProductCategoryList(null);
		
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			ProductDto dto = productDao.selectProduct(paramMap);
			mav.addObject("dto", dto);
		}
		mav.addObject("productCategoryList",productCategoryList);
		return mav;
	}
	
	//상품 정보 조회
	@RequestMapping("/selectProductList.json")
	public @ResponseBody Map<String,Object> selectProductList(@RequestParam Map<String, Object> paramMap){
		String result = "";
		String msg = "";
		
		YmUtil.setPagingInfo(paramMap);
		List<ProductDto> list = productDao.selectProductList(paramMap);
		Integer totCnt = productDao.selectProductListCnt(paramMap);
		
		result = "ok";
		
		return YmUtil.getSelectListResult(result, msg, paramMap, list, totCnt);
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
	
	@RequestMapping("/productCategoryOrderByDuplicationCheck.json")
	public @ResponseBody Map<String, Object> productCategoryOrderByDuplicationCheck(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		ProductCategoryDto dto = productDao.selectProductCategory(paramMap);
		
		if(dto == null) {
			result = "ok";
			msg = "사용 가능한 상품 카테고리 순서입니다.";
		} else {
			result = "error";
			msg = "중복된 상품 카테고리 순서입니다.";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}

	@RequestMapping("/productOrderByDuplicationCheck.json")
	public @ResponseBody Map<String, Object> productOrderByDuplicationCheck(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		ProductDto dto = productDao.selectProduct(paramMap);
		
		if(dto == null) {
			result = "ok";
			msg = "사용 가능한 상품 순서입니다.";
		} else {
			result = "error";
			msg = "중복된 상품 순서입니다.";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/productCategoryNameDuplicationCheck.json")
	public @ResponseBody Map<String, Object> productCategoryNameDuplicationCheck(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		ProductCategoryDto dto = productDao.selectProductCategory(paramMap);
		
		if(dto == null) {
			result = "ok";
			msg = "사용 가능한 상품 카테고리 이름입니다.";
		} else {
			result = "error";
			msg = "중복된 상품 카테고리 이름입니다.";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/productNameDuplicationCheck.json")
	public @ResponseBody Map<String, Object> productNameDuplicationCheck(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		ProductDto dto = productDao.selectProduct(paramMap);
		
		if(dto == null) {
			result = "ok";
			msg = "사용 가능한 상품 이름입니다.";
		} else {
			result = "error";
			msg = "중복된 상품 이름입니다.";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
}
