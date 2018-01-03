package com.udata.osp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.udata.osp.entity.BackLogService;
import com.udata.osp.entity.Mail;
import com.udata.osp.entity.Message;
import com.udata.osp.entity.PageInfo;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.ServiceType;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;
import com.udata.osp.service.TaskService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.InfoplusApiUtil;
import com.udata.osp.util.JsonDeal;
import com.udata.osp.util.LoginFolder;
import com.udata.osp.util.MailApi;
import com.udata.osp.util.PrivilegeDeal;


@Controller
public class TaskCenterController {
	@Resource
	private TaskService taskService;
	@Resource
	private UserService userService;
	/**
	 * 跳转到首页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/findex")
	public String index(HttpSession session,HttpServletRequest request,Model model) throws Exception{
		User user = (User)session.getAttribute("user");
		List<Service> zXserviceList = null;//最新服务
		List<Service> zHserviceList = null;//最火
		List<ServiceType> serviceTypeList = taskService.getServiceTypeList();//服务类型 id  and  name
		List<UserRole> userRoleList = null;//服务角色
		List<ServiceRole> serviceRoleList = null;//服务角色
		//判断用户是否登录，登录的，取得该用户的角色，角色下的服务。
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if (   pd.haveLogin()  && !pd.isAdmin()){
			 serviceRoleList = taskService.getServiceRoleList();//全部角色，树形结构,
			 //取得当前用户的角色
			 userRoleList=pd.getRole();//角色id
			 //取得服务角色中属于当前用户的角色
			 List<ServiceRole>  serviceRoleResult=new LinkedList<ServiceRole>();
			 for(ServiceRole   serviceRole:serviceRoleList){//遍历全部角色
				 for(UserRole ur:userRoleList){//遍历当前用户的角色  ，对全部角色做一次filter.
					 if(ur.getRole_id().equals(serviceRole.getRoleId())){
						 serviceRoleResult.add(serviceRole);
						 break;
					 }
				 }
			 }
			 serviceRoleList=serviceRoleResult;//filter后的结构。
			 zXserviceList=taskService.getServiceZXListInRole(userRoleList);
			 zHserviceList=taskService.getServiceZHListInRole(userRoleList);
		}else{
			 zXserviceList = taskService.getServiceZXList();//最新服务
			 zHserviceList = taskService.getServiceZHList();//最火
			 serviceRoleList = taskService.getServiceRoleList();//服务角色
		}
		
//		System.out.println(zXserviceList);
//		System.out.println(zHserviceList);
//		System.out.println(serviceTypeList);
		List<Map<String,Object>>  trList= userService.getThroughTrain();	
		List<Map<String,Object>>  bannerList= userService.getBannerList();	
		model.addAttribute("zXserviceList", zXserviceList);
		model.addAttribute("zHserviceList", zHserviceList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("serviceRoleList", serviceRoleList);
		model.addAttribute("throughTrain",trList);
		model.addAttribute("bannerList",bannerList);
		if(user != null){
			notify(user,model);
		}
		
		
		
		//当前在线用户
		//HashMap<String,Object>  users=(HashMap<String, Object>) request.getServletContext().getAttribute("users");
		//if(users==null){
			//users=new HashMap<String,Object>();
	//	}
	//	model.addAttribute("users",users);
		return "proscenium2/index";
	}
	
	
	
	
	/**
	 * 由服务id显示服务处理的欢迎页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceWelcome")
	public String serviceWelcome(HttpSession session,HttpServletRequest request,Model model, @RequestParam(value="id",required = false, defaultValue = "0") int id){
		if(id==0){
			model.addAttribute("result", "notSet");
		}else{
			User user = (User)session.getAttribute("user");
			model.addAttribute("result", "ok");
			Service service = taskService.getServiceById(id);
			String adress = service.getServiceAdress();
			if(adress.contains("http://ebt.xust.edu.cn")&& user != null){
				adress += user.getUserId();
				service.setServiceAdress(adress);
			}
				
			String  serviceRoleId=service.getRoleId();
			ServiceRole   serviceRole=taskService.selectSysRoleByPrimaryKey(serviceRoleId);
			int   servicePraise=taskService.selectServicePraise(new Integer(id).toString());
			PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
			if(pd.getCurrentUser()!=null){
			 int  havePraise=taskService.havePraise(pd.getCurrentUser().getUserId(), new Integer(id).toString());
			 model.addAttribute("havePraise",havePraise>0);
			 
			 int  haveCollection=taskService.haveCollection(pd.getCurrentUser().getUserId(), new Integer(id).toString());
			 model.addAttribute("haveCollection",haveCollection>0);
			 
			 
			 
			 
			}else{
				 model.addAttribute("havePraise",false);
				 model.addAttribute("haveCollection",false);
			}
			
			model.addAttribute("servicePraise", servicePraise);
			//通过serviceRole查找同类的服务，除了本服务id外
			 List<Service> services=taskService.getServiceByRoleId(serviceRoleId);
			 List<Service>  serviceResult=new  LinkedList<Service>();
			 int count=0;
			 for(Service serviceV:services){
				 String tempStr=serviceV.getRoleId();
				 if(serviceV.getServiceId() !=service.getServiceId()){
					 if(count<4)
					   serviceResult.add(serviceV);
					 count++;
				 }
				
			 }
					 
					 
		//	service.setFlow_chart(null);//减少网络流量,后台读取后，在处理jsp时并不发往后台
			 if(service.getFlow_chart()!=null){
				 model.addAttribute("haveFlow", true);
			 }else{
				 model.addAttribute("haveFlow", false);
			 }
			 service.setFlow_chart(null);
			service.setServiceIcon(null);
//			System.out.println(service);
			model.addAttribute("service", service);
			model.addAttribute("sys_role", serviceRole);
			model.addAttribute("user",user);
			//添加最多5个类似服务
			model.addAttribute("serviceResult",serviceResult);
		}
		return "proscenium/serviceWelcome";
	}
	/**
	 * 根据服务类型查询服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceByType")
	public String serviceByType(HttpServletRequest request,Model model,int id){
		List<Service> zXserviceList = null;
		List<Service> zHserviceList = null;
		if(id == 1 ){
			/*
			 zXserviceList = taskService.getServiceZXList();//最新服务
			 zHserviceList = taskService.getServiceZHList();//最火
			 */
			 //以上代码有问题，就是在获取最新服务时因为有limit,不是全部，导致过滤不充分。
			//添加获取全部的方法
			 zXserviceList = taskService.getServiceZXListNoLimit();//最新服务
			 zHserviceList = taskService.getServiceZHListNoLimit();//最火
			
			 PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			 zXserviceList=pd.filterService(zXserviceList);
			 zHserviceList=pd.filterService(zHserviceList);
			 model.addAttribute("zXserviceList", zXserviceList);
			 model.addAttribute("zHserviceList", zHserviceList);
			 
			
				
