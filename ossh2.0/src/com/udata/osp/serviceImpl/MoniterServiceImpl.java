package com.udata.osp.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import com.udata.osp.dao.MonitorMapper;
import com.udata.osp.dao.UserMapper;
import com.udata.osp.service.MoniterService;
import com.udata.osp.service.TaskService;


	
@org.springframework.stereotype.Service("moniterService")
public class MoniterServiceImpl implements MoniterService {
	@Resource
	MonitorMapper monitorMapper;

	@Override
	public int saveLogin(Map<String, Object> map) {
		return monitorMapper.saveLogin(map);
	}

	@Override
	public void saveDoServer(String userId, String username, String time, String userIp,String serviceId) {
		
		 monitorMapper.saveDoServer( userId,  username,  time,  userIp,serviceId);
		
	}

	@Override
	public void serviceAddOne(String serviceId) {
		
		 monitorMapper.serviceAddOne( serviceId);
		
	}

}
