package com.yeamin.dto;

public class ReservationProductDto {
	
	private Integer reservation_no;
	
	private Integer product_no;
	
	private Integer product_cnt;

	public ReservationProductDto() {
		
	}

	public Integer getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(Integer reservation_no) {
		this.reservation_no = reservation_no;
	}

	public Integer getProduct_no() {
		return product_no;
	}

	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}

	public Integer getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(Integer product_cnt) {
		this.product_cnt = product_cnt;
	}
	
}
