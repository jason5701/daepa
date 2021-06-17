package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class HotDealContorller {
	@RequestMapping("hotDeal")
	public String hotdeal_main(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "hotDeal/list.jsp");
		return "/index";
	}
}
