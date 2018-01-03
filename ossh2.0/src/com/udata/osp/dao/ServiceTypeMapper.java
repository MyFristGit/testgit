package com.udata.osp.dao;

import java.util.List;

import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.ServiceType;

public interface ServiceTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(ServiceType record);

    int insertSelective(ServiceType record);

    ServiceType selectByPrimaryKey(Integer typeId);
    
    

    int updateByPrimaryKeySelective(ServiceType record);

    int updateByPrimaryKeyWithBLOBs(ServiceType record);

    int updateByPrimaryKey(ServiceType record);


	List<ServiceType> getServiceTypeList();

	List<ServiceType> getServiceTypeByUserId(String userId);

	List<ServiceType> getMycollectTypeByUserId(String userId);

	/**
	 * 根据服务名称查询服务类别
	 * @param appNameList
	 * @return
	 */
	List<ServiceType> getServiceTypeListByName(List<String> appNameList);

	/**
	 * 根据服务名称查询服务类别
	 * @param userId
	 * @return
	 */
	List<ServiceType> getBackLogServiceTypeByUserId(String userId);
}