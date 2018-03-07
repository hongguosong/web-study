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
<%
   Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" href="dist/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="dist/css/bootstrap-reboot.min.css">

<link rel="stylesheet" href="css/reset.min.css">
<link rel="stylesheet" href="css/style.css">


</head>
<body>
	<div class="">
		<div class="row">
			<jsp:include page="indexTop.html"></jsp:include>
		</div>
		
		<div class="row" style="background-image:url('image/mountain.jpg');">
		

				
				<%-- <div class="row text-right ">
					<nav class="navbar navbar-expand-sm">
						<%
							if(account.getAccount_account()==1){
						%>
						<ul class="navbar-nav">
		
							<li id="account" class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
									账号管理
								</a>
								<div class="dropdown-menu bg-dark">
									<a class="dropdown-item text-white bg-dark" href="account?reqType=searchAccountAll">查询普通账号</a>
									<a class="dropdown-item text-white bg-dark" href="account?reqType=searchAdminAll">查询管理账号</a>
								</div>
							</li>
		
							<li id="message" class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
									文章管理
								</a>
								<div class="dropdown-menu bg-dark">
									<a class="dropdown-item text-white bg-dark" href="message?reqType=searchMessageAll">查询所有文章</a>
								</div>
							</li>
							<li id="revert" class="nav-item">
								<a class="nav-link" href="revert?reqType=searchRevertALL">回帖管理</a>
							</li>
							<li id="revert" class="nav-item">
								<a class="nav-link" href="searchWall.jsp">板块管理</a>
							</li>
						</ul>
						<%
							}
						%>
					</nav>
					
					<div class="btn-group" style="">
						<button type="button" class="btn btn-link" data-toggle="modal" data-target="#loginModal">登录</button>
						<button type="button" class="btn btn-link" data-toggle="modal" data-target="#registModal">新用户注册</button>
					</div>
				</div> --%>
				
				<div class="mx-auto">
					<ul class="hList">
					  <li>
					    <div class="menu" style="text-decoration: none">
					      <h2 class="menu-title">账号管理</h2>
					      <ul class="menu-dropdown">
					        <li><a href="account?reqType=searchAccountAll" style="text-decoration: none;color:#000000">查询普通账号</a></li>
					        <li><a href="account?reqType=searchAdminAll" style="text-decoration: none;color:#000000">查询管理账号</a></li>
					        <li>horse</li>
					        <li>cow</li>
					        <li>pig</li>
					      </ul>
					    </div>
					  </li>
					  <li>
					    <div class="menu" style="text-decoration: none">
					      <h2 class="menu-title menu-title_2nd">文章管理</h2>
					      <ul class="menu-dropdown">
					        <li><a href="message?reqType=searchMessageAll" style="text-decoration: none;color:#000000">查询文章</a></li>
					        <li><a href="revert?reqType=searchRevertALL" style="text-decoration: none;color:#000000">查询回帖</a></li>
					        <li>Andy</li>
					      </ul>
					    </div>
					  </li>
					  <li>
					    <div class="menu" style="text-decoration: none">
					      <h2 class="menu-title menu-title_3rd">板块管理</h2>
					      <ul class="menu-dropdown">
					        <li><a href="searchWall.jsp" style="text-decoration: none;color:#000000">查询板块</a></li>
					        <li><a href="imgShow.jsp" style="text-decoration: none;color:#000000">图片墙</a></li>
					        <li>Honda CB125</li>
					        <li>space</li>
					        <li>black matter</li>
					        <li>apple</li>
					        <li>philodendron</li>
					        <li>liver</li>
					        <li>brass</li>
					      </ul>
					    </div>
					  </li>
					  <li>
					    <div class="menu" style="text-decoration: none">
					      <h2 class="menu-title menu-title_4th">登录管理</h2>
					      <ul class="menu-dropdown">
					        <!-- <li><a data-toggle="modal" data-target="#loginModal">登录</a></li>
					        <li><a data-toggle="modal" data-target="#registModal">注册</a></li> -->
					        <li><a href="login.html" style="text-decoration: none;color:#000000">登录</a></li>
					        <li><a href="register.html" style="text-decoration: none;color:#000000">注册</a></li>
					        <li>Spirited Away</li>
					        <li>Interstellar</li>
					      </ul>
					    </div>
					  </li>
					</ul>
				</div>
			
<!-- 			<div class="col-6 text-white justify-content-start" style="margin: auto;">				
					<h4>欢迎使用BBS管理系统 </h4>								
				<form class="form-inline" action="message?reqType=searchMessageKey" method="post">
					<input id="searchMessageKey" class="form-control col-10" name="key" type="text" placeholder="Search">
					<button class="btn btn-success col-2" type="submit">Search</button>
				</form>
						
			</div> -->


			
		</div>
		
		<div class="row" style="margin-top: 20px;">
			<div class="col-12" style="width: 100%; height:50px">
				<div class="row">
					<div class="col-12">
