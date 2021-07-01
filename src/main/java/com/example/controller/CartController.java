package com.example.controller;

import java.util.ArrayList;
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
	public String cart_list(Model model, HttpSession session) throws Exception{
		UserVO user=(UserVO)session.getAttribute("user_info");
		if(user != null){
			String user_id=user.getUser_id();
			List<CartVO> cartList=cart_service.cart_list(user_id);
			
			int fee=0;
			int total=cart_service.cart_total(user_id);
			if(total == 0){
				fee=0;
			}else{
				fee=total >= 50000 ? 0 : 2500;
			}
			
			model.addAttribute("pageName", "cart/list.jsp");
			model.addAttribute("cartList", cartList);
			model.addAttribute("total", total);
			model.addAttribute("fee", fee);
		}else if(session == null || user == null){
			return "redirect:/user/login";
		}
		return "/index";
	}
	
	//장바구니 담기
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public int insert(CartVO vo, HttpSession session) throws Exception{
		UserVO user=(UserVO)session.getAttribute("user_info");
		
		int result=0;
		if(user != null){
			vo.setUser_id(user.getUser_id());
			
			int count=cart_service.cart_count(vo.getProduct_id(), vo.getUser_id());
			if(count == 0){
				cart_service.cart_insert(vo);
				result=1;
			}else{
				result=2;
				cart_service.cart_update_qtt(vo);
			}
		}
		return result;
	}
	
	//장바구니 삭제
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int cart_number) throws Exception{
		cart_service.cart_delete(cart_number);
	}
	
	//장바구니 수정
	@RequestMapping("update")
	public String update(CartVO vo, HttpSession session) throws Exception{
		UserVO user=(UserVO)session.getAttribute("user_info");
		List<CartVO> cartList=cart_service.cart_list(user.getUser_id());
		
		for(CartVO cart:cartList){
			if(vo.getProduct_id().equals(cart.getProduct_id())){
				vo.setUser_id(user.getUser_id());
				cart_service.cart_update(vo);
			}
		}
		return "redirect:/cart/list";
	}

}
