package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.FavVO;
import com.example.domain.UserVO;
import com.example.service.FavoriteService;

@Controller
@RequestMapping("/favorite/")
public class FavoriteController {
	
	@Autowired
	   FavoriteService favorite_service;
	
	 //Âò ¸ñ·Ï
	   @RequestMapping("list") 
	   public String favorite_list(Model model, HttpSession session) throws Exception{
	      UserVO user=(UserVO)session.getAttribute("vo");
	      if(user != null){
	         String user_id=user.getUser_id();
	         
	         List<FavVO> productflist=favorite_service.product_favorite_list(user_id);
	         List<FavVO> meterialflist=favorite_service.meterial_favorite_list(user_id);
	         
	         model.addAttribute("pageName", "favorite/list.jsp");
	         model.addAttribute("productflist",productflist);
	         model.addAttribute("meterialflist",meterialflist);
	         
	      }else if(session == null || user == null){
	         return "redirect:/user/login";
	      }
	      return "/index";
	   }
	   
	   //Âò¸ñ·Ï ´ã±â
	   @RequestMapping(value="insert", method=RequestMethod.POST)
	   @ResponseBody
	   public void insert(FavVO vo, HttpSession session) throws Exception{
	      UserVO user=(UserVO)session.getAttribute("vo");
	      vo.setUser_id(user.getUser_id());
	      
	      favorite_service.product_favorite_insert(vo);
	      favorite_service.meterial_favorite_insert(vo);
	   }
	   
	   
	//ÂòÇÑ¸ñ·Ï »èÁ¦
	   @RequestMapping(value="delete", method=RequestMethod.POST)
	   @ResponseBody
	   public void delete(int favorite_number) throws Exception{
	      favorite_service.favorite_delete(favorite_number);
	   }
}
