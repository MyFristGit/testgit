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
/**
 * 调用流程平台接口查询待办服务
 * @author zhouyouliang
 *
 */
public class ToDo {
//	static String ACCESS_TOKEN_URL = "http://219.245.195.207/infoplus/oauth2/token";
//	static String TASK_URL = "http://219.245.195.207/infoplus/apis/v2/user/";
	
	
	public static String getAccessToken(String grant_type,String client_id,String client_secret,String scope)throws Exception{
		 Map<String, String> parameters = new HashMap<String,String>();
		 parameters.put("grant_type",grant_type); 
		 parameters.put("client_id",client_id);  
		 parameters.put("client_secret",client_secret);
		 parameters.put("scope",scope);
		 JSONObject jsonObject = HttpConnection.doPost(Constant.ACCESS_TOKEN_URL, parameters);
		
	     return jsonObject.getString("access_token");
	}
	
	
	/**获取用户待办
	 * @param userId
	 * @param taskToken
	 * @return
	 * @throws Exception
	 */
	public static JSONObject clientCredentialsTask(String userId,String taskToken)throws Exception{
        String url = Constant.TASK_URL + userId + Constant.YM + "/tasks/todo?access_token=" + taskToken;

        JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	/**
	 * 根据流程名称查询流程待办实例
	 * @param userId
	 * @param taskToken
	 * @param app
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getBackLog(String userId,String app) throws Exception {
		String taskToken = getAccessToken("client_credentials","a651c882-e58d-4cc0-826e-ba3ddd5ea2c4","ce9575433af791c22ec3e4d3134d8c55","sys_task");
		String url = Constant.TASK_URL + userId + Constant.YM + "/tasks/todo?access_token=" + taskToken +  "&keyword=" + app;

        JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	@Test
	public void testBackLog() throws Exception{
		String userId = "jzg001";
		String app = "试验示范站（基地）科技成果推广项目申报";
		JSONObject jsObject  = getBackLog(userId,app);
		System.out.println(jsObject);
	}
	
	@Test
	public void testCodeAccess_Token() throws Exception{

		String accessToken = getAccessToken("client_credentials","a651c882-e58d-4cc0-826e-ba3ddd5ea2c4","ce9575433af791c22ec3e4d3134d8c55","sys_task");
		System.out.println(accessToken);
	}
	
	@Test
	public void getToDo() throws Exception{
		String taskToken = getAccessToken("client_credentials","a651c882-e58d-4cc0-826e-ba3ddd5ea2c4","ce9575433af791c22ec3e4d3134d8c55","sys_task");
		JSONObject jsonObject = clientCredentialsTask("jzg001",taskToken);
		JSONArray entities = (JSONArray) jsonObject.get("entities");
		
		List<String> daiBaiList = new ArrayList<String>();
		for(int i = 0;i < entities.size();i ++){
			JSONObject data = entities.getJSONObject(i);
			
			JSONObject process = (JSONObject) data.get("process");
			JSONObject owner = (JSONObject) process.get("owner");
			JSONObject app = (JSONObject) process.get("app");
			
			if(!"jzg001".equals(owner.get("account"))){
				daiBaiList.add(app.get("name").toString());
			}
		}
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		for (String i : daiBaiList) {
			if(map.get(i) == null)
				map.put(i,1);
			else
				map.put(i,map.get(i) + 1);
		}
		
		
		List<BackLogService> bsList = Done.getDoneAppCount("jzg001@nwsuaf.edu.cn", taskToken, map);
		System.out.println(bsList);
	}
}
