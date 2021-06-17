package com.example.domain;

import java.util.Date;

public class SuggestionVO extends UserVO{
	private String suggestion_number;
	private String suggestion_title;
	private String suggestion_contents;
	private Date suggestion_write_date;
	private int suggestion_click;
	
	public int getSuggestion_click() {
		return suggestion_click;
	}
	public void setSuggestion_click(int suggestion_click) {
		this.suggestion_click = suggestion_click;
	}
	public String getSuggestion_number() {
		return suggestion_number;
	}
	public void setSuggestion_number(String suggestion_number) {
		this.suggestion_number = suggestion_number;
	}
	public String getSuggestion_title() {
		return suggestion_title;
	}
	public void setSuggestion_title(String suggestion_title) {
		this.suggestion_title = suggestion_title;
	}
	public String getSuggestion_contents() {
		return suggestion_contents;
	}
	public void setSuggestion_contents(String suggestion_contents) {
		this.suggestion_contents = suggestion_contents;
	}
	
	
	public Date getSuggestion_write_date() {
		return suggestion_write_date;
	}
	public void setSuggestion_write_date(Date suggestion_write_date) {
		this.suggestion_write_date = suggestion_write_date;
	}
	@Override
	public String toString() {
		return "SuggestionVO [suggestion_number=" + suggestion_number + ", suggestion_title=" + suggestion_title
				+ ", suggestion_contents=" + suggestion_contents + ", suggestion_write_date=" + suggestion_write_date
				+ ", suggestion_click=" + suggestion_click + "]";
	}
	
}