			 return "proscenium2/index_ajax";
		}else{
			
			 
			 /*
			 zXserviceList = taskService.getServiceZXListByType(id);
			 zHserviceList = taskService.getServiceZHListByType(id);
			 */
			 //以上代码有问题，就是在获取最新服务时因为有limit,不是全部，导致过滤不充分。
			//添加获取全部的方法
			 zXserviceList = taskService.getServiceZXListByTypeNoLimit(id);
//			 zHserviceList = taskService.getServiceZHListByTypeNoLimit(id);
			 
			 
			 PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			 zXserviceList=pd.filterService(zXserviceList);
//			 zHserviceList=pd.filterService(zHserviceList);
			 model.addAttribute("zXserviceList", zXserviceList);
//			 model.addAttribute("zHserviceList", zHserviceList);
				
			 return "proscenium2/service_ajax";
		}
	}
	
	
	/**
	 * 根据服务类型查询服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceByZH")
	public String serviceZH(HttpServletRequest request,Model model,int id){
		List<Service> zXserviceList = null;
		List<Service> zHserviceList = null;
		if(id == 1 ){
			/*
			 zXserviceList = taskService.getServiceZXList();//最新服务
			 zHserviceList = taskService.getServiceZHList();//最火
			 */
			 //以上代码有问题，就是在获取最新服务时因为有limit,不是全部，导致过滤不充分。
			//添加获取全部的方法
			 zXserviceList = taskService.getServiceZXListNoLimit();//最新服务
			 zHserviceList = taskService.getServiceZHListNoLimit();//最火
			
			 PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			 zXserviceList=pd.filterService(zXserviceList);
			 zHserviceList=pd.filterService(zHserviceList);
			 model.addAttribute("zXserviceList", zXserviceList);
			 model.addAttribute("zHserviceList", zHserviceList);
			 
			
				
			 return "proscenium2/index_ajax";
		}else{
			
			 
			 /*
			 zXserviceList = taskService.getServiceZXListByType(id);
			 zHserviceList = taskService.getServiceZHListByType(id);
			 */
			 //以上代码有问题，就是在获取最新服务时因为有limit,不是全部，导致过滤不充分。
			//添加获取全部的方法
//			 zXserviceList = taskService.getServiceZXListByTypeNoLimit(id);
			 zHserviceList = taskService.getServiceZHListByTypeNoLimit(id);
			 
			 
			 PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
//			 zXserviceList=pd.filterService(zXserviceList);
			 zHserviceList=pd.filterService(zHserviceList);
//			 model.addAttribute("zXserviceList", zXserviceList);
			 model.addAttribute("zXserviceList", zHserviceList);
				
			 return "proscenium2/service_ajax";
		}
	}
	
	

	/**
	 * 根据服务类型查询服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceByQB")
	public String serviceByQB(HttpServletRequest request,Model model,int id){
	
		List<Service> qbserviceList = taskService.getServiceByQB(id);
		 PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		 qbserviceList=pd.filterService(qbserviceList);
		 model.addAttribute("zXserviceList", qbserviceList);
				
		return "proscenium2/service_ajax";
	}
	
	/**
	 * 根据服务类型查询服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/search")
	public String search(HttpSession session,HttpServletRequest request,Model model,String name){
		User user = (User)session.getAttribute("user");
		
		if(user == null){
			List<Service> zXserviceList = taskService.getServiceZXListByName(name);
			//List<Service> zHserviceList = taskService.getServiceZHListByName(name);
			model.addAttribute("zXserviceList", zXserviceList);
			//model.addAttribute("zHserviceList", zHserviceList);

			
		}else{
			List<Service> zXserviceList = taskService.getAllServiceListByName(name,user.getUserId());
			model.addAttribute("zXserviceList", zXserviceList);

			
		}
		return "proscenium/index_search_ajax";
		
	}
	
	
	@RequestMapping(value="/searchOnlyOne")
	public String searchOnlyOne(HttpSession session,HttpServletRequest request,Model model,String name){
			List<Service> zXserviceList = taskService.getServiceZXListByName(name);
			model.addAttribute("serviceList", zXserviceList);
			return "proscenium/searchOnlyOne_ajax";
		
	}
	
	
	/**
	 * 根据服务类型查询服务
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/search_sh")
	public String searchSH(HttpSession session,HttpServletRequest request,Model model,String name) throws Exception{
		User user = (User)session.getAttribute("user");
		String userName = user.getUsername();//用户名
		/**调用流程平台API查询待办*/
//		Long start = System.currentTimeMillis();
		List<BackLogService>blsList = InfoplusApiUtil.getBackLogService(userName,name);
