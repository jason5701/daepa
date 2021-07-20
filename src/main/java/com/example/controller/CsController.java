package com.example.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.persistence.NoticeDAO;
import com.example.service.NoticeService;

@Controller
@RequestMapping("/cs/")
public class CsController {
	/*20210701 윤선 수정사항*/
	@Resource(name="uploadPath")
	String path;
	
	/*20210701 윤선 수정사항*/
	@Autowired
	NoticeDAO notice_dao;
	
	@Autowired
	NoticeService notice_service;
	
	@RequestMapping("notice") //공지사항
	public String cs_notice(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");

		/*20210701 윤선 수정사항*/
		model.addAttribute("rightContent", "detail/notice/notice_list.jsp");
		return "/index";
	}
	
	@RequestMapping("notice/read") //공지사항
	   public String cs_notice_read(Model model, int notice_number) throws Exception {
	      model.addAttribute("pageName", "cs/cs_service.jsp");
	      model.addAttribute("leftMenu", "cs_menu.jsp");
	      model.addAttribute("vo", notice_service.read(notice_number));
	      /*20210701 윤선 수정사항*/
	      model.addAttribute("rightContent", "detail/notice/notice_read.jsp");
	      
	      return "/index";
	   }

	
	@RequestMapping("commonQA") //자주하는질문
	public String cs_commonqa(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		model.addAttribute("rightContent", "commonQA/list.jsp");
		return "/index";
	}
	
	@RequestMapping("realtime") //공구채팅
	public String cs_realtime(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		model.addAttribute("rightContent", "realtime/chat.jsp");
		return "/index";
	}
	
	@RequestMapping("suggestion") //제안하기
	public String cs_suggestion(Model model) throws Exception {
		model.addAttribute("pageName", "cs/cs_service.jsp");
		model.addAttribute("leftMenu", "cs_menu.jsp");
		//model.addAttribute("rightContent", "commonQA/list.jsp"); 제안하기.jsp추가
		return "/index";
	}
	
}
