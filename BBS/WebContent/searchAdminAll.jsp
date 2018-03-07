<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)session.getAttribute("account");
	if(account==null){
		account=new Account();
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
							<th>账号</th>
							<th>姓名</th>
							<th>密码</th>
							<th>注册时间</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Account> accountList=(List<Account>)request.getAttribute("accountList");
							if(accountList!=null && !accountList.isEmpty()){	
								for(Account acc : accountList){
						%>
									<tr>
										<td><%=acc.getAccount_account()%></td>
										<td><%=acc.getAccount_name()%></td>
										<td><%=acc.getAccount_pass()%></td>
										<td><%=acc.getAccount_date().toLocaleString()%></td>
									</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
				
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