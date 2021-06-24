package com.example.domain;

import java.util.Date;

public class PurchaseVO extends OrderVO{
	public int order_number;
	public String product_id;
	public int purchase_qtt;
	
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
	public int getPurchase_qtt() {
		return purchase_qtt;
	}
	public void setPurchase_qtt(int purchase_qtt) {
		this.purchase_qtt = purchase_qtt;
	}	
	@Override
	public String toString() {
		return "PurchaseVO [order_number=" + order_number + ", product_id=" + product_id + ", purchase_qtt="
				+ purchase_qtt + "]";
	}
	
}
