package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeVO extends AdminVO{
	private int notice_number;
	private String notice_title;
	private String notice_contents;
	private String notice_writer;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date notice_write_date;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date notice_modify_date;
	private int notice_click;
	private String notice_image;
	
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_write_date() {
		return notice_write_date;
	}
	public void setNotice_write_date(Date notice_write_date) {
		this.notice_write_date = notice_write_date;
	}
	public Date getNotice_modify_date() {
		return notice_modify_date;
	}
	public void setNotice_modify_date(Date notice_modify_date) {
		this.notice_modify_date = notice_modify_date;
	}
	public int getNotice_click() {
		return notice_click;
	}
	public void setNotice_click(int notice_click) {
		this.notice_click = notice_click;
	}
	public String getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_number=" + notice_number + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", notice_writer=" + notice_writer + ", notice_write_date=" + notice_write_date
				+ ", notice_modify_date=" + notice_modify_date + ", notice_click=" + notice_click + ", notice_image="
				+ notice_image + "]";
	}
	
	
}
