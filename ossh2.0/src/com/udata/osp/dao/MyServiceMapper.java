package com.udata.osp.dao;

import java.util.List;
import com.udata.osp.entity.Myservice;

public interface MyServiceMapper {
	
	/**
	 * 查询我的服务
	 * @param userName
	 * @return
	 */
	List<Myservice> getMyServiceList(String userName);
	
}