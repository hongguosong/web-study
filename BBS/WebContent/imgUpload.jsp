<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="com.itqinxue.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width:width-device,initial-scale:1">

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

				 <form id="imgUploadForm" action="upLoadImg" method="post" style="width: 100%" enctype="multipart/form-data">
				 	<div class="form-group">
				 		<label for="upLoadImg">图片选择:</label>
				 		<input type="file" name="upLoadImg" id="upLoadImg" onchange="showImg()" accept="image/*">
				 		<br>
				 		<img id="imgContent" alt="no select" src="" style="width:200px; heigth:100px;">
				 	</div>
					<div class="form-group" style="width: 100%">
				 		<label for="upLoadDesc">图片描述:</label>
				 		<br>
				 		<br>
				 		<textarea rows="5" name="upLoadDesc" id="upLoadDesc" style="width: 100%"></textarea>
				 	</div>
				 	<div class="row" style="margin-top: 20px;">
						<div class="col-6">
							<button type="submit" class="btn btn-primary" style="width: 100%;">上传</button>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-secondary" onclick="javascript:history.back(-1);" style="width: 100%;">取消</button>
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
		function showImg(){
		/*  var io=document.getElementById("imgHere");
			io.style.src=source.value;
 			$(document).ready( function(){
				$("#imgHere").css("src",);
			}); */
			//获取文件  
		    var file = $("#imgUploadForm").find("input")[0].files[0];  
		  
		    //创建读取文件的对象  
		    var reader = new FileReader();  
		  
		    //创建文件读取相关的变量  
		    var imgFile;  
		  
		    //为文件读取成功设置事件  
		    reader.onload=function(e) {  
/* 		        alert('文件读取完成');  */ 
		        imgFile = e.target.result;  
		        console.log(imgFile);  
		        $("#imgContent").attr('src', imgFile);  
		    };  
		  
		    //正式读取文件  
		    reader.readAsDataURL(file);  
		}
	</script>
</body>
</html>