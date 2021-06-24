package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.OrderVO;
import com.example.domain.PageMaker;
import com.example.domain.PurchaseVO;
import com.example.domain.UserVO;
import com.example.persistence.OrderDAO;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	OrderDAO order_dao;	
	
	@RequestMapping("orderList.json")
	@ResponseBody
	public HashMap<String, Object> orderList(Model model, Criteria cri,String user_id)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		map.put("orderList", order_dao.orderList(user_id,cri));
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(20);
		
		map.put("cri", cri);
		map.put("pm", pm);
		
		return map;
	}
	
	@RequestMapping("orderList")
	public String order_List(){
		return "/mypage/orderList";
	}
	
	@RequestMapping("all")
	public String mypage(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "orderList.jsp");
		return "/index";
	}
	
	@RequestMapping("my_Favorite")
	public String my_favorite(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_Favorite.jsp");
		return "/index";
	}
	
	@RequestMapping("my_Review")
	public String my_review(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_Review.jsp");
		return "/index";
	}
	
	@RequestMapping("my_QnA")
	public String login(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_QnA.jsp");
		return "/index";
	}
	@RequestMapping("my_Info")
	public String my_info(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_Info.jsp");
		return "/index";
	}
	@RequestMapping("my_Infoupdate")
	public String my_infoupdate(Model model){
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "my_Infoupdate.jsp");
		return "/index";
	}
	
}
