package com.yeamin.dto;

public class ReservationProductDto {
	
	private Integer reservation_no;
	
	private Integer product_category_no;
	
	private String product_category_name;
	
	private Integer product_no;
	
	private String product_name;
	
	private Integer product_price;
	
	private Integer product_cnt;
	
	public ReservationProductDto() {
		
	}

	public Integer getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(Integer reservation_no) {
		this.reservation_no = reservation_no;
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

	public Integer getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(Integer product_cnt) {
		this.product_cnt = product_cnt;
	}

}
