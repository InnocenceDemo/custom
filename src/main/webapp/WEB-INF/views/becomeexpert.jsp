<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>生活服务平台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/template-web.js"></script>
    <!--实现分类的二级联动-->
    <script type="text/javascript">
        // window.onload=function () {
        $(document).ready(function () {
            $("#jia").change(function () {
                var categoryId = $("#jia").val();
                if(categoryId != '' && categoryId != null){
                    $.ajax({
                        type:"GET",
                        url:'${pageContext.request.contextPath}/genre/selectGenresByCategoryId',
                        data:{'categoryId':categoryId},
                        dataType:'json',
                        success:function(data){
                            var html = template('template1', data);
                            $('#example').html(html);
                        }
                    })
                }else{
                    $('#example').html("<option value=''>"+"----请选择----"+"</option>");
                }
            });
            $("#prov").change(function () {
               var provCode = $("#prov").val();
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
        });

    </script>

    <style>
        * {padding: 0;margin: 0;}
        ul, li {list-style: none;}

        a {text-decoration: none;}

        body {background: #eee;}

        #div3 {height: 86px;background: #fff;}
        #ul2 li{line-height: 36px;}

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

        .a2 {
            background: #f5f5f5;
            color: #333333
        }
        .a1{float: right;margin-top: 30px;margin-left: 20px;}
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

        #information{width: 130px;height: 150px;margin-left: 20px;position: relative;z-index: 99;display: none;}
        .haha{background-color: #ccc;color: #000;}
        #ul2 li{line-height: 36px;text-align: center;}
        img{border-radius:50%;}
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#ul2 li').mouseover(function(){
                $(this).addClass("haha");
            });
            $('#ul2 li').mouseout(function(){
                $(this).removeClass();
            });
        })
    </script>
</head>
<body>
<!-- 悬赏专家 -->
<div id="div3">
    <div id="title">
        <a id="a1" href="${pageContext.request.contextPath}/index/${city.code}"><b>生活服务平台</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
        <span>北京市</span>
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
<div class="model">
    <div class="model_head">
        <h3>新增技能</h3>
    </div>
    <div id="model_body">
        <form id="inputForm" action="/${login_user.id}/checkskill">
            <div class="control_group" id="control_group">
                职业分类&nbsp;&nbsp;&nbsp;&nbsp;
                <select id="jia">
                    <option value="">----请选择----</option>
                    <c:forEach items="${maps}" var="map">
                        <option value="${map.id}">${map.category}</option>
                    </c:forEach>
                </select>
                <select id="example" name="example">
                    <script type="text/html" id="template1">
                            {{ each genres as value i }}
                            <a href="#"><option value={{value.id}}>{{value.genre}}</option></a><br/>
                            {{ /each}}
                    </script>
                </select><br><br>
            </div>
            <div class="control_group">
                技能等级&nbsp;&nbsp;&nbsp;&nbsp;
                <select id="example1" name="example1">
                    <option value="0">小白</option>
                    <option value="1">新手</option>
                    <option value="2">熟练</option>
                    <option value="3">专业</option>
                </select><br><br>
            </div>
            <div class="control_group">

                审核文件&nbsp;&nbsp;&nbsp;&nbsp;
                <input type='file' name='textfield' id='textfield' placeholder="可不填" pass="true"/>
                <br><br>
            </div>
            <div class="control_group" id="control_group_last">
                发布地址&nbsp;&nbsp;&nbsp;&nbsp;
                <select id="prov">
                    <option value="">----请选择----</option>
                    <c:forEach items="${provinces}" var="provinces">
                        <option value="${provinces.code}">${provinces.name}</option>
                    </c:forEach>
                </select>
                <select id="city" name="city">
                    <script type="text/html" id="template2">
                        {{ each city as value i }}
                        <option value={{value.code}}>{{value.name}}</option>
                        {{ /each}}
                    </script>
                </select>
            </div>
            <div class="control_group" id="control_group_last">
                <input type="submit" name="" class="btn" value="完善技能信息">
            </div>
        </form>
    </div>
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