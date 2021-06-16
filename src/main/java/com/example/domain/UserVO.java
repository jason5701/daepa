package com.example.domain;

import java.util.Date;

public class UserVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_mobile;
	private String user_address;
	private String user_sex;
	private String user_birthday;
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
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public Date getUser_regiter() {
		return user_register;
	}
	public void setUser_regiter(Date user_regiter) {
		this.user_register = user_regiter;
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
				+ ", user_email=" + user_email + ", user_mobile=" + user_mobile + ", user_address=" + user_address
				+ ", user_sex=" + user_sex + ", user_birthday=" + user_birthday + ", user_register=" + user_register
				+ ", user_drop=" + user_drop + ", user_point=" + user_point + "]";
	}
	

}
