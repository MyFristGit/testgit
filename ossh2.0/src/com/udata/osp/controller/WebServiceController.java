package com.udata.osp.controller;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.udata.osp.entity.User;
import com.udata.osp.service.MoniterService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.JsonDeal;
import com.udata.osp.util.PrivilegeDeal;

import net.sf.json.JSONArray;

//计划显示当前在线用户数，先暂放
//详见 index.jsp  下：users:${users }

//保存用户办理的情况到数据库中
@Controller  
@RequestMapping(value = "/monitor") 
public class WebServiceController {
	
	@Resource
	private MoniterService moniterService;
	
	@ResponseBody
	@RequestMapping(value = "/saveService")
	public void saveService(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="serviceId",required = false, defaultValue = "") String serviceId,String id) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		if( request.getSession().getAttribute("user")==null){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		User user=(User) request.getSession().getAttribute("user");
		//ip
		String  userIp= LoginController.getRemoteHost(request);
		//时间
		   Date nowTime = new Date();  
	         SimpleDateFormat matter = new SimpleDateFormat(  
	                 "yyyy年MM月dd日E HH时mm分ss秒");  
	       String  time=  matter.format(nowTime);
		
		moniterService.saveDoServer(user.getUserId(),user.getUsername(),time,userIp,serviceId);
		
		moniterService.serviceAddOne(id);
		
		
		//服务次数加一
		
		
		
		jsonDeal.putResponse("{'result':'ok'}");
		
		
		
	}
	
	
	
	// http://localhost:8080/RestWebService/getData.html?userName=sun 方式的调用  
    @RequestMapping  
    public void printData1(HttpServletRequest request, HttpServletResponse response,   
    @RequestParam(value="userName", defaultValue="User") String name) {  
        String msg = "Welcome "+ name;  
        printData(response, msg);  
    }  
    
    // http://localhost:8080/RestWebService/getData/Sun/Royi.html 方式的调用  
    @RequestMapping(value = "/{firstName}/{lastName}")  
    public void printData2(HttpServletRequest request, HttpServletResponse response,   
        @PathVariable String firstName, @PathVariable String lastName) {  
        String msg = "Welcome "+ firstName + " " + lastName;  
        printData(response, msg);  
    }  
    
    // 转换成HTML形式返回  
    private void printData(HttpServletResponse response, String msg) {  
        try {  
            response.setContentType("text/html;charset=utf-8");  
            response.setCharacterEncoding("UTF-8");  
            PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));  
            out.println(msg);  
            out.close();  
        } catch (Exception e) {    
            e.printStackTrace();  
        }  
   } 
    
    // http://localhost:8080/ossh/monitor/json.html?item=0
    @RequestMapping(value = "/json")  
    public void printData3(HttpServletRequest request, HttpServletResponse response,   
        @RequestParam(value="item", defaultValue="0") String item) {  
        printDataJason(response, item);  
    }  
    
    
    public class UserInfo{  
        
        Integer ID;  
          
        String Name;  
          
        String Position;  
      
        public Integer getID() {  
            return ID;  
        }  
      
        public void setID(Integer iD) {  
            ID = iD;  
        }  
      
        public String getName() {  
            return Name;  
        }  
      
        public void setName(String name) {  
            Name = name;  
        }  
      
        public String getPosition() {  
            return Position;  
        }  
      
        public void setPosition(String position) {  
            Position = position;  
        }  
          
    }  
    
    
 // JSON格式化  
    private void printDataJason(HttpServletResponse response, String item) {  
        try {  
           response.setContentType("text/html;charset=utf-8");  
           response.setCharacterEncoding("UTF-8");  
           PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));  
             
           List<UserInfo> uiList = new ArrayList<UserInfo>();  
           for (int i=0; i<3; i++)  
           {  
               UserInfo ui = new UserInfo();  
               ui.ID = i;  
               ui.Name = "SUN" + i;  
               ui.Position = "Position" + i;  
               uiList.add(ui);  
  
            
           }
           
           if (!item.equals("0")){  
               JSONArray jsonArr = JSONArray.fromObject(uiList.get(0));  
               out.println(jsonArr);  
           }  
           else{  
               JSONArray jsonArr = JSONArray.fromObject(uiList);  
               out.println(jsonArr);  
               //out.println(uiList);  
           }  

           out.close();  
           
           
        }catch (Exception e) {    
               e.printStackTrace();    
        }  
   }  
        

}
/**
 * 
 * 
 * 调用方法分为：HttpClient和jquery
 * 1.HttpClient
 * eg:
 * import java.util.ArrayList;  
import java.util.List;  
import org.apache.http.HttpEntity;  
import org.apache.http.NameValuePair;  
import org.apache.http.client.entity.UrlEncodedFormEntity;  
import org.apache.http.client.methods.CloseableHttpResponse;  
import org.apache.http.client.methods.HttpPost;  
import org.apache.http.impl.client.CloseableHttpClient;  
import org.apache.http.impl.client.HttpClients;  
import org.apache.http.message.BasicNameValuePair;  
import org.apache.http.util.EntityUtils;  
  
public class Rest{  
      
    public static void main(String[] args){  
        List<NameValuePair> params = new ArrayList<NameValuePair>();  
        params.add(new BasicNameValuePair("userName", "Sun"));  
          
        String url = "http://localhost:8080/RestWebService/getData";  
          
        System.out.println(getRest(url, params));  
    }  
      
    public static String getRest(String url,List<NameValuePair> params){  
        // 创建默认的httpClient实例.      
        CloseableHttpClient httpclient = HttpClients.createDefault();    
        // 创建httppost      
        HttpPost httppost = new HttpPost(url);   
          
        UrlEncodedFormEntity uefEntity;  
          
        try{  
            uefEntity = new UrlEncodedFormEntity(params, "UTF-8");    
            httppost.setEntity(uefEntity);  
            CloseableHttpResponse response = httpclient.execute(httppost);    
            HttpEntity entity = response.getEntity();    
            String json= EntityUtils.toString(entity, "UTF-8");  
            int code= response.getStatusLine().getStatusCode();  
            if(code==200 ||code ==204){  
                return json;  
            }  
        }catch (Exception e){  
            e.printStackTrace();  
        }  
          
        return "";  
    }  
}  

2.jquery:
 $('#callPrintDataWithoutParam').click(function(event){  
            document.getElementById("divContext").innerHTML = "";  
   
            var webserviceUrl="http://localhost:8080/RestWebService/getData" + "?userName=Sun";  
            //var webserviceUrl="http://localhost:8080/RestWebService/getData";  
  
            $.ajax({  
                type: 'POST',  
                contentType: 'application/json',  
                url: webserviceUrl,  
                //data: {"userName":"Sun"},  
                dataType: 'html',  
                success: function (result) {  
            document.getElementById("divContext").innerHTML = result;  
                },  
                error:function(){  
                    alert("error");  
                }  
            });  
              
            //取消事件的默认行为。比如：阻止对表单的提交。IE下不支持，需用window.event.returnValue = false;来实现  
            event.preventDefault();  
  
        });  
 * 
 */
