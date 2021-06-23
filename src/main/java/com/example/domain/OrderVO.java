package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class OrderVO extends CouponVO{
	private int order_number;
	private String user_id;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date order_register_date;
	private String order_name;
	private String order_address;
	private String order_post;
	private String order_road_address;
	private String order_address_detail1;
	private String order_address_detail2;
	private String order_email;
	private String order_mobile;
	private String order_payment;
	private String order_status;
	
	
	public String getOrder_post() {
		return order_post;
	}
	public void setOrder_post(String order_post) {
		this.order_post = order_post;
	}
	public String getOrder_road_address() {
		return order_road_address;
	}
	public void setOrder_road_address(String order_road_address) {
		this.order_road_address = order_road_address;
	}
	public String getOrder_address_detail1() {
		return order_address_detail1;
	}
	public void setOrder_address_detail1(String order_address_detail1) {
		this.order_address_detail1 = order_address_detail1;
	}
	public String getOrder_address_detail2() {
		return order_address_detail2;
	}
	public void setOrder_address_detail2(String order_address_detail2) {
		this.order_address_detail2 = order_address_detail2;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getOrder_register_date() {
		return order_register_date;
	}
	public void setOrder_register_date(Date order_register_date) {
		this.order_register_date = order_register_date;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_mobile() {
		return order_mobile;
	}
	public void setOrder_mobile(String order_mobile) {
		this.order_mobile = order_mobile;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	@Override
	public String toString() {
		return "OrderVO [order_number=" + order_number + ", user_id=" + user_id + ", order_register_date="
				+ order_register_date + ", order_name=" + order_name + ", order_address=" + order_address
				+ ", order_post=" + order_post + ", order_road_address=" + order_road_address
				+ ", order_address_detail1=" + order_address_detail1 + ", order_address_detail2="
				+ order_address_detail2 + ", order_email=" + order_email + ", order_mobile=" + order_mobile
				+ ", order_payment=" + order_payment + ", order_status=" + order_status + "]";
	}
	
}
