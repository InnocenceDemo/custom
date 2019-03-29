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
        body{background:url(img/login_bg.jpg) no-repeat;background-size: cover;padding-top: 100px;}
        #kuang{width: 324px;height: 350px;background: #fff;margin: 0 auto;border-radius: 3px;position: relative;}
        #q{width: 156px;height: 36px;background: #42a5f5;text-align: center;color: white;border-radius: 5%;margin: 0 auto;position: absolute;left: 90px;top: -20px;line-height: 36px;}
        #p{text-align: center;}
        #div1{width: 280px;height: 160px;margin: 0 auto;}
        .input1{width: 280px;height: 30px;margin-bottom: 20px;}
        #div2{width: 280px;height: 20px;margin: 0 auto;margin-bottom: 20px;}
        #a1{float: left;}
        #a2{float: right;}
        #div3{width: 280px;height: 50px;margin: 0 auto;}
        #reg{display: inline-block;width: 250px;height: 50px;line-height: 50px;border-radius: 3px;background: #42a5f5;color: white;text-align: center;margin-left: 15px;}
        #input1{margin-bottom: 30px;}
        #div4{padding-top: 30px;padding-bottom: 20px;}
        .a2{background: #f5f5f5;color: #333333}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
    <script>
        $(function () {
            $('#regForm').submit(function () {
                if ($('#input2').val() != $('#input1').val()) {
                    alert('您两次输入的密码不一致，请重新输入！');
                    return false;
                }
            })

        })
    </script>
</head>
<body style="height: 2000px;">

<div id="kuang">
    <div id="q"><b>中国</b></div>
    <div id="div4">
        <p id="p">账号注册</p>
    </div>
    <form id="regForm" action="${pageContext.request.contextPath}/user1/reg" method="post">
        <div id="div1">
            <input class="input1" type="text" name="name1" placeholder="请输入手机号"/><br />
            <input class="input1" id="input2" type="password" name="pwd" placeholder="请输入密码"/><br />
            <input class="input1" id="input1" type="password" placeholder="请输入重复密码"/>
        </div>
        <div id="div2">
            <a id="a1" href="">已有账号</a><a id="a2" href="">忘记密码</a>
        </div>
        <div id="div3">
            <input id="reg" type="submit" value="注册"/>
        </div>
    </form>
</div>
</body>
</html>

