<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>我发布的任务</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/paging.css">
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
	</style>
</head>
<body>
	<div id="div3">
	    <div id="title">
	        <a id="a1" href="index.html"><b>生活服务平台</b></a>
			<a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
	        <span>北京市</span>
	        <span>登录</span>
	    </div>
	</div>
	<div class="model">
		<div class="model_head">
			<h3>我发布的任务</h3>
		</div>
		<div class="model_option">
			&nbsp;&nbsp;&nbsp;&nbsp;筛选：&nbsp;&nbsp;
			<!-- 从数据库导入职位 -->
			<select>
				<option>All</option>
				<option>外卖</option>
				<option>月嫂</option>
				<option>小时工</option>
			</select>
		</div>
		<div class="model_body">
			<table>
				<tr class="th">
					<th>悬赏发布人</th>
					<th>任务明细</th>
					<th>状态</th>
					<th>预期完成时间</th>
					<th>类别</th>
				</tr>
			</table>
		</div>
		<!-- 跳转页码 -->
		<div id="pageToolbar"></div>
		<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
		<script type="text/javascript" src="js/query.js"></script>
		<script type="text/javascript" src="js/paging.js"></script>
		<script>
		$('#pageTool').Paging({pagesize:10,count:100,callback:function(page,size,count){
			console.log(arguments)
			alert('当前第 ' +page +'页,每页 '+size+'条,总页数：'+count+'页')
			}});
		// count设置信息数量，pagesize为每页显示信息数量。下面这个为100条信息，每页10条信息，共10页
		$('#pageToolbar').Paging({pagesize:10,count:100,toolbar:true});
		</script>
	</div>
</body>
</html>