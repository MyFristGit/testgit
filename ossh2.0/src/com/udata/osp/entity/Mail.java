package com.udata.osp.entity;

public class Mail {
	private String count;
	private String accountName;
	private String password;
	private String mailUrl;

	public Mail(String count, String accountName, String mailUrl) {
		super();
		this.count = count;
		this.accountName = accountName;
		this.mailUrl = mailUrl;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMailUrl() {
		return mailUrl;
	}

	public void setMailUrl(String mailUrl) {
		this.mailUrl = mailUrl;
	}

}
