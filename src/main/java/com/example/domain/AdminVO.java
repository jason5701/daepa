package com.example.domain;

import java.util.Date;

public class AdminVO {
	private String admin_id;
	private String admin_password;
	private String admin_name;
	private String admin_grade;
	private Date admin_register;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_grade() {
		return admin_grade;
	}
	public void setAdmin_grade(String admin_grade) {
		this.admin_grade = admin_grade;
	}
	public Date getAdmin_register() {
		return admin_register;
	}
	public void setAdmin_register(Date admin_register) {
		this.admin_register = admin_register;
	}
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_password=" + admin_password + ", admin_name=" + admin_name
				+ ", admin_grade=" + admin_grade + ", admin_register=" + admin_register + "]";
	}
}
