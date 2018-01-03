package com.udata.osp.entity;
/**
 * 流程实例的处理信息
 * @author zhouyouliang
 *
 */
public class ActionInfo {
	private String actionUser;//处理人
	private Long actionTime;//处理时间
	private String actionName;//处理结果
	private String name;//审核部门
	private String assignUser;//接受人
	private String assignTime;//接受时间
	
	public String getActionUser() {
		return actionUser;
	}
	public void setActionUser(String actionUser) {
		this.actionUser = actionUser;
	}

	public Long getActionTime() {
		return actionTime;
	}
	public void setActionTime(Long actionTime) {
		this.actionTime = actionTime;
	}
	public String getActionName() {
		return actionName;
	}
	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getAssignUser() {
		return assignUser;
	}
	public void setAssignUser(String assignUser) {
		this.assignUser = assignUser;
	}
	public String getAssignTime() {
		return assignTime;
	}
	public void setAssignTime(String assignTime) {
		this.assignTime = assignTime;
	}
	@Override
	public String toString() {
		return "ActionInfo [actionUser=" + actionUser + ", actionTime=" + actionTime + ", actionName=" + actionName
				+ ", name=" + name + ", assignUser=" + assignUser + ", assignTime=" + assignTime + "]";
	}
	
	
	
	
}
