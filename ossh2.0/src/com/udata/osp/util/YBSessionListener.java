package com.udata.osp.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TimeZone;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.udata.osp.entity.User;

public class YBSessionListener implements HttpSessionListener {
	 
    public void sessionCreated(HttpSessionEvent event) {
           HttpSession session = event.getSession();
           ServletContext application = session.getServletContext();
           
           // 在application范围由一个HashSet集保存所有的session
           HashSet sessions = (HashSet) application.getAttribute("sessions");
           if (sessions == null) {
                  sessions = new HashSet();
                  application.setAttribute("sessions", sessions);
           }
           
           // 新创建的session均添加到HashSet集中
           sessions.add(session);
           //putStringInFile("D:\\test\\","test","sessionCreated:  " + sessions+"\n");
           
           /*
            *  // 下面是从文件file2读东西  
        try {  
            FileReader fileReader = new FileReader(file2);  
            String s = null;  
            char ch;  
            try {  
                char[] c = new char[100];  
                fileReader.read(c,0,2); // 具体想得到文件里面的什么值（单个char？int？还是String?），  
                System.out.println(c);  
                fileReader.close();  
  
            } catch (IOException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
  
        } catch (FileNotFoundException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        /** 
         * 具体想得到文件里面的什么值（单个char？int？还是String?），需要知道不通read的不同用法： 
         *  1. int read()       读取单个字符。       
         *  2. int read(char[] cbuf) 将字符读入数组。    可以再将字符型数组转化位字符串     
         *  3.  int read(char[] cbuf,int off,int len) 将字符读入数组的某一部分。 
         * 这三个方法都返回一个int值，作用是：读取的字符数，如果已到达流的末尾，则返回 -1. 
         */  
           
           // 可以在别处从application范围中取出sessions集合
           // 然后使用sessions.size()获取当前活动的session数，即为“在线人数”
    }

    public void sessionDestroyed(HttpSessionEvent event) {
    	
    	  HttpSession session = event.getSession();
    	  if(session == null){
    		  //putStringInFile("D:\\test\\","test","session == null " +"\n");
    		  return ;
    	  }
          ServletContext application = session.getServletContext();
          
          //去掉当前
          //putStringInFile("D:\\test\\","test","去掉当前 " +"\n");
          HashMap users = (HashMap) application.getAttribute("users");
          //putStringInFile("D:\\test\\","test","当前的users: " +users+"\n");
      
		 
        if (users == null) {
      	    users=new  HashMap<String,Object>();
        	application.setAttribute("user", users);
      	 
        }
        users.remove(((User)session.getAttribute("user")).getUserId());
        application.setAttribute("users", users);
        //putStringInFile("D:\\test\\","test","当前的users: " +users+"\n");
        
        //
          
          // 在application范围由一个HashSet集保存所有的session
          HashSet sessions = (HashSet) application.getAttribute("sessions");
          if (sessions == null) {
        	  	 //putStringInFile("D:\\test\\","test","sessions == null " +"\n");
                 sessions = new HashSet();
                 application.setAttribute("sessions", sessions);
          }
          
          
          
          
           
           application = session.getServletContext();
            sessions = (HashSet) application.getAttribute("sessions");
         
           
           // 销毁的session均从HashSet集中移除
           sessions.remove(session);
           System.out.println("session  remove,now session is:"+sessions);
        
           if (sessions == null) {
                  sessions = new HashSet();
                  application.setAttribute("sessions", sessions);
           }
           
           // 新创建的session均添加到HashSet集中
           sessions.add(session);
           
           //putStringInFile("D:\\test\\","test","sessionDestroyed:  " + sessions+"\n");
        
           
           
           
    }
    
     /**
      * 
      * @param dir  unix:/home/a123/  ,windows:D:\\test\\
      * @param fileName  log
      * @param str
      */
    public    static  void  putStringInFile(String  dir,String fileName,String  str){
    	
    	
    	 TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));//定义时区，可以避免虚拟机时间与系统时间不一致的问题  
         
         System.out.println(new Date(System.currentTimeMillis()));//方法一：默认方式输出现在时间  
          
         Date nowTime = new Date();  
         System.out.println(nowTime);//方法二：Date方式，输出现在时间  
   
         SimpleDateFormat matter = new SimpleDateFormat(  
                 "现在时间:yyyy年MM月dd日E HH时mm分ss秒");  
         System.out.println(matter.format(nowTime));//方法三：SimpleDateFormat方式，完整输出现在时间  
         
         
    			
    	
    	  File file1 = new File(dir); 
          if (file1.exists()) {  
              System.out.println(dir);  
          } else {  
              file1.mkdir(); // 文件夹的创建 创建文件夹/home/a123/a  
          }  
          File file2 = new File(dir+fileName);  
          if (file2.exists()) {  
              System.out.println("存在文件夹或者文件test");  
          } else {  
              try {  
                  file2.createNewFile(); // 文件的创建，注意与文件夹创建的区别  
              } catch (IOException e) {  
                  // TODO Auto-generated catch block  
                  e.printStackTrace();  
              }  
          } 
          // 下面是向文件file2里面写数据  
          try {  
              //FileWriter fileWriter = new FileWriter(file2); 
              FileWriter fileWriter=new FileWriter(file2,true); //追加
              String s = new String(matter.format(nowTime)+" "+str);  
              fileWriter.write(s);  
              fileWriter.close(); // 关闭数据流  
                
    
          } catch (IOException e) {  
              // TODO Auto-generated catch block  
              e.printStackTrace();  
          }  
          
    	
    }
}
