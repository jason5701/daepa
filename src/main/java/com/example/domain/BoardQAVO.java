package com.example.domain;

import java.util.Date;

public class BoardQAVO extends ProductVO{
	private int boardQA_number;
	private String boardQA_title;
	private String boardQA_contents;
	private String boardQA_writer;
	private Date boardQA_write_date;
	private Date boradQA_modify_date;
	private int boardQA_click;
	
	public int getBoardQA_number() {
		return boardQA_number;
	}
	public void setBoardQA_number(int boardQA_number) {
		this.boardQA_number = boardQA_number;
	}
	public String getBoardQA_title() {
		return boardQA_title;
	}
	public void setBoardQA_title(String boardQA_title) {
		this.boardQA_title = boardQA_title;
	}
	public String getBoardQA_contents() {
		return boardQA_contents;
	}
	public void setBoardQA_contents(String boardQA_contents) {
		this.boardQA_contents = boardQA_contents;
	}
	public String getBoardQA_writer() {
		return boardQA_writer;
	}
	public void setBoardQA_writer(String boardQA_writer) {
		this.boardQA_writer = boardQA_writer;
	}
	public Date getBoardQA_write_date() {
		return boardQA_write_date;
	}
	public void setBoardQA_write_date(Date boardQA_write_date) {
		this.boardQA_write_date = boardQA_write_date;
	}
	public Date getBoradQA_modify_date() {
		return boradQA_modify_date;
	}
	public void setBoradQA_modify_date(Date boradQA_modify_date) {
		this.boradQA_modify_date = boradQA_modify_date;
	}
	public int getBoardQA_click() {
		return boardQA_click;
	}
	public void setBoardQA_click(int boardQA_click) {
		this.boardQA_click = boardQA_click;
	}
	@Override
	public String toString() {
		return "BoardQAVO [boardQA_number=" + boardQA_number + ", boardQA_title=" + boardQA_title
				+ ", boardQA_contents=" + boardQA_contents + ", boardQA_writer=" + boardQA_writer
				+ ", boardQA_write_date=" + boardQA_write_date + ", boradQA_modify_date=" + boradQA_modify_date
				+ ", boardQA_click=" + boardQA_click + "]";
	}
}