//		Long end = System.currentTimeMillis();
//		System.out.println("查询总时间=" + (end - start));
		model.addAttribute("blsList", blsList);
		return "proscenium/taskCenter_sh";
	}
	
	/**
	 * 根据我的服务类型查询我的服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceByMyType")
	public String serviceByMyType(HttpSession session,HttpServletRequest request,Model model,int id){
		if(id==1){
			User user = (User)session.getAttribute("user");
			
			if(user==null){
				List<Service> serviceList = taskService.getServiceListByTypeAll();
				model.addAttribute("serviceList", serviceList);
				
			}else{
				List<Service> serviceList = taskService.getServiceListByTypeAllByUserId(user.getUserId());
				model.addAttribute("serviceList", serviceList);
				
			}
			
			
		}else{
			List<Service> serviceList = taskService.getServiceListByType(id);
			model.addAttribute("serviceList", serviceList);
			
		}
	

		return "proscenium/taskCenter_ajax";
	}
	
	/**
	 * 根据我的服务类型查询我的服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceByMyCollectType")
	public String serviceByMyCollectType(HttpSession session,HttpServletRequest request,Model model,int id){
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<Service> serviceList = taskService.serviceByMyCollectType(id,userId);
		model.addAttribute("serviceList", serviceList);

		return "proscenium/taskCenter_ajax";
	}
	
	/**
	 * 查询服务图标
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/img")
	public void img(HttpServletRequest request,HttpServletResponse response,Model model,int id) throws IOException{
		Service entity = taskService.getServiceById(id);
		byte[] data = entity.getServiceIcon();
		if(data !=null  &&  data.length>0){
			  response.setContentType("image/jpeg");  
		        response.setCharacterEncoding("UTF-8");  
		        OutputStream outputSream = response.getOutputStream();  
		        InputStream in = new ByteArrayInputStream(data);  
		        
		        int len = 0;  
		        byte[] buf = new byte[1024];  
		        while ((len = in.read(buf, 0, 1024)) != -1) {  
		            outputSream.write(buf, 0, len);  
		        }  
		        outputSream.close(); 
		      //  System.out.println("cahce  ok");
			
		}
		else{
			//缓存有问题，刷新缓存，
			
			
			    response.setContentType("image/jpeg");  
		        response.setCharacterEncoding("UTF-8");  
		        System.out.println("cahce  error,id:"+id);
		       
			
		}
		
		 
	}
	
	/**
	 * 查询流程图
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/imgFlow")
	public void imgFlow(HttpServletRequest request,HttpServletResponse response,Model model,int id) throws IOException{
		Service entity = taskService.getServiceById(id);
		byte[] data = entity.getFlow_chart();
		response.setContentType("image/jpeg");
		response.setCharacterEncoding("UTF-8");
		OutputStream outputSream = response.getOutputStream();
		InputStream in = new ByteArrayInputStream(data);
		int len = 0;
		byte[] buf = new byte[1024];
		while ((len = in.read(buf, 0, 1024)) != -1) {
			outputSream.write(buf, 0, len);
		}
		outputSream.close(); 
	}
	
	
	/**
	 * 查询服务图标
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/img_name")
	public void imgName(HttpServletRequest request,HttpServletResponse response,Model model,String name) throws IOException{
		Service entity = taskService.getServiceByName(name);
		byte[] data = entity.getServiceIcon();
		
		  response.setContentType("image/jpeg");  
	        response.setCharacterEncoding("UTF-8");  
	        OutputStream outputSream = response.getOutputStream();  
	        InputStream in = new ByteArrayInputStream(data);  
	        
	        int len = 0;  
	        byte[] buf = new byte[1024];  
	        while ((len = in.read(buf, 0, 1024)) != -1) {  
	            outputSream.write(buf, 0, len);  
	        }  
	        outputSream.close();  
	}
	
	
	/**
	 * 查询服务图标
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/typeImg")
	public void typeImg(HttpServletRequest request,HttpServletResponse response,Model model,int id) throws IOException{
		ServiceType entity = taskService.getServiceTypeById(id);
		byte[] data = entity.getTypeIcon();
		
	  	response.setContentType("image/jpeg");  
        response.setCharacterEncoding("UTF-8");  
        OutputStream outputSream = response.getOutputStream();  
        InputStream in = new ByteArrayInputStream(data);  
        
        int len = 0;  
        byte[] buf = new byte[1024];  
        while ((len = in.read(buf, 0, 1024)) != -1) {  
            outputSream.write(buf, 0, len);  
        }  
        outputSream.close();  
	}
	
	
	
	
	
	
	
	
	/**
	 * 跳转到服务中心
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/taskCenter")
	public String taskCenter(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		User user = (User)session.getAttribute("user");
//		System.out.println("user=" + user);
		List<Service> serviceList = taskService.getServiceByUserId(user.getUserId());
		List<ServiceType> serviceTypeList = taskService.getServiceTypeByUserId(user.getUserId());
		
//		System.out.println(serviceList);
//		System.out.println(serviceTypeList);
		List<Map<String,Object>>  trList= userService.getThroughTrain();	
		model.addAttribute("throughTrain",trList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("serviceList", serviceList);
		notify(user,model);
		return "proscenium/taskCenter";
	}
	
	public void notify(User user,Model model) throws Exception{
		int dbsl = InfoplusApiUtil.dbsl(user.getUserId());
		int dshsl = InfoplusApiUtil.dshsl(user.getUserId());
		String accountName = "zhaoanxin";
		String mailCount = MailApi.mailCount(accountName);
		String mailUrl = LoginFolder.getMailUrl(accountName);
		Mail mail =new Mail(mailCount,accountName,mailUrl);
		model.addAttribute("mail", mail);
		Message message = new Message(dbsl + dshsl,dbsl,dshsl);
		model.addAttribute("message", message);

	}
	/**
	 * 跳转到个人中心
	 * 如果科研成果数据更新后，务必执行：以admin登录后执行：http://localhost:8080/ossh/user/updateResearchProject.html?all=all，
	 * 或者单个记录更新后，程序调用更新的方法即可。
	 * 最笨的方法是查询某个人时，就单独更新某个人，更新完后再查询
	 * 
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/personalCenter")
	public String personalCenter(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
		
		User user = (User)session.getAttribute("user");	
	
	
		if(user==null){
			return "redirect:findex.html";
		}
		
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		user = (User)session.getAttribute("user");
		String userId = user.getUserId();
  //从数据库中提取个人基本信息
		model.addAttribute("userId", pd.getCurrentUser().getUserId());
		model.addAttribute("userName", pd.getCurrentUser().getUsername());
		model.addAttribute("user", user);
		
		
		/* 旧表作废，
		List<Map<String,Object>>  userInformation= userService.getUserRecord(userId);
		if(userInformation.size()>0){
			model.addAttribute("userInformation", userInformation.get(0));
		}else{
			model.addAttribute("userInformation", null);
		}
		*/
		
		
		List<Map<String,Object>>  userInformation= userService.getUserRecord(userId);
		if(userInformation.size()>0){
			model.addAttribute("userInformation", userInformation.get(0));
		}else{
			model.addAttribute("userInformation", null);
		}
		
		
		
		
		//从数据库t_jzg读取数据
		List<Map<String,Object>>  t_jzg= userService.getT_jzg(userId);
		if(t_jzg.size()>0){
			model.addAttribute("t_jzg", t_jzg.get(0));
		}else{
			model.addAttribute("t_jzg", null);
		}
		
		
		
		//家庭成员
		List<Map<String,Object>>  jtgxInformation= userService.getJtgxInformation(userId);
		if(jtgxInformation.size()>0){
			model.addAttribute("jtgxInformation", jtgxInformation);
		}else{
			model.addAttribute("jtgxInformation", null);
		}
		
		
		//判断用户是老师，学生还是管理员，默认为老师。
		
		 if(user.isStudent.equals("none") ){
			 user.isStudent= userService.getUserIsStudent(user.getUserId()) ?  "student":"teacher";
		 }
		 if  (user.isStudent.equals("student")){
			 
			//资质信息			
				List<Map<String,Object>>  qualificationInformation= userService.getQualification(userId);
				if(qualificationInformation.size()>0){
					model.addAttribute("qualificationInformation", qualificationInformation.get(0));
				}else{
					model.addAttribute("qualificationInformation", null);
				}
				
				
				
				
				//工作经历			
				List<Map<String,Object>>  workInformation= userService.getWorkInformation(userId);
				if(workInformation.size()>0){
					model.addAttribute("workInformation", workInformation);
				}else{
					model.addAttribute("workInformation", null);
				}
				
				
				
				//学习经历			
				List<Map<String,Object>>  studyInformation= userService.getStudyInformation(userId);
				if(studyInformation.size()>0){
					model.addAttribute("studyInformation", studyInformation);
				}else{
					model.addAttribute("studyInformation", null);
				}
				
				
				
				
				
				//岗位信息			
				List<Map<String,Object>>  postInformation= userService.getPostInformation(userId);
				if(postInformation.size()>0){
					model.addAttribute("postInformation", postInformation);
				}else{
					model.addAttribute("postInformation", null);
				}
				
				
				//职称信息			
				List<Map<String,Object>>  titleInformation= userService.getTitleInformation(userId);
				if(titleInformation.size()>0){
					model.addAttribute("titleInformation", titleInformation);
				}else{
					model.addAttribute("titleInformation", null);
				}
				
				//新的推过来的信息：本专科生基本信息
				List<Map<String,Object>>  student= userService.getBasicStudentInformation(userId);
				if(student.size()>0){
					model.addAttribute("studentInformation", student.get(0));
				}else{
					model.addAttribute("studentInformation", null);
				}
				
				if(user != null){
					notify(user,model);
				}

			 
			return "proscenium/personalCenterStudent";
		 }
			
		
				
		//老师或默认
			//资质信息			
			List<Map<String,Object>>  qualificationInformation= userService.getQualification(userId);
			if(qualificationInformation.size()>0){
				model.addAttribute("qualificationInformation", qualificationInformation.get(0));
			}else{
				model.addAttribute("qualificationInformation", null);
			}
			
			
			//岗位信息
			List<Map<String,Object>>  T_JZG_RZ= userService.getT_JZG_RZ(userId);
			if(T_JZG_RZ.size()>0){
				model.addAttribute("T_JZG_RZ", T_JZG_RZ.get(0));
			}else{
				model.addAttribute("T_JZG_RZ", null);
			}
			
			
			
			//工作经历			
			List<Map<String,Object>>  workInformation= userService.getWorkInformation(userId);
			if(workInformation.size()>0){
				model.addAttribute("workInformation", workInformation);
			}else{
				model.addAttribute("workInformation", null);
			}
			
			
			
			//学习经历			
			List<Map<String,Object>>  studyInformation= userService.getStudyInformation(userId);
			if(studyInformation.size()>0){
				model.addAttribute("studyInformation", studyInformation);
			}else{
				model.addAttribute("studyInformation", null);
			}
			
			
			//岗位信息	
			/*
			List<Map<String,Object>>  postInformation= userService.getPostInformation(userId);
			if(postInformation.size()>0){
				model.addAttribute("postInformation", postInformation);
			}else{
				model.addAttribute("postInformation", null);
			}
			*/
			
			//职称信息			
			List<Map<String,Object>>  titleInformation= userService.getTitleInformation(userId);
			if(titleInformation.size()>0){
				model.addAttribute("titleInformation", titleInformation);
			}else{
				model.addAttribute("titleInformation", null);
			}
			
			
			
			
			
			/*
	 //取个人的职务
			List<Map<String,Object>>  userJobs= userService.getUserJobs(userId);
			model.addAttribute("userJobs", userJobs);
	//取个人的职称
			List<Map<String,Object>>  userRanks= userService.getUserRanks(userId);
			model.addAttribute("userRanks", userRanks);
			
			
	//取个人的手机，邮箱
			List<Map<String,Object>>  userActualInformation= userService.getUserActualInformation(userId);
	 //从数据库中提取学习情况
			List<Map<String,Object>>  userLearning= userService.userLearning(userId);
			model.addAttribute("userLearning", userLearning);
	//业务直通车
			List<Map<String,Object>>  trList= userService.getThroughTrain();	
			model.addAttribute("throughTrain",trList);
			*/
			if(user != null){
				notify(user,model);
			}

		return "proscenium/personalCenter4";
	}
	
	
	/**
	 * 跳转到服务中心 审核界面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/taskCenter_sh")
	public String taskCenter_sh(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
		/**调用流程平台API查询待办*/
