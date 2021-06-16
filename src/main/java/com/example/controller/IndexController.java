package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("index") //인덱스
	public String index(Model model){
		model.addAttribute("pageName", "indexList.jsp");
		return "/index";
	}
	
	@RequestMapping("cs_service") //고객센터
	public String cs_service(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		return "/index";
	}
	
	@RequestMapping("all_product") //전체상품 카테고리
	public String all_product(Model model){
		model.addAttribute("pageName", "all/list.jsp");
		return "/index";
	}
	
	@RequestMapping("group_product") //공동구매 카테고리
	public String group_product(Model model){
		model.addAttribute("pageName", "group/list.jsp");
		return "/index";
	}
	
	@RequestMapping("detail") //전체상품 카테고리->상품상세페이지
	public String detail(Model model){
		model.addAttribute("pageName", "detail/detail.jsp");
		return "/index";
	}
	
}
