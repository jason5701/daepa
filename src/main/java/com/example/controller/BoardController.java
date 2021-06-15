package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.persistence.CommonQADAO;
import com.example.persistence.NoticeDAO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	NoticeDAO notice_dao;
	
	@RequestMapping("notice.json")
	@ResponseBody
	public HashMap<String,Object> noticeList(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(3);
		map.put("list", notice_dao.list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(230);
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping(value="notice_insert")
	public String notice_insert(Model model)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "notice/insert.jsp");
		int code=(notice_dao.notice_code()+1);
		model.addAttribute("code",code);
		return "/index";
	}
	
	@RequestMapping(value="notice_insert",method=RequestMethod.POST)
	@ResponseBody
	public String notice_insert_post()throws Exception{
		return "redirect:/admin/main";
	}
	
	@RequestMapping(value="notice_update",method=RequestMethod.POST)
	@ResponseBody
	public String notice_update(NoticeVO vo)throws Exception{
		System.out.println("업데이트 vo확인......"+vo.toString());
		notice_dao.update(vo);
		
		return "redirect:admin/main";
	}
	
	@RequestMapping("notice_read")
	public String notice_read(Model model,int notice_number)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "notice/read.jsp");
		model.addAttribute("vo", notice_dao.read(notice_number));
		return "/index";
	}
	
	@Autowired
	CommonQADAO commonQA_dao;
	
	@RequestMapping("commonQA.json")
	@ResponseBody
	public HashMap<String,Object> commonQAList(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("list", commonQA_dao.list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(230);
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
}
