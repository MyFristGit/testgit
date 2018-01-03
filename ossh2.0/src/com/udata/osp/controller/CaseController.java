package com.udata.osp.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasig.cas.client.authentication.AttributePrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.udata.osp.entity.User;
import com.udata.osp.service.MoniterService;
import com.udata.osp.util.PageData;

@Controller
public class CaseController {
	
	@Resource
	private MoniterService moniterService;
	
	@RequestMapping(value = "/caslogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String casLogin(HttpSession session,HttpServletRequest request) {
		String uid = request.getRemoteUser();
		String cn = "";
		Principal principal = request.getUserPrincipal();
		if (principal != null && principal instanceof AttributePrincipal) {
			AttributePrincipal aPrincipal = (AttributePrincipal) principal;
			// 获取用户信息中公开的Attributes部分
			Map<String, Object> map = aPrincipal.getAttributes();
			// 获取姓名,可以根据属性名称获取其他属性
			cn = (String) map.get("cn");
			
		}
		
		User user = new User();
		user.setUserId(uid);
		user.setUsername(cn);
		session.setAttribute("user",user);
		
		/*
		 * 下边的代码为记录用户的登录信息到数据库中
		 * */
		//ip
		String  userIp=getRemoteHost(request);
		//时间
		   Date nowTime = new Date();  
	         SimpleDateFormat matter = new SimpleDateFormat(  
	                 "yyyy年MM月dd日E HH时mm分ss秒");  
	       String  time=  matter.format(nowTime);
	    //用户id
	       String  userId=user.getUserId();
	       String  userName2=user.getUsername();
	       Map<String, Object> param = new HashMap<String,Object>();
	       param.put("user_id", userId);
           param.put("user_name", userName2); 
           param.put("ip", userIp); 
           param.put("time", time); 
           moniterService.saveLogin(param);
		   return "redirect:taskCenter.html";
	}
	
	 public static String getRemoteHost(javax.servlet.http.HttpServletRequest request){
		    String ip = request.getHeader("x-forwarded-for");
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getHeader("Proxy-Client-IP");
		    }
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getHeader("WL-Proxy-Client-IP");
		    }
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getRemoteAddr();
		    }
		    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
		}
	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

		return request;
	}
}
