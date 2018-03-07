<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="java.sql.*,com.itqinxue.util.DBUtil,com.itqinxue.dao.impl.*" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->
<%
	request.setCharacterEncoding("UTF-8");
	String wall_title=request.getParameter("wall_title");
	Wall wall=new Wall();
	wall.setTitle(wall_title);
	try{
		
		WallDaoImpl dao=new WallDaoImpl();
		dao.addWall(wall);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	request.getRequestDispatcher("searchWall.jsp").forward(request, response);
%>