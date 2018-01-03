package com.udata.osp.util.cache;

import java.util.Date;

import javax.servlet.http.HttpServlet;

/** 
 * 项目启动时默认加载缓存数据类 
 * 在web.xml中加入
 *   <servlet>  
        <servlet-name>cacheinitservlet</servlet-name>  
        <servlet-class>com.udata.osp.util.cache.LoadCache</servlet-class>  
        <load-on-startup>2</load-on-startup>  
    </servlet>  
 */ 
public class LoadCache extends HttpServlet{ 
	 public void init(){  
	        addData();  
	    }  
	      
	    /** 
	     * 项目启动时加载缓存 
	     */  
	    public void addData(){  
	        System.out.println("进入加载缓存addData()………………。");  
	        CacheMgr cm=CacheMgr.getInstance();  
	        CacheConfModel cModel=new CacheConfModel();  
	        Date d=new Date();  
	        cModel.setBeginTime(d.getTime());  
	        cModel.setDurableTime(60);  
	        cModel.setForever(true);  
	        cm.addCache("kk", "123", cModel);//在缓存加值  
	    }  

}
