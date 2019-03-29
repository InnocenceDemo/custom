<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 21:36
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
        body{background:url(${pageContext.request.contextPath}/img/login_bg.jpg) no-repeat;background-size: cover;}
        a{text-decoration: none;}
        #kuang{width: 324px;height: 310px;position: absolute;right: 200px;top: 100px;background: white;border-radius: 3px;}
        #log{width: 250px;line-height: 50px;position:absolute;bottom:30px;left: 40px;border-radius: 3px;background: #42a5f5;font-size: border;color: white;text-align: center;}
        .t1{width: 280px;height: 30px;margin-top: 80px;margin-left: 20px;}
        .t2{width: 280px;height: 30px;margin-top: 30px;margin-left: 20px;}
        #a1{position: absolute;bottom: 100px;left: 20px;margin-top: 5000px;}
        #a2{position: absolute;bottom: 100px;right: 20px;}
        #q{width: 156px;height: 36px;background: #42a5f5;position: absolute;right: 90px;top:-20px ;text-align: center;color: white;border-radius: 5%;line-height: 36px;}
        #p{position: absolute;left: 116px;top: 30px;}
        .a2{background: #f5f5f5;color: #333333}
    </style>
</head>
<body style="height: 2000px;">

<div id="kuang">
    <div id="q"><b>中国</b></div>
    <p id="p">账号登录</p>
    <form action="${pageContext.request.contextPath}/user1/login" method="post">
        <input class="t1" type="text" name="name1"  placeholder="请输入手机号"/>
        <input class="t2" type="password" name="pwd" placeholder="请输人密码"/><br />
        <a id="a1" href="/reg">账号注册</a><a id="a2" href="">忘记密码</a>
        <input id="log" type="submit" value="登录"/>
    </form>
</div>
</body>
</html>

