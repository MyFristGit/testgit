package com.udata.osp.serviceImpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.udata.osp.dao.BackLogServiceMapper;
import com.udata.osp.dao.ServiceMapper;
import com.udata.osp.dao.ServiceRoleMapper;
import com.udata.osp.dao.ServiceTypeMapper;
import com.udata.osp.dao.UserCollectionMapper;
import com.udata.osp.dao.UserCommentMapper;
import com.udata.osp.dao.UserMapper;
import com.udata.osp.dao.UserThumbMapper;
import com.udata.osp.entity.BackLogService;
import com.udata.osp.entity.Myservice;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.ServiceType;
import com.udata.osp.entity.UserCollection;
import com.udata.osp.entity.UserComment;
import com.udata.osp.entity.UserRole;
import com.udata.osp.entity.UserThumb;
import com.udata.osp.service.TaskService;
import com.udata.osp.util.UuidUtil;

@org.springframework.stereotype.Service("taskService")
public class TaskServiceImpl implements TaskService {
	@Resource
	private ServiceMapper serviceMapper;
	
	@Resource
	private ServiceTypeMapper serviceTypeMapper;
	
	@Resource
	private ServiceRoleMapper serviceRoleMapper;
	
	@Resource
	private UserMapper userMapper;
	
	
	@Resource
	private UserThumbMapper userThumbMapper;
	
	@Resource
	private UserCollectionMapper userCollectionMapper;
	
	
	@Resource
	private UserCommentMapper userCommentMapper;
	       
	@Resource
	private BackLogServiceMapper backLogServiceMapper;
	
	
	/**
	 * 最新服务
	 */
	public List<Service> getServiceZXList() {
		return serviceMapper.getServiceZXList();
	}
	
	
	/**
	 * 最火服务
	 */
	@Override
	public List<Service> getServiceZHList() {
		return serviceMapper.getServiceZHList();
	}

	/**
	 * 服务角色大类
	 */
	@Override
	public List<ServiceRole> getServiceRoleList() {
		return serviceRoleMapper.getServiceRoleList();
	}

	/**
	 * 根据角色查询服务
	 */
	@Override
	public List<Service> getServiceByRoleId(String roleId) {
		return serviceMapper.getServiceByRoleId(roleId);
	}

	
	

	@Override
	public List<ServiceType> getServiceTypeList() {
		return serviceTypeMapper.getServiceTypeList();
	}


	@Override
	public Service getServiceById(int id) {
		return serviceMapper.selectByPrimaryKey(id);
	}
	


	@Override
	public ServiceType getServiceTypeById(int id) {
		return serviceTypeMapper.selectByPrimaryKey(id);
	}
	
	
	
	
	
	@Override
	public ServiceRole selectSysRoleByPrimaryKey(String id) {
		return serviceRoleMapper.selectSysRoleByPrimaryKey(id);
	}
	


	@Override
	public List<Service> getServiceZHListByType(int id) {
		return serviceMapper.getServiceZHListByType(id) ;
	}


	@Override
	public List<Service> getServiceZXListByType(int id) {
		return serviceMapper.getServiceZXListByType(id);
	}


	@Override
	public List<Myservice> getMyServiceList(String userName) {
		return null;
	}


	@Override
	public List<Service> getServiceByUserId(String userId) {
		return serviceMapper.getServiceByUserId(userId);
	}


	@Override
	public List<ServiceType> getServiceTypeByUserId(String userId) {
		return serviceTypeMapper.getServiceTypeByUserId(userId);
	}


	@Override
	public Service getServiceByName(String name) {
		return serviceMapper.getServiceByName(name);
	}
	
	@Override
	public List<Service>  getServiceZXListInRole(List<UserRole>  sr){
		if(sr==null){
			return null;
		}
		if(sr.size()==0){
			return new LinkedList<Service>();
		}
		return userMapper.getServiceZXListInRole(sr);
	}
	
	@Override
	public List<Service>  getServiceZHListInRole(List<UserRole>  sr){
		
		if(sr==null){
			return null;
		}
		if(sr.size()==0){
			return new LinkedList<Service>();
		}
		
		return userMapper.getServiceZHListInRole(sr);
	}



	
	
	
	@Override
	public int  selectServicePraise(String  serviceId){
		return userThumbMapper.selectServicePraise(serviceId);
	}
	
	@Override	
	public  int havePraise  (String userId,String serviceId){
		return userThumbMapper.havePraise(userId,serviceId);
	}
	
	@Override
	public  String saveCollection (String userId,String serviceId){		
		  List<UserCollection>  useCollections= userCollectionMapper.selectUserCollection(userId,serviceId);
			if(useCollections.size()>0){
				return "alreadyHave";
			}else{
				UserCollection uc=new  UserCollection();
				uc.setUser_id(userId);
				uc.setService_id(serviceId);
				userCollectionMapper.insertUserCollection(uc);
			}
			
			return "insertOk";
		
	}
	
	@Override	
	public  int haveCollection  (String userId,String serviceId){
		return userCollectionMapper.haveCollection(userId,serviceId);
	}


	@Override
	public List<Service> getServiceListByType(int id) {
		return serviceMapper.getServiceListByType(id);
	}


	@Override
	public List<Service> getServiceListByName(String name) {
		return serviceMapper.getServiceListByName("%" +name + "%");
	}


	@Override
	public List<Service> getServiceZXListByName(String name) {
		return serviceMapper.getServiceZXListByName("%" +name + "%");
	}


	@Override
	public List<Service> getServiceZHListByName(String name) {
		return serviceMapper.getServiceZHListByName("%" +name + "%");
	}


