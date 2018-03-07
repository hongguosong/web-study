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
	int pages=0;            //待显示页面
	int count=0;            //总条数
	int totalpages=0;        //总页数
	int limit=14;            //每页显示记录条数
	Connection conn = DBUtil.getConnection();
	Statement sqlStmt=conn.createStatement();
	//计算记录总数的第二种办法：使用mysql的聚集函数count(*)
	ResultSet sqlRst = sqlStmt.executeQuery("select count(*) from revert_table");
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
<meta name="viewport" content="width:width-device,initial-scale:1">
<style type="text/css">
/* 	li{
		height:30px;
	} */
</style>
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
							<th>回帖人账号</th>
							<th>回帖人姓名</th>
							<th>回帖时间</th>
							<th>操作管理</th>
						</tr>
					</thead>
					<tbody>
						<%-- <%
 							List<Revert> revertList=(List<Revert>)request.getAttribute("revertList");
							if(revertList!=null && !revertList.isEmpty()){	
								for(Revert rev : revertList){
										
						%>
									<tr>
										<td><%=rev.getRevert_account()%></td>
										<td><%=rev.getRevert_account_name()%></td>
										<td><%=rev.getRevert_date().toLocaleString()%></td>
										
										<td>
											<a class="badge badge-pill badge-danger" href="revert?reqType=deleteRevert&revert_id=<%=rev.getRevert_id()%>">删除</a>
										</td>									
									</tr>
						<%
								}
							}
						%> --%>
						
						<%
							//由(pages-1)*limit算出当前页面第一条记录，由limit查询limit条记录。则得出当前页面的记录
							sqlRst = sqlStmt.executeQuery("select * from revert_table order by revert_id limit " + (pages - 1) * limit + "," + limit);
							while (sqlRst.next()){
								//遍历显示
								AccountDaoImpl dao=new AccountDaoImpl();								
								String revert_name=dao.searchAccountNameByRevertId(Integer.parseInt(sqlRst.getString("revert_id")));
						%>
								<tr>
									<td><%=sqlRst.getString("revert_account")%></td>
									<td><%=revert_name%></td>
									<td><%=sqlRst.getString("revert_date").toString()%></td>
									
									<td>
										<a class="badge badge-pill badge-danger" href="revert?reqType=deleteRevert&revert_id=<%=sqlRst.getString("revert_id")%>">删除</a>
									</td>									
								</tr>
						<%
							}	
						%>
						
					</tbody>
				</table>
				<div class="row">
					<div style="margin:auto">
						<form name="f1" method="POST" action="searchRevertAll.jsp" onSubmit="return checknum()">
		 		            <table border="0" align="center" >
				                <tr>
				                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="searchRevertAll.jsp?pages=1">首页&ensp;</a></td>
				                    <td><a href="searchRevertAll.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页&ensp;</a></td>
				                    <td><a href="searchRevertAll.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页&ensp;</a></td>
				                    <td><a href="searchRevertAll.jsp?pages=<%=totalpages%>">最后一页&ensp;</a></td>
				                    <td>转到第:<input type="text" name="pages" size="8">页<input type="submit" class="btn btn-link" value="GO" name="cndok"></td>
				                </tr>
				            </table>
				            <%-- <ul class="breadcrumb" style="text-align:center">
				            	<li class="breadcrumb-item">第<%=pages%>页</li>
				            	<li class="breadcrumb-item">共<%=totalpages%>页</li>
								<li class="breadcrumb-item"><a href="searchRevertAll.jsp?pages=1">首页</a></li>
								<li class="breadcrumb-item"><a href="searchRevertAll.jsp?pages=<%=(pages<1)?pages:(pages-1) %>">上一页</a></li>
								<li class="breadcrumb-item"><a href="searchRevertAll.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>">下一页</a></li>
								<li class="breadcrumb-item"><a href="searchRevertAll.jsp?pages=<%=totalpages%>">最后一页</a></li>
								<li class="breadcrumb-item">转到第:<input type="text" name="pages" size="8">页<input type="submit" value="GO" name="cndok"></li>
							</ul> --%>
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
			var title=document.getElementById("revert");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
</body>
</html>