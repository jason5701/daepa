package com.example.domain;

public class FavVO extends MeterialAndProductVO{
 public int favorite_number;
 public String user_id;
 public String product_id;
 public String meterial_id;
public int getFavorite_number() {
	return favorite_number;
}
public void setFavorite_number(int favorite_number) {
	this.favorite_number = favorite_number;
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
public String getMeterial_id() {
	return meterial_id;
}
public void setMeterial_id(String meterial_id) {
	this.meterial_id = meterial_id;
}
@Override
public String toString() {
	return "FavVO [favorite_number=" + favorite_number + ", user_id=" + user_id + ", product_id=" + product_id
			+ ", meterial_id=" + meterial_id + "]";
}
 

}
