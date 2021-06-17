package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@RequestMapping("all")
	public String login(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		return "/index";
	}
}
