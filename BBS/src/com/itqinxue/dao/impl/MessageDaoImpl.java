package com.itqinxue.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.itqinxue.util.DBUtil;
import com.itqinxun.dao.MessageDao;
import com.itqinxun.model.Account;
import com.itqinxun.model.Message;

public class MessageDaoImpl implements MessageDao{

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/**
	 * 发布一个帖子
	 */
	@Override
	public int addMessage(Message message) {

		int messageId=0;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("insert into message_table(message_account,message_title,message_content,message_wall) values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1,message.getMessage_account());
			pstmt.setString(2, message.getMessage_title());
			pstmt.setString(3, message.getMessage_content());
			pstmt.setString(4,message.getMessage_wall());
			
			i = pstmt.executeUpdate();
			if(i>0) {
				rs=pstmt.getGeneratedKeys();
				if(rs.next()) {
					messageId = rs.getInt(1);
				}
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return messageId;
	}

	/**
	 * 删除帖子
	 */
	@Override
	public boolean deleteMessage(Message message) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from message_table where message_id=?");
			pstmt.setInt(1, message.getMessage_id());
			
			i = pstmt.executeUpdate();
			if(i>0) {
				flag=true;
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return flag;
	}

	/**
	 * 删除账号所有帖子
	 */
	@Override
	public boolean deleteMessageByaccount_account(int account_account) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from message_table where message_account=?");
			pstmt.setInt(1, account_account);
			
			i = pstmt.executeUpdate();
			if(i>0) {
				flag=true;
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return flag;
	}

	@Override
	public List<Message> searchMessageAll() {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table order by message_date desc");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message message=new Message();
				message.setMessage_account(rs.getInt("message_account"));
				message.setMessage_id(rs.getInt("message_id"));
				message.setMessage_title(rs.getString("message_title"));
				message.setMessage_content(rs.getString("message_content"));				
				message.setMessage_date(new java.util.Date(rs.getTimestamp("message_date").getTime()));
				
				RevertDaoImpl dao=new RevertDaoImpl();
				int num=dao.returnRevertNum(message.getMessage_id());
				message.setRevert_num(num);
				
				list.add(message);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<Message> searchMessageALL2(int num) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table  join account_table on message_table.message_account=account_table.account_account order by message_date desc limit ?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message message=new Message();
				message.setMessage_account_name(rs.getString("account_name"));
				message.setMessage_account(rs.getInt("message_account"));
				message.setMessage_id(rs.getInt("message_id"));
				message.setMessage_title(rs.getString("message_title"));
				message.setMessage_content(rs.getString("message_content"));				
				message.setMessage_date(new java.util.Date(rs.getTimestamp("message_date").getTime()));
				
				RevertDaoImpl dao=new RevertDaoImpl();
				int n=dao.returnRevertNum(message.getMessage_id());
				message.setRevert_num(n);
				
				list.add(message);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<Message> searchMessageIpost(int account_account) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_account=? order by message_date desc");
			pstmt.setInt(1, account_account);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message message=new Message();
				message.setMessage_account(rs.getInt("message_account"));
				message.setMessage_id(rs.getInt("message_id"));
				message.setMessage_title(rs.getString("message_title"));
				message.setMessage_content(rs.getString("message_content"));				
				message.setMessage_date(new java.util.Date(rs.getTimestamp("message_date").getTime()));
				
				RevertDaoImpl dao=new RevertDaoImpl();
				int num=dao.returnRevertNum(message.getMessage_id());
				message.setRevert_num(num);
				
				list.add(message);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	
	
	@Override
	public List<Message> searchMessageIpost(int account_account, int num) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_account=? order by message_date desc limit ?");
			pstmt.setInt(1, account_account);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message message=new Message();
				message.setMessage_account(rs.getInt("message_account"));
				message.setMessage_id(rs.getInt("message_id"));
				message.setMessage_title(rs.getString("message_title"));
/*				message.setMessage_content(rs.getString("message_content"));				
				message.setMessage_date(new java.util.Date(rs.getDate("message_date").getTime()));*/
				list.add(message);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<Message> searchMessage(Message message) {
		 return searchMessageIpost(message.getMessage_account());
	}

	@Override
	public List<Message> searchMessageById(Message message) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_id=?");
			pstmt.setInt(1, message.getMessage_id());
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message newMessage=new Message();
				newMessage.setMessage_account(rs.getInt("message_account"));
				newMessage.setMessage_id(rs.getInt("message_id"));
				newMessage.setMessage_title(rs.getString("message_title"));
				newMessage.setMessage_content(rs.getString("message_content"));				
				newMessage.setMessage_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
				list.add(newMessage);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public Message returnMessageBymessage_id(int message_id) {
		Message newMessage=new Message();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table  join message_table on account_table.account_account=message_table.message_account where message_id=?");
			pstmt.setInt(1, message_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				
				newMessage.setMessage_account(rs.getInt("message_account"));
				newMessage.setMessage_id(rs.getInt("message_id"));
				newMessage.setMessage_title(rs.getString("message_title"));
				newMessage.setMessage_content(rs.getString("message_content"));				
				newMessage.setMessage_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
				newMessage.setMessage_account_name(rs.getString("account_name"));
				newMessage.setMessage_wall(rs.getString("message_wall"));
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return newMessage;
	}

	@Override
	public Message returnMessageBymessage(Message message) {
		Message newMessage=new Message();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_account=? and message_title=? and message_content=?");
			pstmt.setInt(1, message.getMessage_account());
			pstmt.setString(2, message.getMessage_title());
			pstmt.setString(3, message.getMessage_content());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				
				newMessage.setMessage_account(rs.getInt("message_account"));
				newMessage.setMessage_id(rs.getInt("message_id"));
				newMessage.setMessage_title(rs.getString("message_title"));
				newMessage.setMessage_content(rs.getString("message_content"));				
				newMessage.setMessage_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return newMessage;
	}

	@Override
	public List<Message> searchMessageByWall(String wall) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_wall=?");
			pstmt.setString(1, wall);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message newMessage=new Message();
				newMessage.setMessage_account(rs.getInt("message_account"));
				newMessage.setMessage_id(rs.getInt("message_id"));
				newMessage.setMessage_title(rs.getString("message_title"));
				newMessage.setMessage_content(rs.getString("message_content"));				
				newMessage.setMessage_date(new java.util.Date(rs.getTimestamp("message_date").getTime()));
				
				RevertDaoImpl dao=new RevertDaoImpl();
				int num=dao.returnRevertNum(newMessage.getMessage_id());
				newMessage.setRevert_num(num);
				
				list.add(newMessage);
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<Message> returnMessageByKey(String key) {
		List<Message> list = new ArrayList<Message>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from message_table where message_content like ?");
			pstmt.setNString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Message newMessage=new Message();
				newMessage.setMessage_account(rs.getInt("message_account"));
				newMessage.setMessage_id(rs.getInt("message_id"));
				newMessage.setMessage_title(rs.getString("message_title"));
				newMessage.setMessage_content(rs.getString("message_content"));				
				newMessage.setMessage_date(new java.util.Date(rs.getTimestamp("message_date").getTime()));
				
				RevertDaoImpl dao=new RevertDaoImpl();
				int num=dao.returnRevertNum(newMessage.getMessage_id());
				newMessage.setRevert_num(num);
				
				list.add(newMessage);
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	
}
