package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.CartVO;
import com.example.domain.UserVO;
import com.example.service.CartService;

@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired
	CartService cart_service;
	
	//장바구니 목록
	@RequestMapping("list") 
	public String cart_list(Model model, HttpSession session, HttpServletResponse response) throws Exception{
		UserVO user=(UserVO)session.getAttribute("vo");
		if(user != null){
			String user_id=user.getUser_id();
			List<CartVO> cartList=cart_service.cart_list(user_id);
			model.addAttribute("pageName", "cart/list.jsp");
			model.addAttribute("cartList", cartList);
		}else if(session == null || user == null){
			return "redirect:/user/login";
		}
		
		return "/index";
	}
	
	//장바구니 담기
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public int insert(CartVO vo, HttpSession session) throws Exception{
		
		int result=0;
		UserVO user=(UserVO)session.getAttribute("vo");
		
		if(user != null){
			vo.setUser_id(user.getUser_id());
			cart_service.cart_insert(vo);
			result=1;
		}
		return result;
	}

}
