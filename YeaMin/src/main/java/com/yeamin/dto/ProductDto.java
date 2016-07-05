package com.yeamin.dto;

public class ProductDto {

	private Integer product_no;

	private String product_name;

	private Integer product_price;

	private String product_desc;

	private String product_img_origin_path;

	private String product_img_system_path;

	private Integer product_order_by;

	public ProductDto() {
		
	}

	public Integer getProduct_no() {
		return product_no;
	}

	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Integer getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public String getProduct_img_origin_path() {
		return product_img_origin_path;
	}

	public void setProduct_img_origin_path(String product_img_origin_path) {
		this.product_img_origin_path = product_img_origin_path;
	}

	public String getProduct_img_system_path() {
		return product_img_system_path;
	}

	public void setProduct_img_system_path(String product_img_system_path) {
		this.product_img_system_path = product_img_system_path;
	}

	public Integer getProduct_order_by() {
		return product_order_by;
	}

	public void setProduct_order_by(Integer product_order_by) {
		this.product_order_by = product_order_by;
	}

}
