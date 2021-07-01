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

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.persistence.GroupSalesDAO;
import com.example.persistence.UserDAO;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	UserDAO dao;	
	
	@Autowired
	GroupSalesDAO group_dao;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping("login")
	public String login(Model model){
		model.addAttribute("pageName","user/login.jsp");
		return "/index";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> loginPost(UserVO vo,String user_password,HttpSession session,boolean chkLogin,HttpServletResponse response)throws Exception{
		  HashMap<String,Object> map = new HashMap<String,Object>();
		  session.setAttribute("id", vo.getUser_id());
		  int result = 0; //���̵� ���� ���
		  vo = dao.login(vo);
		  if(vo!=null){
			  if(passEncoder.matches(user_password,vo.getUser_password())){
				  result=1; //�α��μ���
			  }if(chkLogin){
				  Cookie cookie = new Cookie("user_id",vo.getUser_id()); //��Ű����
				  cookie.setPath("/");
				  cookie.setMaxAge(60*60*24*7); //7�ϰ� ����
				  response.addCookie(cookie);
			  }
			  System.out.println("�α���Ȯ��........."+vo.toString());
			  session.setAttribute("vo", vo);
			  String path=(String)session.getAttribute("path");
			  if(path==null) path="/index";
			  map.put("path", path);
		  }else{
			  result=2; //��й�ȣ ����ġ
		  }
		  map.put("result", result);
		  return map;
	}
	
	@RequestMapping("logout")
	public String logout(Model model,HttpSession session,HttpServletResponse response, HttpServletRequest request){
		model.addAttribute("pageName","indexList.jsp");
		session.invalidate();
		Cookie cookie = WebUtils.getCookie(request, "user_id");
		if(cookie != null){
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "/index";
	}	
	
	//user�� �����ǸŸ���Ʈ
	@RequestMapping("meterial_user_list.json")
	@ResponseBody
	public Map<String,Object> metrial_user_list(Criteria cri,String user_id)throws Exception{
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(3);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(group_dao.user_total_count(user_id));
		map.put("list", group_dao.user_list(cri, user_id));
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	//��������
	@RequestMapping("group_sales_insert")
	public String group_sales_insert(Model model)throws Exception{
		model.addAttribute("pageName","mypage/all.jsp");
		model.addAttribute("leftPage", "myList.jsp");
		model.addAttribute("rightPage", "nanum/insert.jsp");
		return "/index";
	}
}
