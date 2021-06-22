package com.example.domain;

public class MeterialAndProductVO extends MeterialVO{
	private String product_id;
	private String meterial_id;
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
		return "MeterialAndProductVO [product_id=" + product_id + ", meterial_id=" + meterial_id + "]";
	}
	
}
