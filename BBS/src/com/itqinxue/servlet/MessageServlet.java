package com.itqinxue.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itqinxue.dao.impl.MessageDaoImpl;
import com.itqinxue.dao.impl.RevertDaoImpl;
import com.itqinxun.model.Message;
import com.itqinxun.model.Revert;

public class MessageServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8627438765420587083L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		RevertDaoImpl revertDao = new RevertDaoImpl();
		MessageDaoImpl dao=new MessageDaoImpl();
		String reqType = req.getParameter("reqType");
		
		if("addMessage".equals(reqType)) {
			String message_account=req.getParameter("message_account");
			String message_title=req.getParameter("message_title");
			String message_content=req.getParameter("message_content");
			String account_name=req.getParameter("account_name");
			String wall=req.getParameter("wall");
			String wallid=req.getParameter("wallid");
			String editorValue=req.getParameter("editorValue");
			
			
			Message message=new Message();
			message.setMessage_account(Integer.parseInt(message_account));
			message.setMessage_title(message_title);
			message.setMessage_content(editorValue);
			message.setMessage_date(new java.util.Date());
			message.setMessage_account_name(account_name);
			message.setMessage_wall(wall);
			int message_id= dao.addMessage(message);
			if(message_id>0) { 
/*				Message newMessage= dao.returnMessageBymessage(message);
				newMessage.setMessage_account_name(account_name);
				req.setAttribute("message", newMessage);*/
				
				HttpSession session = req.getSession();
				/*Account account=(Account)session.getAttribute("account");*/
				MessageDaoImpl mDao = new MessageDaoImpl();
				List<Message> list=mDao.searchMessageIpost(Integer.parseInt(message_account), 5);
				session.setAttribute("myMessageList", list);
				
				message.setMessage_id(message_id);
				req.setAttribute("message", message);
				req.getRequestDispatcher("message.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "发表文章失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
		}else if("messageEdit".equals(reqType)) {
			
			req.getRequestDispatcher("messageEdit.jsp").forward(req, resp);
			
		}else if("searchMessageIpost".equals(reqType)) {
			String account_account=req.getParameter("account_account");		
			List<Message> list= dao.searchMessageIpost(Integer.parseInt(account_account));
			
			req.setAttribute("messageList", list);
			req.getRequestDispatcher("searchMessageIpost.jsp").forward(req, resp);
			
		}else if("deleteMessage".equals(reqType)) {
			String message_id=req.getParameter("message_id");
			String account_account=req.getParameter("account_account");
			Message message=new Message();
			message.setMessage_id(Integer.parseInt(message_id));
			if(dao.deleteMessage(message)) {
					
				List<Message> list= dao.searchMessageIpost(Integer.parseInt(account_account));				
				req.setAttribute("messageList", list);
				
				HttpSession session = req.getSession();
				/*Account account=(Account)session.getAttribute("account");*/
				MessageDaoImpl mDao = new MessageDaoImpl();
				List<Message> list1=mDao.searchMessageIpost(Integer.parseInt(account_account), 5);
				session.setAttribute("myMessageList", list1);
				
				req.getRequestDispatcher("searchMessageIpost.jsp").forward(req, resp);
				
			}
			else {
				/*resp.sendError(404, "删除文章失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}
		}
		else if("messageDetails".equals(reqType)) {
			String message_id=req.getParameter("message_id");
			String account_account=req.getParameter("account_account");
			
			Message message=dao.returnMessageBymessage_id(Integer.parseInt(message_id));
			req.setAttribute("message", message);
			
			HttpSession session=req.getSession();
			session.setAttribute("wall", message.getMessage_wall());
			
			List<Revert> list=revertDao.returnRevertBymessage_id(Integer.parseInt(message_id));
			req.setAttribute("revertList", list);
			
			req.getRequestDispatcher("message.jsp").forward(req, resp);
			
		}
		else if("searchMessaheWall".equals(reqType)) 
		{
			String wall=req.getParameter("wall");
			
			List<Message> list= dao.searchMessageByWall(wall);
			
			req.setAttribute("messageList", list);
			HttpSession session=req.getSession();			
			session.setAttribute("wall", wall);
			req.getRequestDispatcher("MessageWall.jsp").forward(req, resp);
		}
		else if("searchMessageAll".equals(reqType)) 
		{
			List<Message> list= dao.searchMessageAll();			
			req.setAttribute("messageList", list);
			req.getRequestDispatcher("searchMessageAll.jsp").forward(req, resp);
		}
		else if("searchMessageAll2".equals(reqType))
		{
//			MessageDaoImpl mDao = new MessageDaoImpl();			
//			List<Message> list2=mDao.searchMessageALL2(12);
//			req.setAttribute("newMessageList", list2);
			
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
		else if("searchMessageKey".equals(reqType)) {
			String key=req.getParameter("key");
			List<Message> list= dao.returnMessageByKey(key);	
			req.setAttribute("messageList", list);
			req.getRequestDispatcher("MessageKey.jsp").forward(req, resp);
		}
	}
}
