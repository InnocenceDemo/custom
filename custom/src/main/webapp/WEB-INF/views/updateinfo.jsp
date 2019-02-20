<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <style>
        *{padding: 0;margin: 0;}
        ul,li{list-style: none;}
        a{text-decoration: none;}
        body{background: #eee;}
        #div3{height: 86px;background: #fff;}
        #title{width: 1300px;height: 86px;background: #fff;margin: 0 auto;}
        #a1{font-size: 24px;color: #000;line-height: 86px;}
        #r{background: white;width: 1300px;height: 730px;margin: 0 auto;}
        h3{background: #f6f6f6;padding: 5px 0px 5px 5px;}
        #r label{width: 100px;float: left;text-align: right;}
        #btn{margin-left: 100px;margin-top: 20px;width: 100px;height: 30px;font-size: 14px;}
        .bor{line-height: 50px;color: #495060;}
        .inp{width: 1000px;height: 23px;}
        #input1{width: 100px;height: 100px;}
        #div1{border-bottom: none;padding: 10px;color: #495060;}
        .inp1{width: 440px;height: 23px;}
        .span1{font-size: 12px;}
        .a2{background: #f5f5f5;color: #333333}
        #div9{width: 150px;height: 200px;float: right;}
        #img1{width: 50px;height: 50px;margin-top: 18px;margin-left: 20px;}
        #information{width: 130px;height: 150px;background: red;margin-left: 20px;position: relative;z-index: 99;display: none;}
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
                    <li><a href="${pageContext.request.contextPath}/myinformation">我的信息</a></li><br>
                    <li><a href="${pageContext.request.contextPath}/updateinfo">更新信息</a></li><br>
                    <li><a href="${pageContext.request.contextPath}/mytask">我的任务</a></li><br>
                    <li><a href="${pageContext.request.contextPath}/user1/logout">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="r">
    <h3>个人信息</h3>
        <div id="div1">
            <label>头像&nbsp;</label>&nbsp;<input id="input1" type="file"/>
        </div>
    <form action="${pageContext.request.contextPath}/user1/update" method="post">
        <div class="bor">
            <label>昵称&nbsp;</label>&nbsp; <input type="text" class="inp1" name="nickName"/>&nbsp;&nbsp;<span class="span1">需要五到十以上字符</span>
        </div>
        <div class="bor">
            <label>手机号&nbsp;</label>&nbsp; <input type="text" class="inp" value="" disabled="disabled"/>
        </div>
        <div class="bor">
            <label>姓名&nbsp;</label>&nbsp; <input type="text" class="inp1" name="realName"/>&nbsp;&nbsp;<span class="span1">请输入真实姓名</span>
        </div>
        <div class="bor">
            <label>身份证号&nbsp;</label>&nbsp; <input type="text" class="inp" name="cardNo"/>
        </div>
        <div class="bor">
            <label>性别&nbsp;</label>&nbsp; <input type="radio" name="sex" value="0"/>男
            <input type="radio" name="sex" value="1"/>女
        </div>
        <div class="bor">
            <label>出生日期&nbsp;</label>&nbsp; <input type="date" class="inp" name="birthday"/>
        </div>
        <div class="bor">
            <label>邮箱&nbsp;</label>&nbsp; <input type="email" class="inp" name="email"/>
        </div>
        <div class="bor">
            <label>居住地址&nbsp;</label>&nbsp;
            <select id="province" name="province">
                <option value="0"></option>
                <option>吉林</option>
                <option>辽宁</option>
            </select>
            <select id="city" name="city">
                <option></option>
                <option>沈阳</option>
                <option>大连</option>
                <option>齐齐哈尔</option>
                <option>牡丹江</option>
            </select>
        </div>
        <div class="bor">
            <label>详细地址&nbsp;</label>&nbsp; <textarea cols="126" rows="3" name="addressDesc"></textarea>
        </div>
        <div class="bor">
            <label>自我评价&nbsp;</label>&nbsp; <textarea cols="126" rows="3" name="descr"></textarea>
        </div>
        <input id="btn" type="submit" value="更新用户信息"/>
    </form>
</div>
<script language="JavaScript">
    var oImg1 = document.getElementById('img1');
    var oDiv2 = document.getElementById('information');

    var flag=true;
    oImg1.onclick=function () {
        if (flag) {
            oDiv2.style.display = 'block';
            flag=false;
        } else {
            oDiv2.style.display = 'none';
            flag=true;
        }
    }
</script>
</body>

</html>