<!-- 						<form class="form-inline" action="message?reqType=searchMessageKey" method="post">
							<input id="searchMessageKey" class="form-control col-10" name="key" type="text" placeholder="Search">
							<button class="btn btn-success col-2" type="submit">Search</button>
						</form> -->
						<form class="" action="message?reqType=searchMessageKey" method="post">
								<span id="openNav" style="font-size:15px;cursor:pointer;margin-right:20px">&#9776;</span>
								<a href="message?reqType=searchMessageAll2">最新文章</a>
								<input id="searchMessageKey" class="" name="key" type="text" placeholder="Search" style="margin-left:10px;">
								<button class="btn btn-link" type="submit" style="font-size:15px;cursor:pointer;padding:0px;margin:0px;">查询</button>
								<span id="openNav2" style="font-size:15px;cursor:pointer;float:right">&#9776;</span>
						</form>
					</div>
				</div>
				
				<hr style="margin-top:5px;"/>
				
			</div>
		</div>
		

	</div>
	
	
	<!-- 模态框 -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content">

<!-- 				模态框头部
				<div class="modal-header">
					<h4 class="modal-title">模态框头部</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div> -->

				<!-- 模态框主体 -->
				<div class="modal-body">
					<div class="card" style="width:100%;">
						<div class="text-center" style="width:100%; height:150px">
							<button type="button" class="close" data-dismiss="modal" style="position:absolute;top:0px;right:0px;padding:10px;">&times;</button>
							<img class="card-img-top rounded-circle" src="http://static.runoob.com/images/mix/img_avatar.png" alt="Card image" 
							style="width:150px;height:150px;">
						</div>

						<div class="card-body">
							<form method="post" action="account?reqType=LOGIN_ACCOUNT_INFO">
								<div class="form-group">
									<label for="name">Name:</label>
									<input type="text" class="form-control" name="account_name" id="account_name" placeholder="Enter name">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label>
									<input type="password" class="form-control" name="account_pass" id="account_pass" placeholder="Enter password">
								</div>
								<div class="form-check">
									<label class="form-check-label">
										<input class="form-check-input" type="checkbox"> Remember me			
									</label>
								</div>
								<hr>
								<button type="submit" class="btn btn-primary" style="width: 100%;">Submit</button>
								<br/>
								<button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100%; margin-top:10px;">Cancel</button>
								<hr>
								<p class="text-right">no account? <a id="showRegistModal" href="#">register</a></p>
							</form>
						</div>
					</div>
				</div>

				<!-- 				模态框底部
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
				</div> -->

			</div>
		</div>
	</div>
	
	<!-- 模态框 -->
	<div class="modal fade" id="registModal">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content">

				<div class="modal-body">
					<div class="card" style="width:100%;">


						<div class="card-body">
							<form name="registForm" onsubmit="return validateForm()" action="account?reqType=ADD_ACCOUNT_INFO" method="post">
								<div class="form-group">
									<label for="account_name_regist">Name:</label>
									<input type="text" class="form-control" name="account_name" id="account_name_regist" placeholder="Enter name">
								</div>
								<div class="form-group">
									<label for="account_pass_regist">Password:</label>
									<input type="password" class="form-control" name="account_pass" id="account_pass_regist" placeholder="Enter password">
								</div>
								<div class="form-group">
									<label for="account_pass_repeat_regist">Password:</label>
									<input type="password" class="form-control" id="account_pass_repeat_regist" placeholder="Repeat password">
								</div>
								<div class="form-check">
									<label class="form-check-label">
										<input class="form-check-input" type="checkbox"> Remember me
									</label>
								</div>
								<hr>
								<div class="row">
									<div class="col-6">
										<button type="submit" class="btn btn-primary" style="width: 100%;">Singup</button>
									</div>
									<div class="col-6">
										<button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100%;">Cancel</button>
									</div>
								</div>
								
								
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script type="text/javascript">

		<!--表单验证-->
		function validateForm(){
			var x=document.forms["registForm"]["account_name_regist"].value;
			var y=document.forms["registForm"]["account_pass_regist"].value;
			var z=document.forms["registForm"]["account_pass_repeat_regist"].value;
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
			if(y!=z){
				alert("两次密码不一致");
				return false;
			}		
		}
		
		/* <!--时间-->
		function format(num){
			if(num <10){
				return "0"+num;
			}else{
				return ""+num;
			}
		}
		function time(){
			var d=new Date();
			var year=d.getFullYear();
			var month=d.getMonth()+1;
			var day=d.getDate();
			var hour=d.getHours();
			var minutes=d.getMinutes();
			var seconds=d.getSeconds();
			var t=year+"-"+format(month)+"-"+format(day)+" "+format(hour)+":"+format(minutes)+":"+format(seconds);
			var timeLabel= document.getElementById("time");
			if(timeLabel){
				timeLabel.innerHTML=t;
			}
		}
		setInterval(function(){time()},1000); */
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#showRegistModal').click(function(){
				
				$('#loginModal').modal('hide');  
				$('#registModal').modal('show');
			});
		});
	</script>
</body>
</html>