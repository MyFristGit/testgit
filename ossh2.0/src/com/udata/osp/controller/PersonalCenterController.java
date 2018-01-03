package com.udata.osp.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.service.TaskService;
import com.udata.osp.service.UserService;
import com.udata.osp.util.JsonDeal;
import com.udata.osp.util.PrivilegeDeal;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/personalCenter")
public class PersonalCenterController {
	
	
	@Resource
	private TaskService taskService;
	@Resource
	private UserService userService;
	
	
	/**
	 * 体检指标结果，分页查询
	 * @param request
	 * @param response
	 * @param  sort  排序条件
	 * @param  criteria  查询条件
	 * @param  criteria  查询条件
	 * @param   fields   查询的字段，空表示全部
	 * @param model
	 * @throws IOException
	 */
	
	//@RequestMapping(value = "/get", method = RequestMethod.POST)
	
	
	
	@ResponseBody
	@RequestMapping(value = "/getPhysicExamination")
	public void  getPhysicExamination(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "5") Integer pageSize
			) throws IOException{
		
		
		int  recordCount=15;
		int  countPage=recordCount/pageSize;
		if(recordCount % pageSize  !=0){
			countPage++;
		}
		int begin=(pageNum-1)* pageSize+1;
		int  end=pageNum*pageSize;
		if(end>recordCount){
			end=recordCount;
		}
		
		
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		ArrayList  al=new  ArrayList<HashMap>();
		HashMap    hm;
		for(int  i=begin;i<=end;i++){
			hm=new  HashMap();
			hm.put("date", "2015-04-17");
			hm.put("category", "西安科技大学医职工团体体检");
			hm.put("number", "150417000179");
			hm.put("department", "心电图室");
			hm.put("project", "心电图");
			hm.put("time", "2015-05-26");
			hm.put("examiner", "刘天云");
			hm.put("index", "心率");
			hm.put("result", "88");
			al.add(hm);
		}
		
		jsonDeal.putResponse(al);
		
		
		
		//jsonDeal.putResponse("{'result':'ok'}");
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/personalExchange")
	public void  personalExchange(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "5") Integer pageSize
			) throws IOException{
		
		/*
		int  recordCount=4;
		int  countPage=recordCount/pageSize;
		if(recordCount % pageSize  !=0){
			countPage++;
		}
		int begin=(pageNum-1)* pageSize+1;
		int  end=pageNum*pageSize;
		if(end>recordCount){
			end=recordCount;
		}
		
		
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		ArrayList  al=new  ArrayList<HashMap>();
		HashMap    hm;
		for(int  i=begin;i<=end;i++){
			hm=new  HashMap();
			hm.put("date", "20161110");
			hm.put("number", "07639");
			hm.put("summary", "冲水建姚汝方借检验费");
			hm.put("loan_amount", "0");
			hm.put("repayment_amount", "15487");
			hm.put("loan_balance", "0");
			al.add(hm);
		}
		
		jsonDeal.putResponse(al);
		*/
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getFinance(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deviceInformation")
	public void  deviceInformation(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
		
		//为了多条件查询的通用，去掉分页和url参数
		Map map = new HashMap();
		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			if( paramName.equals("pageCount")){
				continue;
			}
			if( paramName.equals("recordCount")){
				continue;
			}
			if( paramName.equals("pageNum")){
				continue;
			}
			if( paramName.equals("pageSize")){
				continue;
			}
			if( paramName.equals("url")){
				continue;
			}
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() != 0     ) {
					map.put(paramName, paramValue);
				}
			}
		}
		
		
		
		
		/*
		
		int  recordCount=10;
		int  countPage=recordCount/pageSize;
		if(recordCount % pageSize  !=0){
			countPage++;
		}
		int begin=(pageNum-1)* pageSize+1;
		int  end=pageNum*pageSize;
		if(end>recordCount){
			end=recordCount;
		}
		
		
	
		
		
	
		ArrayList  al=new  ArrayList<HashMap>();
		HashMap    hm;
		for(int  i=begin;i<=end;i++){
			hm=new  HashMap();
			hm.put("code", "85011900");
			hm.put("name", "沥清延伸仪");
			hm.put("number", "85011900");
			hm.put("unit_price", "");
			hm.put("date_entry", "2010-10-13");
			hm.put("model", "");
			al.add(hm);
		}
		
		jsonDeal.putResponse(al);
		*/
		
		map.put("user_id",userId);
		PageHelper.startPage(pageNum, pageSize);
		//List<Map<String,Object>>  researchInformation= userService.getDevice(userId);
		//List<Map<String,Object>>  researchInformation= userService.getDeviceAndCondition2(map);
		List<Map<String,Object>>  researchInformation= userService.getDeviceAndCondition3(map);
		PageInfo pageInfo = new PageInfo(researchInformation);
		
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
				",\"pageNum\":"+pageInfo.getPageNum()+
		   "}");
		
	}
	/**
	 * 老师科研项目分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/researchProject")
	public void  researchProject(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getResearchFromThree(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
		
		
		
	}
	
	
	/**
	 * 老师科研论文分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/kylwInformation")
	public void  kylwInformation(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getKYLW(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	
	/**
	 * 老师书籍著作权分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/sjzzqProject")
	public void  sjzzqProject(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getSJZZ(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	/**
	 * 老师软件著作权分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/rjzzqProject")
	public void  rjzzqProject(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getRJZZ(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	
	/**
	 * 老师获奖情况分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/hjqkProject")
	public void  hjqkProject(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getHJQK(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	/**
	 * 老师专利情况分页
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/zlProject")
	public void  zlProject(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getPatent2(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/researchPatent")
	public void  researchPatent(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "5") Integer pageSize
			) throws IOException{
		
		
		int  recordCount=3;
		int  countPage=recordCount/pageSize;
		if(recordCount % pageSize  !=0){
			countPage++;
		}
		int begin=(pageNum-1)* pageSize+1;
		int  end=pageNum*pageSize;
		if(end>recordCount){
			end=recordCount;
		}
		
		
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		ArrayList  al=new  ArrayList<HashMap>();
		HashMap    hm;
		for(int  i=begin;i<=end;i++){
			hm=new  HashMap();
			hm.put("name", "一种密封胶与被粘基材粘接试样界面抗剪强度的测试方法");
			hm.put("number", "");
			hm.put("holder", "西安科技大学");
			hm.put("ranking", "6");
			al.add(hm);
		}
		
		jsonDeal.putResponse(al);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getHealth")
	public void  getHealth(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
	
	
	
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getHealth(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getTuition")
	public void  getTuition(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
	
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getTuition(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getCampusConsumption")
	public void  getCampusConsumption(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
	
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getCampusConsumption(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	/*
	 * 教学工作量分页查询
	 * */
	
	@ResponseBody
	@RequestMapping(value = "/getJxgzlInformation")
	public void  getJxgzlInformation(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
	
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getJxgzlInformation(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/upLoadProfileImg")
	public void  upLoadProfileImg(@RequestParam("upload_file") CommonsMultipartFile[] files,HttpServletRequest request) throws IOException{
		//1..springMVC字节流输入上传文件
		 for(int i = 0;i<files.length;i++){  
	            System.out.println("fileName---------->" + files[i].getOriginalFilename());  
	          
	            if(!files[i].isEmpty()){  
	                int pre = (int) System.currentTimeMillis();  
	                try {  
	                    //拿到输出流，同时重命名上传的文件  
	                	String temp="F:/" + new Date().getTime() + files[i].getOriginalFilename();
	                	System.out.println(temp);
	                    FileOutputStream os = new FileOutputStream(temp); 
	                    
	                    //拿到上传文件的输入流  
	                    FileInputStream in = (FileInputStream) files[i].getInputStream();  
	                      
	                    //以写字节的方式写文件  
	                    int b = 0;  
	                    while((b=in.read()) != -1){  
	                        os.write(b);  
	                    }  
	                    os.flush();  
	                    os.close();  
	                    in.close();  
	                    int finaltime = (int) System.currentTimeMillis();  
	                    System.out.println(finaltime - pre);  
	                      
	                } catch (Exception e) {  
	                    e.printStackTrace();  
	                    System.out.println("上传出错");  
	                }  
	        }  
	        }  
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/upLoadProfileImg2")
	public void  upLoadProfileImg2(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {  
        //创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                //记录上传过程起始时的时间，用来计算上传时间  
                int pre = (int) System.currentTimeMillis();  
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    //取得当前上传文件的文件名称  
                    String myFileName = file.getOriginalFilename();  
                    //  String newFileName = UUID.randomUUID()+origanlFileName.substring(origanlFileName.lastIndexOf("."));  
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                    if(myFileName.trim() !=""){  
                        System.out.println(myFileName);  
                        //重命名上传后的文件名  
                        String fileName = "demoUpload" + file.getOriginalFilename();  
                        //定义上传路径  
                        String path = "f:/" + fileName;  
                        System.out.println(path);
                        File localFile = new File(path);  
                        file.transferTo(localFile);  
                    }  
                }  
                //记录上传该文件后的时间  
                int finaltime = (int) System.currentTimeMillis();  
                System.out.println(finaltime - pre);  
            }  
              
        }  
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/upLoadProfileImg3")
	public void  upLoadProfileImg3(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {  
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		String userId="";
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断 request 是否有文件上传,即多部分请求 
        Map<String, Object> param = new HashMap<String,Object>();
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                //记录上传过程起始时的时间，用来计算上传时间  
                int pre = (int) System.currentTimeMillis();  
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){                   
                    InputStream is=file.getInputStream();
                    byte[] b = FileCopyUtils.copyToByteArray(is);    //FileCopyUtils   为spring下的一个工具类。  
                    if (b == null || b.length == 0) { return ; }  
                    param.put("FILE", b);//此处所用的参数类型为 byte[] 
                    param.put("ID", userId); 
                    //判断数据库中是否有图片，没有才添加
                    //否则更改
                   // userService.savePersonalImage(param);
                    userService.saveOrUpdatePersonalImage(param);
                } 
                
            	jsonDeal.putString("{\"success\":\" <textarea><img src='{$dir_base}{$filename}' title='{$filename}' alt='{$filename}'/></textarea>\"}");
                      
                 
                
                
              
            }  
              
        }  
		
	}
	
	
	
	
	//文件下载  
    //请求<a href="/springmvc_mybatis_test12_upload/test_download.action?filename=赵奕欢.jpg">点击下载资源</a>  
    @RequestMapping("/test_download.action")  
    //String filename 是请求参数  
    public String test_download(HttpServletRequest request,HttpServletResponse response,String filename) throws Exception{  
          
        filename = new String(filename.getBytes("iso-8859-1"),"UTF-8");//get提交，修改编码  
          
        String path = request.getRealPath("/WEB-INF/picture/"+filename);//得到资源在硬盘上的绝对的路径      
        File file = new File(path);  
        response.setCharacterEncoding("UTF-8");  
        filename = URLEncoder.encode(filename, "UTF-8");//将中文转为浏览器可认识的编码  
        response.setHeader("content-disposition", "attachment;filename="+filename);//设置响应头为文件下载  
        response.setContentLength((int)file.length());  
        int len = 0;  
        byte []buffer = new byte[1024];  
        InputStream is = new FileInputStream(file);  
        OutputStream os= response.getOutputStream();//向浏览器写数据  
        while((len = is.read(buffer)) != -1){  
            os.write(buffer,0,len);  
        }  
        is.close();  
        os.close();  
        return null;    //一定要返回null,执行后不跳转  
    } 
    
    
    
    /**
	 * 查询用户头像图标
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/img")
	public void img(HttpServletRequest request,HttpServletResponse response,Model model,String id) throws IOException{
		
		
	
		List<Map<String,Object>> entity = userService.getUserImgById(id);
		byte[] data=new  byte[0];
		if(entity.size()>0){
			 data = (byte[]) entity.get(0).get("image");
		}else{
			try{
				//data=(byte[]) userService.getUserImgById("-1").get(0).get("image");
				data=(byte[]) userService.getDeaultImg().get(0).get("image");
				
			}catch(Exception e){
				System.out.println("数据库中没有 用户id  为  -1  的默认图片");
			}
			
		
			 
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
	
	
	
	@RequestMapping(value="/emptyImage")
	public void emptyImage(HttpServletRequest request,HttpServletResponse response,Model model,String id) throws IOException{
		
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);
		String userId="";
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
	
		userService.emptyImage(userId);
		jsonDeal.putString("[]");
		
	}
	
	

	@ResponseBody
	@RequestMapping(value = "/getXXCJ")
	public void  getXXCJ(HttpServletRequest request,
			HttpServletResponse response,Model model,
			String userId,
			@RequestParam(value="sort",required = false, defaultValue = "") String sort,
			@RequestParam(value="criteria",required = false, defaultValue = "") String criteria,
			@RequestParam(value="fields",required = false, defaultValue = "") String fields,
			@RequestParam(value="pageNum",required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value="pageSize",required = false, defaultValue = "10") Integer pageSize
			) throws IOException{
		JsonDeal  jsonDeal=new  JsonDeal(request,response);	
		PrivilegeDeal  pd=new PrivilegeDeal(request,userService,taskService);	
		if(pd.getCurrentUser()!=null){
		   userId=pd.getCurrentUser().getUserId();
		}else{
			jsonDeal.putString("[]");
			return;
			
		}
		
	
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>>  researchInformation= userService.getXXCJ(userId);
		PageInfo pageInfo = new PageInfo(researchInformation);	
		jsonDeal.putListMapAndOtherData(researchInformation,"{\"total\":"+pageInfo.getTotal()+
				",\"firstRow\":"+pageInfo.getStartRow()+
				",\"endRow\":"+pageInfo.getEndRow()+
				",\"pageCount\":"+pageInfo.getPages()+
		   "}");
		
		
	}
	
	
	
	
	/**
	 * 由服务id显示服务处理的欢迎页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/bindEmail")
	public String bindEmail(HttpSession session,HttpServletRequest request,Model model, @RequestParam(value="id",required = false, defaultValue = "0") int id){
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
					 
					 
			service.setFlow_chart(null);//减少网络流量
			service.setServiceIcon(null);
//			System.out.println(service);
			model.addAttribute("service", service);
			model.addAttribute("sys_role", serviceRole);
			model.addAttribute("user",user);
			//添加最多5个类似服务
			model.addAttribute("serviceResult",serviceResult);
		}
		return "proscenium/bindEmail";
	}
	

}
