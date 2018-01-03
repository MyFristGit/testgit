package com.udata.osp.entity;

public class Message {
	private int total;
	private int dblsl;
	private int dshsl;
	
	
	
	public Message(int total, int dblsl, int dshsl) {
		super();
		this.total = total;
		this.dblsl = dblsl;
		this.dshsl = dshsl;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getDblsl() {
		return dblsl;
	}
	public void setDblsl(int dblsl) {
		this.dblsl = dblsl;
	}
	public int getDshsl() {
		return dshsl;
	}
	public void setDshsl(int dshsl) {
		this.dshsl = dshsl;
	}
	
	
	
}
