package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.SearchDAO;

@Controller
@RequestMapping("/search/")
public class SearchController {
	
	@Autowired
	SearchDAO search_dao;
	
	//검색결과
	@RequestMapping("list") 
	public String search_list(Model model){
		model.addAttribute("pageName", "search/search.jsp");
		return "/index";
	}
	
	@RequestMapping("search_list.json")
	@ResponseBody
	public Map<String, Object> search_list(Criteria cri) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		
		map.put("plist", search_dao.search_plist(cri));
		map.put("mlist", search_dao.search_mlist(cri));
		
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
}