//		Long start = System.currentTimeMillis();
		List<BackLogService>blsList = InfoplusApiUtil.getBackLogService(userId);
		if(blsList.size() !=0){
			taskService.saveOrUpdateBackLog(blsList,userId);
		}
	
		List<ServiceType> serviceTypeList = taskService.getBackLogServiceTypeByUserId(user.getUserId());

//		Long end = System.currentTimeMillis();
//		System.out.println("查询总时间=" + (end - start));
		List<Map<String,Object>>  trList= userService.getThroughTrain();
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("throughTrain", trList);
		model.addAttribute("blsList", blsList);
		return "proscenium/taskCenter_sh";
	}
	
	
	/**
	 * 跳转到审核页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/taskCenter_sp")
	public String taskCenter_sp(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,String code) throws Exception{
//		String appName = URLDecoder.decode(app,"utf8" );
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
		List<com.udata.osp.entity.Process> processList = InfoplusApiUtil.getBackLog(userId,code == null ? session.getAttribute("code").toString() : code);
		if(code != null)
		session.setAttribute("code",code);
//		System.out.println("processList ======> " + processList);
		model.addAttribute("processList", processList);
		return "proscenium/taskCenter_sp";
	}
	
	
	/**
	 * 跳转到审核完成页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/taskCenter_wc")
	public String taskCenter_wc(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		String code = session.getAttribute("code").toString();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
		/**查询已完成*/
		PageInfo pageInfo  = InfoplusApiUtil.getYWCByPage(userId, code, page, pageSize);
		pageInfo.setPageSize(pageSize);
		
		model.addAttribute("pageInfo", pageInfo);
		return "proscenium/taskCenter_wc";
	}
	
	/**
	 * 跳转到审核完成页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/taskCenter_wc_ajax")
	public String taskCenter_wc_ajax(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		String code = session.getAttribute("code").toString();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
		/**查询已完成*/
		PageInfo pageInfo  = InfoplusApiUtil.getYWCByPage(userId, code, page, pageSize);
		pageInfo.setPageSize(pageSize);
		
		model.addAttribute("pageInfo", pageInfo);
		return "proscenium/taskCenter_wc_ajax";
	}
	/**
	 * 跳转到申请人待办理页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/sqr_to_dbl")
	public String taskCenterSqrDbl(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
//		/**调用待办接口*/
		List<com.udata.osp.entity.Process> processList = InfoplusApiUtil.getDbl(userId);
		model.addAttribute("processList", processList);
		if(user != null){
			notify(user,model);
		}
		return "proscenium/sqr_dbl";
	}
	
	
	/**
	 * 跳转到申请人待办理页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/sqr_to_slz_ajax")
	public String sqr_to_slz_ajax(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
//		/**调用在办接口*/
		PageInfo pageInfo = InfoplusApiUtil.getSlz(userId,page,pageSize);
		pageInfo.setPageSize(pageSize);
		model.addAttribute("pageInfo", pageInfo);
		return "proscenium/sqr_slz_ajax";
	}
	
	/**
	 * 跳转到申请人受理中页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/sqr_to_slz")
	public String taskCenterSqrSlz(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
//		/**调用在办接口*/
		PageInfo pageInfo = InfoplusApiUtil.getSlz(userId,page,pageSize);
		pageInfo.setPageSize(pageSize);
		model.addAttribute("pageInfo", pageInfo);
		if(user != null){
			notify(user,model);
		}
		return "proscenium/sqr_slz";
	}
	
	
	/**
	 * 跳转到申请人完成页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/sqr_to_wc")
	public String taskCenterSqrWc(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
//		/**调用在办接口*/
		PageInfo pageInfo  = InfoplusApiUtil.getSqrWc(userId,page,pageSize);
		pageInfo.setPageSize(pageSize);
		model.addAttribute("pageInfo", pageInfo);
		if(user != null){
			notify(user,model);
		}
		return "proscenium/sqr_wc";
	}
	
	
	/**
	 * 跳转到申请人完成页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/sqr_wc_ajax")
	public String taskCenterSqrWcAjax(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required = false, defaultValue = "0") Integer page,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();//用户名
//		/**调用在办接口*/
		PageInfo pageInfo  = InfoplusApiUtil.getSqrWc(userId,page,pageSize);
		pageInfo.setPageSize(pageSize);
		model.addAttribute("pageInfo", pageInfo);
		return "proscenium/sqr_wc_ajax";
	}
	/**
	 * 主页取得图标
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	
	@ResponseBody
	@RequestMapping(value = "getServicesUl", method = RequestMethod.POST)
	public void getServicesUl(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		List<ServiceRole> serviceRoles=taskService.getServiceRoleList();
		
		//对当前用户的权限进行过滤
		//判断用户是否登录，登录的后，取得该用户的角色，角色下的服务。
				PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
				if (   pd.haveLogin()  && !pd.isAdmin()){
					List<ServiceRole> serviceRoleList = taskService.getServiceRoleList();//服务角色
					List<UserRole> userRoleList=pd.getRole();
					 //取得角色中不是当前用户的服务
					 List<ServiceRole>  serviceRoleResult=new LinkedList<ServiceRole>();
					 for(ServiceRole   serviceRole:serviceRoleList){
						 for(UserRole ur:userRoleList){
							 if(ur.getRole_id().equals(serviceRole.getRoleId())){
								 serviceRoleResult.add(serviceRole);
								 break;
							 }
						 }
					 }
					 serviceRoles=serviceRoleResult;
				}
		jsonDeal.putResponse(serviceRoles);
	}
	
	
	
	
	/**
	 * 由图标取得图标下边的服务名
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = "getSubServicesUl", method = RequestMethod.POST)
	public void getSubServicesUl2(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		 List<Service> services=taskService.getServiceByRoleId(jsonDeal.getMapString("roleId"));
		jsonDeal.putResponse(services);
		
	}
	
	
	
	/**
	 * 点赞
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = "praise", method = RequestMethod.POST)
	public void praise(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="isPraise",required = false, defaultValue = "true") boolean isPraise) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}		
		 String result="";
		 if(isPraise){
			 result=taskService.praise(pd.getCurrentUser().getUserId(),jsonDeal.getMapString("serviceId"));
		 }else{
			 result=taskService.cancelPraise(pd.getCurrentUser().getUserId(),jsonDeal.getMapString("serviceId"));			 
		 }
		 //将点赞数目返回
		int   servicePraise=taskService.selectServicePraise(jsonDeal.getMapString("serviceId"));
		//将该评论的点赞数目更新到service中
		taskService.updatePraiseCount(jsonDeal.getMapString("serviceId"),servicePraise);
		
			
			
		jsonDeal.putResponse("{'result':'"+result+"',sum:"+servicePraise+"}");
		
	}
	
	
	/**
	 * 收藏
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "saveCollection", method = RequestMethod.POST)
	public void saveCollection(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="isCancel",required = false, defaultValue = "true") boolean isCancel) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if(!pd.haveLogin()){
			jsonDeal.putResponse("{'result':'noLogin'}");
			return;
		}
		 String result="";
		 if(isCancel){
			 result=taskService.cancelCollection(pd.getCurrentUser().getUserId(),jsonDeal.getMapString("serviceId"));			 
		 }else{
			 result=taskService.saveCollection(pd.getCurrentUser().getUserId(),jsonDeal.getMapString("serviceId"));			 
		 }
		 
		 //将收藏数目更新到service中
			int   servicePraise=taskService.selectServiceCollection(jsonDeal.getMapString("serviceId"));
			//将该评论的点赞数目更新到service中
			taskService.updateCollectionCount(jsonDeal.getMapString("serviceId"),servicePraise);
			
			
		jsonDeal.putResponse("{'result':'"+result+"'}");
		
		
		
	}
	
	
	
	

	
	/**
	 * 由服务id显示服务处理的欢迎页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/pinglun")
	public String pinglun(HttpServletRequest request,Model model, @RequestParam(value="id",required = false, defaultValue = "0") int id){
		
		return "proscenium/pinglun";
	}
	
	
	/**
	 * 我的收藏
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/taskCenter_collect")
	public String collect(HttpSession session,HttpServletRequest request,Model model, @RequestParam(value="id",required = false, defaultValue = "0") int id) throws Exception{
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		List<Service> serviceList=taskService.getMycollectByUserId(userId);
		List<ServiceType> serviceTypeList = taskService.getMycollectTypeByUserId(userId);//服务类型
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("serviceList", serviceList);
		if(user != null){
			notify(user,model);
		}
		return "proscenium/taskCenter_Mycollect";
	}
	
	
	@RequestMapping(value="/imgThroughTrain")
	public void imgThroughTrain(HttpServletRequest request,HttpServletResponse response,Model model,String id) throws IOException{

		List<Map<String, Object>> list = taskService.getThroughTrainImg(id);
		byte[] data;
		if(list.size()>0){
			data= (byte[])list.get(0).get("icon");
		}
		else{
			data=new  byte[]{};
		}
	
		
	  	response.setContentType("image/jpeg");  
        response.setCharacterEncoding("UTF-8");  
        OutputStream outputSream = response.getOutputStream();  
        InputStream in = new ByteArrayInputStream(data);  
        
        int len = 0;  
        byte[] buf = new byte[1024];  
        while ((len = in.read(buf, 0, 1024)) != -1) {  
            outputSream.write(buf, 0, len);  
        }  
        outputSream.close();  
	}
	
	
	
	@RequestMapping(value="/imgBanner")
	public void imgBanner(HttpServletRequest request,HttpServletResponse response,Model model,int id) throws IOException{

		List<Map<String, Object>> list = taskService.getBannerImg(id);
		byte[] data;
		if(list.size()>0){
			data= (byte[])list.get(0).get("banner_icon");
		}
		else{
			data=new  byte[]{};
		}
	
		
	  	response.setContentType("image/jpeg");  
        response.setCharacterEncoding("UTF-8");  
        OutputStream outputSream = response.getOutputStream();  
        InputStream in = new ByteArrayInputStream(data);  
        
        int len = 0;  
        byte[] buf = new byte[1024];  
        while ((len = in.read(buf, 0, 1024)) != -1) {  
            outputSream.write(buf, 0, len);  
        }  
        outputSream.close();  
	}
	
	
	@ResponseBody
	@RequestMapping(value = "changeLearningOrder", method = RequestMethod.POST)
	public void changeLearningOrder(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);
		 userService.setLearningOrderById(jsonDeal.getMapString("id"),jsonDeal.getMapString("idOrder"));
		 userService.setLearningOrderById(jsonDeal.getMapString("otherId"),jsonDeal.getMapString("otherIdOrder"));
		jsonDeal.putResponse("{}");
		
	}
	
	
	/**
	 * 查找全部服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/allService")
	public String allService(HttpSession session,HttpServletRequest request,Model model){
		   //全部服务有两种，没有登录，是全部
		List<Service> allService=null;
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		if (   pd.haveLogin()  && !pd.isAdmin()){
			
			 allService = userService.getServiceAllList(pd.getCurrentUser().getUserId());
			
		}else{
			 allService = taskService.getServiceAllZHList();//all  为全部
			
		}
		   //登录后仅仅取该角色下的服务
		
			
			model.addAttribute("zHserviceListAll", allService);
			return "proscenium/index_ajax_all_services";		
	}
	
	
	
	/**
	 * 查找全部服务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/throughTrainAjax")
	public String throughTrainAjax(HttpSession session,HttpServletRequest request,Model model){
		//业务直通车
		List<Map<String,Object>>  trList= userService.getThroughTrain();
		model.addAttribute("throughTrain",trList);
		return "proscenium/personal_ajax/through_train";		
	}
	
	
	/**
	 * 我的收藏
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myCollectonAjax")
	public String myCollectonAjax(HttpSession session,HttpServletRequest request,Model model){
		//我的收藏的数据
		User  user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		List<Service> serviceList=taskService.getMycollectByUserId(userId);
		List<ServiceType> serviceTypeList = taskService.getMycollectTypeByUserId(userId);//服务类型
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("serviceList", serviceList);
		
		return "proscenium/personal_ajax/myCollectonAjax";		
	}
	public  static void  main(String[]  agrs){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		Date now = new Date(); 
		int  a=now.getYear()+1900;
		System.out.println(a);
		int b=now.getYear()+1900-1;
		System.out.println(b);
		System.out.println(getWeekOfDate(now));
		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

		java.util.Date time=null;
		try {
		  // time= sdf.parse(sdf.format(new Date()));
			 time= sdf.parse("2017-10-21");

		} catch (Exception e) {

		   e.printStackTrace();
		}
		
		
		 Calendar cal = Calendar.getInstance();
	        cal.setTime(now);
	       int  w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	       int  year=cal.get(Calendar.YEAR);
	       int  month=cal.get(Calendar.MONTH)+1;
	       int day=cal.get(Calendar.DATE);
	       System.out.println("week:"+w+" year:"+year+" month:"+month+" day:"+day);
	       
	        
	        
		System.out.println(w);
		
		
	}
	/**
     * 获取当前日期是星期几<br>
     * 
     * @param dt
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return weekDays[w];
    }
	
	/**
	 * 教学信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myServiceAjax")
	public String myServiceAjax(HttpSession session,HttpServletRequest request,Model model){
		//为了演示的速度，暂时注释掉读取数据库操作
		/*
		User  user = (User)session.getAttribute("user");
		//我的任务中的我的服务
		List<Service> serviceListInTask = taskService.getServiceByUserId(user.getUserId());
		model.addAttribute("serviceListInTask", serviceListInTask);
		*/
		//return "proscenium/personal_ajax/myServiceAjax";//将请求重新定向到新的ajax请求
		//读取本年有关的第一学期周数
	
		List<Map<String,Object>>  listFirstWerks= userService.getFirstWerks();	
		model.addAttribute("listFirstWerks",listFirstWerks);
		 Calendar cal = Calendar.getInstance();
	        cal.setTime(new  Date());
	       int  w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	       int  year=cal.get(Calendar.YEAR);
	       int  month=cal.get(Calendar.MONTH)+1;
	       int day=cal.get(Calendar.DATE);
		   model.addAttribute("weekday",w);
		   model.addAttribute("year",year);
		   model.addAttribute("month",month);
		   model.addAttribute("day",day);
		   String last=String.valueOf(year-1);
		   String first=String.valueOf(year);
		   String next=String.valueOf(year+1);
		   
		   
		//取得当年的，当前用户的课表
		   User  user = (User)session.getAttribute("user");
		//	PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			//String order=userService.getUserOrder(pd.getCurrentUser().getUserId());
		//	if(order==null)
			 // model.addAttribute("schedules",null);
			//else
			//{
				
				  List<Map<String,Object>>  schedules= userService.getSchedules(user.getUserId(),last+"-"+first,first+"-"+next);
				// List<Map<String,Object>>  schedules= userService.getSchedules("003807",last+"-"+first,first+"-"+next);	
				  model.addAttribute("schedules",schedules);
				
			//}
		
		 
					String userId = user.getUserId();
					model.addAttribute("userId",user.getUserId());
					
					
					
					//教学工作量
					PageHelper.startPage(1, 10);
					List<Map<String,Object>>  jxgzlInformation= userService.getJxgzlInformation(userId);	
					com.github.pagehelper.PageInfo
					 pageInfo2 = new com.github.pagehelper.PageInfo(jxgzlInformation);
					model.addAttribute("jxgzlInformation", jxgzlInformation);
					model.addAttribute("jxgzlInformationFirstRow", pageInfo2.getStartRow());
					model.addAttribute("jxgzlInformationEndRow", pageInfo2.getEndRow());
					model.addAttribute("jxgzlInformationTotal", pageInfo2.getTotal());
					
					
					
		
		return "proscenium/personal_ajax/myServiceAjax2";		
	}
	
	
	
	/**
	 * 学生财务
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/studentFinance")
	public String studentFinance(HttpSession session,HttpServletRequest request,Model model){
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/studentFinance";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		model.addAttribute("userId",userId);
		//学费缴纳
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  tuitionInformation= userService.getTuition(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(tuitionInformation);
		model.addAttribute("tuitionInformation", tuitionInformation);
		model.addAttribute("tuitionInformationFirstRow", pageInfo.getStartRow());
		model.addAttribute("tuitionInformationEndRow", pageInfo.getEndRow());
		model.addAttribute("tuitionInformationTotal", pageInfo.getTotal());
		
		//校园消费
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  campusConsumptionInformation= userService.getCampusConsumption(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo2 = new com.github.pagehelper.PageInfo(campusConsumptionInformation);
		model.addAttribute("campusConsumptionInformation", campusConsumptionInformation);
		model.addAttribute("campusConsumptionInformationFirstRow", pageInfo2.getStartRow());
		model.addAttribute("campusConsumptionInformationEndRow", pageInfo2.getEndRow());
		model.addAttribute("campusConsumptionInformationTotal", pageInfo2.getTotal());
		
		
		//图书欠费
		PageHelper.startPage(1, 10);
		//List<Map<String,Object>>  books_arrearageInformation= userService.getBooksArrearage(userId);	
		List<Map<String,Object>>  books_arrearageInformation= userService.getBooksArrearage2(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo3 = new com.github.pagehelper.PageInfo(books_arrearageInformation);
		model.addAttribute("books_arrearageInformation", books_arrearageInformation);		
		model.addAttribute("books_arrearageInformationTotal", pageInfo3.getTotal());
		
		
		return "proscenium/personal_ajax/studentFinance";		
	}
	
	
	
	/**
	 * 个人其它信息ajax
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/otherPersonalInformationAjax")
	public String otherPersonalInformationAjax(HttpSession session,HttpServletRequest request,Model model){
		User  user = (User)session.getAttribute("user");
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		String order=userService.getUserOrder(pd.getCurrentUser().getUserId());
		if(order==null)
		  model.addAttribute("order","1,2,3,4,5,6");
		else
		   model.addAttribute("order",order);
		//取得该用户的科研项目情况
		
				//查询之前先更新。虽然这样自动，单体现不了缓存表的优点，不如直接放在内存中，不用中间表。
				userService.InsertIntoReSearchProject(pd.getCurrentUser().getUserId());
				//查询
				List<Map<String,Object>>  listManage= userService.getManageSearchProjectByUserId(pd.getCurrentUser().getUserId());
				List<Map<String,Object>>  listParticipate= userService.getParticipateSearchProjectByUserId(pd.getCurrentUser().getUserId());		
				//为了简化jsp的书写，提前拼接出字符串
				String country="[";
				if(listManage.size()>0){
					int num=(int)listManage.get(0).get("country");
					if(num==0){
						country+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
					}else{
						country+=num;
					}
				}else{
					country+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
				}
				if(listParticipate.size()>0){
					int num=(int)listParticipate.get(0).get("country");
					if(num==0){
						country+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
					}else{
						country+=","+num+"]";;
					}
				}else{
					country+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
				}
				model.addAttribute("country",country);
				
				
				
				String province="[";
				if(listManage.size()>0){
					int num=(int)listManage.get(0).get("province");
					if(num==0){
						province+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
					}else{
						province+=num;
					}
				}else{
					province+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
				}
				if(listParticipate.size()>0){
					int num=(int)listParticipate.get(0).get("province");
					if(num==0){
						province+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
					}else{
						province+=","+num+"]";;
					}
				}else{
					province+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
				}
				model.addAttribute("province",province);
				
				

				
				String city="[";
				if(listManage.size()>0){
					int num=(int)listManage.get(0).get("city");
					if(num==0){
						city+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
					}else{
						city+=num;
					}
				}else{
					city+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
				}
				if(listParticipate.size()>0){
					int num=(int)listParticipate.get(0).get("city");
					if(num==0){
						city+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
					}else{
						city+=","+num+"]";;
					}
				}else{
					city+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
				}
				model.addAttribute("city",city);
				
				
				
				String other="[";
				if(listManage.size()>0){
					int num=(int)listManage.get(0).get("other");
					if(num==0){
						other+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
					}else{
						other+=num;
					}
				}else{
					other+="{value:0,label:{normal: {  show: false }},itemStyle:{}}";
				}
				if(listParticipate.size()>0){
					int num=(int)listParticipate.get(0).get("other");
					if(num==0){
						other+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
					}else{
						other+=","+num+"]";;
					}
				}else{
					other+=","+"{value:0,label:{normal: {  show: false }},itemStyle:{}}"+"]";;
				}
				model.addAttribute("other",other);
				
				
				//取得该用户的科研成果
				List<Map<String,Object>>  listAchievements= userService.getAchievementsByUserId(pd.getCurrentUser().getUserId());
				int  sci=0;
				int dissertation=0;
				int patent=0;
				int achievements=0;
				for(Map<String,Object> map :listAchievements){
					if(    
							(  (String) map.get("type") ).equals("SCI/EI")
							){
						sci=( (Long) map.get("ct") ).intValue();				
					}
					if(    
							(  (String) map.get("type") ).equals("专利")
							){
						dissertation=( (Long) map.get("ct") ).intValue();				
					}
					if(    
							(  (String) map.get("type") ).equals("其它论文")
							){
						patent=( (Long) map.get("ct") ).intValue();				
					}
					if(    
							(  (String) map.get("type") ).equals("成果")
							){
						achievements=( (Long) map.get("ct") ).intValue();				
					}
				}
				model.addAttribute("sci",sci);
				model.addAttribute("dissertation",dissertation);
				model.addAttribute("patent",patent);
				model.addAttribute("achievements",achievements);
				
				
				
				
				//取得该用户的科研成果
				List<Map<String,Object>>  listFinance= userService.getFinanceByUserId(pd.getCurrentUser().getUserId());
				int  comeAndGo=0;
				int  projectAccount=0;
				for(Map<String,Object> map :listFinance){
					if(    
							(  (String) map.get("type") ).equals("往来账")
							){
						comeAndGo=( (Long) map.get("ct") ).intValue();				
					}
					if(    
							(  (String) map.get("type") ).equals("项目账")
							){
						projectAccount=( (Long) map.get("ct") ).intValue();				
					}			
				}		
				model.addAttribute("comeAndGo",comeAndGo);
				model.addAttribute("projectAccount",projectAccount);
				
				
				//取得该用户的指导学生情况
				List<Map<String,Object>>  listGuide= userService.getGuideByUserId(pd.getCurrentUser().getUserId());
						int  undergraduate=0;
						int  master=0;
						int  doctor=0;
						for(Map<String,Object> map :listGuide){
							if(    
									(  (String) map.get("student_type") ).equals("本科生")
									){
								undergraduate=( (Long) map.get("ct") ).intValue();				
							}
							if(    
									(  (String) map.get("student_type") ).equals("硕士生")
									){
								master=( (Long) map.get("ct") ).intValue();				
							}
							if(    
									(  (String) map.get("student_type") ).equals("博士生")
									){
								doctor=( (Long) map.get("ct") ).intValue();				
							}
						}		
						model.addAttribute("undergraduate",undergraduate);
						model.addAttribute("master",master);
						model.addAttribute("doctor",doctor);
						
						//取得该用户的经费情况
					List<Map<String,Object>>  listFunding= userService.getFundingByUserId(pd.getCurrentUser().getUserId());
					int  contractFunding=0;
					int  incomeFunding=0;
					int  fundBalance=0;
					
					for(Map<String,Object> map :listFunding){
						if(    
								(  (String) map.get("type") ).equals("合同经费")
								){
							contractFunding=( (Long) map.get("ct") ).intValue();				
						}
						if(    
								(  (String) map.get("type") ).equals("到款经费")
								){
							incomeFunding=( (Long) map.get("ct") ).intValue();				
						}
						if(    
								(  (String) map.get("type") ).equals("经费余额")
								){
							fundBalance=( (Long) map.get("ct") ).intValue();				
						}
					}		
					model.addAttribute("contractFunding",contractFunding);
					model.addAttribute("incomeFunding",incomeFunding);
					model.addAttribute("fundBalance",fundBalance);
		
		
		return "proscenium/personal_ajax/otherPersonalInformationAjax";		
	}
	
	
	/**
	 * 老师 科研信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/searchlInformationAjax2")
	public String searchlInformationAjax2(HttpSession session,HttpServletRequest request,Model model){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/searchlInformationAjax2";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		model.addAttribute("userId",user.getUserId());
		//科研项目	
		/*
		PageHelper.startPage(1, 10);
		//List<Map<String,Object>>  researchInformation= userService.getResearch(userId);	
		List<Map<String,Object>>  researchInformation= 
				userService.getStatementsByUserId("ossh_personal_research_project","user_id","'"+userId+"'","ORDER BY date DESC ");	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(researchInformation);
		model.addAttribute("researchInformation", researchInformation);
		model.addAttribute("researchInformationFirstRow", pageInfo.getStartRow());
		model.addAttribute("researchInformationEndRow", pageInfo.getEndRow());
		model.addAttribute("researchInformationTotal", pageInfo.getTotal());
		*/
		//去掉
		//将前台的
	   //  <!-- 
		 //    虽然标签页科研完成数据的读取，但是视图的union没有优化。改为mybatis读取。
		//        <springTag:researchInformation    dataName="ex_view_kyxm" 
		 //        setName="researchInformation2"  userFieldId="ZGH"  other= "ORDER BY ND DESC "> 
		//        </springTag:researchInformation>
		 //      -->
		
		
		/*改为从3张表中读取，横向，纵向，校际*/
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  researchInformation= userService.getResearchFromThree(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(researchInformation);
		model.addAttribute("researchInformation2", researchInformation);
		model.addAttribute("researchInformation2Total", pageInfo.getTotal());
		
		       
		//科研论文 从表T_KY_LW,T_KY_LW_RY两表关联
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  kylwInformation= userService.getKYLW(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoLW = new com.github.pagehelper.PageInfo(kylwInformation);
		model.addAttribute("kylwInformation", kylwInformation);
		model.addAttribute("kylwInformationTotal", pageInfoLW.getTotal());
		
		
		
		//科研专利			
		//List<Map<String,Object>>  patentInformation= userService.getPatent(userId);	
		//model.addAttribute("patentInformation", patentInformation);
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  patentInformation= userService.getPatent2(userId);	
		model.addAttribute("patentInformation", patentInformation);
		com.github.pagehelper.PageInfo
		 pageInfoZL = new com.github.pagehelper.PageInfo(patentInformation);
		model.addAttribute("zlInformationTotal", pageInfoZL.getTotal());
		
		
		//书籍著作权
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  sjzzqInformation= userService.getSJZZ(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoSJZZ = new com.github.pagehelper.PageInfo(sjzzqInformation);
		model.addAttribute("sjzzqInformation", sjzzqInformation);
		model.addAttribute("sjzzqInformationTotal", pageInfoSJZZ.getTotal());
		
		
		
		//软件著作权
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  rjzzqInformation= userService.getRJZZ(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoRJZZ = new com.github.pagehelper.PageInfo(rjzzqInformation);
		model.addAttribute("rjzzqInformation", rjzzqInformation);
		model.addAttribute("rjzzqInformationTotal", pageInfoRJZZ.getTotal());
		
		//获奖情况
		
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  hjqkInformation= userService.getHJQK(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoHJQK = new com.github.pagehelper.PageInfo(hjqkInformation);
		model.addAttribute("hjqkInformation", hjqkInformation);
		model.addAttribute("hjqkInformationTotal", pageInfoHJQK.getTotal());
		
		
		
		
		return "proscenium/personal_ajax/searchlInformationAjax2";		
	}
	
	
	/**
	 * 学生学业信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/studentAcademic")
	public String studentAcademic(HttpSession session,HttpServletRequest request,Model model){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/studentAcademic";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		model.addAttribute("userId",userId);
		List<Map<String,Object>>  listFirstWerks= userService.getFirstWerks();	
		model.addAttribute("listFirstWerks",listFirstWerks);
		 Calendar cal = Calendar.getInstance();
	        cal.setTime(new  Date());
	       int  w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	       int  year=cal.get(Calendar.YEAR);
	       int  month=cal.get(Calendar.MONTH)+1;
	       int day=cal.get(Calendar.DATE);
		   model.addAttribute("weekday",w);
		   model.addAttribute("year",year);
		   model.addAttribute("month",month);
		   model.addAttribute("day",day);
		   String last=String.valueOf(year-1);
		   String first=String.valueOf(year);
		   String next=String.valueOf(year+1);
		   
		   
		//取得当年的，当前用户的课表
		 
			//PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
			//String order=userService.getUserOrder(pd.getCurrentUser().getUserId());
			//if(order==null)
			//  model.addAttribute("schedules",null);
			//else
			//{
				
				  List<Map<String,Object>>  schedules= userService.getStudentSchedules(user.getUserId(),last+"-"+first,first+"-"+next);
				// List<Map<String,Object>>  schedules= userService.getSchedules("003807",last+"-"+first,first+"-"+next);	
				  model.addAttribute("schedules",schedules);
				  
					//学习成绩
				  
					PageHelper.startPage(1, 10);
					
					
					
					
					
					
				  List<Map<String,Object>>  xxcjInformation= userService.getXXCJ(user.getUserId());
				  com.github.pagehelper.PageInfo
					 pageInfo = new com.github.pagehelper.PageInfo(xxcjInformation);
				  model.addAttribute("xxcjInformationTotal", pageInfo.getTotal());
				  
				  model.addAttribute("xxcjInformation",xxcjInformation);
				  
				  //等级考试
				  List<Map<String,Object>>  djxsInformation= userService.getDjxs(user.getUserId());
				  model.addAttribute("djxsInformation",djxsInformation);
				  
				//获奖情况
					
					PageHelper.startPage(1, 10);
					List<Map<String,Object>>  hjqkInformation= userService.getHJQK(userId);	
					com.github.pagehelper.PageInfo
					 pageInfoHJQK = new com.github.pagehelper.PageInfo(hjqkInformation);
					model.addAttribute("hjqkInformation", hjqkInformation);
					model.addAttribute("hjqkInformationTotal", pageInfoHJQK.getTotal());
					
				  
				  
				
			//}
			
		
		
		return "proscenium/personal_ajax/studentAcademic";		
	}
	
	
	/**
	 * 个人中心中设备信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/deviceInformationAjax")
	public String deviceInformationAjax(HttpSession session,HttpServletRequest request,Model model){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/deviceInformationAjax";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
	
		model.addAttribute("userId",user.getUserId());
		//设备信息
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  deviceInformation= userService.getDevice(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(deviceInformation);
		model.addAttribute("deviceInformation", deviceInformation);
		model.addAttribute("deviceInformationFirstRow", pageInfo.getStartRow());
		model.addAttribute("deviceInformationEndRow", pageInfo.getEndRow());
		model.addAttribute("deviceInformationTotal", pageInfo.getTotal());
		return "proscenium/personal_ajax/deviceInformationAjax";		
	}
	
	/**
	 * 学生科研信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/studentResearch")
	public String studentResearch(HttpSession session,HttpServletRequest request,Model model){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/studentResearch";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		model.addAttribute("userId",userId);
		//科研项目	
		/*改为从3张表中读取，横向，纵向，校际*/
		/*
				PageHelper.startPage(1, 10);
				List<Map<String,Object>>  researchInformation= userService.getResearch(userId);	
				com.github.pagehelper.PageInfo
				 pageInfo = new com.github.pagehelper.PageInfo(researchInformation);
				model.addAttribute("researchInformation", researchInformation);
				model.addAttribute("researchInformationFirstRow", pageInfo.getStartRow());
				model.addAttribute("researchInformationEndRow", pageInfo.getEndRow());
				model.addAttribute("researchInformationTotal", pageInfo.getTotal());
			*/	
		
		/*改为从3张表中读取，横向，纵向，校际*/
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  researchInformation= userService.getResearchFromThree(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(researchInformation);
		model.addAttribute("researchInformation2", researchInformation);
		model.addAttribute("researchInformation2Total", pageInfo.getTotal());
		
		//科研论文 从表T_KY_LW,T_KY_LW_RY两表关联
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  kylwInformation= userService.getKYLW(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoLW = new com.github.pagehelper.PageInfo(kylwInformation);
		model.addAttribute("kylwInformation", kylwInformation);
		model.addAttribute("kylwInformationTotal", pageInfoLW.getTotal());
		//科研专利			
		//List<Map<String,Object>>  patentInformation= userService.getPatent(userId);	
		//model.addAttribute("patentInformation", patentInformation);
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  patentInformation= userService.getPatent2(userId);	
		model.addAttribute("patentInformation", patentInformation);
		com.github.pagehelper.PageInfo
		 pageInfoZL = new com.github.pagehelper.PageInfo(patentInformation);
		model.addAttribute("zlInformationTotal", pageInfoZL.getTotal());
		
		
		//书籍著作权
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  sjzzqInformation= userService.getSJZZ(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoSJZZ = new com.github.pagehelper.PageInfo(sjzzqInformation);
		model.addAttribute("sjzzqInformation", sjzzqInformation);
		model.addAttribute("sjzzqInformationTotal", pageInfoSJZZ.getTotal());
		
		//软件著作权
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  rjzzqInformation= userService.getRJZZ(userId);	
		com.github.pagehelper.PageInfo
		 pageInfoRJZZ = new com.github.pagehelper.PageInfo(rjzzqInformation);
		model.addAttribute("rjzzqInformation", rjzzqInformation);
		model.addAttribute("rjzzqInformationTotal", pageInfoRJZZ.getTotal());
				
				
		
		//个人往来款
	
		return "proscenium/personal_ajax/studentResearch";		
	}
	/**
	 * 个人中心中财务信息ajax
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/financeInformationAjax")
	public String financeInformationAjax(HttpSession session,HttpServletRequest request,Model model){
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/financeInformationAjax";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		model.addAttribute("userId",userId);
		//个人往来款
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  financeInformation= userService.getFinance(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(financeInformation);
		model.addAttribute("financeInformation", financeInformation);
		model.addAttribute("financeInformationTotal", pageInfo.getTotal());
		
		
		
		
		//图书欠费
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  books_arrearageInformation= userService.getBooksArrearage(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo3 = new com.github.pagehelper.PageInfo(books_arrearageInformation);
		model.addAttribute("books_arrearageInformation", books_arrearageInformation);		
		model.addAttribute("books_arrearageInformationTotal", pageInfo3.getTotal());
		
		
		 //校园消费
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  campusConsumptionInformation= userService.getCampusConsumption(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo2 = new com.github.pagehelper.PageInfo(campusConsumptionInformation);
		model.addAttribute("campusConsumptionInformation", campusConsumptionInformation);
		model.addAttribute("campusConsumptionInformationFirstRow", pageInfo2.getStartRow());
		model.addAttribute("campusConsumptionInformationEndRow", pageInfo2.getEndRow());
		model.addAttribute("campusConsumptionInformationTotal", pageInfo2.getTotal());
				
				
		return "proscenium/personal_ajax/financeInformationAjax";		
	}
	/**
	 * 个人中心中健康信息ajax
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/healthInformationAjax")
	public String healthInformationAjax(HttpSession session,HttpServletRequest request,Model model){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("Login", false);
			return "proscenium/personal_ajax/healthInformationAjax";		
		}
		model.addAttribute("Login", true);
		String userId = user.getUserId();
		PageHelper.startPage(1, 10);
		List<Map<String,Object>>  healthInformation= userService.getHealth(userId);	
		com.github.pagehelper.PageInfo
		 pageInfo = new com.github.pagehelper.PageInfo(healthInformation);
		model.addAttribute("healthInformation", healthInformation);
		model.addAttribute("healthInformationTotal", pageInfo.getTotal());
		
		return "proscenium/personal_ajax/healthInformationAjax";		
	}
	
	
	


	
}
