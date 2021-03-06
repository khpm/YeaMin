package com.yeamin.dto;

import java.sql.Timestamp;

public class ReviewDto {

	private Integer review_no;

	private String review_content;

	private Timestamp review_reg_time;
	
	private Integer review_re_ref;
	
	private Integer review_re_step;
	
	private Integer review_re_level;

	private Integer user_no;
	
	private String user_name;
	
	private Integer review_answer_cnt;
	
	private String is_admin;
	
	private String user_gender;
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

	public Integer getReview_re_ref() {
		return review_re_ref;
	}

	public void setReview_re_ref(Integer review_re_ref) {
		this.review_re_ref = review_re_ref;
	}

	public Integer getReview_re_step() {
		return review_re_step;
	}

	public void setReview_re_step(Integer review_re_step) {
		this.review_re_step = review_re_step;
	}

	public Integer getReview_re_level() {
		return review_re_level;
	}

	public void setReview_re_level(Integer review_re_level) {
		this.review_re_level = review_re_level;
	}

	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Integer getReview_answer_cnt() {
		return review_answer_cnt;
	}

	public void setReview_answer_cnt(Integer review_answer_cnt) {
		this.review_answer_cnt = review_answer_cnt;
	}

	public String getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
}
