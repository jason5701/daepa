package com.example.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.persistence.BoardQADAO;
import com.example.persistence.CommonQADAO;
import com.example.persistence.NoticeDAO;
import com.example.service.NoticeService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	NoticeDAO notice_dao;
	
	/*수정 사항*/
	@Autowired
	BoardQADAO boardQA_dao;
	
	
	@Autowired
	NoticeService notice_service;
	
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
	
	/*공지사항 list -- 유저용*/
	@RequestMapping("notice/list")
	public String list(Model model, Criteria cri) throws Exception{
		cri.setPerPageNum(3);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
	    pm.setTotalCount(notice_dao.totalCount());
		
	    model.addAttribute("pm", pm);
	    model.addAttribute("cri", cri);
		model.addAttribute("list", notice_dao.list(cri));
		return "/detail/notice/list";
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
	
	/*공지사항 read--유저용*/
	@RequestMapping("notice/read")
	public String read(Model model, int notice_number) throws Exception {
		model.addAttribute("vo", notice_service.read(notice_number));
		return "/detail/notice/read";
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

	/*수정 사항--상품문의목록*/
	@RequestMapping("boardQA/boardQA_list")
	public String boardQA_list(Model model, Criteria cri) throws Exception{
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
	    pm.setTotalCount(boardQA_dao.totalCount());
		
	    model.addAttribute("pm", pm);
	    model.addAttribute("cri", cri);
	    model.addAttribute("boardQA_list", boardQA_dao.boardQA_list(cri));
		return "/detail/boardQA/boardQA_list";
	}
	
	/*수정 사항--상품문의 읽어오기*/
	@RequestMapping("boardQA/boardQA_read")
	public String boardQA_read(Model model, int boardQA_number) throws Exception {
		model.addAttribute("vo", boardQA_dao.boardQA_read(boardQA_number));
		return "/detail/boardQA/boardQA_read";
	}

	
}
