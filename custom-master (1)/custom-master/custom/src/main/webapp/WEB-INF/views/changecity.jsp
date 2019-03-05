<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        *{padding: 0;margin: 0;}
        ul,li{list-style: none;}
        a{text-decoration: none;}
        body{background: #eee;}
        #div3{height: 86px;background: #fff;}
        #title{width: 1300px;height: 86px;background: #fff;margin: 0 auto;}
        #a1{font-size: 24px;color: #000;line-height: 86px;}
        #div1{width: 1300px;height: 600px;margin: 0 auto;background: #fff;}
        #div2{width: 1280px;height: 40px;background: #f6f6f6;color: black;line-height: 40px;font-size: 14px;font-weight: bold;padding-left: 20px;}
        #a2{float: right;padding-right: 10px;}
        #div4{width: 100%;height: 3000px;background: #fff;}
        .ul1 li{float: left;margin-right: 20px;}
        .div1{height: 120px;padding-left: 20px;}
		.span1{font-size: 20px;line-height: 60px;color: #495060;}
        .a2{background: #f5f5f5;color: #333333}
        .a1{color: #495060;}
    </style>
</head>
<body style="height: 2000px;">
<div id="div3">
    <div id="title">
        <a id="a1" href="index.html"><b>生活服务平台</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
        <span>北京市</span>
        <span>登录</span>
    </div>
</div>
<div id="div1">
    <div id="div2"><span>切换城市</span></div>
    <div id="div4">
		<c:forEach items="${provinces}" var="province">
			<div class="div1">
				<span class="span1">${province.name}</span><br />
				<ul class="ul1">
					<c:forEach items="${citys}" var="city">
						<c:if test="${city.provincecode == province.code}">
							<li><a class="a1" href="${pageContext.request.contextPath}/index/${city.code}">${city.name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>
    </div>
</div>
</body>
</html>

