package com.udata.osp.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.udata.osp.entity.ActionInfo;
import com.udata.osp.entity.BackLogService;
import com.udata.osp.entity.PageInfo;
import com.udata.osp.entity.Process;
import com.udata.osp.infoplus.api.Constant;
import com.udata.osp.infoplus.api.Details;
import com.udata.osp.infoplus.api.Done;
import com.udata.osp.infoplus.api.ToDo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class InfoplusApiUtil {
//	private static String client_credentials = "client_credentials";
//	private static String client_id = "a651c882-e58d-4cc0-826e-ba3ddd5ea2c4";
//	private static String client_secret = "ce9575433af791c22ec3e4d3134d8c55";
//	private static String scop = "sys_task";
	/**
	 * 获取某个流程的已办、待办数量
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public static List<BackLogService> getBackLogService(String userId) throws Exception{
//		Long start = System.currentTimeMillis();
		String taskToken = ToDo.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		JSONObject jsonObject = ToDo.clientCredentialsTask(userId,taskToken);
//		Long end = System.currentTimeMillis();
//		System.out.println("调用待办接口花费时间=" + (end - start));
		
		if(jsonObject == null)
			return null;
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		
		List<String> daiBaiList = new ArrayList<String>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			JSONObject app = (JSONObject) process.get("app");
			
			if(!userId.equals(owner.get("account"))){//不是自己的待办
				daiBaiList.add(app.get("code").toString() + "&" + app.get("name").toString());
			}
		}
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		for (String i : daiBaiList) {
			if(map.get(i) == null)
				map.put(i,1);
			else
				map.put(i,map.get(i) + 1);
		}
		
//		System.out.println(map);
		List<BackLogService> bsList = Done.getDoneAppCount(userId, taskToken, map);//查询已完成的数量
//		System.out.println(bsList);
		return bsList;
	}
	
	/**
	 * 待办数量
	 * @return
	 * @throws Exception 
	 */
	public static int dbsl(String userId) throws Exception{
//		Long start = System.currentTimeMillis();
		String taskToken = ToDo.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		JSONObject jsonObject = ToDo.clientCredentialsTask(userId,taskToken);
//		Long end = System.currentTimeMillis();
//		System.out.println("调用待办接口花费时间=" + (end - start));
		
		if(jsonObject == null)
			return 0;
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		
		List<String> daiBaiList = new ArrayList<String>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			JSONObject app = (JSONObject) process.get("app");
			
			if(userId.equals(owner.get("account"))){//不是自己的待办
				daiBaiList.add(app.get("code").toString());
			}
		}
		
		return daiBaiList.size();
	}
	
	/**
	 * 待审核数量
	 * @return
	 * @throws Exception 
	 */
	public static int dshsl(String userId) throws Exception{
//		Long start = System.currentTimeMillis();
		String taskToken = ToDo.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		JSONObject jsonObject = ToDo.clientCredentialsTask(userId,taskToken);
//		Long end = System.currentTimeMillis();
//		System.out.println("调用待办接口花费时间=" + (end - start));
		
		if(jsonObject == null)
			return 0;
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		
		List<String> daiBaiList = new ArrayList<String>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			JSONObject app = (JSONObject) process.get("app");
			
			if(!userId.equals(owner.get("account"))){//不是自己的待办
				daiBaiList.add(app.get("code").toString());
			}
		}
		
		return daiBaiList.size();
	}
	/**
	 * 获取某个用户，某个流程的待办
	 * @param app
	 * @return
	 * @throws Exception 
	 */
	public static List<Process> getBackLog(String userId,String code) throws Exception {
		String taskToken = ToDo.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);

		JSONObject jsonObject = ToDo.clientCredentialsTask(userId,taskToken);//用户所有的待办
