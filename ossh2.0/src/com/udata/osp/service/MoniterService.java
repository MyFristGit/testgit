package com.udata.osp.service;

import java.util.Map;

public interface MoniterService {
	int saveLogin(Map<String, Object> map);

	void saveDoServer(String userId, String username, String time, String userIp, String serviceId);

	void serviceAddOne(String serviceId);

}
