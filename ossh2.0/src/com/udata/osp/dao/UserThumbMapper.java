package com.udata.osp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;
import com.udata.osp.entity.UserThumb;

public interface UserThumbMapper {
	  List<UserThumb>  selectUserThumb(String userId,String  serviceId);
	  int insertUserThumb(UserThumb ut);
	  int  selectServicePraise(String   service_id);
	  int  havePraise(String userId,String  serviceId);
	  int deleteUserThumb(String userId, String serviceId);  
	  int selectServiceCollection(String mapString);	
	  void updateCollectionCount(String mapString, int servicePraise);
}