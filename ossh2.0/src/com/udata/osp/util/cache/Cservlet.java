package com.udata.osp.util.cache;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *  <servlet>  
      <servlet-name>testCache</servlet-name>  
      <servlet-class>com.udata.osp.util.cache.Cservlet</servlet-class>  
    </servlet>  
    <servlet-mapping>  
      <servlet-name>testCache</servlet-name>  
      <url-pattern>/testCache.do</url-pattern>  
    </servlet-mapping> 
 */

public class Cservlet extends HttpServlet{  
	 public void service(HttpServletRequest request,HttpServletResponse response){  
	        try {  
	            System.out.println("进入servlet类............");  
	            request.setCharacterEncoding("utf-8");  
	            response.setContentType("text/html;charset=UTF-8");   //3.设置响应类型  
	  
	            PrintWriter out = response.getWriter();  
	              
	              
	            CacheMgr cm=CacheMgr.getInstance();  
	              
	            int numm=cm.getSize();//获取缓存个数  
	            Object ob=cm.getValue("kk"); 
	            CacheConfModel ccm=new  CacheConfModel();
	            ccm.setBeginTime(new Date().getTime());
	            ccm.setDurableTime(1000);
	            ccm.setForever(false);
	            cm.addCache("test", "do", ccm);
	            System.out.println("numm===========//======"+numm);  
	            out.println("缓存个数为："+numm);  
	            out.println("缓存数值：value===="+ob);  
	              
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } 
	    }  

}
