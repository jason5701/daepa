package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.PurchaseDAO;

@Controller
@RequestMapping("/order/")
public class OrderController {
	@Autowired
	PurchaseDAO purchase_dao;
	
	@RequestMapping("admin_list.json")
	@ResponseBody
	public Map<String,Object> admin_order_list(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<>();
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(5);
		pm.setCri(cri);
		pm.setTotalCount(120);
		map.put("list", purchase_dao.admin_order_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
}
