package com.yeamin.dto;

import java.sql.Timestamp;

public class ReviewDto {

	private Integer review_no;

	private String review_content;

	private Timestamp review_reg_time;

	private Integer user_no;

	private Integer review_upper_no;

	public ReviewDto() {
		
	}
	
	public Integer getReview_no() {
		return review_no;
	}

	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Timestamp getReview_reg_time() {
		return review_reg_time;
	}

	public void setReview_reg_time(Timestamp review_reg_time) {
		this.review_reg_time = review_reg_time;
	}

	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public Integer getReview_upper_no() {
		return review_upper_no;
	}

	public void setReview_upper_no(Integer review_upper_no) {
		this.review_upper_no = review_upper_no;
	}
	
}
