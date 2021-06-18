package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewVO extends MeterialAndProductVO{
	private int review_number;
	private String product_id;
	private String meterial_id;
	private String review_writer;
	private String review_title;
	private String review_contents;
	
	@JsonFormat(pattern="yyyy/MM/dd hh:mm:ss", timezone="Asia/Seout")
	private Date review_write_date;
	@JsonFormat(pattern="yyyy/MM/dd hh:mm:ss", timezone="Asia/Seout")
	private Date review_modify_date;	
	
	private int review_click;
	private String review_image;
	
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMeterial_id() {
		return meterial_id;
	}
	public void setMeterial_id(String meterial_id) {
		this.meterial_id = meterial_id;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public Date getReview_write_date() {
		return review_write_date;
	}
	public void setReview_write_date(Date review_write_date) {
		this.review_write_date = review_write_date;
	}
	public Date getReview_modify_date() {
		return review_modify_date;
	}
	public void setReview_modify_date(Date review_modify_date) {
		this.review_modify_date = review_modify_date;
	}
	public int getReview_click() {
		return review_click;
	}
	public void setReview_click(int review_click) {
		this.review_click = review_click;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_number=" + review_number + ", product_id=" + product_id + ", meterial_id="
				+ meterial_id + ", review_writer=" + review_writer + ", review_title=" + review_title
				+ ", review_contents=" + review_contents + ", review_write_date=" + review_write_date
				+ ", review_modify_date=" + review_modify_date + ", review_click=" + review_click + ", review_image="
				+ review_image + "]";
	}
}
