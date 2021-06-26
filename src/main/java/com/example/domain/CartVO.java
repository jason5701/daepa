package com.example.domain;

public class CartVO {
	
	private int cart_number;
	private String user_id;
	
	private String product_id;
	private String product_name;
	private String product_image;
	private int product_price;
	private int cart_product_qtt;
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCart_product_qtt() {
		return cart_product_qtt;
	}
	public void setCart_product_qtt(int cart_product_qtt) {
		this.cart_product_qtt = cart_product_qtt;
	}
	@Override
	public String toString() {
		return "CartVO [cart_number=" + cart_number + ", user_id=" + user_id + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_image=" + product_image + ", product_price="
				+ product_price + ", cart_product_qtt=" + cart_product_qtt + "]";
	}
	
	
	
	
}