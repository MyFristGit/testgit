package com.udata.osp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.udata.osp.entity.User;
import com.udata.osp.service.MoniterService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.PageData;

/**
 * 
 * @author 周有亮
 *
 */
@Controller
public class LoginController extends BaseController{
	@Resource
	private UserService userService;
	
	@Resource
	private MoniterService moniterService;
	
	
	
	
	/**
	 * 获取登录用户的IP
	 * @throws Exception
	 */
	public void getRemortIP(String USERNAME) throws Exception {
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		//userService.saveIP(pd);
	}
	
	
	
	/**
	 * 用户登录
	 * @param session
	 * @param request
	 * @param model
	 * @param user
	 * @return
	 * @throws IOException 
	 */
    @RequestMapping(value="/login")
	public void  login(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
    	request.setCharacterEncoding("UTF-8");
    	String code = new String(request.getParameter("code"));
		String KEYDATA[] = request.getParameter("code").replaceAll("qq123456789fh", "").replaceAll("QQ987654321fh", "").split(",fh,");
		String userName = KEYDATA[0];
		String password = KEYDATA[1];
		String passwd = new SimpleHash("SHA-1", userName, password).toString(); // 密码加密
		User hasUser = userService.getUserBy(userName,passwd);
		String errInfo = "";
		if(hasUser == null){
			errInfo = "usererror"; // 用户名或密码有误
		}else{
			
			session.setAttribute("user",hasUser);
			errInfo = "success";
			
			//在数据库中登记
			//ip
			String  userIp=getRemoteHost(request);
			//时间
			   Date nowTime = new Date();  
		         SimpleDateFormat matter = new SimpleDateFormat(  
		                 "yyyy年MM月dd日E HH时mm分ss秒");  
		       String  time=  matter.format(nowTime);
		    //用户id
		       String  userId=hasUser.getUserId();
		       String  userName2=hasUser.getUsername();
		       
		       
		       Map<String, Object> param = new HashMap<String,Object>();
		       param.put("user_id", userId);//此处所用的参数类型为 byte[] 
               param.put("user_name", userName2); 
               param.put("ip", userIp); 
               param.put("time", time); 
               moniterService.saveLogin(param);
               
               
		       
		       
			
			//在全局中记录登录的用户情况。
		    //这儿有bug,一个用户在不同浏览器登录，只显示一个用户，应该分开，key为sessionId.
			/*
			ServletContext servletContext = request.getServletContext();
			  HashMap users = (HashMap) servletContext.getAttribute("users");
	          if (users == null) {
	        	  users=new  HashMap<String,Object>();
	          }
	          users.put(hasUser.getUserId(), hasUser);
	          servletContext.setAttribute("users", users);
	          */
//			return "redirect:/taskCenter.html";
		}
		
		PrintWriter out = response.getWriter();  
		  out.print(errInfo);  
	}
    
    /** 
     * 退出系统 
     * @param session 
     *          Session 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping(value="/logout")  
    public String logout(HttpSession session,HttpServletResponse response) throws Exception{  
        //清除Session  
        session.invalidate();  
        String casLogoutURL = "http://ids.xust.edu.cn/authserver/logout";
        String redirectURL=casLogoutURL+"?service="+URLEncoder.encode("http://ehall.xust.edu.cn");
    //	response.sendRedirect(redirectURL);
        return "redirect:" + redirectURL;  
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
}
