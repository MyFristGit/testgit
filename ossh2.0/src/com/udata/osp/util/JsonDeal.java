package com.udata.osp.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 简化处理Json请求和返回json 使用方法
 * @author:txf
 */
public class JsonDeal {
	private HttpServletResponse response;
	private Set<Map.Entry<String, String>> set;
	
	

	public JsonDeal(HttpServletRequest request, HttpServletResponse response) {
		this.response = response;
		this.set = showParams(request).entrySet();
	}

	public String getMapString(String mapName) {
		for (Map.Entry entry : set) {
			if (entry.getKey().toString().equals(mapName)) {
				return (entry.getValue().toString());
			}
		}
		return null;
	}
	
	
	/**
	 * 将object转为字符串后输出
	 * @param object
	 */

	public void putResponse(Object object) {
		try {
			// 设置页面不缓存
			response.setContentType("application/json");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			if(object instanceof java.util.List){
				JSONArray jsonArray = JSONArray.fromObject(object);
				out.println(jsonArray.toString());
			}else{
				JSONObject jsonObject = JSONObject.fromObject(object);
				out.println(jsonObject.toString());
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 将object转为字符串后输出
	 * @param object
	 */

	public void putString(String string) {
		try {
			// 设置页面不缓存
			response.setContentType("application/json");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			out.println(string);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 将object转为字符串后输出
	 * @param object
	 */

	public void putListMap(List<Map<String,Object>> researchInformation) {
		try {
			// 设置页面不缓存
			response.setContentType("application/json");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			String output="[";
			boolean  haveMore=false;
			for(Map<String, Object>  hm : researchInformation){
				haveMore=true;
				 output+="{";
				for (Map.Entry<String, Object> entry : hm.entrySet()) { 
					output+=("\""+entry.getKey()+"\" :");
					output+=("\""+entry.getValue().toString().replace("\\","\\\\").replace("\"", "\\\"")+"\",");
					//为了避免字符串中的",影响javascript的正常解析，将",变为\",\变为\\.
					//在字符串中要表示",用\",表示\用\\有了上边的结果
				}  
				output=output.substring(0,output.length()-1);
				output+="},";
			}
			if(haveMore)
				output=output.substring(0,output.length()-1);
			output+="]";
			out.println(output);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 将object转为字符串后输出
	 * @param object
	 */

	public void putListMapAndOtherData(List<Map<String,Object>> researchInformation,String otherData) {
		try {
			// 设置页面不缓存
			response.setContentType("application/json");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			String output="{ \"data\" :[";
			boolean  haveMore=false;
			for(Map<String, Object>  hm : researchInformation){
				haveMore=true;
				 output+="{";
				for (Map.Entry<String, Object> entry : hm.entrySet()) { 
					output+=("\""+entry.getKey()+"\" :");
					output+=("\""+entry.getValue().toString().replace("\\","\\\\").replace("\"", "\\\"")+"\",");
					//为了避免字符串中的",影响javascript的正常解析，将",变为\",\变为\\.
					//在字符串中要表示",用\",表示\用\\有了上边的结果
				}  
				output=output.substring(0,output.length()-1);
				output+="},";
			}
			if(haveMore){
				output=output.substring(0,output.length()-1);
			}			
			output+="],\"otherData\":"+otherData+"}";
			out.println(output);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Map showParams(HttpServletRequest request) {
		Map map = new HashMap();
		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() != 0) {
					map.put(paramName, paramValue);
				}
			}
		}
		return map;
	}



}
