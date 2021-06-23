package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.HotdealVO;
import com.example.domain.PageMaker;
import com.example.persistence.HotdealDAO;

@Controller
@RequestMapping("/admin/")
public class HotDealContorller {
	@Autowired
	HotdealDAO hotdeal_dao;
	
	@RequestMapping("hotdeal.json")
	@ResponseBody
	public Map<String,Object> hotdeal_json(Criteria cri)throws Exception{
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(30);
		map.put("list", hotdeal_dao.hotdeal(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
	@RequestMapping("hotdeal_detail.json")
	@ResponseBody
	public List<HotdealVO> hotdeal_detail_json(int hotdeal_number)throws Exception{
		return hotdeal_dao.hotdeal_detail(hotdeal_number);
	}
	
	@RequestMapping("hotDeal")
	public String hotdeal_main(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "hotDeal/list.jsp");
		return "/index";
	}
}
