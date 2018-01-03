package com.udata.osp.entity;

import java.util.ArrayList;
import java.util.List;
/**
 * 我的服务分页
 * @author zhouyouliang
 *
 */
public class PageInfo {
	private int total;
	private int currPage;
	private int pageSize;
	private List<Process> processList = new ArrayList<Process>();

	public PageInfo(int total, int currPage, List<Process> processList) {
		super();
		this.total = total;
		this.currPage = currPage;
		this.processList = processList;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Process> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Process> processList) {
		this.processList = processList;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "PageInfo [total=" + total + ", processList=" + processList + "]";
	}

}
