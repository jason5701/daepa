package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.GroupSalesDAO;

@Controller
@RequestMapping("/group/")
public class GroupController {
	@Autowired
	GroupSalesDAO group_dao;
	
	@RequestMapping("sales")
	public String group_sales_management(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "nanum/group_manage.jsp");
		return "/index";
	}
}
