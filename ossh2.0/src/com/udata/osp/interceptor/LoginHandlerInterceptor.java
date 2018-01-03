package com.udata.osp.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	 private List<String> excludedUrls;
	 
	 
	 
	public List<String> getExcludedUrls() {
		return excludedUrls;
	}



	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		 String requestUri = request.getRequestURI();
	        for (String url : excludedUrls) {
	            if (requestUri.endsWith(url)) {
	                return true;
	            }
	        }
	        
	        HttpSession session = request.getSession();
	        if (session.getAttribute("user") == null) {
	            System.out.println(request.getContextPath());
	            response.sendRedirect(request.getContextPath() + "/findex.html");
	        }
	        return false;
	}
	
	

}
