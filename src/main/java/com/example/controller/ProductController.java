package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.ProductDAO;

@Controller
@RequestMapping("/product/")
public class ProductController {
	@Autowired
	ProductDAO product_dao;
	
	@RequestMapping("admin_product.json")
	@ResponseBody
	public Map<String, Object> admin_product_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(10);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(product_dao.totalCount(cri));
		map.put("list", product_dao.admin_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}

	@RequestMapping("product.json")
	@ResponseBody
	public Map<String, Object> product_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(product_dao.totalCount(cri));
		map.put("list", product_dao.list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
}
