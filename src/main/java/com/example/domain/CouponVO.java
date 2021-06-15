package com.example.domain;

import java.util.Date;

public class CouponVO extends ProductVO{
	private String coupon_id;
	private String coupon_name;
	private int coupon_discount;
	private Date coupon_register;
	private Date coupon_end;
	private String user_id;
	private String product_id;
	
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
	public Date getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "CouponVO [coupon_id=" + coupon_id + ", coupon_name=" + coupon_name + ", coupon_discount="
				+ coupon_discount + ", coupon_register=" + coupon_register + ", coupon_end=" + coupon_end + ", user_id="
				+ user_id + ", product_id=" + product_id + "]";
	}
	
}
