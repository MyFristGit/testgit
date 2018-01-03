package com.udata.osp.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.udata.osp.service.TaskService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.JsonDeal;
import com.udata.osp.util.PrivilegeDeal;


@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private TaskService taskService;
	@Resource
	private UserService userService;
	
	
	
	
	
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	public void savePassword(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="password",required = false, defaultValue = "") String password) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		if(password.equals("")){
			jsonDeal.putResponse("{'result':'noPassword'}");
			return;
		}
		
		userService.savePassword(pd.getCurrentUser().getUserId(), 
				new SimpleHash("SHA-1", pd.getCurrentUser().getUsername(), password).toString());
		jsonDeal.putResponse("{'result':'ok'}");
		
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/bindEmail")
	public void bindEmail(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="email_account",required = false, defaultValue = "") String email_account,
			String  email_password) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		if(email_account.equals("") ||  "".equals(email_password)){
			jsonDeal.putResponse("{'result':'noPassword'}");
			return;
		}
		
		userService.bindEmail(pd.getCurrentUser().getUserId()
				,email_account,email_password);
		jsonDeal.putResponse("{'result':'ok'}");
		
	}
	
	
	
	
	/**
	 * 保存次序
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/saveOrder")
	public void saveOrder(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="order",required = false, defaultValue = "") String order) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		if(order.equals("")){
			jsonDeal.putResponse("{'result':'noOrder'}");
			return;
		}
		
		userService.saveOrder(pd.getCurrentUser().getUserId(), 
				order);
		jsonDeal.putResponse("{'result':'ok'}");
		
	}
	
	

	/**
	 * 对ossh_research_project_data中的数据进行统计，统计结果存入ossh_research_project中
	 * all,表示对全部人员进行统计，否则对单个人进行统计。当第一次导入时用全部，临时加入时用单个人。
	 * ossh_research_project相当于一个缓存表。
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/updateResearchProject")
	public void updateResearchProject(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="all",required = false, defaultValue = "all") String who) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin() ||   !pd.isAdmin()){
			jsonDeal.putResponse("{'result':'noLogin,or not admin.'}");
			return;
		}
		if("all".equals(who)){
			//取得全部的用户，按照次序调用 InsertIntoReSearchProject();
			//为了系统不挂掉，采用先返回结果另一个线程单独处理
			Thread t=new Thread(new Runnable() {
		        @Override
		        public void run() {
		            try {
		               //Thread.sleep(5000);
		            	 List<String>  userIdList=userService.getUserIdInResearchProjectData();
		             	for(String  userid  : userIdList){
		             		userService.InsertIntoReSearchProject(userid);
		             	}
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    });
		    t.start();
		}else{			
			userService.InsertIntoReSearchProject(who);
	    }
		jsonDeal.putResponse("{'result':'ok'}");
		
	}
	
	
}
