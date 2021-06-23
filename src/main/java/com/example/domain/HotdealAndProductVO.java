package com.example.domain;

public class HotdealAndProductVO extends ProductVO{
	private int hotdeal_number;
	private String product_id;
	public int getHotdeal_number() {
		return hotdeal_number;
	}
	public void setHotdeal_number(int hotdeal_number) {
		this.hotdeal_number = hotdeal_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "HotdealAndProductVO [hotdeal_number=" + hotdeal_number + ", product_id=" + product_id + "]";
	}
	
}
