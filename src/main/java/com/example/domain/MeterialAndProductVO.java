package com.example.domain;

public class MeterialAndProductVO extends MeterialVO{
	private String meterial_id;
	private String meterial_image;
	private String meterial_name;
	private int meterial_price;
	private String product_id;
	private String product_image;
	private String product_name;
	private int product_price;
	
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getMeterial_image() {
		return meterial_image;
	}
	public void setMeterial_image(String meterial_image) {
		this.meterial_image = meterial_image;
	}
	public int getMeterial_price() {
		return meterial_price;
	}
	public void setMeterial_price(int meterial_price) {
		this.meterial_price = meterial_price;
	}
	public String getMeterial_name() {
		return meterial_name;
	}
	public void setMeterial_name(String meterial_name) {
		this.meterial_name = meterial_name;
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
	@Override
	public String toString() {
		return "MeterialAndProductVO [product_id=" + product_id + ", meterial_id=" + meterial_id + ", meterial_image="
				+ meterial_image + ", meterial_name=" + meterial_name + ", meterial_price=" + meterial_price
				+ ", product_image=" + product_image + ", product_name=" + product_name + ", product_price="
				+ product_price + "]";
	}
	
}
