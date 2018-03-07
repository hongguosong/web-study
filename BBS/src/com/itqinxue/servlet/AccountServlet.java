package com.itqinxue.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itqinxue.dao.impl.AccountDaoImpl;
import com.itqinxue.dao.impl.MessageDaoImpl;
import com.itqinxun.model.Account;
import com.itqinxun.model.Message;

public class AccountServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7011135633008482378L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		AccountDaoImpl dao=new AccountDaoImpl();
		String reqType = req.getParameter("reqType");
		if("ADD_ACCOUNT_INFO".equals(reqType)) {
			String account_name=req.getParameter("account_name");
			String account_pass=req.getParameter("account_pass");
			
			Account account=new Account();
			account.setAccount_limit(0);
			account.setAccount_name(account_name);
			account.setAccount_pass(account_pass);		
			
			if(dao.addAccount(account)!=0) {
				Account newAccount= dao.loginAccount(account);
				HttpSession session = req.getSession();
				session.setAttribute("account", newAccount);
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "注册失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}		
		}else if("LOGIN_ACCOUNT_INFO".equals(reqType)) {
			String account_name=req.getParameter("account_name");
			String account_pass=req.getParameter("account_pass");
			
			Account account=new Account();
			account.setAccount_name(account_name);
			account.setAccount_pass(account_pass);
			
			Account newAccount= dao.loginAccount(account);
			if(newAccount.getAccount_name()!=null && !newAccount.getAccount_name().isEmpty()) {
				HttpSession session = req.getSession();
				session.setAttribute("account", newAccount);
				
				MessageDaoImpl mDao = new MessageDaoImpl();
				List<Message> list=mDao.searchMessageIpost(newAccount.getAccount_account(), 5);
				session.setAttribute("myMessageList", list);
				
				List<Message> list2=mDao.searchMessageALL2(12);
				req.setAttribute("newMessageList", list2);
				
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "登录失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
		}else if("searchAccountAll".equals(reqType)) {
			List<Account> list=dao.searchAccountAll();
			//保存查询的账户信息  
			req.setAttribute("accountList", list);
			//转发请求
			req.getRequestDispatcher("searchAccountAll.jsp").forward(req, resp);
		}else if("searchAdminAll".equals(reqType)) {
			List<Account> list=dao.searchAdminAll();
			//保存查询的账户信息  
			req.setAttribute("accountList", list);
			//转发请求
			req.getRequestDispatcher("searchAdminAll.jsp").forward(req, resp);
		}else if("deleteAccount".equals(reqType)) {
			String account_account=req.getParameter("account_account");
			Account account=new Account();
			account.setAccount_account(Integer.parseInt(account_account));
			if(dao.deleteAccount(account)) {
				List<Account> list=dao.searchAccountAll();
				//保存查询的账户信息  
				req.setAttribute("accountList", list);
				//转发请求
				req.getRequestDispatcher("searchAccountAll.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "删除账号失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
		}else if("updateAccount".equals(reqType)) {
			
			String account_account=req.getParameter("account_account");
			Account account=new Account();
			account.setAccount_account(Integer.parseInt(account_account));
			Account newAccount=dao.returnAccountByaccount_account(account);
			req.setAttribute("account", newAccount);
			req.getRequestDispatcher("updateAccount.jsp?account="+account).forward(req, resp);
			
		}else if("setAccountAdmin".equals(reqType)) {
			String account_account=req.getParameter("account_account");
			Account account=new Account();
			account.setAccount_account(Integer.parseInt(account_account));
			if(dao.setAccountAdmin(account)) {
				List<Account> list=dao.searchAccountAll();
				//保存查询的账户信息  
				req.setAttribute("accountList", list);
				//转发请求
				req.getRequestDispatcher("searchAccountAll.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "设为管理员账号失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
			
		}else if("updateAccountDetail".equals(reqType)) {
			String account_account=req.getParameter("account_account");
			String account_name=req.getParameter("account_name");
			String account_pass=req.getParameter("account_pass");
			Account account=new Account();
			account.setAccount_account(Integer.parseInt(account_account));
			account.setAccount_name(account_name);
			account.setAccount_pass(account_pass);
			account.setAccount_date(new java.util.Date());
			if(dao.updateAccount(account)) {
				List<Account> list=dao.searchAccountAll();
				//保存查询的账户信息  
				req.setAttribute("accountList", list);
				//转发请求
				req.getRequestDispatcher("searchAccountAll.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "更新失败失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
		}
		
	}

	
}
