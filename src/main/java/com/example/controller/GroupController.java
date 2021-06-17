package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.MeterialVO;
import com.example.domain.PageMaker;
import com.example.persistence.GroupSalesDAO;

@Controller
@RequestMapping("/group_sell/")
public class GroupController {
	@Autowired
	GroupSalesDAO group_dao;
	
	@RequestMapping("sales_list.json")
	@ResponseBody
	public Map<String,Object> group_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<>();
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(20);
		pm.setCri(cri);
		pm.setTotalCount(200);
		map.put("list", group_dao.list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
}
