package com.udata.osp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.entity.Service;

public interface ServiceMapper {
    int deleteByPrimaryKey(Integer serviceId);

    int insert(Service record);

    int insertSelective(Service record);

    Service selectByPrimaryKey(Integer serviceId);

    int updateByPrimaryKeySelective(Service record);

    int updateByPrimaryKeyWithBLOBs(Service record);

    int updateByPrimaryKey(Service record);

	List<Service> getServiceZXList();

	List<Service> getServiceZHList();

	List<Service> getServiceZHListByType(int id);

	List<Service> getServiceZXListByType(int id);

	List<Service> getServiceByUserId(String userId);
	//由角色取得角色所属的service
	List<Service>  getServiceByRoleId(String roleId);

	/**
	 * 根据服务名称查询服务图标
	 * @param name 服务名称
	 * @return 服务
	 */
	Service getServiceByName(String name);
	
	/**
	 * 
	 * @param id 类型ID
	 * @return 服务列表
	 */
	List<Service> getServiceListByType(int id);

	/**
	 * 模糊查询最新服务
	 * @param string
	 * @return
	 */
	List<Service> getServiceZXListByName(String string);
	/**
	 * 登录后，根据角色  和服务名模糊查询最新服务
	 * @param string
	 * @return
	 */
	List<Service> getAllServiceListByName(@Param("name")String name,@Param("user_id")String user_id);
	
	
	
	
	/**
	 * 模糊查询最火服务
	 * @param string
	 * @return
	 */
	List<Service> getServiceZHListByName(String string);

	/**
	 * 模糊查询我的服务
	 * @param string
	 * @return
	 */
	List<Service> getServiceListByName(String string);

	/**
	 * 查询我的收藏
	 * @param userId
	 * @return
	 */
	List<Service> getMycollectByUserId(String userId);

	/**
	 * 根据服务类型查询我的服务
	 * @param id
	 * @return
	 */
	List<Service> serviceByMyCollectType(int id,String userId);

	void updatePraiseCount(String mapString, int servicePraise);

	List<Service> getServiceAllZHList();

	List<Service> getServiceZXListNoLimit();

	List<Service> getServiceZHListNoLimit();

	List<Service> getServiceZXListByTypeNoLimit(int id);

	List<Service> getServiceZHListByTypeNoLimit(int id);

	List<Service> getServiceListByTypeAll();

	List<Service> getServiceListByTypeAllByUserId(String userId);

	List<Service> getServiceByQB(int id);
	
	
	
}