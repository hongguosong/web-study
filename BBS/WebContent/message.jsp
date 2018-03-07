<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Account account=(Account)session.getAttribute("account");
	if(account==null){
		account=new Account();
	}
	Message message=(Message)request.getAttribute("message");
	if(message==null){
		message=new Message();
	}
	
	List<Revert> revertList=(List<Revert>)request.getAttribute("revertList");
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
				
				<%-- <h3 class="center-block"><%=message.getMessage_title()%></h3> --%>
				
				<%
					if(message.getMessage_date()!=null){
				%>
					<p>
						<%=message.getMessage_date().toLocaleString()%>
					</p>
				<%
					}
				%>
					
				
				<div class="text-right">
					<span>------<%=message.getMessage_account_name()%></span>
				</div>
				<div style="overflow:auto;"><%=message.getMessage_content()%></div>
				
				<%
				if(revertList !=null && !revertList.isEmpty()){
					int i=0;
				%>
					<h5>评论列表</h5>
					<hr/>
				<%
					for(Revert rev : revertList){
						i++;
				%>
						<div>
							<h5><%=i%>楼 <%=rev.getRevert_date().toLocaleString()%> <%=rev.getRevert_account_name()%></h5>
							<p><%=rev.getRevert_content()%></p>
							<hr/>
							<br/>
						</div>
				<%	
					}
				}
				%>
				
				
				<hr>
				<div class="text-right">
					<button class="btn btn-primary btn-block" onclick="showEditer()">发表评论</button>
					<a class="btn btn-primary btn-block" href="message?reqType=messageDetails&message_id=<%=message.getMessage_id()%>&account_account=<%=account.getAccount_account()%>">刷新评论</a>
				</div>
				
				<form style="display: none;" id="addRevertForm" name="addRevertForm"  action="revert?reqType=addRevert" method="post">
					
					<input type="hidden" name="revert_account" id="revert_account" value="<%=account.getAccount_account()%>" />
					<input type="hidden" name="revert_messageid" id="revert_messageid" value="<%=message.getMessage_id()%>" />
					<div class="message_content">
						<label for="revert_content">回复:</label>
						<textarea class="form-control" rows="8" name="revert_content" id="revert_content"></textarea>
					</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-6">
							<button type="submit" class="btn btn-primary" style="width: 100%;">确定</button>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100%;">取消</button>
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
			var title=document.getElementById("message");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
	
	<script type="text/javascript">
		function showEditer(){

			var editer=document.getElementById("addRevertForm");
			if(<%=account.getAccount_account()%>!=0){
				editer.style.display="block";
			}else{

				/* window.alert("清先登录"); */
				/* var login=document.getElementById("loginModal"); */
				$('#loginModal').modal('show');  
				
			}
		}
	</script>
</body>
</html>