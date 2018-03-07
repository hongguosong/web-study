package com.itqinxue.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.itqinxue.util.DBUtil;
import com.itqinxun.dao.RevertDao;
import com.itqinxun.model.Revert;

public class RevertDaoImpl implements RevertDao{

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public int addRevert(Revert revert) {
		int revertId=0;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("insert into revert_table(revert_account,revert_messageid,revert_content) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1,revert.getRevert_account());
			pstmt.setInt(2,revert.getRevert_messageid());
			pstmt.setString(3,revert.getRevert_content());
			
			i = pstmt.executeUpdate();
			if(i>0) {
				rs=pstmt.getGeneratedKeys();
				if(rs.next()) {
					revertId=rs.getInt(1);
				}
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return revertId;
	}

	@Override
	public boolean deleteRevert(Revert revert) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from revert_table where revert_id=?");
			pstmt.setInt(1, revert.getRevert_id());
			
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
	public boolean deleteRevertByaccount_account(int account_account) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from revert_table where revert_account=?");
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
	public boolean deleteRevertbyMessageid(int messageid) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from revert_table where revert_messageid=?");
			pstmt.setInt(1, messageid);
			
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
	public List<Revert> searchRevertALL() {
		List<Revert> list = new ArrayList<Revert>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from revert_table");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Revert revert=new Revert();
				revert.setRevert_account(rs.getInt("revert_account"));
				revert.setRevert_messageid(rs.getInt("revert_messageid"));
				revert.setRevert_id(rs.getInt("revert_id"));
				revert.setRevert_content(rs.getString("revert_content"));				
				revert.setRevert_date(new Date(rs.getTimestamp("revert_date").getTime()));
				
				AccountDaoImpl dao=new AccountDaoImpl();								
				revert.setRevert_account_name(dao.searchAccountNameByRevertId(revert.getRevert_id()));
				
				list.add(revert);
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
	public List<Revert> searchNewRevertALL() {
		List<Revert> list = new ArrayList<Revert>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from revert_table limit 3");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Revert revert=new Revert();
				revert.setRevert_account(rs.getInt("revert_account"));
				revert.setRevert_messageid(rs.getInt("revert_messageid"));
				revert.setRevert_id(rs.getInt("revert_id"));
				revert.setRevert_content(rs.getString("revert_content"));				
				revert.setRevert_date(new Date(rs.getTimestamp("revert_date").getTime()));
				list.add(revert);
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
	public List<Revert> searchRevertById(int account_account) {
		List<Revert> list = new ArrayList<Revert>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from revert_table where revert_account=?");
			pstmt.setInt(1, account_account);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Revert revert=new Revert();
				revert.setRevert_account(rs.getInt("revert_account"));
				revert.setRevert_messageid(rs.getInt("revert_messageid"));
				revert.setRevert_id(rs.getInt("revert_id"));
				revert.setRevert_content(rs.getString("revert_content"));				
				revert.setRevert_date(new Date(rs.getTimestamp("revert_date").getTime()));
				list.add(revert);
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
	public List<Revert> returnRevertBymessage_id(int messageid) {
		List<Revert> list = new ArrayList<Revert>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from revert_table where revert_messageid=?");
			pstmt.setInt(1, messageid);
			
			rs = pstmt.executeQuery();
			while(rs.next()){			
				
				Revert revert=new Revert();
				revert.setRevert_account(rs.getInt("revert_account"));
				revert.setRevert_messageid(rs.getInt("revert_messageid"));
				revert.setRevert_id(rs.getInt("revert_id"));
				revert.setRevert_content(rs.getString("revert_content"));				
				revert.setRevert_date(new Date(rs.getTimestamp("revert_date").getTime()));
				
				AccountDaoImpl dao=new AccountDaoImpl();								
				revert.setRevert_account_name(dao.searchAccountNameByRevertId(revert.getRevert_id()));
				
				list.add(revert);
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
	public int returnRevertNum(int messageid) {
		
		int num=0;

		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from revert_table where revert_messageid=?");
			pstmt.setInt(1, messageid);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				num = rs.getInt(1);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return num;
	}

	
}
