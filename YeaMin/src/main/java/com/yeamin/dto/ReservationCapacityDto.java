package com.yeamin.dto;

public class ReservationCapacityDto {
	
	private Integer reservation_capacity_no;
	
	private String reservation_capacity_dw;
	
	private String reservation_capacity_time;
	
	private Integer reservation_capacity_people;
	
	public ReservationCapacityDto() {
		
	}

	public Integer getReservation_capacity_no() {
		return reservation_capacity_no;
	}

	public void setReservation_capacity_no(Integer reservation_capacity_no) {
		this.reservation_capacity_no = reservation_capacity_no;
	}

	public String getReservation_capacity_dw() {
		return reservation_capacity_dw;
	}

	public void setReservation_capacity_dw(String reservation_capacity_dw) {
		this.reservation_capacity_dw = reservation_capacity_dw;
	}

	public String getReservation_capacity_time() {
		return reservation_capacity_time;
	}

	public void setReservation_capacity_time(String reservation_capacity_time) {
		this.reservation_capacity_time = reservation_capacity_time;
	}

	public Integer getReservation_capacity_people() {
		return reservation_capacity_people;
	}

	public void setReservation_capacity_people(Integer reservation_capacity_people) {
		this.reservation_capacity_people = reservation_capacity_people;
	}
	
}
