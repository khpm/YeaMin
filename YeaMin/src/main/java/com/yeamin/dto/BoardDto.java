package com.yeamin.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	private Integer board_no;
	
	private String board_title;
	
	private String board_content;
	
	private Integer board_read_cnt;
	
	private Timestamp board_reg_time;
	
	private Integer board_re_ref;
	
	private Integer board_re_step;
	
	private Integer board_re_level;
	
	private Integer user_no;
	
	private String user_name;
	
	private Integer r;
	
	public BoardDto() {
		
	}

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Integer getBoard_read_cnt() {
		return board_read_cnt;
	}

	public void setBoard_read_cnt(Integer board_read_cnt) {
		this.board_read_cnt = board_read_cnt;
	}

	public Timestamp getBoard_reg_time() {
		return board_reg_time;
	}

	public void setBoard_reg_time(Timestamp board_reg_time) {
		this.board_reg_time = board_reg_time;
	}

	public Integer getBoard_re_ref() {
		return board_re_ref;
	}

	public void setBoard_re_ref(Integer board_re_ref) {
		this.board_re_ref = board_re_ref;
	}

	public Integer getBoard_re_step() {
		return board_re_step;
	}

	public void setBoard_re_step(Integer board_re_step) {
		this.board_re_step = board_re_step;
	}

	public Integer getBoard_re_level() {
		return board_re_level;
	}

	public void setBoard_re_level(Integer board_re_level) {
		this.board_re_level = board_re_level;
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

	public Integer getR() {
		return r;
	}

	public void setR(Integer r) {
		this.r = r;
	}
	
}
