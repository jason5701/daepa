package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.persistence.PurchaseDAO;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	PurchaseDAO purchase_dao;
	
	@RequestMapping("/order_List")
	@ResponseBody
	public HashMap<String, Object> order_List(Criteria cri,String user_id)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		map.put("list", purchase_dao.order_List(cri));
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		map.put("cri", cri);
		map.put("pm", pm);
		
		return map;
	}
	
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
