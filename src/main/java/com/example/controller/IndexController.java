package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("pageName", "indexList.jsp");
		return "/index";
	}
	
	@RequestMapping("all_product")
	public String all_product(Model model){
		model.addAttribute("pageName", "all/list.jsp");
		return "/index";
	}
	
	@RequestMapping("group_product")
	public String group_product(Model model){
		model.addAttribute("pageName", "group/list.jsp");
		return "/index";
	}
	
	@RequestMapping("detail")
	public String detail(Model model){
		model.addAttribute("pageName", "detail/detail.jsp");
		return "/index";
	}
	
}
