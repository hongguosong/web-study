<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="java.sql.*,com.itqinxue.util.DBUtil,com.itqinxue.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=new Account();
%>

<%
	int pages=0;            //待显示页面
	int count=0;            //总条数
	int totalpages=0;        //总页数
	int limit=14;            //每页显示记录条数
	int account_account=0;
	try{
		account_account=Integer.parseInt(request.getParameter("account_account"));
	}catch(Exception e){
		
	}
	
	Connection conn = DBUtil.getConnection();
	Statement sqlStmt=conn.createStatement();
	//计算记录总数的第二种办法：使用mysql的聚集函数count(*)
	ResultSet sqlRst = sqlStmt.executeQuery("select count(*) from wall_table");
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
<title>文章墙管理</title>
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
							<th>文章墙ID</th>
							<th>文章墙标题</th>
							<th>管理操作</th>
						</tr>
					</thead>
					<tbody>
						<%-- <%
							List<Account> accountList=(List<Account>)request.getAttribute("accountList");
							if(accountList!=null && !accountList.isEmpty()){	
								for(Account acc : accountList){
						%>
									<tr>
										<td><%=acc.getAccount_account()%></td>
										<td><%=acc.getAccount_name()%></td>
										<td><%=acc.getAccount_pass()%></td>
										<td><%=acc.getAccount_date().toLocaleString()%></td>
										<td>
											<a class="badge badge-pill badge-danger" href="account?reqType=deleteAccount&account_account=<%=acc.getAccount_account()%>">删除</a>
											<a class="badge badge-pill badge-info" href="account?reqType=updateAccount&account_account=<%=acc.getAccount_account()%>">修改</a>
											<a class="badge badge-pill badge-warning" href="account?reqType=setAccountAdmin&account_account=<%=acc.getAccount_account()%>">设为管理员</a>
										</td>
										
										
										
									</tr>
						<%
								}
							}
						%> --%>
						
						<%
							sqlRst=sqlStmt.executeQuery("select * from wall_table order by wall_id");
							while(sqlRst.next()){
						%>
								<tr>
									<td><%=sqlRst.getInt("wall_id")%></td>
									<td><%=sqlRst.getString("wall_title")%></td>
									<td>
										<a class="badge badge-pill badge-danger" href="deleteWall.jsp?wall_id=<%=sqlRst.getInt("wall_id")%>">删除</a>
										<a class="badge badge-pill badge-warning" href="addWall.jsp?">添加</a>
									</td>								
								</tr>
						<%
							}
						%>
						
					</tbody>
				</table>

				<div class="row">
					<div style="margin:auto">
						<form name="f1" method="POST" action="searchAccountAll.jsp" onSubmit="return checknum()">
		 		            <table border="0" align="center" >
				                <tr>
				                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="searchAccountAll.jsp?pages=1">首页&ensp;</a></td>
				                    <td><a href="searchAccountAll.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页&ensp;</a></td>
				                    <td><a href="searchAccountAll.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页&ensp;</a></td>
				                    <td><a href="searchAccountAll.jsp?pages=<%=totalpages%>">最后一页&ensp;</a></td>
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
			var title=document.getElementById("account");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
</body>
</html>