package com.udata.osp.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 流程实例
 * @author zhouyouliang
 *
 */
public class Process {
	private String id;
	private String name;
	private String url;
	private String status;
	private String updateDate;
	private List<ActionInfo> actionInfoList = new ArrayList<ActionInfo>();
	

	public List<ActionInfo> getActionInfoList() {
		return actionInfoList;
	}

	public void setActionInfoList(List<ActionInfo> actionInfoList) {
		this.actionInfoList = actionInfoList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Process [id=" + id + ", name=" + name + ", url=" + url + ", status=" + status + ", updateDate="
				+ updateDate + ", actionInfoList=" + actionInfoList + "]";
	}

	
	
}
