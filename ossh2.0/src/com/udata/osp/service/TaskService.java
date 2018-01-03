package com.udata.osp.service;

import java.util.List;
import java.util.Map;

import com.udata.osp.entity.BackLogService;
import com.udata.osp.entity.Myservice;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.ServiceType;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserComment;
import com.udata.osp.entity.UserRole;

/**
 * 
 * @author 周有亮
 *
 */
public interface TaskService {

	/**
	 * 
	 * @return 最新服务
	 */
	List<Service> getServiceZXList();
	
	
	/**
	 * 
	 * @return 最火服务
	 */
	List<Service> getServiceZHList();
	
	
	/**
	 * 获取服务类型
	 * @return
	 */
	List<ServiceType> getServiceTypeList();
	
	
	/**
	 * 
	 * @return 获取服务角色
	 */
	List<ServiceRole> getServiceRoleList();
	
	
	/**
	 * 
	 * @return 获取服务角色下边的服务
	 */
	List<Service> getServiceByRoleId(String  roleId);
	
	

	/**
	 * 根据ID查询服务
	 * @param id
	 * @return
	 */
	Service getServiceById(int id);
	
	


	/**
	 * 根据ID查询服务类型
	 * @param id
	 * @return
	 */
	ServiceType getServiceTypeById(int id);
	
	
	/**
	 * 根据ID查询服务
	 * @param id
	 * @return
	 */
	ServiceRole selectSysRoleByPrimaryKey(String id);
	
	

	/**
	 * 根据类型查最新服务
	 * @param id
	 * @return
	 */
	List<Service> getServiceZXListByType(int id);

	/**
	 * 根据类型查最火服务
	 * @param id
	 * @return
	 */
	List<Service> getServiceZHListByType(int id);

	/**
	 * 查询我的服务
	 * @param userName 工号
	 * @return
	 */
	List<Myservice> getMyServiceList(String userName);

	/**
	 * 根据工号查询服务
	 * @param userId
	 * @return
	 */
	List<Service> getServiceByUserId(String userId);


	/**
	 * 根据工号查询服务类型
	 * @param userId
	 * @return
	 */
	List<ServiceType> getServiceTypeByUserId(String userId);

	/**
	 * 根据服务名称查询服务图标
	 * @param name
	 * @return
	 */
	Service getServiceByName(String name);

	/**
	 * 根据服务类型查询服务
	 * @param id
	 * @return 服务
	 */
	List<Service> getServiceListByType(int id);

	/**
	 * 根据服务名称模糊查询
	 * @param name
	 * @return
	 */
	List<Service> getServiceListByName(String name);

	/**
	 * 根据服务名称模糊查询
	 * @param name
	 * @return
	 */
	List<Service> getServiceZXListByName(String name);

	/**
	 * 根据服务名称模糊查询
	 * @param name
	 * @return
	 */
	List<Service> getServiceZHListByName(String name);
	
	/**
	 * 由权限查找最火服务
	 * @param sr
	 * @return
	 */
	List<Service>  getServiceZXListInRole(List<UserRole>  sr);
	
	/**
	 * 由权限查找最火服务
	 * @param sr
	 * @return
	 */
	List<Service>  getServiceZHListInRole(List<UserRole>  sr);
	
	
	
	/**
	 * 
	 * @return 点赞
	 */
	String praise (String userId,String serviceId);
	//点赞的个数	
	int  selectServicePraise(String  serviceId);	
	//是否已经点赞	
	int havePraise  (String userId,String serviceId);	
	//收藏	
	String saveCollection (String userId,String serviceId);
	//取消收藏	
	String cancelCollection (String userId,String serviceId);
	//是否已经收藏	
	int haveCollection(String userId,String serviceId);

	/**
	 * 我的收藏
	 * @param userId
	 * @return
	 */
	List<Service> getMycollectByUserId(String userId);

	/**
	 * 我的类型
	 * @return
	 */
	List<ServiceType> getMycollectTypeByUserId(String userId);


	/**
	 * 根据服务类型查询我收藏的服务
	 * @param id
	 * @return
	 */
	List<Service> serviceByMyCollectType(int id,String userId);	
	
	
	//发布评论	
	String saveComment (String userId,String serviceId,String comment);

	//由服务id取得该id下的全部评论
	List<UserComment> getCommentsByServiceId(String id);
	
	//由服务id取得该id下的全部评论
	List<Map<String, Object>>  getCommentsAndUserByServiceId(String id);
	
	
	//删除评论
	String deleteComment (String userId,String serviceId);
	
	//用户是否对某个服务发表过评论
	boolean  isPublish(String  userId,String serviceId);


	String cancelPraise(String userId, String mapString);


	List<Map<String, Object>> getThroughTrainImg(String id);


	List<Map<String, Object>> getBannerImg(int id);


	void updatePraiseCount(String mapString, int servicePraise);


	int selectServiceCollection(String mapString);


	void updateCollectionCount(String mapString, int servicePraise);

	List<Service> getServiceAllZHList();

	/**
	 * 保存或更新待办服务
	 * @param blsList
	 * @param userId 
	 */
	void saveOrUpdateBackLog(List<BackLogService> blsList, String userId);


	List<ServiceType> getBackLogServiceTypeByUserId(String userId);


	List<Service> getAllServiceListByName(String name, String userId);


	List<Service> getServiceZXListNoLimit();


	List<Service> getServiceZHListNoLimit();


	List<Service> getServiceZXListByTypeNoLimit(int id);


	List<Service> getServiceZHListByTypeNoLimit(int id);


	List<Service> getServiceListByTypeAll();


	List<Service> getServiceListByTypeAllByUserId(String userId);


	List<Service> getServiceByQB(int id);
}
