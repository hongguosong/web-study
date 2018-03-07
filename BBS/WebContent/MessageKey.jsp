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
	request.setCharacterEncoding("UTF-8");
	String key=request.getParameter("key");
	if(key==null){
		key="";
	}
	int pages=0;            //待显示页面
	int count=0;            //总条数
	int totalpages=0;        //总页数
	int limit=14;            //每页显示记录条数
	Connection conn = DBUtil.getConnection();
	Statement sqlStmt=conn.createStatement();
	//计算记录总数的第二种办法：使用mysql的聚集函数count(*)
	ResultSet sqlRst = sqlStmt.executeQuery("select count(*) from message_table where message_content like '%"+key+"%'");
	if(sqlRst.next()){
	    count = sqlRst.getInt(1);//结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
	}    
	//由记录总数除以每页记录数得出总页数
	totalpages = (int)Math.ceil(count/(limit*1.0));
	//获取跳页时传进来的当前页面参数
	String strPage = request.getParameter("pages");
	//判断当前页面参数的合法性并处理非法页号（为空则显示第一页，小于0则显示第一页，大于总页数则显示最后一页）
	if (strPage == null) { 
	    pages = 1;
	} else {
	    try{
	        pages = java.lang.Integer.parseInt(strPage);
	    }catch(Exception e){
	        pages = 1;
	    }
	    
	    if (pages < 1){
	        pages = 1;
	    }
	    
	    if (pages > totalpages){
	        pages = totalpages;
	    }                            
	}

%>

<html>
<head>
<meta charset="UTF-8">
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
						</tr>
					</thead>
					<tbody>
						<%-- <%
							List<Message> messageList=(List<Message>)request.getAttribute("messageList");
							if(messageList!=null && !messageList.isEmpty()){	
								for(Message mess : messageList){
						%>
									<tr>
										<td><a class="badge badge-pill" href="message?reqType=messageDetails&message_id=<%=mess.getMessage_id()%>&account_account=<%=mess.getMessage_account()%>"><%=mess.getMessage_title()%></a></td>
										<td><%=mess.getMessage_date().toLocaleString()%></td>
										<td><%=mess.getRevert_num()%></td>								
									</tr>
						<%
								}
							}
						%> --%>
						
						<%
							RevertDaoImpl dao=new RevertDaoImpl();
							sqlRst = sqlStmt.executeQuery("select * from message_table where message_content like '%"+key+"%' order by message_date desc limit " + (pages - 1) * limit + "," + limit);
							while(sqlRst.next()){				
								int num=dao.returnRevertNum(sqlRst.getInt("message_id"));
						%>
									<tr>
										<td><a class="badge badge-pill" href="message?reqType=messageDetails&message_id=<%=sqlRst.getInt("message_id")%>&account_account=<%=sqlRst.getString("message_account")%>"><%=sqlRst.getString("message_title")%></a></td>
										<td><%=sqlRst.getTimestamp("message_date").toLocaleString()%></td>
										<td><%=num%></td>								
									</tr>
						<%	
							}
						%>
					</tbody>
				</table>
				<form name="f1" method="POST" action="MessageKey.jsp" onSubmit="return checknum()">
					<input type="hidden" name="key" value="<%=key%>">
 		            <table border="0" align="center" >
		                <tr>
		                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="MessageKey.jsp?pages=1&key=<%=key%>">首页</a></td>
		                    <td><a href="MessageKey.jsp?pages=<%=(pages<1)?pages:(pages-1) %>&key=<%=key%>"> 上一页</a></td>
		                    <td><a href="MessageKey.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>&key=<%=key%>"> 下一页</a></td>
		                    <td><a href="MessageKey.jsp?pages=<%=totalpages%>&key=<%=key%>">最后一页</a></td>
		                    <td>转到第:<input type="text" name="pages" size="8">页<input type="submit" value="GO" name="cndok"></td>
		                </tr>
		            </table>
				</form>
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#searchMessageKey').val("<%=key%>");
		});
	</script>
</body>
</html>