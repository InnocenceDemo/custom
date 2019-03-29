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
        #a3{float: right;margin-top: 30px;}
        .a2{background: #f5f5f5;color: #333333}
        .a1{float: right;margin-top: 30px;margin-left: 20px;}
        #div9{width: 150px;height: 200px;float: right;}
        #img1{width: 50px;height: 50px;margin-top: 18px;margin-left: 20px;}
        #information{width: 130px;height: 150px;background: red;margin-left: 20px;position: relative;z-index: 99;display: none;}
        #ul2 li{line-height: 36px;}
    </style>

</head>
<body>
<div id="div3">
    <div id="title">
        <a id="a1" href="${pageContext.request.contextPath}/index/${city.code}"><b>生活服务平台</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
        <span><c:if test="${city == null}">北京市</c:if><c:if test="${city != null}">${city.name}</c:if></span>
        <c:if test="${login_user==null}">
            <a id="a3" href="/login">登录</a>
        </c:if>
        <c:if test="${login_user != null}">
            <div id="div9">
                <img id="img1" src="${pageContext.request.contextPath}/img/default.png"/>
                <div id="information">
                    <ul id="ul2">
                        <li><a href="${pageContext.request.contextPath}/${login_user.id}/myinformation">我的信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/${login_user.id}/updateinfo">更新信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/${login_user.id}/mytask">我的任务</a></li>
                        <li><a href="${pageContext.request.contextPath}/user1/logout">退出</a></li>
                    </ul>
                </div>
            </div>
            <a class="a1" href="${pageContext.request.contextPath}/historychat">历史聊天</a>
            <a class="a1" href="${pageContext.request.contextPath}/becomeexpert">成为悬赏专家</a>
        </c:if>
    </div>
</div>
<div class="model">
    <div class ="main">
        <table  border="0">
            <tr>
                <td rowspan="6"><img src="${pageContext.request.contextPath}/img/${userMessage.image}" width="130px" height="130px"></td>
                <td class="">用户名： ${userMessage.nickName}</td>
            </tr>
            <tr>
                <td>真实姓名： ${userMessage.realName}</td>
            </tr>
            <tr>
                <td>发送消息</td>
            </tr>
            <tr>
                <td>Email： ${userMessage.email}</td>
            </tr>
            <tr>
                <td>手机号：${userMessage.telephone}</td>
            </tr>
            <tr>
                <td>地址：${userMessage.addressDesc}</td>
            </tr>
        </table>
        <div class="chooseBut">
            <input type="button" name="detail" value="detail" id="datail">
            <input type="button" name="task" value="task" id="task">
        </div>
        <div class="chooseRs">
            <div id="datail_Text">
                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自我说明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%--<span id="linkweb"></span>--%></h5>
                <textarea cols="40" rows="6" ><%--${userMessage.descr}--%></textarea><br>
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
                <c:if test="${taskList==[null]}">
                    <tr><td colspan="4">当前无任务记录</td></tr>
                </c:if>
                <c:if test="${taskList!=[null]}">
                    <c:forEach items="${taskList}" var="taskList">
                        <tr>
                            <td>${taskList.desc}</td>
                            <c:if test="${taskList.status==0}"><td>待接取</td></c:if>
                            <c:if test="${taskList.status==1}"><td>待完成</td></c:if>
                            <c:if test="${taskList.status==2}"><td>已完成</td></c:if>
                            <c:if test="${taskList.status==null}"><td>状态未知</td></c:if>
                            <td>${taskList.finishTime}</td>
                            <td>无法操作</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
</div>
<script language="javascript">

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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
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