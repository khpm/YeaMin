package com.yeamin.dto;

public class ProductCategoryDto {

	private Integer product_category_no;

	private String product_category_name;

	private Integer product_category_order_by;

	private Integer product_cnt;

	public ProductCategoryDto() {
		
	}

	public Integer getProduct_category_no() {
		return product_category_no;
	}

	public void setProduct_category_no(Integer product_category_no) {
		this.product_category_no = product_category_no;
	}

	public String getProduct_category_name() {
		return product_category_name;
	}

	public void setProduct_category_name(String product_category_name) {
		this.product_category_name = product_category_name;
	}

	public Integer getProduct_category_order_by() {
		return product_category_order_by;
	}

	public void setProduct_category_order_by(Integer product_category_order_by) {
		this.product_category_order_by = product_category_order_by;
	}

	public Integer getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(Integer product_cnt) {
		this.product_cnt = product_cnt;
	}
	
}
