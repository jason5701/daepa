package com.example.domain;

public class HotdealVO extends HotdealAndProductVO{
	private int hotdeal_number;
	private String hotdeal_start;
	private String hotdeal_end;
	private String hotdeal_contents;
	private String hotdeal_title;
	private String hotdeal_writer;
	
	public String getHotdeal_writer() {
		return hotdeal_writer;
	}
	public void setHotdeal_writer(String hotdeal_writer) {
		this.hotdeal_writer = hotdeal_writer;
	}
	public int getHotdeal_number() {
		return hotdeal_number;
	}
	public void setHotdeal_number(int hotdeal_number) {
		this.hotdeal_number = hotdeal_number;
	}
	public String getHotdeal_start() {
		return hotdeal_start;
	}
	public void setHotdeal_start(String hotdeal_start) {
		this.hotdeal_start = hotdeal_start;
	}
	public String getHotdeal_end() {
		return hotdeal_end;
	}
	public void setHotdeal_end(String hotdeal_end) {
		this.hotdeal_end = hotdeal_end;
	}
	public String getHotdeal_contents() {
		return hotdeal_contents;
	}
	public void setHotdeal_contents(String hotdeal_contents) {
		this.hotdeal_contents = hotdeal_contents;
	}
	public String getHotdeal_title() {
		return hotdeal_title;
	}
	public void setHotdeal_title(String hotdeal_title) {
		this.hotdeal_title = hotdeal_title;
	}
	@Override
	public String toString() {
		return "HotdealVO [hotdeal_number=" + hotdeal_number + ", hotdeal_start=" + hotdeal_start + ", hotdeal_end="
				+ hotdeal_end + ", hotdeal_contents=" + hotdeal_contents + ", hotdeal_title=" + hotdeal_title
				+ ", hotdeal_writer=" + hotdeal_writer + "]";
	}
	
}
