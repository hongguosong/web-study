<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)session.getAttribute("account");
	
/* 	Message message=(Message)request.getAttribute("message");
	if(message==null){
		message=new Message();
	} */
%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->

<title>right</title>
</head>
<body>
	<div class="card">
		<img class="card-img-top" src="http://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:100%">
		<div class="card-body">
			用户信息:<br/>
			<%
			if(account !=null){
			%>
				账号：<%=account.getAccount_account()%><br/>
				姓名：<%=account.getAccount_name()%><br/>
				注册时间:<%=account.getAccount_date().toLocaleString() %>
			<%
			}
			%>

		</div>
	</div>
	<br>
	<div class="card bg-primary text-white">
		<div class="card-body">
		<%
			if(account !=null){
		%>
				<div>
					<a class="text-white font-italic badge" style="background-color: #007BFF;" href="message?reqType=messageEdit">发表新文章<hr/></a>					
				</div>
				<div>
					<a class="text-white font-italic badge" style="background-color: #007BFF;" href="message?reqType=searchMessageIpost&account_account=<%=account.getAccount_account()%>">已发表文章<hr/></a>				
				</div>
				<div>
					<a class="text-white font-italic badge" style="background-color: #007BFF;" href="imgUpload.jsp">上传图片<hr/></a>				
				</div>
				
		<%
			}
		%>
		</div>
	</div>

	<br>
	<div class="list-group">
		<p id="zui" class="list-group-item text-center">最近发表文章</p>
		<%
			List<Message> myMessageList=(List<Message>)session.getAttribute("myMessageList");
			if(myMessageList!=null && !myMessageList.isEmpty()){	
				for(Message mess : myMessageList){
		%>
					
					<a class="list-group-item" href="message?reqType=messageDetails&message_id=<%=mess.getMessage_id()%>&account_account=<%=mess.getMessage_account()%>"><%=mess.getMessage_title()%></a>
					
		<%
				}
			}
		%>
	</div>
	<br>
	<!-- <div class="card bg-info text-white">
		<div class="card-body">Info card</div>
	</div>
	<br>
	<div class="card bg-warning text-white">
		<div class="card-body">Warning card</div>
	</div>
	<br>
	<div class="card bg-danger text-white">
		<div class="card-body">Danger card</div>
	</div>
	<br>
	<div class="card bg-secondary text-white">
		<div class="card-body">Secondary card</div>
	</div>
	<br>
	<div class="card bg-dark text-white">
		<div class="card-body">Dark card</div>
	</div>
	<br>
	<div class="card bg-light text-dark">
		<div class="card-body">Light card</div>
	</div> -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#zui").click(function(){
				$("a[class='list-group-item']").toggle(1000);
			});		
		});
	</script>
</body>
</html>