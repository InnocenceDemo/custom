<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>我的信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
	<style>
		*{padding: 0;margin: 0;}
        ul,li{list-style: none;}
        a{text-decoration: none;}
        body{background: #eee;}
		#div3{height: 86px;background: #fff;}
        #title{width: 1300px;height: 86px;background: #fff;margin: 0 auto;}
        #a1{font-size: 24px;color: #000;line-height: 86px;}
		.a2{background: #f5f5f5;color: #333333}
		.a1{float: right;margin-top: 30px;margin-left: 20px;}
		#img1{width: 50px;height: 50px;float: right;margin-top: 18px;margin-left: 20px;}
	</style>
</head>
<body>
	<div id="div3">
	    <div id="title">
	        <a id="a1" href="index.html"><b>生活服务平台</b></a>
			<a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
	        <span>北京市</span>
			<img id="img1" src="${pageContext.request.contextPath}/img/default.png"/>
			<a class="a1" href="${pageContext.request.contextPath}/myinformation">信息</a>
			<a class="a1" href="${pageContext.request.contextPath}/historychat">历史聊天</a>
			<a class="a1" href="${pageContext.request.contextPath}/becomeexpert">成为悬赏专家</a>
	    </div>
	</div>
	<div class="model">
		<div class ="main">
			<table  border="0">
				<tr>
					<th rowspan="5"><img src="${pageContext.request.contextPath}/img/default.png" width="130px" height="130px"></th>
					<td class="">用户名:</td>
					<td>18341415412</td>
				</tr>
				<tr>
					<td>真实姓名：</td>
					<td>张三</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td>14468556@qq.com</td>
				</tr>
				<tr>
					<td>手机号：</td>
					<td>18345655565</td>
				</tr>
				<tr>
					<td>地址： </td>
					<td> </td>
				</tr>				
			</table>
			<div class="chooseBut">
				<input type="button" name="detail" value="detail" id="datail">
				<input type="button" name="task" value="task" id="task">
			</div>
			<div class="chooseRs">				
				<div id="datail_Text">
					<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自我说明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="linkweb"></span></h5>
					<textarea cols="40" rows="6" ></textarea><br>
					<input type="button" name="button" onclick="" value="like">
				</div>
			</div>
			<div class="chooseRs1">
				<hr>
				<table>
					<tr>
						<td>任务详情</td>
						<td>状态</td>
						<td>完成时间</td>
						<td>操作</td>
					</tr>
				</table>
			</div>
		</div> 
	</div>
	<script>
		setInterval("linkweb.innerHTML=new Date().toLocaleString()",1000);
	</script>
	<script language="javascript">
		function time1(){
		now=new Date(); 定义一个时间对象
		n = now.getYear()+"-";//得到年份
		y = now.getMonth()+"-";//得到月份
		r = now.getDay();//得到天
		h = now.getHours()+":"; //得到小时
		m = now.getMinutes()+":"; //得到分钟
		s = now.getSeconds(); //得到秒
		document.all["time"].innerHTML="现在时间是："+n+y+r+"\n"+h+m+s;
		}
		setInterval('time1()',1000);
	</script>
	<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		  $("#task").click(function(){
		  	$("#datail").css({'background-color':'#eee'});
		  	$(this).css({'background-color':'#fff'});
		  	
		  	$(".chooseRs").css({display:'none'});
		    $(".chooseRs1").css({display:'block'});
		  });
		  $("#datail").click(function(){
		  	$("#task").css({'background-color':'#eee'});
		  	$(this).css({'background-color':'#fff'});

		  	$(".chooseRs1").css({display:'none'});
		    $(".chooseRs").css({display:'block'});
		  });
		});
	</script>
</body>
</html>