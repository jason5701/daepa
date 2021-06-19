package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CsController {
	
	@RequestMapping("cs_service") //∞Ì∞¥ºæ≈Õ
	public String cs_service(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		return "/index";
	}
}
