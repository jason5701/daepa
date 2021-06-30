package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		map.put("admin_list", purchase_dao.admin_order_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
	@RequestMapping("admin_purchase_List.json")
	@ResponseBody
	public HashMap<String, Object> admin_purchase_List(Model model, int order_number)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("purchase_List", purchase_dao.admin_purchase_List(order_number));
		
		PageMaker pm = new PageMaker();		
		map.put("pm", pm);
		
		return map;
	}
}
