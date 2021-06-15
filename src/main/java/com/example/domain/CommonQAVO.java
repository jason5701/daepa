package com.example.domain;

import java.util.Date;

public class CommonQAVO extends AdminVO{
	private int commonQA_number;
	private String commonQA_title;
	private String commonQA_contents;
	private String commonQA_writer;
	private Date commonQA_write_date;
	private Date commonQA_modify_date;
	private int commonQA_click;
	private String commonQA_image;
	public int getCommonQA_number() {
		return commonQA_number;
	}
	public void setCommonQA_number(int commonQA_number) {
		this.commonQA_number = commonQA_number;
	}
	public String getCommonQA_title() {
		return commonQA_title;
	}
	public void setCommonQA_title(String commonQA_title) {
		this.commonQA_title = commonQA_title;
	}
	public String getCommonQA_contents() {
		return commonQA_contents;
	}
	public void setCommonQA_contents(String commonQA_contents) {
		this.commonQA_contents = commonQA_contents;
	}
	public String getCommonQA_writer() {
		return commonQA_writer;
	}
	public void setCommonQA_writer(String commonQA_writer) {
		this.commonQA_writer = commonQA_writer;
	}
	public Date getCommonQA_write_date() {
		return commonQA_write_date;
	}
	public void setCommonQA_write_date(Date commonQA_write_date) {
		this.commonQA_write_date = commonQA_write_date;
	}
	public Date getCommonQA_modify_date() {
		return commonQA_modify_date;
	}
	public void setCommonQA_modify_date(Date commonQA_modify_date) {
		this.commonQA_modify_date = commonQA_modify_date;
	}
	public int getCommonQA_click() {
		return commonQA_click;
	}
	public void setCommonQA_click(int commonQA_click) {
		this.commonQA_click = commonQA_click;
	}
	public String getCommonQA_image() {
		return commonQA_image;
	}
	public void setCommonQA_image(String commonQA_image) {
		this.commonQA_image = commonQA_image;
	}
	@Override
	public String toString() {
		return "CommonQAVO [commonQA_number=" + commonQA_number + ", commonQA_title=" + commonQA_title
				+ ", commonQA_contents=" + commonQA_contents + ", commonQA_writer=" + commonQA_writer
				+ ", commonQA_write_date=" + commonQA_write_date + ", commonQA_modify_date=" + commonQA_modify_date
				+ ", commonQA_click=" + commonQA_click + ", commonQA_image=" + commonQA_image + "]";
	}
	
	
}
