<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="com.itqinxue.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)session.getAttribute("account");
	if(account==null){
		account=new Account();
	}
	
	MessageDaoImpl mDao = new MessageDaoImpl();			
	List<Message> list2=mDao.searchMessageALL2(12);
	request.setAttribute("newMessageList", list2);
	
	session.setAttribute("wall", "");
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width:width-device,initial-scale:1">
<style>
	.thumbnail 
	{
		float:left;
		width:110px;
		height:90px;
		margin:8px;
	}
</style>
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

				<% 
					List<Message> newMessageList=(List<Message>)request.getAttribute("newMessageList");
					if(newMessageList!=null && !newMessageList.isEmpty()){	
						for(Message mess : newMessageList){
				%>
							
							<a class="text-dark mycon" href="message?reqType=messageDetails&message_id=<%=mess.getMessage_id()%>&account_account=<%=mess.getMessage_account()%>">
								<div onmouseover="showShandow(this)" onmouseout="lostShandow(this)" class="card img-fluid thumbnail" style="width:270px">
									<img class="card-img-top" src="image/mountain.jpg" alt="Card image" style="width:100%">
									<div class="card-img-overlay">
										<div class="" style="overflow: hidden;width:200px;height:100px">
											<%=mess.getMessage_title()%>
										</div>				
									</div>
									<div class="card-footer">
										<div style="overflow: hidden;width:270px;height:50px;">										
											<%=mess.getMessage_account_name() %>
											<br>
											<%=mess.getMessage_date().toLocaleString() %>
										</div>
									</div>
								</div>
							</a>
							
				<%
						}
					}
				%>
				 
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
/* 		$(document).ready(function(){

			$('#cardMessage').hover(function(){
				$('#cardMessage').css('box-shadow','10px 10px 5px #888888');
			})
		}); */

		function showShandow(me){
			me.style.boxShadow='10px 10px 5px #888888';
		}
		function lostShandow(me){
			me.style.boxShadow='0px 0px 0px #888888';
		}
	</script>
	
	<script type="text/javascript">

		$(document).ready(function(){
			$("#mycon").fadeIn(3000);
		});
		
	</script>
</body>
</html>