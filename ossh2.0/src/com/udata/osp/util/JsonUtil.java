package com.udata.osp.util;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * @author zhouyl
 *
 */
public class JsonUtil{
	
	public static final class JsonUtilManger{
		private static JsonUtil instance = new JsonUtil();
	}
	
	public static JsonUtil getInstance(){
		return JsonUtilManger.instance;
	}
	
	public JSONObject stringToJson(String str){
		JSONObject json = JSONObject.fromObject(str);
		return json;
	}
	
	public String stringToJson(String str,String name){
		JSONObject json = JSONObject.fromObject(str);
		return json.get(name).toString();
	}
	
	public static String map2json(Map map){
		JSONObject jsonObject = JSONObject.fromObject(map);
		
		return jsonObject.toString();
	}
	
	/**
	* 从一个JSON 对象字符格式中得到一个java对象
	* 
	* @param jsonString
	* @param pojoCalss
	* @return
	*/
	public static Object getObject4JsonString(String jsonString, Class pojoCalss) {
	Object pojo;
	JSONObject jsonObject = JSONObject.fromObject(jsonString);
	pojo = JSONObject.toBean(jsonObject, pojoCalss);
	return pojo;
	}


	/**
	* 从json HASH表达式中获取一个map，改map支持嵌套功能
	* 
	* @param jsonString
	* @return
	*/
	public  Map<String,String> getMap4Json(String jsonString) {
	JSONObject jsonObject = JSONObject.fromObject(jsonString);
	Iterator<?> keyIter = jsonObject.keys();
	String key;
	String value;
	Map<String,String> valueMap = new HashMap<String,String>();


	while (keyIter.hasNext()) {
	key = (String) keyIter.next();
	value = jsonObject.get(key).toString();
	valueMap.put(key, value);
	}


	return valueMap;
	}


	/**
	* 从json数组中得到相应java数组
	* 
	* @param jsonString
	* @return
	*/
	public static Object[] getObjectArray4Json(String jsonString) {
	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	return jsonArray.toArray();


	}


	/**
	* 从json对象集合表达式中得到一个java对象列表
	* 
	* @param jsonString
	* @param pojoClass
	* @return
	*/
	public static List getList4Json(String jsonString, Class pojoClass) {


	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	JSONObject jsonObject;
	Object pojoValue;


	List list = new ArrayList();
	for (int i = 0; i < jsonArray.size(); i++) {


	jsonObject = jsonArray.getJSONObject(i);
	pojoValue = JSONObject.toBean(jsonObject, pojoClass);
	list.add(pojoValue);


	}
	return list;


	}


	/**
	* 从json数组中解析出java字符串数组
	* 
	* @param jsonString
	* @return
	*/
	public static String[] getStringArray4Json(String jsonString) {


	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	String[] stringArray = new String[jsonArray.size()];
	for (int i = 0; i < jsonArray.size(); i++) {
	stringArray[i] = jsonArray.getString(i);


	}


	return stringArray;
	}


	/**
	* 从json数组中解析出javaLong型对象数组
	* 
	* @param jsonString
	* @return
	*/
	public static Long[] getLongArray4Json(String jsonString) {


	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	Long[] longArray = new Long[jsonArray.size()];
	for (int i = 0; i < jsonArray.size(); i++) {
	longArray[i] = jsonArray.getLong(i);


	}
	return longArray;
	}


	/**
	* 从json数组中解析出java Integer型对象数组
	* 
	* @param jsonString
	* @return
	*/
	public static Integer[] getIntegerArray4Json(String jsonString) {


	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	Integer[] integerArray = new Integer[jsonArray.size()];
	for (int i = 0; i < jsonArray.size(); i++) {
	integerArray[i] = jsonArray.getInt(i);


	}
	return integerArray;
	}




	/**
	* 从json数组中解析出java Integer型对象数组
	* 
	* @param jsonString
	* @return
	*/
	public static Double[] getDoubleArray4Json(String jsonString) {


	JSONArray jsonArray = JSONArray.fromObject(jsonString);
	Double[] doubleArray = new Double[jsonArray.size()];
	for (int i = 0; i < jsonArray.size(); i++) {
	doubleArray[i] = jsonArray.getDouble(i);


	}
	return doubleArray;
	}


	/**
	* 将java对象转换成json字符串
	* 
	* @param javaObj
	* @return
	*/
	public static String getJsonString4JavaPOJO(Object javaObj) {


	JSONObject json;
	json = JSONObject.fromObject(javaObj);
	return json.toString();


	}
	
	@Test
	public void testJson(){
		String str = "{name:'zhangsan',type:'1'}";
		String name = JsonUtil.getInstance().stringToJson(str,"name");
		String type = JsonUtil.getInstance().stringToJson(str, "type");
		System.out.println(name);
		System.out.println(type);
	}
	
	@Test
	public void testMap(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("0","1");
		map.put("id","1");
		map.put("1","0");
		
		map.put("parentId","0");
		map.put("2","Computers");
		map.put("name","Computers");
		map.put("3","null");
		map.put("quantity","null");
		map.put("4","null");
		map.put("price","null");
		map.put("state","closed");
		map.put("total",0);
		String str =JsonUtil.getInstance().map2json(map);
		System.out.println(str);
	}
}