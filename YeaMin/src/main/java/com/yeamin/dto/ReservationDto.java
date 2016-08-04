package com.yeamin.dto;

import java.sql.Timestamp;

public class ReservationDto {

	private Integer reservation_no;

	private Integer reservation_people;

	private String reservation_comment;

	private Timestamp reservation_time;
	
	private String user_name;
	
	private Integer product_total_cnt;
	
	private Integer product_sum_price;
	
	private String reservation_time_format;

	public ReservationDto() {
		
	}

	public Integer getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(Integer reservation_no) {
		this.reservation_no = reservation_no;
	}

	public Integer getReservation_people() {
		return reservation_people;
	}

	public void setReservation_people(Integer reservation_people) {
		this.reservation_people = reservation_people;
	}

	public String getReservation_comment() {
		return reservation_comment;
	}

	public void setReservation_comment(String reservation_comment) {
		this.reservation_comment = reservation_comment;
	}

	public Timestamp getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(Timestamp reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Integer getProduct_total_cnt() {
		return product_total_cnt;
	}

	public void setProduct_total_cnt(Integer product_total_cnt) {
		this.product_total_cnt = product_total_cnt;
	}

	public Integer getProduct_sum_price() {
		return product_sum_price;
	}

	public void setProduct_sum_price(Integer product_sum_price) {
		this.product_sum_price = product_sum_price;
	}

	public String getReservation_time_format() {
		return reservation_time_format;
	}

	public void setReservation_time_format(String reservation_time_format) {
		this.reservation_time_format = reservation_time_format;
	}
	
}
