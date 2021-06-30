package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CartVO;
import com.example.domain.Criteria;
import com.example.domain.OrderVO;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.persistence.PurchaseDAO;
import com.example.persistence.UserDAO;
import com.example.service.CartService;

@Controller
@RequestMapping("/order/")
public class OrderController {
	
	@Autowired
	PurchaseDAO purchase_dao;
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	CartService cart_service;
	
	@RequestMapping("form")
	public String order_form(Model model, HttpSession session) throws Exception{
		model.addAttribute("pageName", "order/form.jsp");
		
		UserVO user=(UserVO)session.getAttribute("vo");
		
		if(user != null){
			String user_id=user.getUser_id();
			UserVO userinfo=user_dao.read(user_id);
			
			List<CartVO> cartList=cart_service.cart_list(user_id);
			
			int fee=0;
			int total=cart_service.cart_total(user_id);
			if(total == 0){
				fee=0;
			}else{
				fee=total >= 50000 ? 0 : 2500;
			}
			model.addAttribute("userinfo", userinfo);
			model.addAttribute("cartList", cartList);
			model.addAttribute("total", total);
			model.addAttribute("fee", fee);
		}else if(session == null || user == null){
			return "redirect:/user/login";
		}
		return "/index";
	}
	
	@RequestMapping(value="order_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_insert(OrderVO vo) throws Exception{
		
	}
	
	@RequestMapping("admin_list.json")
	@ResponseBody
	public Map<String,Object> admin_order_list(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<>();
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(5);
		pm.setCri(cri);
		pm.setTotalCount(120);
		map.put("list", purchase_dao.admin_order_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
}
