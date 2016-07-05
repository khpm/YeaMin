package com.yeamin.dto;

import java.sql.Timestamp;

public class ReservationDto {

	private Integer reservation_no;

	private Integer reservation_people;

	private String reservation_comment;

	private Timestamp reservation_time;

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
	
}
