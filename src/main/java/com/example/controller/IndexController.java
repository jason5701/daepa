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
	
	//전체상품 카테고리
	@RequestMapping("all_product") 
	public String all_product(Model model){
		model.addAttribute("pageName", "product/all/list.jsp");
		return "/index";
	}
	
	//전체상품-1인밀키트,완제품
	@RequestMapping("/all/meal") 
	public String meal(Model model){
		model.addAttribute("pageName", "product/all/meal.jsp");
		return "/index";
	}
	
	//전체상품-육류
	@RequestMapping("/all/meat") 
	public String meat(Model model){
		model.addAttribute("pageName", "product/all/meat.jsp");
		return "/index";
	}
	
	//전체상품-해산물
	@RequestMapping("/all/sea") 
	public String sea(Model model){
		model.addAttribute("pageName", "product/all/sea.jsp");
		return "/index";
	}
	
	//전체상품-채소,야채
	@RequestMapping("/all/vegetable") 
	public String vegetable(Model model){
		model.addAttribute("pageName", "product/all/vegetable.jsp");
		return "/index";
	}
	
	//전체상품-양념,조미료
	@RequestMapping("/all/seasoning") 
	public String seasoning(Model model){
		model.addAttribute("pageName", "product/all/seasoning.jsp");
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