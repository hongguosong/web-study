package com.itqinxun.model;

import java.util.Date;

public class Revert {

	private int revert_account; //回复贴的发帖人数字账号设立对应account表的外键
    private int revert_messageid; //所回复的主题帖的id 设立对应message表的外键
    private int revert_id;         //回复贴的id主键
    private String revert_content; //回复贴的内容
    private Date revert_date;      //回复贴的发帖日期
    private String revert_account_name;
    
	public int getRevert_account() {
		return revert_account;
	}
	public void setRevert_account(int revert_account) {
		this.revert_account = revert_account;
	}
	public int getRevert_messageid() {
		return revert_messageid;
	}
	public void setRevert_messageid(int revert_messageid) {
		this.revert_messageid = revert_messageid;
	}
	public int getRevert_id() {
		return revert_id;
	}
	public void setRevert_id(int revert_id) {
		this.revert_id = revert_id;
	}
	public String getRevert_content() {
		return revert_content;
	}
	public void setRevert_content(String revert_content) {
		this.revert_content = revert_content;
	}

	public Date getRevert_date() {
		return revert_date;
	}
	public void setRevert_date(Date revert_date) {
		this.revert_date = revert_date;
	}
	public String getRevert_account_name() {
		return revert_account_name;
	}
	public void setRevert_account_name(String revert_account_name) {
		this.revert_account_name = revert_account_name;
	}
}
