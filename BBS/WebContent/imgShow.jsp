<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<%@ page import="java.sql.*,com.itqinxue.util.DBUtil,com.itqinxue.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cmn-Hans">
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<title>Hydrogen &mdash; A free HTML5 Template </title>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

    <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />


	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css" />
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css" />
	<!-- Salvattore -->
	<link rel="stylesheet" href="css/salvattore.css" />
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/stylePBL.css" />
	<!-- Modernizr JS -->
	<script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->


	
</head>
<body>
	<div class="container-fluid">

		<jsp:include page="top.jsp"></jsp:include>
		<div class="row" style="margin-top:0px;margin-bottom:100px;">
			<div id="leftSide" class="col-lg-2 col-sm-4">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div id="mainSide" class="col-lg-8 col-sm-8">
				
				
				
				<div id="fh5co-main">
					<div class="container">
						<div class="row">
        					<div id="fh5co-board" data-columns>
        						
        						<%
        						ImageDaoImpl dao=new ImageDaoImpl();
        						List<Image> list=dao.searchImageAll();
        						if(list != null && list.size()>0){
        							for(Image img : list){
        						%>
        								<div class="item">
							        		<div class="animate-box">
								        		<a href="<%=img.getImage_src()%>" class="image-popup fh5co-board-img"><img src="<%=img.getImage_src()%>" alt="Free HTML5 Bootstrap template"></a>
								        		<div class="fh5co-desc"><%=img.getImage_desc()%></div>
							        		</div>
							        	</div>
        						<%
        							}
        						}
        						%>
        						      	
        					</div>
						</div>
					</div>
				</div>
				
				
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

	<!-- jQuery -->
	<!-- <script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script> -->
	<script type="text/javascript"  src="dist/js/jquery-3.3.1.min.js"></script>
	<!-- jQuery Easing -->
	<script type="text/javascript"  src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<!-- <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script> -->
	<script type="text/javascript"  src="dist/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script type="text/javascript"  src="js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script type="text/javascript"  src="js/jquery.magnific-popup.min.js"></script>
	<!-- Salvattore -->
	<script type="text/javascript"  src="js/salvattore.min.js"></script>
	<!-- Main JS -->
	<script type="text/javascript"  src="js/main.js"></script>
	
</body>
</html>