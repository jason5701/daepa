package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.UserVO;
import com.example.persistence.UserDAO;

@Controller
@RequestMapping("/user/")
public class RegisterController {
	
	@Autowired
	UserDAO dao;
	   
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping("register")
	public String register(Model model){
		model.addAttribute("pageName","user/register.jsp");
		return "/index";
	}
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String register(UserVO vo,int year,int month,int day)throws Exception{
		System.out.println("year:" + year + "month:" + month + "day:" + day);
		String birthday=year+"-"+month+"-"+day;
		vo.setUser_birthday(birthday);
		String password=passEncoder.encode(vo.getUser_password());
		vo.setUser_password(password);
		dao.register(vo);
		System.out.println(vo.toString());
		return "/index";
	}
}
