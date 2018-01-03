package com.udata.osp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.udata.osp.entity.User;
import com.udata.osp.service.TaskService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.JsonDeal;
import com.udata.osp.util.PrivilegeDeal;


@Controller
public class UserCommentController {

	@Resource
	private TaskService taskService;
	@Resource
	private UserService userService;
	
	
	/**
	 * 由服务id显示服务处理的欢迎页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/comment")
	public String comment(HttpServletRequest request,Model model,
			@RequestParam(value="id",required = false, defaultValue = "0") String id,
			@RequestParam(value="page",required = false, defaultValue = "1") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "5") Integer pageSize
			){
		if(id.equals("0")){
			model.addAttribute("result", 0);
		}else{
			model.addAttribute("result", id);		
			 PageHelper.startPage(page, pageSize);
			List<Map<String,Object>>  listResult= taskService.getCommentsAndUserByServiceId(id);
			PageInfo pageInfo = new PageInfo(listResult);			
			model.addAttribute("total",pageInfo.getTotal());
			model.addAttribute("pageSize",pageSize);			
			model.addAttribute("userComments", listResult);
			//确定用户是否发表过评论
			PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			
			User user = pd.getCurrentUser();
			if(user != null){
				String userid = user.getUserId();
				model.addAttribute("havePublish", taskService.isPublish(userid, id));
			}
			
			model.addAttribute("haveMorePage",pageInfo.getPages()>1);		
		}
		return "proscenium/comment";
	}
	
	
	
	
	/**
	 * 处理保存评论
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "saveComment", method = RequestMethod.POST)
	public void saveComment(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		 String result=taskService.saveComment(pd.getCurrentUser().getUserId(), 
				 jsonDeal.getMapString("serviceId"), jsonDeal.getMapString("comment"));
		jsonDeal.putResponse("{'result':'"+result+"'}");
		userService.UpdateCommentCountToService(jsonDeal.getMapString("serviceId"));
		
	}
	
	
	

	/**
	 * 处理保存评论
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "deleteComment", method = RequestMethod.POST)
	public void deleteComment(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		 String result=taskService.deleteComment(pd.getCurrentUser().getUserId(), 
				 jsonDeal.getMapString("serviceId"));
		jsonDeal.putResponse("{'result':'"+result+"'}");
		
	}
	
	
	
	/**
	 * 动态分页评论
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "getPager", method = RequestMethod.POST)
	public void getPager(HttpServletRequest request,
			HttpServletResponse response,Model model,
			@RequestParam(value="serviceId",required = false, defaultValue = "0") String serviceId,
			@RequestParam(value="pageIndex",required = false, defaultValue = "1") Integer pageIndex,
			@RequestParam(value="pageSize",required = false, defaultValue = "3") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		
		 PageHelper.startPage(pageIndex, pageSize);
			List<Map<String,Object>>  listResult= taskService.getCommentsAndUserByServiceId(serviceId);
			PageInfo pageInfo = new PageInfo(listResult);
			jsonDeal.putResponse(listResult);	
			
		
	}
	
	
}