//		System.out.println(jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			JSONObject app = (JSONObject) process.get("app");
			String currCode = app.getString("code");
			if(!userId.equals(owner.get("account")) && code.equals(currCode)){//找出这个流程的待办实例
//				processList.add(app.get("name").toString());
				Process proce = new Process();
				String entry = process.getString("entry");
				List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
				
				proce.setId(process.getString("entry"));
				proce.setName(process.getString("name"));
				proce.setStatus(process.getString("status"));
				proce.setUrl(data.getString("uri"));
//				long mis = Long.parseLong(process.getString("update"));
//				Date date = new Date(mis);
//				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long now = Long.parseLong(process.getString("update")) * 1000L;
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(now);
				
				
				proce.setUpdateDate(formatter.format(calendar.getTime()));
				proce.setActionInfoList(actionInfoList);
				processList.add(proce);
			}
		}
		return processList;
	}
	
	
	/**
	 * 获取已办理完成的数据
	 * @param string
	 * @param string2
	 * @return
	 * @throws Exception 
	 */
	public static List<Process> getYWC(String userId, String code) throws Exception {
		String taskToken = Done.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		JSONObject jsonObject = Done.getDone(userId, taskToken, code);
		
//		System.out.println("办理完成：" + jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			String entry = data.getString("entry");
			String update = data.getString("update");
			String name = data.getString("name");
			String url = data.getString("uri");
			String status = data.getString("status");
			List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
			Process proce = new Process();
			proce.setId(entry);
			proce.setName(name);
			proce.setStatus(status);
			proce.setUrl(url);
			proce.setUpdateDate(update);
			proce.setActionInfoList(actionInfoList);
			processList.add(proce);
		}
		return processList;
	}
	
	
	/**
	 * 获取已办理完成的数据
	 * @param string
	 * @param string2
	 * @return
	 * @throws Exception 
	 */
	public static PageInfo getYWCByPage(String userId, String code,int start,int pageSize) throws Exception {
		String taskToken = Done.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		JSONObject jsonObject = Done.getDoneByPage(userId, taskToken, code,start,pageSize);
		int total = jsonObject.getInt("total");
//		System.out.println("办理完成：" + jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			String entry = data.getString("entry");
			String update = data.getString("update");
			String name = data.getString("name");
			String url = data.getString("uri");
			String status = data.getString("status");
			List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
			Process proce = new Process();
			proce.setId(entry);
			proce.setName(name);
			proce.setStatus(status);
			proce.setUrl(url);
			proce.setUpdateDate(update);
			proce.setActionInfoList(actionInfoList);
			processList.add(proce);
		}
		
		int currPage = (total + pageSize - 1) / pageSize;
		PageInfo pageInfo= new PageInfo(total,currPage,processList);
		
		return pageInfo;
	}
	
	/**
	 * 
	 * @param userName 用户工号
	 * @return 申请人待办事项
	 * @throws Exception 
	 */
	public static List<Process> getDbl(String userId) throws Exception {
		String taskToken = ToDo.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		JSONObject jsonObject = ToDo.clientCredentialsTask(userId,taskToken);//用户所有的待办
//		System.out.println(jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			if(userId.equals(owner.get("account"))){//找出当前用户申请的待办
				Process proce = new Process();
				
				proce.setId(process.getString("entry"));
				proce.setName(process.getString("name"));
				proce.setStatus(process.getString("status"));
				proce.setUrl(data.getString("uri"));
				
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long now = Long.parseLong(process.getString("update")) * 1000L;
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(now);
				
				proce.setUpdateDate(formatter.format(calendar.getTime()));
				processList.add(proce);
			}
		}
		return processList;
	}
	
	/**
	 * 查询在办流程实例
	 * @param 工号
	 * @return 在办流程实例
	 * @throws Exception 
	 */
	public static PageInfo getSlz(String userId,int start,int pageSize) throws Exception {
		String taskToken = Done.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		JSONObject jsonObject = Done.getDoing(userId, taskToken,start,pageSize);
		int total = jsonObject.getInt("total");
//		System.out.println("受理中：" + jsonObject.getInt("total"));
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			String entry = data.getString("entry");
			String update = data.getString("update");
			String name = data.getString("name");
			String url = data.getString("uri");
			String status = data.getString("status");
			List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
			Process proce = new Process();
			proce.setId(entry);
			proce.setName(name);
			proce.setStatus(status);
			proce.setUrl(url);
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long now = Long.parseLong(update) * 1000L;
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(now);
			
			proce.setUpdateDate(formatter.format(calendar.getTime()));
			proce.setActionInfoList(actionInfoList);
			processList.add(proce);
		}
		
		int currPage = (total + pageSize - 1) / pageSize;
		PageInfo pageInfo= new PageInfo(total,currPage,processList);
		
		return pageInfo;
	}
	
	/**
	 * 申请后完成的流程实例
	 * @param userName 工号
	 * @return 完成的实例
	 * @throws Exception 
	 */
	public static List<Process> getSqrWc(String userId) throws Exception {
		String taskToken = Done.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		JSONObject jsonObject = Done.getDone(userId, taskToken,0,10);
		
//		System.out.println("办理完成：" + jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			String entry = data.getString("entry");
			String update = data.getString("update");
			String name = data.getString("name");
			String url = data.getString("uri");
			String status = data.getString("status");
			List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
			Process proce = new Process();
			proce.setId(entry);
			proce.setName(name);
			proce.setStatus(status);
			proce.setUrl(url);
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long now = Long.parseLong(update) * 1000L;
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(now);
			
			proce.setUpdateDate(formatter.format(calendar.getTime()));
//			proce.setUpdateDate(update);
			proce.setActionInfoList(actionInfoList);
			processList.add(proce);
		}
		return processList;
	}
	
	/**
	 * 申请人已完成任务分页
	 * @param userId
	 * @param page
	 * @param pageSize
	 * @return
	 * @throws Exception 
	 */
	public static PageInfo getSqrWc(String userId, Integer page, Integer pageSize) throws Exception {
		String taskToken = Done.getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		JSONObject jsonObject = Done.getDone(userId, taskToken,page,pageSize);
		int total = jsonObject.getInt("total");
//		System.out.println("办理完成：" + jsonObject);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		List<Process> processList = new ArrayList<Process>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			String entry = data.getString("entry");
			String update = data.getString("update");
			String name = data.getString("name");
			String url = data.getString("uri");
			String status = data.getString("status");
			List<ActionInfo> actionInfoList = Details.getProcessStep(taskToken, entry);//查询实例详情
			Process proce = new Process();
			proce.setId(entry);
			proce.setName(name);
			proce.setStatus(status);
			proce.setUrl(url);
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long now = Long.parseLong(update) * 1000L;
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(now);
			
			proce.setUpdateDate(formatter.format(calendar.getTime()));
//			proce.setUpdateDate(update);
			proce.setActionInfoList(actionInfoList);
			processList.add(proce);
		}
		
		int currPage = (total + pageSize - 1) / pageSize;
		PageInfo pageInfo= new PageInfo(total,currPage,processList);
		
		return pageInfo;
	}
	
	public static List<BackLogService> getBackLogService(String userName, String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Test
	public void testBackLog() throws Exception{
		 List<Process> backLog = getBackLog(Constant.userId,"SXJM");
		 System.out.println(backLog);
	}
	
	@Test
	public void testgetBackLogService() throws Exception{
		getBackLogService(Constant.userId);
	}
	
	@Test
	public void testgetYWC() throws Exception{
		List<Process> processList = getYWC(Constant.userId,"SXJM");
		System.out.println(processList);
	}

	@Test
	public void testDb() throws Exception{
		String userId = "jzg001";
		int dbsl = dbsl(userId);
		int dshsl = dshsl(userId);
		System.out.println(dbsl);
		System.out.println(dshsl);
	}

	@Test
	public void testSLZ() throws Exception{
		String userId = "003633";
		int start = 20;
		int pageSize = 10;
		PageInfo pageInfo = getSlz( userId,start,pageSize);
		System.out.println(pageInfo);
	}

	
}
