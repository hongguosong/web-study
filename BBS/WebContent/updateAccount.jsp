<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)request.getAttribute("account");
%>
<html>
<head>
<meta charset="UTF-8">
<title>洪国松BBS</title>
</head>
<body>
	<div class="container-fluid">

		<jsp:include page="top.jsp"></jsp:include>
		<div class="row" style="margin-top:0px;margin-bottom:100px;">
			<div id="leftSide" class="col-lg-2 col-sm-4">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div id="mainSide" class="col-lg-8 col-sm-8">
				
				<form name="accountUpdateForm" onsubmit="return validateForm1()" action="account?reqType=updateAccountDetail" method="post">
					<div class="form-group">
						<label for="account_account">账户:</label>
						<input type="text" class="form-control" name="account_account" id="account_account" value="<%=account.getAccount_account()%>" readonly>
					</div>
					<div class="form-group">
						<label for="account_name">姓名:</label>
						<input type="text" class="form-control" name="account_name" id="account_name" value="<%=account.getAccount_name()%>">
					</div>
					<div class="form-group">
						<label for="account_pass">密码:</label>
						<input type="text" class="form-control" name="account_pass" id="account_pass" value="<%=account.getAccount_pass()%>">
					</div>
					<div class="form-group">
						<label for="account_date">注册时间:</label>
						<input type="text" class="form-control" name="account_date" id="account_date" value="<%=account.getAccount_date().toLocaleString()%>" disabled>
					</div>
					<div class="row">
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
		<!--表单验证-->
		function validateForm1(){
			var x=document.forms["accountUpdateForm"]["account_name"].value;
			var y=document.forms["accountUpdateForm"]["account_pass"].value;
	
			if (x==null || x=="")
			{
			  alert("姓名必须填写");
			  return false;
			}
			if (y==null || y=="")
			{
			  alert("密码必须填写");
			  return false;
			}		
		}
	</script>
	
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