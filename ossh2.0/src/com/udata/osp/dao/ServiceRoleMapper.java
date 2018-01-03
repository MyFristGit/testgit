package com.udata.osp.dao;

import java.util.List;

import com.udata.osp.entity.ServiceRole;

public interface ServiceRoleMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(ServiceRole record);

    int insertSelective(ServiceRole record);

    ServiceRole selectByPrimaryKey(String roleId);
    
    ServiceRole selectSysRoleByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(ServiceRole record);

    int updateByPrimaryKey(ServiceRole record);

	List<ServiceRole> getServiceRoleList();
}