package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.persistence.ChartDAO;

@Controller
@RequestMapping("/chart/")
public class ChartController {
	@Autowired
	ChartDAO chart_dao;
	
	@RequestMapping("product_click.json")
	@ResponseBody
	public List<List<Object>> product_click_json()throws Exception{
		List<List<Object>> click_data=new ArrayList<>();
		List<Object> products=new ArrayList<>();
		products.add("상품명");
		products.add("상품조회수");
		click_data.add(products);
		
		for(HashMap<String,Object> map:chart_dao.product_click()){
			products=new ArrayList<>();
			products.add(map.get("product_name"));
			products.add(map.get("product_click"));
			click_data.add(products);
		}
		return click_data;
	}
}
