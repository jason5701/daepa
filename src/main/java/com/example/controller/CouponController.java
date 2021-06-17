package com.example.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CouponVO;
import com.example.persistence.CouponDAO;

@Controller
@RequestMapping("/coupon/")
public class CouponController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	CouponDAO coupon_dao;
	
	@RequestMapping("admin")
	public String admin_coupon(Model model)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "coupon/list.jsp");
		
		model.addAttribute("list", coupon_dao.admin_list());
		return "/index";
	}
	
	@RequestMapping("read_set")
	public String coupon_read(Model model,String coupon_id)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "coupon/read.jsp");
		
		model.addAttribute("vo", coupon_dao.admin_read(coupon_id));
		return "/index";
	}
	
	@RequestMapping(value="admin_update",method=RequestMethod.POST)
	public String coupon_update(CouponVO vo,MultipartHttpServletRequest multi)throws Exception{
		System.out.println("쿠폰 업데이트확인!!!!!!!1"+vo.toString());
		CouponVO oldOne=coupon_dao.admin_read(vo.getCoupon_id());
		
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path+"/"+image));
			vo.setCoupon_image(image);
			if(oldOne.getCoupon_image()!=null){
				new File(path+"/"+oldOne.getCoupon_image()).delete();
			}
		}else{
			vo.setCoupon_image(oldOne.getCoupon_image());
		}
		coupon_dao.admin_update(vo);
		return "redirect:/coupon/admin";
	}
	
	@RequestMapping("admin_insert")
	public String coupon_insert(Model model)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "coupon/insert.jsp");
		int code=120+coupon_dao.coupon_id()+1;
		String coupon_id="C"+code;
		model.addAttribute("coupon_id", coupon_id);
		return "/index";
	}
	
	@RequestMapping(value="admin_insert",method=RequestMethod.POST)
	public String admin_insert(CouponVO vo,MultipartHttpServletRequest multi)throws Exception{
		System.out.println("쿠폰 발행!!!!!!!"+vo.toString());
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path+"/"+image));
			vo.setCoupon_image(image);
		}
		coupon_dao.admin_insert(vo);
		return "redirect:/coupon/admin";
	}
}
