package com.itqinxue.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itqinxue.dao.impl.MessageDaoImpl;
import com.itqinxue.dao.impl.RevertDaoImpl;
import com.itqinxun.model.Message;
import com.itqinxun.model.Revert;


public class RevertServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1970606505792605403L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MessageDaoImpl messageDao = new MessageDaoImpl();
		RevertDaoImpl dao=new RevertDaoImpl();
		String reqType = req.getParameter("reqType");
		if("addRevert".equals(reqType)) {
			String revert_account=req.getParameter("revert_account");
			String revert_messageid=req.getParameter("revert_messageid");
			String revert_content=req.getParameter("revert_content");
			
			Revert revert=new Revert();
			revert.setRevert_account(Integer.parseInt(revert_account));
			revert.setRevert_messageid(Integer.parseInt(revert_messageid));
			revert.setRevert_content(revert_content);
			
			if(dao.addRevert(revert)>0) {
				List<Revert> list=dao.returnRevertBymessage_id(revert.getRevert_messageid());
				req.setAttribute("revertList", list);
				
				Message message=messageDao.returnMessageBymessage_id(Integer.parseInt(revert_messageid));
				req.setAttribute("message", message);
				
				req.getRequestDispatcher("message.jsp").forward(req, resp);
			}else {
				/*resp.sendError(404, "回复信息失败");*/
				req.getRequestDispatcher("error404.html").forward(req, resp);
			}		
		}
		else if("searchRevertALL".equals(reqType)) {
			List<Revert> list=dao.searchRevertALL();
			req.setAttribute("revertList", list);		
			req.getRequestDispatcher("searchRevertAll.jsp").forward(req, resp);
		}
	}

	
}
