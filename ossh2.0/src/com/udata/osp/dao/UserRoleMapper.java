package com.udata.osp.dao;

import java.util.List;

import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;

public interface UserRoleMapper {
   
  
    List<UserRole>  getUserRole(String UserId);
    
   
    
}