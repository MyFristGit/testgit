package com.udata.osp.serviceImpl;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.udata.osp.dao.UserMapper;
import com.udata.osp.dao.UserRoleMapper;
import com.udata.osp.dao.enumpack.ResearchProjectType;
import com.udata.osp.entity.ResearchProject;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;
import com.udata.osp.service.UserService;
@org.springframework.stereotype.Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	UserMapper userMapper;
	
	@Resource
	UserRoleMapper userRoleMapper;
	
	
	

	

	@Override
	public User getUserBy(String userName, String password) {
		return userMapper.selectByPrimaryKey(userName, password);
	}

	@Override
	public List<UserRole> getUserRole(String UserId) {
		return userRoleMapper.getUserRole(UserId);
	}

	@Override
	public void savePassword(String userId, String password) {
		// TODO Auto-generated method stub
		userMapper.savePassword(userId,password);
		
	}

	@Override
	public void saveOrder(String userId, String order) {
		// TODO Auto-generated method stub
		userMapper.saveOrder(userId,order);
		
	}
	
	
	
	@Override
	public String getUserOrder(String userId) {
		return userMapper.getUserOrder(userId);
	}

	@Override
	public List<Map<String, Object>> getManageSearchProjectByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getSearchProjectByUserId(userId,ResearchProjectType.MANAGE.index);		
		return   listResult;
	}

	@Override
	public List<Map<String, Object>> getParticipateSearchProjectByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getSearchProjectByUserId(userId,ResearchProjectType.PARTICIPATE.index);		
		return   listResult;
	}

	@Override
	public void InsertIntoReSearchProject(String who) {
		// TODO Auto-generated method stub
		List<Map<String,Object>>  listResult=userMapper.CountResearchProject(who);
		
		//对list中一个结果，查找目标数据表中是否存在，不存在添加，否则修改。
		int country=0;
		int province=0;
		int city=0;
		int other=0;
		int countryParticipate=0;
		int provinceParticipate=0;
		int cityParticipate=0;
		int otherParticipate=0;
		
		for(Map<String,Object> map :listResult){
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.MANAGE.name)
					&&  (  (String) map.get("project_type") ).equals("国家级")
					){
				country=( (Long) map.get("ct") ).intValue();
				
			}
			
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.MANAGE.name)
					&&  (  (String) map.get("project_type") ).equals("省部级")
					){
				province=( (Long) map.get("ct") ).intValue();
			}
			
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.MANAGE.name)
					&&  (  (String) map.get("project_type") ).equals("市级")
					){
				city=( (Long) map.get("ct") ).intValue();
			}
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.MANAGE.name)
					&&  (  (String) map.get("project_type") ).equals("其它")
					){
				other=( (Long) map.get("ct") ).intValue();
			}
			
			
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.PARTICIPATE.name)
					&&  (  (String) map.get("project_type") ).equals("国家级")
					){
				countryParticipate=( (Long) map.get("ct") ).intValue();
			
			}
			
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.PARTICIPATE.name)
					&&  (  (String) map.get("project_type") ).equals("省部级")
					){
				provinceParticipate=( (Long) map.get("ct") ).intValue();
			}
			
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.PARTICIPATE.name)
					&&  (  (String) map.get("project_type") ).equals("市级")
					){
				cityParticipate=( (Long) map.get("ct") ).intValue();
			}
			if(    
					(  (String) map.get("user_type") ).equals(ResearchProjectType.PARTICIPATE.name)
					&&  (  (String) map.get("project_type") ).equals("其它")
					){			
				otherParticipate= ( (Long) map.get("ct") ).intValue();
			}
			
			
			
		}
	
		
		ResearchProject first=new  ResearchProject();
		first.setUser_id(who);
		first.setCountry(country);
		first.setProvince(province);
		first.setCity(city);
		first.setOther(other);
		first.setType(1);
		
		
		
	List<ResearchProject> list=userMapper.findResearchProject(who,1);
	if(list.size()==0){
		userMapper.addResearchProject(first);
	}else{
		userMapper.changeResearchProject(first);
	}
	
	
	ResearchProject second=new  ResearchProject();
	second.setUser_id(who);
	second.setCountry(countryParticipate);
	second.setProvince(provinceParticipate);
	second.setCity(cityParticipate);
	second.setOther(otherParticipate);
	second.setType(2);
	List<ResearchProject> list2=userMapper.findResearchProject(who,2);
	if(list2.size()==0){
		userMapper.addResearchProject(second);
	}else{		
		userMapper.changeResearchProject(second);
	}
		
	
		
		
	}
	

	
	
	
	
	
	
	
	
    @Override
	public List<String> getUserIdInResearchProjectData() {
		return userMapper.getUserIdInResearchProjectData();
	}

	@Override
	public List<Map<String, Object>> getAchievementsByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getAchievementsByUserId(userId);		
		return   listResult;
	}
	
	
	@Override
	public List<Map<String, Object>> getFinanceByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getFinanceByUserId(userId);		
		return   listResult;
	}
	
	
	@Override
	public List<Map<String, Object>> getGuideByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getGuideByUserId(userId);		
		return   listResult;
	}
	
	@Override
	public List<Map<String, Object>> getFundingByUserId(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getFundingByUserId(userId);		
		return   listResult;
	}

	@Override
	public List<Map<String, Object>> getThroughTrain() {
		List<Map<String,Object>>  listResult= userMapper.getThroughTrain();	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getThroughTrainImg(String id) {
		List<Map<String,Object>>  listResult= userMapper.getThroughTrainImg(id);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getBannerList() {
		List<Map<String,Object>>  listResult= userMapper.getBannerList();	
		return listResult;
	}
	
	
	@Override
	public void UpdateCommentCountToService(String service_id) {
		// TODO Auto-generated method stub
		List<Map<String,Object>>  listResult=userMapper.getCommentCountByServiceId(service_id);
		int count=0;
		for(Map<String,Object> map :listResult){
			count=( (Long) map.get("ct") ).intValue();
		}
		userMapper.changeServiceComment(Integer.parseInt(service_id),count);
	}

	@Override
	public List<Map<String, Object>> getUserRecord(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getUserRecord(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> userLearning(String userId) {
		List<Map<String,Object>>  listResult= userMapper.userLearning(userId);	
		return listResult;
	}

	@Override
	public void setLearningOrderById(String mapString, String mapString2) {
		int first=Integer.parseInt(mapString);
		int second=Integer.parseInt(mapString2);
		userMapper.setLearningOrderById(first,second);	
		
	}

	@Override
	public List<Map<String, Object>> getUserJobs(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getUserJobs(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getUserRanks(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getUserRanks(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getUserActualInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getUserActualInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getQualification(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getQualification(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getWorkInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getWorkInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getStudyInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getStudyInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getPostInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getPostInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getTitleInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getTitleInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getResearch(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getResearch(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getPatent(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getPatent(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getDevice(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getDevice(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getFinance(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getFinance(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getHealth(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getHealth(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getDeviceAndCondition(String user_id, String code, String name, String number,
			String unit_price, String date_entry, String model) {
		return userMapper.getDeviceAndCondition(user_id,code,name,number,unit_price,date_entry,model);
	}

	@Override
	public List<Map<String, Object>> getDeviceAndCondition2(Map<String,String> map) {
		// TODO Auto-generated method stub
		return userMapper.getDeviceAndCondition2(map);
	}
	
	
	
	@Override
	public boolean getUserIsStudent(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getUserIsStudent(userId);	
		return listResult.size()>0;
	}

	@Override
	public List<Map<String, Object>> getFirstWerks() {
		List<Map<String,Object>>  listResult= userMapper.getFirstWerks();	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getSchedules(String userId, String lastYear, String thisYear) {
		List<Map<String,Object>>  listResult= userMapper.getSchedules(userId,lastYear,thisYear);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getStudentSchedules(String userId, String lastYear, String thisYear) {
		List<Map<String,Object>>  listResult= userMapper.getStudentSchedules(userId,lastYear,thisYear);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getBasicStudentInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getBasicStudentInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getTuition(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getTuitionInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getCampusConsumption(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getCampusConsumption(userId);	
		return listResult;
	}

	

	@Override
	public List<Map<String, Object>> getT_JZG_RZ(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getT_JZG_RZ(userId);	
		return listResult;
	}

	@Override
	public int savePersonalImage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.savePersonalImage(map);
	}

	@Override
	public int saveOrUpdatePersonalImage(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return userMapper.saveOrUpdatePersonalImage(param);
	}

	@Override
	public List<Map<String, Object>> getUserImgById(String id) {
		List<Map<String,Object>>  listResult= userMapper.getUserImgById(id);	
		return listResult;
	}

	@Override
	public void emptyImage(String userId) {
		userMapper.emptyImage(userId);	
	}
	

	@Override
	public List<Map<String, Object>> getDeaultImg() {
		List<Map<String,Object>>  listResult= userMapper.getDeaultImg();	
		return listResult;
	}
	
	@Override
	public List<Map<String, Object>> getJtgxInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getJtgxInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getXXCJ(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getXXCJ(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getDjxs(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getDjxs(userId);	
		return listResult;
	}
	
	@Override
	public List<Map<String, Object>> getBooksArrearage(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getBooksArrearage(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getBooksArrearage2(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getBooksArrearage2(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getDeviceAndCondition3(Map map) {
		// TODO Auto-generated method stub
		return userMapper.getDeviceAndCondition3(map);
	}

	@Override
	public List<Map<String, Object>> getStatementsByUserId(String tableName,String userIdField, String userId,String other ) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("tableName", tableName);
		map.put("userIdField", userIdField);
		map.put("userId", userId);
		map.put("other", other);
		
		return userMapper.getStatementsByUserId(map);
	}

	@Override
	public List<Service> getServiceAllList(String userId) {
		// TODO Auto-generated method stub
		List<Service>  listResult= userMapper.getServiceAllList(userId);	
		return listResult;
	}

	@Override
	public void bindEmail(String userId, String email_account, String email_password) {
		userMapper.bindEmail(userId,email_account,email_password);
		
	}

	@Override
	public List<Map<String, Object>> getJxgzlInformation(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getJxgzlInformation(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getT_jzg(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getT_jzg(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getResearchFromThree(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getResearchFromThree(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getKYLW(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getKYLW(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getSJZZ(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getSJZZ(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getRJZZ(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getRJZZ(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getHJQK(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getHJQK(userId);	
		return listResult;
	}

	@Override
	public List<Map<String, Object>> getPatent2(String userId) {
		List<Map<String,Object>>  listResult= userMapper.getPatent2(userId);	
		return listResult;
	}
	

	


	

}
