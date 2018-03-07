package com.itqinxun.model;

import java.util.Date;

public class Message {

	private int message_account;//主题帖发帖人数字账号,设立对应account表的外键
	private int message_id;//主题帖的id 主键
	private String message_title;//主题帖名称
	private String message_content;//主题帖内容;
	private Date message_date;//主题帖发帖日期；
	private String message_account_name;   //主题帖的发帖人账号名字
    private int revert_num;                   //主题帖的回帖数
    private String message_wall; //主题所属板块
    
	public String getMessage_wall() {
		return message_wall;
	}
	public void setMessage_wall(String message_wall) {
		this.message_wall = message_wall;
	}
	public String getMessage_account_name() {
		return message_account_name;
	}
	public void setMessage_account_name(String message_account_name) {
		this.message_account_name = message_account_name;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public int getMessage_account() {
		return message_account;
	}
	public void setMessage_account(int message_account) {
		this.message_account = message_account;
	}
	public int getRevert_num() {
		return revert_num;
	}
	public void setRevert_num(int revert_num) {
		this.revert_num = revert_num;
	}
	
}
