package com.udata.osp.entity;

public class BackLogService {
    private String code;

    private String appname;

    private Integer backlogcount;

    private Integer donecount;
    
    private String userId;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getAppname() {
        return appname;
    }

    public void setAppname(String appname) {
        this.appname = appname == null ? null : appname.trim();
    }

    public Integer getBacklogcount() {
        return backlogcount;
    }

    public void setBacklogcount(Integer backlogcount) {
        this.backlogcount = backlogcount;
    }

    public Integer getDonecount() {
        return donecount;
    }

    public void setDonecount(Integer donecount) {
        this.donecount = donecount;
    }

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
    
    
}