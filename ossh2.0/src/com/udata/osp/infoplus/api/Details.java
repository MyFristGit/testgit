package com.udata.osp.infoplus.api;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.udata.osp.entity.ActionInfo;
import com.udata.osp.util.HttpConnection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 获取流程详情demo
 * @author 周有亮
 *
 */
public class Details {
//	static String ACCESS_TOKEN_URL = "http://219.245.195.207/infoplus/oauth2/token";
//	static String TASK_URL = "http://219.245.195.207/infoplus/apis/v2";
	
	
	public static String getAccessToken(String grant_type,String client_id,String client_secret,String scope)throws Exception{
		Map<String, String> parameters = new HashMap<String,String>();
		 parameters.put("grant_type",grant_type); 
		 parameters.put("client_id",client_id);  
		 parameters.put("client_secret",client_secret);
		 parameters.put("scope",scope);
		 JSONObject jsonObject = HttpConnection.doPost(Constant.ACCESS_TOKEN_URL, parameters);
		
	     return jsonObject.getString("access_token");
	}
	
	
	public static JSONObject getProcessDetails(String taskToken,String entryId)throws Exception{
        String url = Constant.TASK_URL + "/process/" + entryId + "?access_token=" + taskToken;
        JSONObject jsonObject = HttpConnection.doGet(url);
        return jsonObject;
	}
	
	/**
	 * 获取实例的办理人
	 * @param taskToken
	 * @param entryId
	 * @return
	 * @throws Exception
	 */
	public static List<ActionInfo> getProcessStep(String taskToke,String entryId)throws Exception{
		String taskToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE_DONE);

		String url = Constant.DETAILS_URL + "process/" + entryId + "?access_token=" + taskToken;
        JSONObject jsonObject = HttpConnection.doGet(url);
//        System.out.println("*********" + jsonObject);
         JSONArray entities = jsonObject.getJSONArray("entities");
         JSONObject entities1 = (JSONObject) entities.get(0);
         JSONArray tasks = (JSONArray) entities1.get("tasks");
        List<ActionInfo> actionInfoList = new ArrayList<ActionInfo>();
        for(int i = 0;i < tasks.size();i ++){
        	JSONObject data = tasks.getJSONObject(i);
        	
//        	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        	JSONObject tasks = data.getJSONObject("tasks");
        	ActionInfo actionInfo = new ActionInfo();
        	if(data.containsKey("actionTime")){
        		String actionName = data.getString("actionName");//操作
        		String actionUser = data.getJSONObject("actionUser").getString("name");//操作人
        		String name = data.getString("name");//审核部门
        		actionInfo.setActionName(actionName);
        		String actionTime = data.getString("actionTime");//处理时间
        		long now = Long.parseLong(actionTime) * 1000L;
//    			Calendar calendar = Calendar.getInstance();
//    			calendar.setTimeInMillis(now);
    			
        		actionInfo.setActionTime(now);;
        		actionInfo.setActionUser(actionUser);
        		actionInfo.setName(name);
        		
//        		actionInfoList.add(actionInfo);
        	}else{
//        		String assignTime = data.getString("assignTime");//接受时间
//        		String assignUser = data.getJSONObject("assignUser").getString("name");//操作人
        		String name = data.getString("name");//审核部门
//        		ActionInfo actionInfo = new ActionInfo();
//        		actionInfo.setAssignUser(assignUser);
        		String assignTime = data.getString("assignTime");//处理时间
        		long now = Long.parseLong(assignTime) * 1000L;
//    			Calendar calendar = Calendar.getInstance();
//    			calendar.setTimeInMillis(now);
//    			
//        		actionInfo.setActionTime(formatter.format(calendar.getTime()));
        		actionInfo.setActionTime(now);
        		actionInfo.setName(name);
        	}
        	
        	actionInfoList.add(actionInfo);
        }
        
        Collections.sort(actionInfoList,new Comparator<ActionInfo>() {

			@Override
			public int compare(ActionInfo o1, ActionInfo o2) {
				if(o1.getActionTime() > o2.getActionTime() )
					return 1;
				else if (o1.getActionTime() == o2.getActionTime() ){
					if(o1.getActionUser()== null)
						return 1;
				}
					
				return -1;
			}
		});
        return actionInfoList;
	}
	
	@Test
	public void testCodeAccess_Token() throws Exception{

		String accessToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		System.out.println(accessToken);
	}
	
	@Test
	public void getDetails() throws Exception{
		String taskToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,Constant.SCOPE);
		JSONObject jsonObject = getProcessDetails(taskToken,"31d6ee65-0a8c-4172-92c3-c3db3a9c489b");
		
		System.out.println(jsonObject);
	}
	
	
	@Test
	public void getProcessStep() throws Exception{
		String accessToken = getAccessToken(Constant.CLIENT_TYPE,Constant.CLIENT_ID,Constant.CLIENT_SECRET,"sys_process");
		System.out.println(accessToken);
		List<ActionInfo> list = getProcessStep(accessToken,"8");
		
		System.out.println(list);
	}
}
