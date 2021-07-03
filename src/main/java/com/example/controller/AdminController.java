package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.AdminVO;
import com.example.domain.MeterialVO;
import com.example.domain.ProductVO;
import com.example.persistence.AdminDAO;
import com.example.persistence.MeterialDAO;
import com.example.persistence.ProductDAO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	String main_list[]={"육류","해산물","면/밀가루"};
	String vege_list[]={"보라","빨강","하양","초록"};
	
	@Autowired
	AdminDAO admin_dao;
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	MeterialDAO meterial_dao;

	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	
	@RequestMapping("main")
	public String admin(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "notice/list.jsp");
		return "/index";
	}
	
	@RequestMapping("commonQA")
	public String commonQA(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "commonQA/list.jsp");
		return "/index";
	}	
	
	//관리자-주문내역 모든 user
	@RequestMapping("orders")
	public String admin_orders(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "orders/list.jsp");
		return "/index";
	}

	@RequestMapping("login")
	public String admin_login(Model model){
		model.addAttribute("pageName", "admin/login.jsp");
		return "/index";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> admin_login(String admin_id,String admin_password,HttpSession session,boolean chkLogin,HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<>();
		int result=0;
		AdminVO admin_vo=admin_dao.admin_login(admin_id);
		if(admin_vo!=null){
			if(admin_vo.getAdmin_password().equals(admin_password)){
				result=1;
				
			}if(chkLogin){
				Cookie cookie=new Cookie("admin_id",admin_vo.getAdmin_id());
				cookie.setPath("/admin/main");
				cookie.setMaxAge(60*60*24*3);
				response.addCookie(cookie);
			}
			session.setAttribute("admin_id", admin_vo.getAdmin_id());
			String path=(String) session.getAttribute("path");
			if(path==null) {
				path="/admin/main";
			}
			map.put("path", path);
		}else{
			result=2;
		}
		map.put("vo", admin_vo);
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("logout")
	public String admin_logout(Model model,HttpSession session,HttpServletResponse response, HttpServletRequest request){
		session.invalidate();
		Cookie cookie=WebUtils.getCookie(request, "admin_id");
		if(cookie!=null){
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/index";
	}
	//관리자-완제품관리
	@RequestMapping("product")
	public String product_manage(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "product/manage.jsp");
		model.addAttribute("main_list", main_list);
		return "/index";
	}
	//관리자-완제품-추가
	@RequestMapping("product_insert")
	public String meal_insert(Model model,ProductVO vo)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "product/meal/insert.jsp");
		String newProduct_id="M"+(Integer.parseInt(product_dao.getProduct_id().substring(1))+1);
		model.addAttribute("new_id", newProduct_id);
		model.addAttribute("main_list", main_list);
		return "/index";
	}

	//관리자-완제품-리드
	@RequestMapping("admin_product_read")
	public String admin_meal_read(Model model,String product_id)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "product/meal_read.jsp");
		model.addAttribute("vo", product_dao.read(product_id));
		model.addAttribute("main_list", main_list);
		return "/index";
	}
	
	//관리자-재료 관리
	@RequestMapping("meterial")
	public String meterial_manage(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "meterial/manage.jsp");
		return "/index";
	}
	
	//관리자-재료-추가
	@RequestMapping("meterial_insert")
	public String vege_insert(Model model,MeterialVO vo)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "meterial/vege/insert.jsp");
		String newMeterial_id="N"+(Integer.parseInt(meterial_dao.getMetrial_id().substring(1))+1);
		model.addAttribute("new_id", newMeterial_id);
		model.addAttribute("vege_list", vege_list);
		return "/index";
	}
	
	//관리자-재료-리드
	@RequestMapping("admin_meterial_read")
	public String admin_vege_read(Model model,String meterial_id)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "meterial/vege_read.jsp");
		model.addAttribute("vo", meterial_dao.read(meterial_id));
		model.addAttribute("vege_list", vege_list);
		return "/index";
	}
	
	
	//관리자-분석
	@RequestMapping("analyze")
	public String analyze(Model model){
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "analyze/chart.jsp");
		return "/index";
	}
}
