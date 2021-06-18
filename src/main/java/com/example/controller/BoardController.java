package com.example.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.domain.ReviewVO;
import com.example.persistence.BoardDAO;
import com.example.persistence.CommonQADAO;
import com.example.persistence.NoticeDAO;
import com.example.persistence.SuggestionDAO;
import com.example.service.BoardService;
import com.example.service.SuggestionService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	NoticeDAO notice_dao;

	@Autowired
	BoardDAO review_dao;
	
	@Autowired
	BoardService review_service;
	
	@RequestMapping("review_delete")
	public String review_delete(int review_number) throws Exception{
		ReviewVO vo=review_dao.review_read(review_number);
		if(vo.getReview_image()!=null){
			new File(path + "/" + vo.getReview_image()).delete();
		}
		review_dao.review_delete(review_number);
		return "redirect:/board/review_list";
	}
	
	@RequestMapping("review_list.json")
	@ResponseBody
	public HashMap<String, Object> review_list(Criteria cri) throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(4);
		map.put("list", review_dao.review_list(cri));
				
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(review_dao.totalCount());
		
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping("review_list")
	public String review_list(){
		return "/detail/review/list";
	}
	@RequestMapping("review_insert")
	public String review_insert(Model model)throws Exception{
		String lastNumber=review_dao.lastNumber();
		int review_number=Integer.parseInt(lastNumber.substring(1)) + 1;
		model.addAttribute("review_number",review_number);
		return "/detail/review/insert";
	}
	
	@RequestMapping(value="review_insert", method=RequestMethod.POST)
	public String review_insert(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
		//파일업로드
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setReview_image(image);
		}
		review_dao.review_insert(vo);		
		return "redirect:/board/review_list";
	}
	
	@RequestMapping(value="review_update", method=RequestMethod.POST)
	public String review_update(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
		System.out.println(vo.toString());
		ReviewVO oldVO=review_dao.review_read(vo.getReview_number());
		
		//대표 이미지 파일업로드
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setReview_image(image);
			
			//예전이미지가 존재한다면 삭제
			if(oldVO.getReview_image()!=null){
				new File(path + "/" + oldVO.getReview_image()).delete();
			}
		}else{
			vo.setReview_image(oldVO.getReview_image());
		}
		review_dao.review_update(vo);
		return "redirect:/board/review_list";
	}
	
	@RequestMapping("review_read")
	public String review_read(Model model, int review_number) throws Exception{
		model.addAttribute("vo", review_service.review_read(review_number));
		return "/detail/review/read";
	}
	@RequestMapping("admin_notice.json")
	@ResponseBody
	public HashMap<String,Object> admin_noticeList(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(3);
		map.put("list", notice_dao.admin_list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(230);
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping(value="admin_notice_insert")
	public String admin_notice_insert(Model model)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "notice/insert.jsp");
		int code=(notice_dao.admin_notice_code()+1);
		model.addAttribute("code",code);
		return "/index";
	}
	
	@RequestMapping(value="admin_notice_insert",method=RequestMethod.POST)
	public String admin_notice_insert_post(NoticeVO vo, MultipartHttpServletRequest multi)throws Exception{
		System.out.println("공지사항 insert 확인!!!!!!!!"+vo.toString());
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path+"/"+image));
			vo.setNotice_image(image);
		}
		notice_dao.admin_insert(vo);
		return "redirect:/admin/main";
	}
	
	@RequestMapping(value="admin_notice_update",method=RequestMethod.POST)
	public String admin_notice_update(NoticeVO vo)throws Exception{
		System.out.println("업데이트 vo확인......"+vo.toString());
		notice_dao.admin_update(vo);
		
		return "redirect:/admin/main";
	}
	
	@RequestMapping("admin_notice_read")
	public String admin_notice_read(Model model,int notice_number)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "notice/read.jsp");
		model.addAttribute("vo", notice_dao.admin_read(notice_number));
		return "/index";
	}
	
	@RequestMapping("admin_notice_delete")
	public String admin_notice_delete(int notice_number)throws Exception{
		notice_dao.admin_delete(notice_number);
		return "redirect:/admin/main";
	}
	
	@Autowired
	CommonQADAO commonQA_dao;
	
	@RequestMapping("admin_commonQA.json")
	@ResponseBody
	public HashMap<String,Object> admin_commonQAList(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("list", commonQA_dao.admin_list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(230);
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping(value="admin_commonQA_insert")
	public String admin_commonQA_insert(Model model)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "commonQA/insert.jsp");
		int code=(commonQA_dao.admin_commonQA_code()+1);
		model.addAttribute("code",code);
		return "/index";
	}
	
	@RequestMapping(value="admin_commonQA_insert",method=RequestMethod.POST)
	public String admin_commonQA_insert_post(CommonQAVO vo)throws Exception{
		System.out.println("자주하는질문 insert 확인!!!!!!!!"+vo.toString());
		
		commonQA_dao.admin_insert(vo);
		return "redirect:/admin/commonQA";
	}
	
	@Autowired
	SuggestionDAO suggestion_dao;
	
	@Autowired
	SuggestionService suggestion_service;
	
	@RequestMapping("suggestion")
	public String suggestion(Model model,Criteria cri)throws Exception{
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(3);
		pm.setCri(cri);
		pm.setDisplayPageNum(2);
		pm.setTotalCount(suggestion_dao.suggestion_count());
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "suggestion/list.jsp");
		model.addAttribute("list", suggestion_dao.list(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pm", pm);
		return "/index";
	}
	
	@RequestMapping("suggestion_read")
	public String suggestion_read(Model model,int suggestion_number)throws Exception{
		model.addAttribute("pageName", "admin/main.jsp");
		model.addAttribute("rightPage", "suggestion/read.jsp");
		model.addAttribute("vo", suggestion_service.read_confirm(suggestion_number));
		return "/index";
	}
}
