package com.udata.osp.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.udata.osp.entity.*;
import com.udata.osp.service.TaskService;
import com.udata.osp.service.UserService;
/**
 * 权限处理的工具类
 * @author:txf
 */
public class PrivilegeDeal {
	static UserService userService=null  ;
	static TaskService taskService=null;
	
	static{
		userService=(UserService) new com.udata.osp.serviceImpl.UserServiceImpl();
	}
	private HttpServletRequest request=null;
	
	
    public  boolean haveLogin(){
    	return  request!=null  &&  request.getSession().getAttribute("user")!=null;
    }
    public  User getCurrentUser(){
    	return  (User) request.getSession().getAttribute("user");
    }
	public PrivilegeDeal(HttpServletRequest request, UserService userService,TaskService taskService) {
		this.request = request;
		this.userService=userService;
		this.taskService=taskService;
	}
	public  List<UserRole>  getRole(){
		User  user=getCurrentUser();
		if(user!=null){
			List<UserRole>  userRoles=userService.getUserRole(user.getUserId());
		 	return userRoles;
		}
		else
			return null;
	}
	
	public  List<Service>  getUserServices(){
		User  user=getCurrentUser();
		List<Service>  resultList=new LinkedList<Service>();
		if(user!=null){
			List<UserRole>  userRoles=userService.getUserRole(user.getUserId());
			for(UserRole userRole:userRoles){
				List<Service> service=  taskService.getServiceByRoleId(userRole.getRole_id());
				resultList.addAll(service);
			}
			return resultList;
		}
		else
			return null;
	}
	
	public  boolean isAdmin(){
		return haveLogin() &&  (((User)request.getSession().getAttribute("user")).getUsername().equals("admin"));
	}
	
	
	/**
	 * 如果用户登录并且不是管理员就限制只能显示它角色下的服务
	 * @param service
	 * @return
	 */
	public  List<Service> filterService(List<Service>service){
		if (   haveLogin()  && !isAdmin()){
			List<UserRole> userRoleList=getRole();
			 //取得角色中是当前用户的服务
			 List<Service>  serviceResult=new LinkedList<Service>();
			 for(Service   serviceV:service){
				 for(UserRole ur:userRoleList){
					 if(ur.getRole_id().equals(serviceV.getRoleId())){
						 serviceResult.add(serviceV);
						 break;
					 }
				 }
			 }
			 return serviceResult;
		}
		
		
		return service;
	}





}
