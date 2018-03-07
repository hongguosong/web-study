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
<title>新添文章墙</title>
</head>
<body onload="getTitle()">
	<div class="container-fluid">

		<jsp:include page="top.jsp"></jsp:include>
		<div class="row" style="margin-top:0px;margin-bottom:100px;">
			<div id="leftSide" class="col-lg-2 col-sm-4">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div id="mainSide" class="col-lg-8 col-sm-8">
				
				<form name="accountUpdateForm"  action="addWallAction.jsp" method="post" onSubmit="return checknum()">
					<div class="form-group">
						<label for="wall_title">文章墙标题:</label>
						<input type="text" class="form-control" name="wall_title" id="wall_title">
					</div>
					
					<div class="row" style="margin-top: 20px;">
						<div class="col-6">
							<button type="submit" class="btn btn-primary" style="width: 100%;">OK</button>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-secondary" onclick="javascript:history.back(-1);" style="width: 100%;">Cancel</button>
						</div>
					</div>														
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
			var title=document.getElementById("account");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
</body>
</html>


	