package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CouponVO extends MeterialAndProductVO{
	private String coupon_id;
	private String coupon_name;
	private int coupon_discount;
	private Date coupon_register;
	private String coupon_end;
	private String coupon_image;
	private int coupon_exp;
	
	public int getCoupon_exp() {
		return coupon_exp;
	}
	public void setCoupon_exp(int coupon_exp) {
		this.coupon_exp = coupon_exp;
	}
	public String getCoupon_image() {
		return coupon_image;
	}
	public void setCoupon_image(String coupon_image) {
		this.coupon_image = coupon_image;
	}
	public String getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public Date getCoupon_register() {
		return coupon_register;
	}
	public void setCoupon_register(Date coupon_register) {
		this.coupon_register = coupon_register;
	}
	public String getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_end(String coupon_end) {
		this.coupon_end = coupon_end;
	}
	@Override
	public String toString() {
		return "CouponVO [coupon_id=" + coupon_id + ", coupon_name=" + coupon_name + ", coupon_discount="
				+ coupon_discount + ", coupon_register=" + coupon_register + ", coupon_end=" + coupon_end
				+ ", coupon_image=" + coupon_image + ", coupon_exp=" + coupon_exp + "]";
	}

}
