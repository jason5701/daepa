package com.example.domain;

import java.util.Date;

public class UserVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_mobile;
	private String user_post;
	private String user_road_address;
	private String user_address;
	private String user_address_detail1;
	private String user_address_detail2;
	private String user_sex;
	private String user_birthday_year;
	private String user_birthday_month;
	private String user_birthday_day;
	private Date user_register;
	private int user_drop;
	private int user_point;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getUser_post() {
		return user_post;
	}
	public void setUser_post(String user_post) {
		this.user_post = user_post;
	}
	public String getUser_road_address() {
		return user_road_address;
	}
	public void setUser_road_address(String user_road_address) {
		this.user_road_address = user_road_address;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_address_detail1() {
		return user_address_detail1;
	}
	public void setUser_address_detail1(String user_address_detail1) {
		this.user_address_detail1 = user_address_detail1;
	}
	public String getUser_address_detail2() {
		return user_address_detail2;
	}
	public void setUser_address_detail2(String user_address_detail2) {
		this.user_address_detail2 = user_address_detail2;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_birthday_year() {
		return user_birthday_year;
	}
	public void setUser_birthday_year(String user_birthday_year) {
		this.user_birthday_year = user_birthday_year;
	}
	public String getUser_birthday_month() {
		return user_birthday_month;
	}
	public void setUser_birthday_month(String user_birthday_month) {
		this.user_birthday_month = user_birthday_month;
	}
	public String getUser_birthday_day() {
		return user_birthday_day;
	}
	public void setUser_birthday_day(String user_birthday_day) {
		this.user_birthday_day = user_birthday_day;
	}
	public Date getUser_register() {
		return user_register;
	}
	public void setUser_register(Date user_register) {
		this.user_register = user_register;
	}
	public int getUser_drop() {
		return user_drop;
	}
	public void setUser_drop(int user_drop) {
		this.user_drop = user_drop;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_mobile=" + user_mobile + ", user_post=" + user_post
				+ ", user_road_address=" + user_road_address + ", user_address=" + user_address
				+ ", user_address_detail1=" + user_address_detail1 + ", user_address_detail2=" + user_address_detail2
				+ ", user_sex=" + user_sex + ", user_birthday_year=" + user_birthday_year + ", user_birthday_month="
				+ user_birthday_month + ", user_birthday_day=" + user_birthday_day + ", user_register=" + user_register
				+ ", user_drop=" + user_drop + ", user_point=" + user_point + "]";
	}
	

}
