package com.udata.osp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.udata.osp.entity.User;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 // 获得在下面代码中要用的request,response,session对象
		 HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		
		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		
		User user = (User)session.getAttribute("user");
		  // 登陆页面无需过滤
         if(path.indexOf("/findex.html") > -1) {
             chain.doFilter(servletRequest, servletResponse);
             return;
         }

         // 判断如果没有取到员工信息,就跳转到登陆页面
          if (user == null) {
                 // 跳转到登陆页面
                servletResponse.sendRedirect("/ossh/findex.html");
           } else {
               // 已经登陆,继续此次请求
               chain.doFilter(request, response);
           }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
