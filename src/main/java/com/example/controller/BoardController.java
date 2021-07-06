 

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

import com.example.domain.BoardQAVO;
import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.domain.ReviewVO;
import com.example.persistence.BoardDAO;
import com.example.persistence.BoardQADAO;
import com.example.persistence.CommonQADAO;
import com.example.persistence.MeterialDAO;
import com.example.persistence.NoticeDAO;
import com.example.persistence.ProductDAO;
import com.example.persistence.SuggestionDAO;
import com.example.service.BoardService;
import com.example.service.MeterialService;
import com.example.service.NoticeService;
import com.example.service.ProductService;
import com.example.service.SuggestionService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	NoticeDAO notice_dao;
	
	/*20210701 윤선 수정사항*/
	@Autowired
	NoticeService notice_service;
	
	/*20210701 윤선 수정사항*/
	@Autowired
	BoardQADAO boardQA_dao;

	@Autowired
	BoardDAO review_dao;
	
	@Autowired
	BoardService review_service;
	
	@Autowired
	ProductDAO product_dao;
   
	@Autowired
	ProductService product_service;

	/*20210701 윤선 수정사항*/
	@RequestMapping("notice/list.json")
	@ResponseBody
	public HashMap<String, Object> list_json(Criteria cri) throws Exception{
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(3);
		map.put("notice_hashmap", notice_dao.list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(notice_dao.n_totalCount());
		
		map.put("pm", pm);
		map.put("cri", cri);
		
		return map;
	}
	/*20210701 윤선 수정사항*/
	@RequestMapping("notice/list")
	public String list(Model model, Criteria cri) throws Exception {
		model.addAttribute("list", notice_dao.list(cri)); //("items 이름" , DAO)
		return "/detail/notice/notice_list"; //(jsp 경로)
	}	 
	 
	 
	/*20210701 윤선 수정사항*/
	@RequestMapping("notice/read")
	public String read(Model model, int notice_number) throws Exception { 
		model.addAttribute("vo", notice_service.read(notice_number));	
		return "/cs/detail/notice/notice_read";
	}
	
	/*20210625 수정사항*/
	@RequestMapping("product_boardQA_list.json") //jsp에 있는, ajax으로 url 연결하여 출력. ==> 크롤링과 동일하게 생각하면 됨
	@ResponseBody
	public HashMap<String, Object> product_boardQA_list(Criteria cri) throws Exception{
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(3);
		map.put("list", boardQA_dao.product_boardQA_list(cri));  
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
	    pm.setTotalCount(boardQA_dao.totalCount(cri));
	    
	    map.put("pm", pm);
	    map.put("cri", cri);
		return map;
	}
		
////////////////////////20210702윤선이 수정수정 !!!
@RequestMapping("user_boardQA_list.json") // jsp에 있는, ajax으로 url 연결하여 출력.// ==> 크롤링과 동일하게 생각하면 됨
@ResponseBody
public HashMap<String, Object> user_boardQA_list(Criteria cri) throws Exception {
HashMap<String, Object> map = new HashMap<>();
cri.setPerPageNum(5);
map.put("list", boardQA_dao.user_boardQA_list(cri));

PageMaker pm = new PageMaker();
pm.setCri(cri);
pm.setTotalCount(boardQA_dao.user_totalCount(cri));

map.put("pm", pm);
map.put("cri", cri);
return map;
}

@RequestMapping("boardQA/boardQA_read")
public String product_boardQA_read(Model model, int boardQA_number) throws Exception {
model.addAttribute("vo", boardQA_dao.product_boardQA_read(boardQA_number));
//System.out.println(boardQA_dao.boardQA_read(boardQA_number)) 
return "/product/detail/meal_detail/productQA/product_boardQA_read";
}

///insert
@RequestMapping("product_boardQA_insert")
public String product_boardQA_insert(Model model, String product_id)throws Exception{
String lastNumber=boardQA_dao.lastNumber();
int boardQA_number_1=Integer.parseInt(lastNumber.substring(1)) + 11;
model.addAttribute("boardQA_number",boardQA_number_1);
model.addAttribute("product_id", product_id);
model.addAttribute("aa", product_dao.read(product_id));
return "/product/detail/meal_detail/productQA/product_boardQA_insert";
}

@RequestMapping(value="product_boardQA_insert", method=RequestMethod.POST)
public String product_boardQA_insert(BoardQAVO vo) throws Exception{
boardQA_dao.product_boardQA_insert(vo);		
return "redirect:/meal_detail?product_id=" + vo.getProduct_id();
}
//(/insert)

///update (get)
@RequestMapping(value="product_boardQA_update", method=RequestMethod.GET)
public String product_boardQA_update(Model model,BoardQAVO vo, int boardQA_number) throws Exception{
boardQA_dao.product_boardQA_update(vo);
model.addAttribute("vo", boardQA_dao.product_boardQA_read(boardQA_number));
return "/product/detail/meal_detail/productQA/product_boardQA_reply";
}

//update (post)
@RequestMapping(value="product_boardQA_update", method=RequestMethod.POST)
public String product_boardQA_update(BoardQAVO vo) throws Exception{
boardQA_dao.product_boardQA_update(vo);		
return "redirect:/meal_detail?product_id=" + vo.getProduct_id();
}


	
	
	@RequestMapping("product_review_delete")
	   public String product_review_delete(int review_number) throws Exception{
	      ReviewVO vo=review_dao.product_review_read(review_number);
	      if(vo.getReview_image()!=null){
	         new File(path + "/" + vo.getReview_image()).delete();
	      }
	      review_dao.product_review_delete(review_number);
	      return "redirect:/meal_detail?product_id=" + vo.getProduct_id();
	   }
	   
	   @RequestMapping("product_review_list.json")
	   @ResponseBody
	   public HashMap<String, Object> product_review_list(Criteria cri) throws Exception{
	      HashMap<String, Object> map=new HashMap<String, Object>();
	      cri.setPerPageNum(4);
	      map.put("list", review_dao.product_review_list(cri));
	      
	      PageMaker pm=new PageMaker();
	      pm.setCri(cri);
	      pm.setTotalCount(review_dao.product_totalCount(cri));
	      
	      map.put("cri", cri);
	      map.put("pm", pm);
	      return map;
	   }
	   
	 
	   
		@RequestMapping("product_review_insert")
		public String product_review_insert(Model model, String product_id)throws Exception{
			/*model.addAttribute("pageName", "product/detail/meal_detail/meal_detail.jsp");
			model.addAttribute("product_review", "review/pinsert.jsp");
			model.addAttribute("product_div", "meal_read_div.jsp");
			model.addAttribute("vo", product_service.read(product_id));
			model.addAttribute("vo", product_dao.read(product_id));*/
			String lastNumber=review_dao.lastNumber();
			int last_review_number=Integer.parseInt(lastNumber.substring(1)) + 11;
			model.addAttribute("review_number",last_review_number);   
			model.addAttribute("product_id", product_id);
			return "/product/detail/meal_detail/review/pinsert";
		}
	   
	   @RequestMapping(value="product_review_insert", method=RequestMethod.POST)
	   public String product_review_insert(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
	      //파일업로드
	      MultipartFile file=multi.getFile("file");
	      if(!file.isEmpty()){
	         String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
	         file.transferTo(new File(path + "/" + image));
	         vo.setReview_image(image);
	      }
	      review_dao.product_review_insert(vo);
	      return "redirect:/meal_detail?product_id=" + vo.getProduct_id();
	   }
	   
	   @RequestMapping(value="product_review_update", method=RequestMethod.POST)
	   public String product_review_update(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
	      System.out.println(vo.toString());
	      ReviewVO oldVO=review_dao.product_review_read(vo.getReview_number());
	      
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
	      review_dao.product_review_update(vo);
	      return "redirect:/meal_detail?product_id=" + vo.getProduct_id();
	   }
	   
	   @RequestMapping("product_review_read")
	   public String product_review_read(Model model, int review_number) throws Exception{
	      model.addAttribute("vo", review_service.product_review_read(review_number));
	      return "/detail/review/pread";
	   }
	   
	   @RequestMapping("meterial_review_delete")
	   public String meterial_review_delete(int review_number) throws Exception{
	      ReviewVO vo=review_dao.meterial_review_read(review_number);
	      if(vo.getReview_image()!=null){
	         new File(path + "/" + vo.getReview_image()).delete();
	      }
	      review_dao.product_review_delete(review_number);
	      return "redirect:/vege_detail?meterial_id=" + vo.getMeterial_id();
	   }
	   
	   @RequestMapping("meterial_review_list.json")
	   @ResponseBody
	   public HashMap<String, Object> meterial_review_list(Criteria cri) throws Exception{
	      HashMap<String, Object> map=new HashMap<String, Object>();
	      cri.setPerPageNum(4);
	      map.put("list", review_dao.meterial_review_list(cri));
	      
	      PageMaker pm=new PageMaker();
	      pm.setCri(cri);
	      pm.setTotalCount(review_dao.meterial_totalCount(cri));
	      
	      map.put("cri", cri);
	      map.put("pm", pm);
	      return map;
	   }
	   
	   @Autowired
	   MeterialDAO meterial_dao;
	   
	   @Autowired
	   MeterialService meterial_service;
	   
	   @RequestMapping("meterial_review_insert")
       public String meterial_review_insert(Model model, String meterial_id)throws Exception{
		 /*model.addAttribute("pageName", "product/detail/vege_detail/vege_detail.jsp");
         model.addAttribute("meterial_review", "review/minsert.jsp");
         model.addAttribute("product_div", "vege_read_div.jsp");
         model.addAttribute("vo", meterial_service.read(meterial_id));*/
         String lastNumber=review_dao.lastNumber();
         int last_review_number=Integer.parseInt(lastNumber.substring(1)) + 11;
         model.addAttribute("review_number",last_review_number);
         model.addAttribute("meterial_id", meterial_id);
         return "/product/detail/vege_detail/review/minsert";
       }
	   
	   @RequestMapping(value="meterial_review_insert", method=RequestMethod.POST)
	   public String meterial_review_insert(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
	      //파일업로드
	      MultipartFile file=multi.getFile("file");
	      if(!file.isEmpty()){
	         String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
	         file.transferTo(new File(path + "/" + image));
	         vo.setReview_image(image);
	      }
	      review_dao.meterial_review_insert(vo);      
	      return "redirect:/vege_detail?meterial_id=" + vo.getMeterial_id();
	   }
	   
	   @RequestMapping(value="meterial_review_update", method=RequestMethod.POST)
	   public String meterial_review_update(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
	      System.out.println(vo.toString());
	      ReviewVO oldVO=review_dao.meterial_review_read(vo.getReview_number());
	      
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
	      review_dao.meterial_review_update(vo);
	      return "redirect:/vege_detail?meterial_id=" + vo.getMeterial_id();
	   }
	   
	   @RequestMapping("meterial_review_read")
	   public String meterial_review_read(Model model, int review_number) throws Exception{
	      model.addAttribute("vo", review_service.meterial_review_read(review_number));
	      return "/detail/review/mread";
	   }
	
	@RequestMapping("user_review_delete")
	public String user_review_delete(int review_number) throws Exception{
		ReviewVO vo=review_dao.user_review_read(review_number);
		if(vo.getReview_image()!=null){
			new File(path + "/" + vo.getReview_image()).delete();
		}
		review_dao.user_review_delete(review_number);
		return "redirect:/mypage/myReview";
	}
	
	@RequestMapping("user_review_list.json")
	@ResponseBody
	public HashMap<String, Object> user_review_list(Criteria cri) throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPerPageNum(4);
		map.put("list", review_dao.user_review_list(cri));
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(review_dao.user_totalCount(cri));
		
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping(value="user_review_update", method=RequestMethod.POST)
	public String user_review_update(ReviewVO vo,MultipartHttpServletRequest multi) throws Exception{
		System.out.println(vo.toString());
		ReviewVO oldVO=review_dao.user_review_read(vo.getReview_number());
		
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
		review_dao.user_review_update(vo);
		return "redirect:/mypage/myReview";
	}
	
	@RequestMapping("user_review_read")
	public String user_review_read(Model model, int review_number) throws Exception{
		model.addAttribute("vo", review_service.user_review_read(review_number));
		return "/detail/review/uread";
	}
	
	@RequestMapping("commonQA_list.json")
	@ResponseBody
	public HashMap<String,Object> commonQA_list(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("list", commonQA_dao.commonQA_list(cri));
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(commonQA_dao.totalCount(cri));
		
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping("commonQA_list")
	public String commonQA_list(){
		return "/cs/commonQA/list";
	}
	
	@RequestMapping("commonQA_read")
	public String commonQA_read(Model model, int commonQA_number) throws Exception{
		model.addAttribute("vo", commonQA_dao.commonQA_read(commonQA_number));
		return "/cs/commonQA/read";
	}
	
	@RequestMapping("admin_notice.json")
	@ResponseBody
	public HashMap<String,Object> admin_noticeList(Criteria cri)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		cri.setPerPageNum(3);
		map.put("list", notice_dao.admin_list(cri));
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(notice_dao.totCount(cri));
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
		pm.setTotalCount(commonQA_dao.totalCount(cri));
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
