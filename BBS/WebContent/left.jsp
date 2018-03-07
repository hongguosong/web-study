<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="java.sql.*,com.itqinxue.util.DBUtil,com.itqinxue.dao.impl.*" %>
<%
	String wall=(String)session.getAttribute("wall");
	if(wall==null){
		wall="清华天地";
	}
	
	WallDaoImpl dao=new WallDaoImpl();
	List<Wall> list=dao.searchWall();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->
<title>left</title>
</head>
<body>
	<!-- <div class="card">
		<div class="card-body"><a id="a0" href="message?reqType=searchMessaheWall&wall=清华天地">清华天地</a></div>
	</div>
	<br>
	<div class="card bg-primary text-white">
		<div class="card-body"><a id="a1" class="text-white" href="message?reqType=searchMessaheWall&wall=风雨人生">风雨人生</a></div>
	</div>
	<br>
	<div class="card bg-success text-white">
		<div class="card-body"><a id="a2" class="text-white" href="message?reqType=searchMessaheWall&wall=时代周刊">时代周刊</a></div>
	</div>
	<br>
	<div class="card bg-info text-white">
		<div class="card-body"><a id="a3" class="text-white" href="message?reqType=searchMessaheWall&wall=激情梦想">激情梦想</a></div>
	</div>
	<br>
	<div class="card bg-warning text-white">
		<div class="card-body"><a id="a4" class="text-white" href="message?reqType=searchMessaheWall&wall=广袤世界">广袤世界</a></div>
	</div>
	<br>
	<div class="card bg-danger text-white">
		<div class="card-body"><a id="a5" class="text-white" href="message?reqType=searchMessaheWall&wall=科技前沿">科技前沿</a></div>
	</div>
	<br>
	<div class="card bg-secondary text-white">
		<div class="card-body"><a id="a6" class="text-white" href="message?reqType=searchMessaheWall&wall=古今中外">古今中外</a></div>
	</div>
	<br>
	<div class="card bg-dark text-white">
		<div class="card-body"><a id="a7" class="text-white" href="message?reqType=searchMessaheWall&wall=历史名流">历史名流</a></div>
	</div>
	<br>
	<div class="card bg-light text-dark">
		<div class="card-body"><a id="a8" class="text-dark" href="message?reqType=searchMessaheWall&wall=朝代兴衰">朝代兴衰</a></div>
	</div> -->

	<div id="leftSideDiv">
	<%
		if(list!=null && list.size()>0){
			int i=0;
			String lage="";
			for(Wall wa:list){			
				if(i%7==0){
					lage="bg-primary";
				}
				else if(i%7==1){
					lage="bg-success";
				}
				else if(i%7==2){
					lage="bg-info";
				}
				else if(i%7==3){
					lage="bg-warning";
				}
				else if(i%7==4){
					lage="bg-danger";
				}
				else if(i%7==5){
					lage="bg-secondary";
				}
				else if(i%7==6){
					lage="bg-dark";
				}
				if(wa.getTitle().equals(wall)){
					out.println("<div class='card "+lage+"'>");
					out.println("<div class='card-body' style='font-size:25px;box-shadow: 5px 0px 5px #888888;'>");
					out.println("<a class='text-white' href='message?reqType=searchMessaheWall&wall="+wa.getTitle()+"'>"+wa.getTitle()+"</a>");
					out.println("</div>");
					out.println("</div>");
				}
				else{
					out.println("<div class='card "+lage+"'>");
					out.println("<div class='card-body'>");
					out.println("<a class='text-white' href='message?reqType=searchMessaheWall&wall="+wa.getTitle()+"'>"+wa.getTitle()+"</a>");
					out.println("</div>");
					out.println("</div>");
				}
				i++;
			}
		}
	%>
	</div>
	
	<script>
		$(document).ready(function(){

			<%-- var wall="<%=wall%>";
			if(wall=="清华天地"){
				$('#a0').css('font-size','30px');
				$('#a0').css('text-decoration','underline');
			}else if(wall=="风雨人生"){
				$('#a1').css('font-size','30px');
				$('#a1').css('text-decoration','underline');
			}
			else if(wall=="时代周刊"){
				$('#a2').css('font-size','30px');
				$('#a2').css('text-decoration','underline');
			}
			else if(wall=="激情梦想"){
				$('#a3').css('font-size','30px');
				$('#a3').css('text-decoration','underline');
			}
			else if(wall=="广袤世界"){
				$('#a4').css('font-size','30px');
				$('#a4').css('text-decoration','underline');
			}
			else if(wall=="科技前沿"){
				$('#a5').css('font-size','30px');
				$('#a5').css('text-decoration','underline');
			}
			else if(wall=="古今中外"){
				$('#a6').css('font-size','30px');
				$('#a6').css('text-decoration','underline');
			}
			else if(wall=="历史名流"){
				$('#a7').css('font-size','30px');
				$('#a7').css('text-decoration','underline');
			}
			else if(wall=="朝代兴衰"){
				$('#a8').css('font-size','30px');
				$('#a8').css('text-decoration','underline');
			} --%>
			
		});
	</script>

</body>
</html>