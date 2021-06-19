package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	//인덱스
	@RequestMapping("index") 
	public String index(Model model){
		model.addAttribute("pageName", "indexList.jsp");
		return "/index";
	}
	
	//전체상품-1인밀키트
	@RequestMapping("/meals") 
	public String all_product(Model model){
		model.addAttribute("pageName", "product/meal/container.jsp");
		model.addAttribute("product_list", "meal_category/each_meal_list.jsp");
		String type[]={"전체","육류","해산물","면/밀가루"};
		model.addAttribute("type", type);
		return "/index";
	}
	
	//전체상품-채소,야채
	@RequestMapping("/veges") 
	public String vegetable(Model model){
		model.addAttribute("pageName", "product/vege/container.jsp");
		model.addAttribute("product_list", "vege_category/each_vege_list.jsp");
		return "/index";
	}
	
	//공동구매 카테고리
	@RequestMapping("group_product") 
	public String group_product(Model model){
		model.addAttribute("pageName", "product/group/list.jsp");
		return "/index";
	}
	
	//전체상품 카테고리->상품상세페이지
	@RequestMapping("detail") 
	public String detail(Model model){
		model.addAttribute("pageName", "product/detail/detail.jsp");
		return "/index";
	}
	
}