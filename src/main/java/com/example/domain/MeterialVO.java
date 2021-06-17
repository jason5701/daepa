package com.example.domain;

import java.util.Date;

public class MeterialVO extends ProductVO{
	private String meterial_id;
	private String meterial_name;
	private int meterial_price;
	private String meterial_description;
	private String meterial_image;
	private int meterial_delivery; //0-무료,1일반 택배 타입
	private Date meterial_register;
	private int meterial_click; //조회수
	private int meterial_selling; //재료 판매수량
	private int meterial_drop; //재료품절 0-판매중,1-품절
	
	public String getMeterial_id() {
		return meterial_id;
	}
	public void setMeterial_id(String meterial_id) {
		this.meterial_id = meterial_id;
	}
	public String getMeterial_name() {
		return meterial_name;
	}
	public void setMeterial_name(String meterial_name) {
		this.meterial_name = meterial_name;
	}
	public int getMeterial_price() {
		return meterial_price;
	}
	public void setMeterial_price(int meterial_price) {
		this.meterial_price = meterial_price;
	}
	public String getMeterial_description() {
		return meterial_description;
	}
	public void setMeterial_description(String meterial_description) {
		this.meterial_description = meterial_description;
	}
	public String getMeterial_image() {
		return meterial_image;
	}
	public void setMeterial_image(String meterial_image) {
		this.meterial_image = meterial_image;
	}
	public int getMeterial_delivery() {
		return meterial_delivery;
	}
	public void setMeterial_delivery(int meterial_delivery) {
		this.meterial_delivery = meterial_delivery;
	}
	public Date getMeterial_register() {
		return meterial_register;
	}
	public void setMeterial_register(Date meterial_register) {
		this.meterial_register = meterial_register;
	}
	public int getMeterial_click() {
		return meterial_click;
	}
	public void setMeterial_click(int meterial_click) {
		this.meterial_click = meterial_click;
	}
	public int getMeterial_selling() {
		return meterial_selling;
	}
	public void setMeterial_selling(int meterial_selling) {
		this.meterial_selling = meterial_selling;
	}
	public int getMeterial_drop() {
		return meterial_drop;
	}
	public void setMeterial_drop(int meterial_drop) {
		this.meterial_drop = meterial_drop;
	}
	@Override
	public String toString() {
		return "MeterialVO [meterial_id=" + meterial_id + ", meterial_name=" + meterial_name + ", meterial_price="
				+ meterial_price + ", meterial_description=" + meterial_description + ", meterial_image="
				+ meterial_image + ", meterial_delivery=" + meterial_delivery + ", meterial_register="
				+ meterial_register + ", meterial_click=" + meterial_click + ", meterial_selling=" + meterial_selling
				+ ", meterial_drop=" + meterial_drop + "]";
	}
	
	
}
