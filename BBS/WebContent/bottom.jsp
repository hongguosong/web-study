<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,java.text.*,com.itqinxun.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="css/mycss.css">
<title>bottom</title>
<style>
</style>
</head>
<body>

	<canvas id="myCanvas" style="width:100%; height:50px;background:#f0f09e;" >
		您的浏览器不支持 HTML5 canvas 标签。
	</canvas>
	
	<div class="text-center" style="background:#f0f09e; color:black">
		遵守法律，文明发言 现在时间:<span id="time"></span> 论坛系统: 洪国松BBS
		<br>
		<div style="color: red;padding:px;">本站所有内容均为网友自行发布，不代表网站立场，如有版权纠纷请与本站管理员联系</div>
		<br>
		沪ICP备10210768号 沪公网安备31010802001143号
		<br>
	</div>
	
	<script>
		
		(function(){
			
			var c = document.getElementById("myCanvas"),
					ctx = c.getContext("2d");
			
			c.width = innerWidth;
			c.height = innerHeight;
			
			var lines = [],
					maxSpeed = 5,
					spacing = 5,
					xSpacing = 0,
					n = innerWidth / spacing,
					colors = ["#3B8686", "#79BD9A", "#A8DBA8", "#0B486B"],
					i;
			
			for (i = 0; i < n; i++){
				xSpacing += spacing;
				lines.push({
					x: xSpacing,
					y: Math.round(Math.random()*c.height),
					width: 2,
					height: Math.round(Math.random()*(innerHeight/10)),
					speed: Math.random()*maxSpeed + 1,
					color: colors[Math.floor(Math.random() * colors.length)]
				});
			}
			
			
			function draw(){
				var i;
				ctx.clearRect(0,0,c.width,c.height);
				
				for (i = 0; i < n; i++){
					ctx.fillStyle = lines[i].color;
					ctx.fillRect(lines[i].x, lines[i].y, lines[i].width, lines[i].height);
					lines[i].y += lines[i].speed;
					
					if (lines[i].y > c.height)
						lines[i].y = 0 - lines[i].height;
				}
				
				requestAnimationFrame(draw);
				
			}
			
			draw();
			
		}());
	
	</script>
	
	<script type="text/javascript">
		var left=0;
		var right=0;
		$(document).ready(function(){
			$("#openNav").click(function (){
				if(left===0){
					left=1;
				}else if(left===1){
					left=0;
				}
				if(left===1){
					$("#leftSide").hide(300);
					if(right===0){
						$("#mainSide").addClass("col-10");
					}else if(right===1){
						$("#mainSide").addClass("col-12");
					}					
				}else if(left===0){
					$("#leftSide").show(300);
					if(right===0){
						$("#mainSide").removeClass("col-10");
					}else if(right===1){
						$("#mainSide").removeClass("col-12");
					}
				}
			});
			$("#openNav2").click(function (){
				
				if(right===0){
					right=1;
				}else if(right===1){
					right=0;
				}
				if(right===1){
					$("#rightSide").hide(300);
					if(left===0){
						$("#mainSide").addClass("col-10");
					}else if(left===1){
						$("#mainSide").addClass("col-12");
					}					
				}else if(right===0){
					$("#rightSide").show(300);
					if(left===0){
						$("#mainSide").removeClass("col-10");
					}else if(left===1){
						$("#mainSide").removeClass("col-12");
					}
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		
		<!--时间-->
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
		setInterval(function(){time()},1000);
	</script>
</body>
</html>