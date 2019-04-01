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
        #input1{opacity:0; filter:alpha(opacity=0); height: 100px; width: 100px; position: absolute; top: 0; left: 0; z-index: 9;}
        #div1{border-bottom: none;padding: 10px;color: #495060;width: 100%;height: 100px;}
        .inp1{width: 440px;height: 23px;}
        .span1{font-size: 12px;}
        .a2{background: #f5f5f5;color: #333333}
        #div9{width: 150px;height: 200px;float: right;}
        #img1{width: 50px;height: 50px;margin-top: 18px;margin-left: 20px;}
        #information{width: 130px;height: 150px;margin-left: 20px;position: relative;z-index: 99;display: none;}
        .haha{background-color: #ccc;color: #000;}
        #ul2 li{line-height: 36px;text-align: center;}
        .a1{float: right;margin-top: 30px;margin-left: 20px;}
        img{border-radius:50%;}
    </style>

    <script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/template-web.js"></script>
    <!--实现分类的二级联动-->
    <script type="text/javascript">
        // window.onload=function () {
        $(document).ready(function () {
            $("#province").change(function () {
                var provCode = $("#province").val();
                if(provCode != '' && provCode != null){
                    $.ajax({
                        type:"GET",
                        url:'${pageContext.request.contextPath}/getcity',
                        data:{'provCode':provCode},
                        dataType:'json',
                        success:function(data){
                            var html = template('template2', data);
                            $('#city').html(html);
                        }
                    })
                }else{
                    $('#city').html("<option value=''>"+"----请选择----"+"</option>");
                }
            });
            $('#ul2 li').mouseover(function(){
                $(this).addClass("haha");
            });
            $('#ul2 li').mouseout(function(){
                $(this).removeClass();
            });
        });

    </script>
</head>

<body style="height: 2000px;">
<div id="div3">
    <div id="title">
        <a id="a1" href="${pageContext.request.contextPath}/index/${city.code}"><b>生活服务平台</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
        <span><c:if test="${sessionScope.city == null}">北京市</c:if><c:if test="${sessionScope.city != null}">${sessionScope.city.name}</c:if></span>
        <div id="div9">
            <img id="img1" src="<%=request.getContextPath()%>/upload/${login_user.image}"/>
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
    </div>
</div>
<div id="r">
    <h3>个人信息</h3>
    <form action="${pageContext.request.contextPath}/user1/${login_user.id}/update" method="post" enctype="multipart/form-data">
        <div id="div1">
            <div style="float: left;">
                <label >头像&nbsp;</label>&nbsp;
            </div>
            <div style="width: 60%;display: block;position: relative;float: left;">
                <input type="file" style="" onchange="handleFiles(this,'icon')" id="input1" name="input1">
                <img src="<%=request.getContextPath()%>/upload/${login_user.image}" style="height: 100px; width: 100px;" id="icon" name="image">
            </div>
        </div>
        <div class="bor">
            <label>昵称&nbsp;</label>&nbsp; <input type="text" class="inp1" name="nickName" value="${showMyinformation.nickName}"/>&nbsp;&nbsp;<span class="span1">需要五到十以上字符</span>
        </div>
        <div class="bor">
            <label>手机号&nbsp;</label>&nbsp; <input type="text" class="inp" value="${showMyinformation.telephone}" disabled="disabled"/>
        </div>
        <div class="bor">
            <label>姓名&nbsp;</label>&nbsp; <input type="text" class="inp1" name="realName" value="${showMyinformation.realName}"/>&nbsp;&nbsp;<span class="span1">请输入真实姓名</span>
        </div>
        <div class="bor">
            <label>身份证号&nbsp;</label>&nbsp; <input type="text" class="inp" name="cardNo" value="${showMyinformation.cardNo}"/>
        </div>
        <div class="bor">
            <label>性别&nbsp;</label>&nbsp;
            <c:if test="${showMyinformation.sex==0}">
                <input type="radio" name="sex" value="0" checked/>男
                <input type="radio" name="sex" value="1"/>女
            </c:if>
            <c:if test="${showMyinformation.sex==1}">
                <input type="radio" name="sex" value="0" />男
                <input type="radio" name="sex" value="1" checked/>女
            </c:if>
        </div>
        <div class="bor">
            <label>出生日期&nbsp;</label>&nbsp; <input type="date" class="inp" name="birthday" value="${showMyinformation.birthday}"/>
        </div>
        <div class="bor">
            <label>邮箱&nbsp;</label>&nbsp; <input type="email" class="inp" name="email" value="${showMyinformation.email}"/>
        </div>
        <div class="bor">
            <label>居住地址&nbsp;</label>&nbsp;
            <select id="province" name="province">
                <option value="">----请选择----</option>
                <c:forEach items="${provinces}" var="provinces">
                    <option value="${provinces.code}" >${provinces.name}</option>
                </c:forEach>
            </select>
            <select id="city" name="city" style="width: 100px;">
                <script type="text/html" id="template2">
                    {{ each city as value i }}
                    <option value={{value.code}} name="city">{{value.name}}</option>
                    {{ /each}}
                </script>
            </select>
        </div>
        <div class="bor">
            <label>详细地址&nbsp;</label>&nbsp; <textarea cols="126" rows="3" name="addressDesc" >${showMyinformation.addressDesc}</textarea>
        </div>
        <div class="bor">
            <label>自我评价&nbsp;</label>&nbsp; <textarea cols="126" rows="3" name="descr">${showMyinformation.descr}</textarea>
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
<script>
    function handleFiles(obj,id) {
        file = document.getElementById("icon");
        var files = obj.files;
        img = new Image();
        if(window.URL){
            //File API
            img.src = window.URL.createObjectURL(files[0]); //创建一个object URL，并不是你的本地路径
            img.onload = function(e) {
                window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
            }
        }
        file.src=img.src;
        //上传文件
        var fd = new FormData(),//实例化一个表单
            xhr = new XMLHttpRequest();
        fd.append('headimg', files[0]);//追加图片元素
        xhr.open('post', 'user.php?act=act_edit_img');//请求方式，请求地址
        xhr.send(fd);
    }
</script>

</body>

</html>
