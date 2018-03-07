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
	
	WallDaoImpl dao=new WallDaoImpl();
	List<Wall> list=dao.searchWall();
%>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" charset="utf-8" src="ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor1_4_3-utf8-jsp/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor1_4_3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
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

				<form name="accountUpdateForm"  action="message?reqType=addMessage" method="post" onSubmit="return checknum()">
					<div class="form-group">
						<!-- <label for="message_account">账户:</label> -->
						<input type="hidden" class="form-control" name="message_account" id="message_account" value="<%=account.getAccount_account()%>" readonly>
					</div>
					<div class="form-group">
						<label for="account_name">姓名:</label>
						<input type="text" class="form-control" name="account_name" id="account_name" value="<%=account.getAccount_name()%>" readonly readonly>
					</div>
					<div class="form-group">
					<label for="wall">文章板块:</label>
					<input id="wallid" name="wallid" type="hidden">
					<select class="form-control" name="wall" id="wall">
						<!-- <option>清华天地</option>
						<option>风雨人生</option>
						<option>时代周刊</option>
						<option>激情梦想</option>
						<option>广袤世界</option>
						<option>科技前沿</option>
						<option>古今中外</option>
						<option>历史名流</option>
						<option>朝代兴衰</option> -->
						<%
							if(list!=null && list.size()>0){
								for(Wall w:list){
									out.print("<option>"+w.getTitle()+"</option>");
								}
							}
						%>
					</select>
				</div>
					<div class="form-group">
						<label for="message_title">标题:</label>
						<input type="text" class="form-control" name="message_title" id="message_title">
					</div>
					<div class="message_content">
						<label for="message_content">内容:</label>
						<!-- <textarea class="form-control" rows="8" name="message_content" id="message_content"></textarea> -->
						<script id="editor" type="text/plain" style="width:100%; height:400px;"></script>
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
			var title=document.getElementById("message");
			if(title !=null){
				title.className+=" active";
			}		
		}
	</script>
	
	<script type="text/javascript">
	    //实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');
	</script>
	
	<script type="text/javascript">
	function checknum(){
		var f=document.getElementById("wall").selectedIndex;
		document.getElementById("wallid").value=f;
		var message_title=document.getElementById("message_title");
		if(message_title.value == ""){			
			window.alert("请输入标题.");	
			return false;	
		}
	}
	</script>
</body>
</html>