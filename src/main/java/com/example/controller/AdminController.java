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
import com.example.persistence.AdminDAO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	AdminDAO admin_dao;

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
		AdminVO vo=admin_dao.admin_login(admin_id);
		if(vo!=null){
			if(vo.getAdmin_password().equals(admin_password)){
				result=1;
			}if(chkLogin){
				Cookie cookie=new Cookie("admin_id",vo.getAdmin_id());
				cookie.setPath("/admin/main");
				cookie.setMaxAge(60*60*24*3);
				response.addCookie(cookie);
			}
			session.setAttribute("admin_id", vo.getAdmin_id());
			String path=(String) session.getAttribute("path");
			if(path==null) path="/admin/main";
			map.put("path", path);
		}else{
			result=2;
		}
		map.put("vo", vo);
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
}
