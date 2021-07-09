package com.example.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.domain.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	 @Override
	 public boolean preHandle(HttpServletRequest req,HttpServletResponse res, Object obj) throws Exception {
	  
	  HttpSession session = req.getSession();
	  UserVO user_info = (UserVO)session.getAttribute("user_info");
	  res.setContentType("text/html; charset=euc-kr");
	  
	  if(user_info == null) {
		  String path = req.getServletPath();
		  System.out.println("path:"+path);
		  String query = req.getQueryString();
		  if(query==null||query.equals("")){
			  query="";
		  }else{
			  query="?"+query;
		  }		  
		  req.getSession().setAttribute("path", path + query);	
		  res.sendRedirect("/user/login");		  
		  return false;
	  }
	  return true;
	 }


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	        ModelAndView modelAndView) throws Exception {
	    // TODO Auto-generated method stub
	    super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	        throws Exception {
	    // TODO Auto-generated method stub
	    super.afterCompletion(request, response, handler, ex);
	}
}