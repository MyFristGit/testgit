package com.udata.osp.dao;

import java.util.Map;

public interface MonitorMapper {
	int saveLogin(Map<String, Object> map);

	int saveDoServer(String userId, String username, String time, String userIp, String serviceId);

	void serviceAddOne(String serviceId);

}
