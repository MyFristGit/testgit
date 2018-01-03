package com.udata.osp.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageHelper;
import com.udata.osp.entity.User;
import com.udata.osp.service.UserService;

public class SpringTag extends  SimpleTagSupport {
  
    private static UserService userService; 
	private String dataName; 
    private String setName;
    private String other;  
    private String userFieldId;  
      
    public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getSetName() {
		return setName;
	}

	public void setSetName(String setName) {
		this.setName = setName;
	}


    public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getUserFieldId() {
		return userFieldId;
	}

	public void setUserFieldId(String userFieldId) {
		this.userFieldId = userFieldId;
	}

	
    
    
  
    /** 
     *  
     */  
    private static final long serialVersionUID = 1L;  
  
    @Override  
    public void doTag() throws JspException, IOException {  
    	
    	  StringWriter writer = new StringWriter();
          
          //4.2 把标签体内容拷贝到临时的Writer流中
               JspFragment jspBody = this.getJspBody();

          jspBody.invoke(writer);
          
          //4.3 从临时的Writer流中取出标签体内容
          String content = writer.toString();
          
          //4.4 改变标签体内容
          content = content.toUpperCase();
          
          //4.5 把改变后的内容写出到浏览器中
          //jspBody.invoke(null);如果这样写，那么还是输出原来的内容
          this.getJspContext().getOut().write(content);
          
          
          
    
        /*获取bean*/  
        if(userService==null){  
            WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();  
            userService = (UserService) webApplicationContext.getBean("userService");  
        }  
        HttpSession session=((PageContext)this.getJspContext()).getSession();
        User user = (User)session.getAttribute("user");
		if(user==null){
			return ;	
		}
	
		String userId = user.getUserId();
		
        /*查询数据库*/  
    	PageHelper.startPage(1, 10);
		//List<Map<String,Object>>  researchInformation= userService.getResearch(userId);	
	//	List<Map<String,Object>>  researchInformation= 
			//	userService.getStatementsByUserId("ossh_personal_research_project","user_id","'"+userId+"'","ORDER BY date DESC ");
		
		List<Map<String,Object>>  researchInformation= 
				userService.getStatementsByUserId(dataName,userFieldId,"'"+userId+"'",other);	
		
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(researchInformation);
		HttpServletRequest request=(HttpServletRequest) ((PageContext)this.getJspContext()).getRequest();
		
		request.setAttribute(setName, researchInformation);
		
		request.setAttribute(setName+"Total", pageInfo.getTotal());
		
		
     
      
    }  
  
   
  
}  

/*
 * 这儿记录项目常用的命令：
 * 将测试的admin账号改为老师
 * update   ossh_user_role  set  role_id='9d02e2bd51a241e1babac80a7e11f87a'  where  user_id='0'
 * 改为学生
 * update   ossh_user_role  set  role_id='a9d5e681e3014217b26bb3f767e307b1'  where  user_id='0'

 * 
 * 
 * 
 * 
 * 
 * */
