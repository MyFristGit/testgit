package com.udata.osp.entity;

import java.util.Arrays;
import java.util.Date;



public class UserComment {
	private String id;
    private String user_id;

	private String service_id;
    
    private  String comment;

	private  java.sql.Timestamp  create_time; 
	
	
	 private  String create_time_string;
	 
	    public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

	public String getCreate_time_string() {
		return create_time_string;
	}

	public void setCreate_time_string(String create_time_string) {
		this.create_time_string = create_time_string;
	}

	public java.sql.Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(java.sql.Timestamp create_time) {
		this.create_time = create_time;
	}
		

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getService_id() {
		return service_id;
	}

	public void setService_id(String service_id) {
		this.service_id = service_id;
	}
	
	
	
	
    
}