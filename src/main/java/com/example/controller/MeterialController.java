package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.MeterialDAO;

@Controller
@RequestMapping("/meterial/")
public class MeterialController {
	@Autowired
	MeterialDAO meterial_dao;
	
	@RequestMapping("meterial.json")
	@ResponseBody
	public Map<String,Object> meterial_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(meterial_dao.totalCount(cri));
		
		map.put("list", meterial_dao.list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
	@RequestMapping("admin_meterial.json")
	@ResponseBody
	public Map<String,Object> admin_meterial_list(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(10);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(meterial_dao.totalCount(cri));
		
		map.put("list", meterial_dao.admin_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
}
