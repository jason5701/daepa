package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.persistence.GroupSalesDAO;
import com.example.persistence.MeterialDAO;
import com.example.persistence.ProductDAO;
import com.example.service.MeterialService;
import com.example.service.ProductService;

@Controller
public class IndexController {
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	MeterialDAO meterial_dao;
	
	@Autowired
	GroupSalesDAO group_dao;
	
	@Autowired
	ProductService product_service;
	
	@Autowired
	MeterialService meterial_service;
	
	//인덱스
	@RequestMapping("index") 
	public String index(Model model){
		model.addAttribute("pageName", "indexList.jsp");
		return "/index";
	}	
	
	
	//전체상품-1인밀키트
	@RequestMapping("/meals") 
	public String all_product(Model model,String searchType){
		model.addAttribute("pageName", "product/meal/container.jsp");
		model.addAttribute("product_list", "meal_category/each_meal_list.jsp");
		String type[]={"전체","육류","해산물","면/밀가루"};
		model.addAttribute("type", type);
		model.addAttribute("searchType", searchType);
		return "/index";
	}
	
	//전체상품-채소,야채
	@RequestMapping("/veges") 
	public String vegetable(Model model,String searchType){
		model.addAttribute("pageName", "product/vege/container.jsp");
		model.addAttribute("product_list", "vege_category/each_vege_list.jsp");
		String type[]={"전체","초록","빨강","보라","하양"};
		model.addAttribute("type", type);
		model.addAttribute("searchType", searchType);
		return "/index";
	}
	
	//공동구매 카테고리
	@RequestMapping("group_product") 
	public String group_product(Model model){
		model.addAttribute("pageName", "product/group/list.jsp");
		return "/index";
	}
	
	//전체상품 카테고리->밀 상세페이지
	@RequestMapping("meal_detail") 
	public String mealdetail(Model model,String product_id)throws Exception{
		model.addAttribute("pageName", "product/detail/meal_detail/meal_detail.jsp");
		model.addAttribute("product_review", "review/plist.jsp");
		model.addAttribute("product_div", "meal_read_div.jsp");
		////////////////////////20210702윤선이 수정수정 !!!
		model.addAttribute("product_boardQA_list", "productQA/product_boardQA_list.jsp");
		
		model.addAttribute("vo", product_service.read(product_id));
		model.addAttribute("vo", product_dao.read(product_id));
		return "/index";
	}
	
	//전체상품 카테고리->채소 상세페이지
	@RequestMapping("vege_detail") 
	public String vege_detail(Model model,String meterial_id)throws Exception{
		model.addAttribute("pageName", "product/detail/vege_detail/vege_detail.jsp");
		model.addAttribute("meterial_review", "review/mlist.jsp");
		model.addAttribute("product_div", "vege_read_div.jsp");
		model.addAttribute("vo", meterial_service.read(meterial_id));
		return "/index";
	}
	
	//전체상품 카테고리->나눔판매 상세페이지
	@RequestMapping("group_detail") 
	public String group_detail(Model model,String sales_id)throws Exception{
		model.addAttribute("pageName", "product/detail/group_detail/group_detail.jsp");
		model.addAttribute("product_div", "group_read_div.jsp");
		model.addAttribute("vo", group_dao.read(sales_id));
		return "/index";
	}
}