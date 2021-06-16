package com.example.domain;

import java.util.Date;

public class ProductVO {
	private String product_id;
	private String product_name;
	private int product_price;
	private String product_image;
	private String product_detail;
	private int product_delivery; //배송타입 0-무료 1-일반배송
	private Date product_register; //등록일
	private int prodcut_click; //조회수
	private int product_selling; //판매수량
	private int product_drop; //품절 0-판매중,1-품절
	private int product_group_price; //공동구매 가격
	private String product_main_meterial; //대표재료? 음식구분을 위한 컬럼
	
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public int getProduct_delivery() {
		return product_delivery;
	}
	public void setProduct_delivery(int product_delivery) {
		this.product_delivery = product_delivery;
	}
	public Date getProduct_register() {
		return product_register;
	}
	public void setProduct_register(Date product_register) {
		this.product_register = product_register;
	}
	public int getProdcut_click() {
		return prodcut_click;
	}
	public void setProdcut_click(int prodcut_click) {
		this.prodcut_click = prodcut_click;
	}
	public int getProduct_selling() {
		return product_selling;
	}
	public void setProduct_selling(int product_selling) {
		this.product_selling = product_selling;
	}
	public int getProduct_drop() {
		return product_drop;
	}
	public void setProduct_drop(int product_drop) {
		this.product_drop = product_drop;
	}
	public int getProduct_group_price() {
		return product_group_price;
	}
	public void setProduct_group_price(int product_group_price) {
		this.product_group_price = product_group_price;
	}
	public String getProduct_main_meterial() {
		return product_main_meterial;
	}
	public void setProduct_main_meterial(String product_main_meterial) {
		this.product_main_meterial = product_main_meterial;
	}
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_image=" + product_image
				+ ", product_detail=" + product_detail + ", product_delivery=" + product_delivery
				+ ", product_register=" + product_register + ", prodcut_click=" + prodcut_click + ", product_selling="
				+ product_selling + ", product_drop=" + product_drop + ", product_group_price=" + product_group_price
				+ ", product_main_meterial=" + product_main_meterial + "]";
	}
	
	
}
