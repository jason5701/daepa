package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardQAVO extends ProductVO{
	private int boardQA_number;
	private String product_id;
	private String meterial_id;
	private String boardQA_title;
	private String boardQA_contents;
	private String boardQA_writer;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date boardQA_write_date;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date boradQA_modify_date;
	private int boardQA_click;
	private String answer_writer;
	private String answer_contents;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private String answer_write_date;
	public int getBoardQA_number() {
		return boardQA_number;
	}
	public void setBoardQA_number(int boardQA_number) {
		this.boardQA_number = boardQA_number;
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
	public String getAnswer_writer() {
		return answer_writer;
	}
	public void setAnswer_writer(String answer_writer) {
		this.answer_writer = answer_writer;
	}
	public String getAnswer_contents() {
		return answer_contents;
	}
	public void setAnswer_contents(String answer_contents) {
		this.answer_contents = answer_contents;
	}
	public String getAnswer_write_date() {
		return answer_write_date;
	}
	public void setAnswer_write_date(String answer_write_date) {
		this.answer_write_date = answer_write_date;
	}
	@Override
	public String toString() {
		return "BoardQAVO [boardQA_number=" + boardQA_number + ", product_id=" + product_id + ", meterial_id="
				+ meterial_id + ", boardQA_title=" + boardQA_title + ", boardQA_contents=" + boardQA_contents
				+ ", boardQA_writer=" + boardQA_writer + ", boardQA_write_date=" + boardQA_write_date
				+ ", boradQA_modify_date=" + boradQA_modify_date + ", boardQA_click=" + boardQA_click
				+ ", answer_writer=" + answer_writer + ", answer_contents=" + answer_contents + ", answer_write_date="
				+ answer_write_date + "]";
	}
}
