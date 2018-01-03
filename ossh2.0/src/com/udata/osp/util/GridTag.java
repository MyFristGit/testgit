package com.udata.osp.util;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;  
import java.lang.reflect.Array;  
import java.util.ArrayList; 
import java.util.List; 
  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.tagext.SimpleTagSupport; 
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

public class GridTag extends SimpleTagSupport  {
	 private PageContext pageContext;
	 private Object items;  
	    private String var;  
	    private Collection collection;  
	    public Object getItems() {  
	        return items;  
	    }  
	    public void setItems(Object items) {  
	        this.items = items;  
	    }  
	    public String getVar() {  
	        return var;  
	    }  
	    public void setVar(String var) {  
	        this.var = var;  
	    }  
  
    
    @Override
    public void doTag() throws JspException, IOException {  
    	/*
        
    try {
      pageContext.getResponse().getWriter().write("这是我写的一大段信息：ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }*/
    	// 定义一个迭代器
    	 if(items instanceof Map)  
         {  
             Map map=(Map) items;  
             collection=map.entrySet();  
         }  
         else if(items instanceof Collection)  
         {  
             collection=(Collection) items;        
         }  
         else if(items instanceof Object[])  
         {  
             Object[]objs=(Object[]) items;  
             collection=Arrays.asList(objs);  
         }  
         else if(items.getClass().isArray())  
         {  
             int length=Array.getLength(items);  
             collection=new ArrayList();  
             for(int i=0;i<length;++i)  
             {  
                 collection.add(Array.get(items, i));  
             }  
         }  
           
         Iterator it=collection.iterator();  
         while(it.hasNext())  
         {  
             Object ob=it.next();  
             this.getJspContext().setAttribute(var, ob);  
             getJspBody().invoke(null);  
         }  
    }
    
}

/*
 * 1.将Map化为Collection，Map的每一个元素即Entry放进Collection即可。
2.将类数组化为Collection，调用Arrays.asList(objs);方法。
3.若此对象为数组类（即items.isArray()返回true），将每一个数组元素放入Collection，比较巧妙的是使用Array.getLength(items);获得items数组长度，Array.get(items, i); 便可以获得items 数组在 i 处的对象值。然后将每个对象加入Collection中。
注意：int[]a ; 与Integer []a; 是完全不同的,前者归于第三类，后者归于第二类。
最后只需要处理Collection便可
Iterator it=collection.iterator();
while(it.hasNext())
{
Object ob=it.next();
this.getJspContext().setAttribute(var, ob);
getJspBody().invoke(null);
}

使用：
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://bangxue.com/grid" prefix="mmt" %>





	<%  
								        Map map=new HashMap();  
								        map.put("aaa", "111");  
								        map.put("bbb", "222");     
								        request.setAttribute("map", map);     
								          
								        Integer numbers[]={1,2,3};  
								        request.setAttribute("numbers", numbers);  
								          
								        List list=new ArrayList();  
								        list.add(11);     
								        list.add(22);     
								        request.setAttribute("list", list);  
								          
								        int nums[]={4,5,6};  
								        request.setAttribute("nums", nums);       
								   %> 
				  		 
				  		    
				  		    -----------------map------------------------<br/>  
   <mmt:mytag var="entry" items="${map}">  
    ${entry.key}:${entry.value}  
   </mmt:mytag>  
   <br/>  
   ----------------numbers----------------------<br/>  
   <mmt:mytag var="index" items="${numbers}">  
    ${index}  
   </mmt:mytag>  
   <br/>  
   ----------------list-------------------------------<br/>  
   <mmt:mytag var="index" items="${list}">  
    ${index}  
   </mmt:mytag>  
   <br/>  
   ----------------nums-----------------------------------<br/>  
   <mmt:mytag var="index" items="${nums}">  
    ${index}  
   </mmt:mytag>  
 * */
