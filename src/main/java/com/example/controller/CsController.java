package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs/")
public class CsController {
	
	@RequestMapping("notice") //공지사항
	public String cs_notice(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		//model.addAttribute("rightContent", "commonQA/list.jsp"); 공지사항.jsp추가
		return "/index";
	}
	
	@RequestMapping("commonQA") //자주하는질문
	public String cs_commonqa(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		model.addAttribute("rightContent", "commonQA/list.jsp");
		return "/index";
	}
	
	@RequestMapping("realtime") //공구채팅
	public String cs_realtime(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		//model.addAttribute("rightContent", "commonQA/list.jsp"); 공구채팅.jsp추가
		return "/index";
	}
	
	@RequestMapping("suggestion") //제안하기
	public String cs_suggestion(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		//model.addAttribute("rightContent", "commonQA/list.jsp"); 제안하기.jsp추가
		return "/index";
	}
	
}