	@Override
	public List<Service> getMycollectByUserId(String userId) {
		return serviceMapper.getMycollectByUserId(userId);
	}


	@Override
	public List<ServiceType> getMycollectTypeByUserId(String userId) {
		return serviceTypeMapper.getMycollectTypeByUserId(userId);
	}


	@Override
	public List<Service> serviceByMyCollectType(int id,String userId) {
		return serviceMapper.serviceByMyCollectType(id,userId);
	}


	@Override
	public String saveComment(String userId, String serviceId, String comment) {
		//是否已经发表评论
		//int  haveComment=userCommentMapper.haveComment(userId,serviceId);
		//if(haveComment==0){//add
		//必须登录
	
			UserComment uc=new  UserComment();
			uc.setUser_id(userId);
			uc.setService_id(serviceId);
			uc.setComment(comment);
			uc.setId(UuidUtil.get32UUID());
			java.sql.Timestamp now =new java.sql.Timestamp(System.currentTimeMillis());
			uc.setCreate_time(now);
			String tsStr = "";
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			try {
				//方法一
				tsStr = sdf.format(now);
				System.out.println(tsStr);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			uc.setCreate_time_string(tsStr);
			userCommentMapper.insertUserComment( uc);
			return "saveOk";
		//}else{//update
			
		//}
		//userCommentMapper.save(userId,serviceId,comment);
		//return "";
	}


	@Override
	public List<UserComment> getCommentsByServiceId(String id) {
		
		return userCommentMapper.getCommentsByServiceId( id);
		
	}


	@Override
	public List<Map<String, Object>> getCommentsAndUserByServiceId(String id) {
				
		List<Map<String,Object>>  listResult= userCommentMapper.getCommentsAndUserByServiceId(id);
		//PageInfo page = new PageInfo(listResult);
		//System.out.println(page.getTotal());
		return   listResult;
		
	}


	@Override
	public String deleteComment(String userId, String serviceId) {
		userCommentMapper.deleteComment(userId,serviceId);
		return "";
	}


	@Override
	public boolean isPublish(String userId, String serviceId) {
		int  haveComment=userCommentMapper.haveComment(userId,serviceId);
		if(haveComment==0)
			return false;
		return true;
	}


	@Override
	public String cancelCollection(String userId, String serviceId) {
		userCollectionMapper.deleteCollection(userId,serviceId);
		return "cancelOk";
	}

	@Override
	public String praise(String userId,String serviceId) {
		//查找是否已经点赞，没有就点赞,否则就插入一个新的。
	  List<UserThumb>  userThumbs= userThumbMapper.selectUserThumb(userId,serviceId);
		if(userThumbs.size()>0){
			return "alreadyHave";
		}else{
			UserThumb ut=new  UserThumb();
			ut.setUser_id(userId);
			ut.setService_id(serviceId);
			userThumbMapper.insertUserThumb(ut);
			//为了ajax效果，插入后返回当前点赞的数量
			int   servicePraise=selectServicePraise(serviceId);
			return  String.valueOf(servicePraise);
		}
		
		
	}
	
	@Override
	public String cancelPraise(String userId, String serviceId) {
		userThumbMapper.deleteUserThumb(userId,serviceId);
		
		return "cancelOk";
	}


	@Override
	public List<Map<String, Object>> getThroughTrainImg(String id) {
		return userMapper.getThroughTrainImg(id);
	}


	@Override
	public List<Map<String, Object>> getBannerImg(int id) {
		return userMapper.getBannerImg(id);
	}


	@Override
	public void updatePraiseCount(String mapString, int servicePraise) {		
		serviceMapper.updatePraiseCount(mapString, servicePraise);		
	}


	@Override
	public int selectServiceCollection(String mapString) {
		return userThumbMapper.selectServiceCollection(mapString);
	}
	
	


	@Override
	public void updateCollectionCount(String mapString, int servicePraise) {
		userThumbMapper.updateCollectionCount(mapString, servicePraise);		
		
	}

	@Override
	public List<Service> getServiceAllZHList() {
		return serviceMapper.getServiceAllZHList();
	}

	@Override
	public void saveOrUpdateBackLog(List<BackLogService> blsList,String userId) {
		backLogServiceMapper.deleteBackLog(userId);
	//	if(blsList.size()==0) return;
		backLogServiceMapper.insertList(blsList);	
	}


	@Override
	public List<ServiceType> getBackLogServiceTypeByUserId(String userId) {
		return serviceTypeMapper.getBackLogServiceTypeByUserId(userId);
	}


	@Override
	public List<Service> getAllServiceListByName(String name, String userId) {
		return serviceMapper.getAllServiceListByName(name,userId);
		
	}


	
	@Override
	public List<Service> getServiceZXListNoLimit() {
		return serviceMapper.getServiceZXListNoLimit();
	}


	@Override
	public List<Service> getServiceZHListNoLimit() {
		// TODO Auto-generated method stub
		return serviceMapper.getServiceZHListNoLimit();
	}

	@Override
	public List<Service> getServiceZXListByTypeNoLimit(int id) {
		return serviceMapper.getServiceZXListByTypeNoLimit(id);
	}


	@Override
	public List<Service> getServiceZHListByTypeNoLimit(int id) {
		return serviceMapper.getServiceZHListByType(id);
	}


	@Override
	public List<Service> getServiceListByTypeAll() {
		return serviceMapper.getServiceListByTypeAll();
	}


	@Override
	public List<Service> getServiceListByTypeAllByUserId(String userId) {
		return serviceMapper.getServiceListByTypeAllByUserId(userId);
	}


	@Override
	public List<Service> getServiceByQB(int id) {
		return serviceMapper.getServiceByQB(id);
	}
	
}
