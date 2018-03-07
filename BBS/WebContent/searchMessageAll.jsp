<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="java.sql.*,com.itqinxue.util.DBUtil,com.itqinxue.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)session.getAttribute("account");
	if(account==null){
		account=new Account();
	}
%>

<%
	int pages=0;
	int count=0;
	int totalpages=0;
	int limit=14;
	Connection conn=DBUtil.getConnection();
	Statement sqlStmt=conn.createStatement();
	ResultSet sqlRst=sqlStmt.executeQuery("select count(*) from message_table");
	if(sqlRst.next()){
		count =sqlRst.getInt(1);
	}
	
	totalpages= (int)Math.ceil(count/(limit*1.0));
	String strPage=request.getParameter("pages");
	if(strPage==null){
		pages=1;
	}else{
		try{
			pages=Integer.parseInt(strPage);
		}catch(Exception e){
			pages=1;
		}
		
		if(pages <1){
			pages=1;
		}
		
		if(pages>totalpages){
			pages=totalpages;
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width:width-device,initial-scale:1">

<title>洪国松BBS</title>
</head>
<body onload="getTitle()">
	<div class="container-fluid">

		<jsp:include page="top.jsp"></jsp:include>
		<div class="row" style="margin-top:0px;margin-bottom:100px;">
			<div id="leftSide" class="col-lg-2 col-sm-4">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div id="mainSide" class="col-lg-8 col-sm-8">

				<table class="table">
					<thead>
						<tr>
							<th>文章标题</th>
							<th>发表时间</th>
							<th>回复数量</th>
							<th>操作管理</th>
						</tr>
					</thead>
					<tbody>
						<%-- <%
							List<Message> messageList=(List<Message>)request.getAttribute("messageList");
							if(messageList!=null && !messageList.isEmpty()){	
								for(Message mess : messageList){
						%>
									<tr>
										<td><%=mess.getMessage_title()%></td>
										<td><%=mess.getMessage_date().toLocaleString()%></td>
										<td><%=mess.getRevert_num()%></td>
										<td>
											<a class="badge badge-pill badge-danger" href="message?reqType=deleteMessage&message_id=<%=mess.getMessage_id()%>&account_account=<%=mess.getMessage_account()%>">删除</a>
											<a class="badge badge-pill badge-info" href="message?reqType=messageDetails&message_id=<%=mess.getMessage_id()%>&account_account=<%=mess.getMessage_account()%>">详细</a>
										</td>
										
										
										
									</tr>
						<%
								}
							}
						%> --%>
						
						<%
							sqlRst=sqlStmt.executeQuery("select * from message_table order by message_date desc limit "+(pages-1)*limit+","+limit);
						    RevertDaoImpl dao=new RevertDaoImpl();
							while(sqlRst.next()){				
						%>
								<tr>
									<td><%=sqlRst.getString("message_title")%></td>
									<td><%=sqlRst.getTimestamp("message_date").toLocaleString()%></td>
									<td><%=dao.returnRevertNum(sqlRst.getInt("message_id"))%></td>
									<td>
										<a class="badge badge-pill badge-danger" href="message?reqType=deleteMessage&message_id=<%=sqlRst.getInt("message_id")%>&account_account=<%=sqlRst.getString("message_account")%>">删除</a>
										<a class="badge badge-pill badge-info" href="message?reqType=messageDetails&message_id=<%=sqlRst.getInt("message_id")%>&account_account=<%=sqlRst.getString("message_account")%>">详细</a>
									</td>
									
									
									
								</tr>
						<%
							}
						%>
					</tbody>
				</table>
				
				<div class="row">
					<div style="margin:auto">				
						<form name="f1" method="POST" action="searchMessageAll.jsp" onSubmit="return checknum()">
		 		            <table border="0" align="center" >
				                <tr>
				                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="searchMessageAll.jsp?pages=1">首页&ensp;</a></td>
				                    <td><a href="searchMessageAll.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页&ensp;</a></td>
				                    <td><a href="searchMessageAll.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页&ensp;</a></td>
				                    <td><a href="searchMessageAll.jsp?pages=<%=totalpages%>">最后一页&ensp;</a></td>
				                    <td>转到第:<input type="text" name="pages" size="8">页<input type="submit" class="btn btn-link" value="GO" name="cndok"></td>
				                </tr>
				            </table>
						</form>
					</div>
				</div>
			</div>
			<div id="rightSide" class="col-lg-2 col-sm-12">
				<jsp:include page="right.jsp"></jsp:include>
			</div>
		</div>
		
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card bg-secondary text-white text-center border border-0">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</div>			
	</div>
	<script type="text/javascript">
		function getTitle(){
			var title=document.getElementById("message");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
</body>
</html>