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
import com.example.domain.PurchaseVO;
import com.example.domain.UserVO;
import com.example.persistence.PurchaseDAO;
import com.example.persistence.UserDAO;
import com.example.service.CartService;
import com.example.service.OrderService;
import com.example.service.ProductService;

@Controller
@RequestMapping("/order/")
public class OrderController {
	
	@Autowired
	PurchaseDAO purchase_dao;
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	CartService cart_service;
	
	@Autowired
	ProductService product_service;

	@RequestMapping("update_orderstatus")
	public void update_orderstatus(String order_number,OrderVO ordervo){
		String order_status = ordervo.getOrder_status();
		ordervo.setOrder_status(order_status);
	}
	
	
	//주문서 입력
	@RequestMapping("form")
	public String order_form(Model model, HttpSession session) throws Exception{
		model.addAttribute("pageName", "order/form.jsp");
		
		UserVO user=(UserVO)session.getAttribute("user_info");
		
		if(user != null){
			String user_id=user.getUser_id();
			UserVO userinfo=user_dao.login(user);
			
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
	
	//주문자정보 추가
	@RequestMapping(value="order_insert", method=RequestMethod.POST)
	@ResponseBody
	public int order_insert(OrderVO vo, HttpSession session, Model model) throws Exception{
		UserVO user=(UserVO)session.getAttribute("user_info");
		vo.setUser_id(user.getUser_id());
		purchase_dao.order_insert(vo);
				
		int max_order=purchase_dao.max_order_number();
		return max_order;
	}
	
	//판매(상품)정보 추가
	@RequestMapping(value="purchase_insert", method=RequestMethod.POST)
	@ResponseBody
	public void purchase_insert(PurchaseVO vo, HttpSession session) throws Exception{
		UserVO user=(UserVO)session.getAttribute("user_info");		
		//purchase_dao.purchase_insert(vo);
		String product_id=vo.getProduct_id();
		product_service.updateProduct_selling(vo, product_id);	
	}
	
	@RequestMapping("admin_list.json")
	@ResponseBody
	public Map<String,Object> admin_order_list(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<>();
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(5);
		pm.setCri(cri);
		pm.setTotalCount(120);
		map.put("admin_list", purchase_dao.admin_order_list(cri));
		map.put("pm", pm);
		map.put("cri", cri);
		return map;
	}
	
	@RequestMapping("admin_purchase_List.json")
	@ResponseBody
	public HashMap<String, Object> admin_purchase_List(Model model, int order_number)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("purchase_List", purchase_dao.admin_purchase_List(order_number));
		
		PageMaker pm = new PageMaker();		
		map.put("pm", pm);
		
		return map;
	}
}
