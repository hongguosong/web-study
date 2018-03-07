package com.itqinxue.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.itqinxue.util.DBUtil;
import com.itqinxun.dao.AccountDao;
import com.itqinxun.model.Account;

public class AccountDaoImpl implements AccountDao{

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/**
	 * 注册新用户
	 */
	@Override
	public int addAccount(Account account) {

		int accountId=0;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("insert into account_table(account_name,account_pass) values(?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,account.getAccount_name());
			pstmt.setString(2, account.getAccount_pass());
			
			i = pstmt.executeUpdate();
			if(i>0) {
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					accountId=rs.getInt(1);
				}
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return accountId;
	}

	/**
	 * 删除用户
	 */
	@Override
	public boolean deleteAccount(Account account) {

		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("update account_table set account_limit=2 where account_account=?");
			pstmt.setInt(1,account.getAccount_account());
			
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
	 * 保存用户修改
	 */
	@Override
	public boolean updateAccount(Account account) {

		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("update account_table set account_name=?,account_pass=? where account_account=?");
			pstmt.setString(1,account.getAccount_name());
			pstmt.setString(2, account.getAccount_pass());
			pstmt.setInt(3, account.getAccount_account());
			
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
     * 查询所有用户的方法，只查询普通用户，不查询管理员
     */
	@Override
	public List<Account> searchAccountAll() {
		List<Account> list = new ArrayList<Account>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table where account_limit=0");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Account account=new Account();
				account.setAccount_account(rs.getInt("account_account"));
				account.setAccount_name(rs.getString("account_name"));
				account.setAccount_pass(rs.getString("account_pass"));
				account.setAccount_limit(rs.getInt("account_limit"));
				account.setAccount_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
				list.add(account);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	/**
	 * 普通所有管理员
	 */
	@Override
	public List<Account> searchAdminAll() {
		List<Account> list = new ArrayList<Account>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table where account_limit=1");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Account account=new Account();
				account.setAccount_account(rs.getInt("account_account"));
				account.setAccount_name(rs.getString("account_name"));
				account.setAccount_pass(rs.getString("account_pass"));
				account.setAccount_limit(rs.getInt("account_limit"));
				account.setAccount_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
				list.add(account);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

	/**
     * 根据用户的账号查找其他的信息，即申明一个对象，仅赋予该对象数字账号，调用该方法会把名称，密码再赋值到该对象中，更加安全
     */
	@Override
	public Account returnAccountByaccount_account(Account account) {
		
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table where account_account=?");
			pstmt.setInt(1, account.getAccount_account());
			rs = pstmt.executeQuery();
			while(rs.next()){
				account.setAccount_name(rs.getString("account_name"));
				account.setAccount_pass(rs.getString("account_pass"));
				account.setAccount_limit(rs.getInt("account_limit"));
				account.setAccount_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return account;
	}

	/**
     * 普通用户登录方法，查询Limit<2
     */
	@Override
	public Account loginAccount(Account account) {
		
		Account newAccount=new Account();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table where account_name=? and account_pass=? and account_limit<2");
			pstmt.setString(1, account.getAccount_name());
			pstmt.setString(2, account.getAccount_pass());
			rs = pstmt.executeQuery();
			while(rs.next()){
				newAccount.setAccount_account(rs.getInt("account_account"));
				newAccount.setAccount_name(rs.getString("account_name"));
				newAccount.setAccount_pass(rs.getString("account_pass"));
				newAccount.setAccount_limit(rs.getInt("account_limit"));
				newAccount.setAccount_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return newAccount;
	}

	/**
     * 普通管理员登录方法，查询Limit=1才能登录
     */
	@Override
	public Account adminLoginAccount(Account account) {
		Account newAccount=new Account();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from account_table where account_name=? and account_pass=? and account_limit=1");
			pstmt.setString(1, account.getAccount_name());
			pstmt.setString(2, account.getAccount_pass());
			rs = pstmt.executeQuery();
			while(rs.next()){
				newAccount.setAccount_account(rs.getInt("account_account"));
				newAccount.setAccount_name(rs.getString("account_name"));
				newAccount.setAccount_pass(rs.getString("account_pass"));
				newAccount.setAccount_limit(rs.getInt("account_limit"));
				newAccount.setAccount_date(new java.util.Date(rs.getTimestamp("account_date").getTime()));
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return newAccount;
	}

	/**
	 * 设置管理员
	 */
	@Override
	public boolean setAccountAdmin(Account account) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("update account_table set account_limit=1 where account_account=?");
			pstmt.setInt(1, account.getAccount_account());
			
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
	public String searchAccountNameByRevertId(int revertId) {
		String account_name="";
		
		try {
			conn = DBUtil.getConnection();
			pstmt=conn.prepareStatement("select * from account_table  join revert_table on account_table.account_account=revert_table.revert_account where revert_id=?");
			pstmt.setInt(1, revertId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				account_name=rs.getString("account_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return account_name;
	}

	
}
