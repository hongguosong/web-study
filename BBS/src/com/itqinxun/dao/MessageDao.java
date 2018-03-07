package com.itqinxun.dao;

import java.util.List;

import com.itqinxun.model.Message;

public interface MessageDao {

	public int addMessage(Message message);//新增主题帖
	public boolean deleteMessage(Message message);//删除主题帖，根据主题帖的ID即message_id;
	public boolean deleteMessageByaccount_account(int account_account);//删除主题帖,根据用户数字账号删除该用户所有的主题帖
	public List<Message> searchMessageAll();//显示所有主题帖信息，每查询日期，只查询了message表
	public List<Message> searchMessageALL2(int num);   //
	public List<Message> searchMessageIpost(int account_account);    //根据用户Id显示该用户所有的发布主题帖
	public List<Message> searchMessageIpost(int account_account,int num);    //根据用户Id显示该用户所有的发布主题帖,最新num个
	public List<Message> searchMessage(Message message);     //根据用户数字账号ID
    public List<Message> searchMessageById(Message message);     //根据用户帖子ID查找帖子
    public List<Message> searchMessageByWall(String wall);     //查询该板块的主题
    public Message returnMessageBymessage_id(int message_id);//显示所有主题帖信息给用户，包括发帖人名字，回帖数
    public Message returnMessageBymessage(Message message);
    public List<Message> returnMessageByKey(String key);////显示所有主题帖信息给用户，包括发帖人名字，回帖数
}
