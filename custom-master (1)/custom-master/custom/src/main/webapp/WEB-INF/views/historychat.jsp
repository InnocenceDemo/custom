<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        #div2{width: 100%;height: 100px;background: #01aee0;color: #fff;text-align: center;line-height: 100px;font-size: 18px;font-weight: bold;}
        #a2{float: right;padding-right: 10px;}
        .a2{background: #f5f5f5;color: #333333}
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
    <div id="div2"><span>聊天用户记录</span><a id="a2">关闭</a></div>
</div>
</body>
</html>

