package com.itqinxun.dao;

import java.util.List;

import com.itqinxun.model.Account;

public interface AccountDao {

	public int addAccount(Account account);//新增账号信息
	public boolean deleteAccount(Account account);//删除账号信息，将用户权限设为2，即不可登录
	public boolean updateAccount(Account account);//更新账户信息
	public List<Account> searchAccountAll();//显示所有账号信息，只查询普通账号；
	public List<Account> searchAdminAll();//查询管理员账号
	public Account returnAccountByaccount_account(Account account);//根据用户数字账号返回用户
	public Account loginAccount(Account account);//查询登录信息以及返回用户
	public Account adminLoginAccount(Account account);//查询管理用户信息以及返回用户
	public boolean setAccountAdmin(Account account);//将用户权限变为1，即使管理员
	public String searchAccountNameByRevertId(int revertId);
}
