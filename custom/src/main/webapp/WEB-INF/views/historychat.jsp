<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        * {
            padding: 0;
            margin: 0;
        }

        ul, li {
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        body {
            background: #eee;
        }

        #div3 {
            height: 86px;
            background: #fff;
        }

        #title {
            width: 1300px;
            height: 86px;
            background: #fff;
            margin: 0 auto;
        }

        #a1 {
            font-size: 24px;
            color: #000;
            line-height: 86px;
        }

        #div1 {
            width: 1300px;
            height: 600px;
            margin: 0 auto;
            background: #fff;
        }

        #div2 {
            width: 100%;
            height: 100px;
            background: #01aee0;
            color: #fff;
            text-align: center;
            line-height: 100px;
            font-size: 18px;
            font-weight: bold;
        }

        #a2 {
            float: right;
            padding-right: 10px;
        }

        .a2 {
            background: #f5f5f5;
            color: #333333
        }

        #div9 {
            width: 150px;
            height: 200px;
            float: right;
        }

        #img1 {
            width: 50px;
            height: 50px;
            margin-top: 18px;
            margin-left: 20px;
        }

        #information {
            width: 130px;
            height: 150px;
            background: red;
            margin-left: 20px;
            position: relative;
            z-index: 99;
            display: none;
        }
    </style>
</head>
<body style="height: 2000px;">
<div id="div3">
    <div id="title">
        <a id="a1" href="index.html"><b>生活服务平台</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
        <span><c:if test="${sessionScope.city == null}">北京市</c:if><c:if test="${sessionScope.city != null}">${sessionScope.city.name}</c:if></span>
        <div id="div9">
            <img id="img1" src="${pageContext.request.contextPath}/img/default.png"/>
            <div id="information">
                <ul id="ul2">
                    <li><a href="${pageContext.request.contextPath}/myinformation">我的信息</a></li>
                    <br>
                    <li><a href="${pageContext.request.contextPath}/updateinfo">更新信息</a></li>
                    <br>
                    <li><a href="${pageContext.request.contextPath}/mytask">我的任务</a></li>
                    <br>
                    <li><a href="${pageContext.request.contextPath}/user1/logout">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="div1">
    <div id="div2"><span>聊天用户记录</span><a id="a2">关闭</a></div>
</div>
<script language="JavaScript">
    var oImg1 = document.getElementById('img1');
    var oDiv2 = document.getElementById('information');

    var flag = true;
    oImg1.onclick = function () {
        if (flag) {
            oDiv2.style.display = 'block';
            flag = false;
        } else {
            oDiv2.style.display = 'none';
            flag = true;
        }
    }
</script>
</body>
</html>

