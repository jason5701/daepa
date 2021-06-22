package com.example.domain;

public class PurchaseVO extends OrderVO{
	public int order_number;
	public String product_id;
	public int product_price;
	public int purchase_qtt;
	public int purchase_sum;

	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getPurchase_qtt() {
		return purchase_qtt;
	}
	public void setPurchase_qtt(int purchase_qtt) {
		this.purchase_qtt = purchase_qtt;
	}
	
	public int getPurchase_sum() {
		return purchase_sum;
	}
	public void setPurchase_sum(int purchase_sum) {
		this.purchase_sum = this.product_price * this.purchase_qtt;
	}
	@Override
	public String toString() {
		return "PurchaseVO [order_number=" + order_number + ", product_id=" + product_id + ", product_price="
				+ product_price + ", purchase_qtt=" + purchase_qtt + "]";
	}	
	
}
