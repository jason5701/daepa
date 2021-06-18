package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@RequestMapping("all")
	public String mypage(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "order_list.jsp");
		return "/index";
	}
	
	@RequestMapping("my_favorite")
	public String my_favorite(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_favorite.jsp");
		return "/index";
	}
	
	@RequestMapping("my_review")
	public String my_review(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_review.jsp");
		return "/index";
	}
	@RequestMapping("my_QnA")
	public String login(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_QnA.jsp");
		return "/index";
	}
	@RequestMapping("my_info")
	public String my_info(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_info.jsp");
		return "/index";
	}
	@RequestMapping("my_infoupdate")
	public String my_infoupdate(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_infoupdate.jsp");
		return "/index";
	}
	
}
