package com.udata.osp.dao;

import java.util.List;

import com.udata.osp.entity.BackLogService;

public interface BackLogServiceMapper {
    int insert(BackLogService record);

    int insertSelective(BackLogService record);

	void insertList(List<BackLogService> blsList);

	void deleteBackLog(String userId);
}