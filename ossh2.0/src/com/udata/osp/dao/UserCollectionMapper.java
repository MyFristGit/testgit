package com.udata.osp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserCollection;
import com.udata.osp.entity.UserRole;
import com.udata.osp.entity.UserThumb;

public interface UserCollectionMapper {
	  List<UserCollection>  selectUserCollection(String userId,String  serviceId);
	  int insertUserCollection(UserCollection uc);
	  int  selectServiceCollection(String   service_id);
	  
	  int  haveCollection(String userId,String  serviceId);
	  
	  int deleteCollection(String userId, String serviceId);
}