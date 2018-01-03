package com.udata.osp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserComment;
import com.udata.osp.entity.UserRole;
import com.udata.osp.entity.UserThumb;

public interface UserCommentMapper {
	  int  haveComment(String userId,String  serviceId);
	  int insertUserComment(UserComment uc);
	 // List<UserThumb>  selectUserThumb(String userId,String  serviceId);
	   List<UserComment> getCommentsByServiceId(String id);
	   List<Map<String, Object>> getCommentsAndUserByServiceId(String id);
	   int deleteComment(String userId, String serviceId);
	
	   
	   
	   // int  selectServicePraise(String   service_id);
	
}