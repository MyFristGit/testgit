package com.udata.osp.infoplus.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.udata.osp.entity.BackLogService;
import com.udata.osp.util.HttpConnection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Done {
	static String ACCESS_TOKEN_URL = "http://59.74.184.145/infoplus/oauth2/token";
	static String TASK_URL = "http://59.74.184.145/infoplus/apis/v2/user/";
	
	
	public static String getAccessToken(String grant_type,String client_id,String client_secret,String scope)throws Exception{
		 Map<String, String> parameters = new HashMap<String,String>();
		 parameters.put("grant_type",grant_type); 
		 parameters.put("client_id",client_id);  
		 parameters.put("client_secret",client_secret);
		 parameters.put("scope",scope);
		 JSONObject jsonObject = HttpConnection.doPost(Constant.ACCESS_TOKEN_URL, parameters);
		
	     return jsonObject.getString("access_token");
	}
	
	/**
	 * 
	 * @param userId 用户工号
	 * @param taskToken 
	 * @param start 起始条序号
	 * @param limit 返回数
	 * @return 已办任务
	 * @throws Exception
	 */
	public static JSONObject getDone(String userId,String taskToken,int start,int limit)throws Exception{

		String url = Constant.TASK_URL + userId + Constant.YM + "/processes/done?access_token=" + taskToken + 
		"&start=" + start + "&limit=" + limit;

		JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	
	/**
	 * 
	 * @param userId 用户工号
	 * @param taskToken 
	 * @param start 起始条序号
	 * @param limit 返回数
	 * @return 已办任务
	 * @throws Exception
	 */
	public static JSONObject getDoing(String userId,String taskToken,int start,int limit)throws Exception{

		String url = Constant.TASK_URL + userId + Constant.YM + "/processes/doing?access_token=" + taskToken + 
		"&start=" + start + "&limit=" + limit;

		JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	/**
	 * 
	 * @param userId 用户工号
	 * @param taskToken 
	 * @param start 起始条序号
	 * @param limit 返回数
	 * @return 已办任务
	 * @throws Exception
	 */
	public static JSONObject getDone(String userId,String taskToken,String app)throws Exception{

		String url = Constant.TASK_URL + userId + Constant.YM +"/processes/done?access_token=" + taskToken + 
		 "&app=" + app;

		JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	public static JSONObject getDoneByPage(String userId, String taskToken, String app, int start, int limit) throws Exception {

		String url = Constant.TASK_URL + userId + Constant.YM +"/processes/done?access_token=" + taskToken + 
		 "&app=" + app	+ "&start=" + start + "&limit=" + limit;

		JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	/**
	 * @param userId 用户工号
	 * @param taskToken
	 * @param apps 
	 * @return
	 * @throws Exception 
	 */
	public static List<BackLogService> getDoneAppCount(String userId,String taskToken,Map<String,Integer>apps) throws Exception{
		String accessToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);
		List<BackLogService> blsList = new ArrayList<BackLogService>();
		for(Map.Entry<String,Integer> entry: apps.entrySet()){
			String code = entry.getKey().split("&")[0];
			String appName = entry.getKey().split("&")[1];
			
			Integer backLogCount = entry.getValue();//待办数量
			
//			Long start = System.currentTimeMillis();
			JSONObject done = getDone(userId,accessToken,code);//已办数据
//			Long end = System.currentTimeMillis();
//			System.out.println("调用已办接口花费时间=" + (end - start));
			
			
			BackLogService bs = new BackLogService();
			
			if(done == null){//根据app code没有查到已办数据
				bs.setCode(code);
				bs.setAppname(appName);
				bs.setBacklogcount(backLogCount);
				bs.setDonecount(0);
				bs.setUserId(userId);
				blsList.add(bs);
			}else{
				Integer total = Integer.parseInt(done.getString("total"));//已办数量
				bs.setCode(code);
				bs.setAppname(appName);
				bs.setBacklogcount(backLogCount);
				bs.setDonecount(total);
				bs.setUserId(userId);
			}
			
			blsList.add(bs);
		}
		return blsList;
	}
	
	
	
	@Test
	public void testCodeAccess_Token() throws Exception{

		String accessToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,"sys_process");
		System.out.println(accessToken);
	}
	
	@Test
	public void getDone() throws Exception{
		//http://59.74.184.145/infoplus/apis/v2/user/alice@xust.edu.cn/processes/done?access_token=e0c6d2061646112e1457e6622ed5fe6e&app=SXJM
		String taskToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,"sys_process");
		String app = "SXJM";
		JSONObject jsonObject = getDone("alice",taskToken,app);

		System.out.println(jsonObject); 
		System.out.println(jsonObject.getString("total")); 
	}

}
