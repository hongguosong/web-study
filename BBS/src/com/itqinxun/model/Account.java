package com.itqinxun.model;

import java.util.Date;

public class Account {

	private int account_account;//用户数字账号 主键
	private String account_name;//用户账号个性名字
	private String account_pass;//用户账号密码
	private int account_limit;//用户账号权限识别码，0为用户，1为管理员
	private Date account_date;//用户账号创建日期
	
	public int getAccount_account() {
		return account_account;
	}
	public void setAccount_account(int account_account) {
		this.account_account = account_account;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_pass() {
		return account_pass;
	}
	public void setAccount_pass(String account_pass) {
		this.account_pass = account_pass;
	}
	public int getAccount_limit() {
		return account_limit;
	}
	public void setAccount_limit(int account_limit) {
		this.account_limit = account_limit;
	}
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}
	
	
}
