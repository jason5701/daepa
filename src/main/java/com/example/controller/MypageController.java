package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("orderList.json")
	@ResponseBody
	public HashMap<String, Object> orderList(Model model,HttpSession session, String user_id, int order_number)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("orderList", purchase_dao.orderList(order_number,user_id));
		
		session.setAttribute("map", map);
		PageMaker pm = new PageMaker();		
		map.put("pm", pm);
		
		return map;
	}
	
	@RequestMapping("orders.json")
	@ResponseBody
	public HashMap<String, Object> orders(Model model,HttpSession session, Criteria cri,String user_id)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		map.put("orders", purchase_dao.orders(user_id, cri));
		
		session.setAttribute("map", map);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		map.put("cri", cri);
		map.put("pm", pm);
		
		return map;
	}
	
	@RequestMapping("orderList")
	public String orderList(){
		return "/mypage/orderList";
	}
	
	@RequestMapping("all")
	public String mypage(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "orderList.jsp");
		return "/index";
	}
	
	@RequestMapping("myFavorite")
	public String my_favorite(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "myFavorite.jsp");
		return "/index";
	}
	
	@RequestMapping("myReview")
	public String my_review(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "myReview.jsp");
		return "/index";
	}
	
	@RequestMapping("myQnA")
	public String login(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "myQnA.jsp");
		return "/index";
	}
	
	@RequestMapping("myInfo")
	public String myInfo(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "myInfo.jsp");
		return "/index";
	}
	
	@RequestMapping("myInfoupdate")
	public String myInfoupdate(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "myInfoupdate.jsp");
		return "/index";
	}
	
}
