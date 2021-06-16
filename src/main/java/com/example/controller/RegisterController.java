package com.example.controller;

import java.text.ParseException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UserVO;
import com.example.persistence.UserDAO;
import com.example.service.UserService;

@Controller
@RequestMapping("/user/")
public class RegisterController {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	UserService service;
	
	@Autowired
	SqlSession session;
	   
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@ResponseBody
	@RequestMapping(value="idChk",method=RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception{
		int result = service.idChk(vo);
		return result;
	}
	
	@RequestMapping("registercomplete")
	public String registercomplete(Model model){
		model.addAttribute("pageName","user/registercomplete.jsp");
		return "/index";
	}
	
	@RequestMapping("register")
	public String register(Model model){
		model.addAttribute("pageName","user/register.jsp");
		return "/index";
	}
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String register(UserVO vo)throws Exception{	
		int result=service.idChk(vo);
		try{
			if(result==1){
				return "/user/register";
			}else if(result == 0){
				service.register(vo);
			}
		}catch(Exception e){
			throw new RuntimeException();
		}	
		String password=passEncoder.encode(vo.getUser_password());
		vo.setUser_password(password);
		dao.register(vo);
		System.out.println(vo.toString());
		return "redirect:registercomplete";
	}
}
