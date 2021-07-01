package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CsController {
	
	@RequestMapping("cs_service") //������
	public String cs_service(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		model.addAttribute("rightContent", "commonQA/list.jsp");
		model.addAttribute("rightContent", "realtime/chat.jsp");
		return "/index";
	}
}
