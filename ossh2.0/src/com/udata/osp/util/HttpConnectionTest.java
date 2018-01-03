package com.udata.osp.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpConnectionTest {
	public static void main(String[] args) {
		  System.out.println("1" ); 
    	try {  
    		/**/
    		StringBuffer buffer = new StringBuffer();
    		
           // String url = "http://www.baidu.com";  
    		 String url = "http://mail.qiye.163.com/js/loginjs.jsp";
            System.out.println("访问地址:" + url); 
            YBSessionListener.putStringInFile("D:\\test\\","test", "访问地址:" + url+"\n");
            
            //发送get请求
            URL serverUrl = new URL(url);  
            HttpURLConnection conn = (HttpURLConnection) serverUrl.openConnection();  
            conn.setRequestMethod("GET");  
            //必须设置false，否则会自动redirect到重定向后的地址  
            conn.setInstanceFollowRedirects(false);
            conn.addRequestProperty("Accept-Charset", "UTF-8;"); 
            conn.addRequestProperty("Referer", "http://mail.xust.edu.cn/");  
            conn.addRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Firefox/3.6.8");  
            conn.addRequestProperty("Referer", "http://matols.com/");  
            conn.connect();  
            
            //判定是否会进行302重定向
            if (conn.getResponseCode() == 302) { 
                //如果会重定向，保存302重定向地址，以及Cookies,然后重新发送请求(模拟请求)
                String location = conn.getHeaderField("Location");  
                String cookies = conn.getHeaderField("Set-Cookie");  
                System.out.println("location:"+location ); 
                System.out.println("cookies:"+cookies ); 
                YBSessionListener.putStringInFile("D:\\test\\","test", "location:"+location+"\n");
                YBSessionListener.putStringInFile("D:\\test\\","test", "cookies:"+cookies+"\n");
                
	            serverUrl = new URL(location);  
	            conn = (HttpURLConnection) serverUrl.openConnection();  
	            conn.setRequestMethod("GET");
	            conn.setRequestProperty("Cookie", cookies);
	            conn.addRequestProperty("Accept-Charset", "UTF-8;");  
	            conn.addRequestProperty("User-Agent","Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Firefox/3.6.8");  
	            conn.addRequestProperty("Referer", "http://matols.com/");  
	            conn.connect();  
	            System.out.println("跳转地址:" + location); 
	            YBSessionListener.putStringInFile("D:\\test\\","test", "跳转地址:" + location+"\n");
            }else{
            	  System.out.println("不跳转:"); 
            	   String location = conn.getHeaderField("Location");  
                   String cookies = conn.getHeaderField("Set-Cookie");  
                   System.out.println("location:"+location ); 
                   System.out.println("cookies:"+cookies ); 
                   YBSessionListener.putStringInFile("D:\\test\\","test", "location:"+location+"\n");
                   YBSessionListener.putStringInFile("D:\\test\\","test", "cookies:"+cookies+"\n");
            	
            }
            
            //将返回的输入流转换成字符串  
            InputStream inputStream = conn.getInputStream();  
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"utf-8");  
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader); 
            String str = null;  
            while ((str = bufferedReader.readLine()) != null) {  
                buffer.append(str);  
                System.out.println("new  :"+str);
                YBSessionListener.putStringInFile("D:\\test\\","test", str+"\n");
            }  
            bufferedReader.close();  
            inputStreamReader.close();  
            // 释放资源  
            inputStream.close();  
            inputStream = null;  
  
            System.out.println(buffer.toString());
            YBSessionListener.putStringInFile("D:\\test\\","test", buffer.toString()+"\n");
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }

}
