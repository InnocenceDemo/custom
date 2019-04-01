<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
        #div2{width: 1150px;height: 525px;margin: 0 auto;background: #00BFFF;position: relative;}
        #category{width: 265px;height: 100%;float: left;position: relative;}
        #category ul{width: 265px;color: #fff;position: absolute;z-index: 9;}
        #category ul ol{font-size: 26px;padding-left: 10px;padding-top: 10px;border-bottom: 1px solid #FFFFFF;}
        #category ul li{margin-left: 10px;line-height: 25px;}
        #category span{float: right;}
        #carousel{width: 883px;height: 100%;position: absolute;left: 265px;top: 115px;}
        .div1{height: 100%;background:url(${pageContext.request.contextPath}/img/loader_ico.gif) no-repeat center center;position:relative;left: 0px;top: -114px;}
        .top{width:883px;height:20px;opacity: 0.7;position:absolute;}
        .bottom{width:883px;height:20px;opacity: 0.7;position: absolute;bottom: 0px;}
        .topcharacters{width: 100px;height: 20px;position: absolute;left: 430px;color: #fff;}
        .bottomcharacters{width: 100px;height: 20px;position: absolute;left: 430px;bottom:0px;color: #fff;}
        body{background: #eeeeee;}
        #div1 ul{position: absolute;left: 390px;bottom: 24px;}
        #div1 li{width: 10px;height: 10px;background: #fff;margin-bottom: 10px;border-radius: 50%;float: left;opacity: 0.6;margin: 0 10px;}
        .active{background: #fc3;}
        .noactive{background: #fff;}
        #div4{width: 1150px;height: 400px;background: #fff;margin: 0 auto;margin-bottom: 30px;}
        #div5{width: 100%;height: 50px;background: #f6f6f6;}
        #div5 span{line-height: 50px;font-size: 18px;font-weight: bold;margin-left: 20px;}
        #div6{width: 1150px;height: 800px;margin: 0 auto;background: #fff;}
        #a2{float: right;}
        #div7{width: 100%;height: 50px;background: #f6f6f6;margin-bottom: 50px;}
        #span1{line-height: 50px;margin-left: 20px;font-weight: bold;}
        #a2{width: 105px;height: 35px;line-height: 35px;text-align: center;margin-right: 20px;margin-top: 7.5px;border-radius: 5px;background: #248aaf;color: #fff;}
        #table1{width: 1050px;margin-left: 15px;margin: 0 auto;font-size: 14px;border-spacing: 0px;}
        #tr1{background: #29b7d3;color: #fff;height: 70px;}
        th{width: 150px;border: none;}
        td{width: 150px;text-align: center;border-bottom: 1px solid #d5d5d5;line-height: 55px;}
        .img1{margin-top: 20px;}
        #a3{float: right;margin-top: 30px;}
        .a1{float: right;margin-top: 30px;margin-left: 20px;}
        #div8{width: 200px;height: 480px;position: absolute;left: 265px;background: #fff;top: 44px;z-index: 10;display: none;}
        #div8 ul{width: 200px;position:absolute;z-index: 11;color: black}
        .a2{background: #f5f5f5;color: #333333}
        .tr1{font-size: 14px;color: #495060;}
        .span1{background: #d74f2a;color: #fff;padding: 5px 5px;}
        #a4{background: #d74f2a;color: #fff;padding: 5px 5px;}
        #div9{width: 150px;height: 200px;float: right;}
        #img1{width: 50px;height: 50px;margin-top: 18px;margin-left: 20px;}
        #information{width: 130px;height: 150px;margin-left: 20px;position: relative;z-index: 99;display: none;}
        .haha{background-color: #ccc;color: #000;}
        #ul2 li{line-height: 36px;text-align: center;}
        .show_worker{width: 30%;height:129px;float: left;display: inline-block;padding: 4px;}
        #table2 td{height: 10px;}
        img{border-radius:50%;}
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/template-web.js"></script>
    <script>
        window.onload=function(){
            var arrImg=[
                '${pageContext.request.contextPath}/img/1.png',
                '${pageContext.request.contextPath}/img/2.png',
                '${pageContext.request.contextPath}/img/3.png',
                '${pageContext.request.contextPath}/img/4.png'
            ];

            function test(obj,arrImg){
                var oDiv1=document.getElementById(obj);
                var oUl=oDiv1.getElementsByTagName('ul')[0];

                for(i in arrImg){
                    oUl.innerHTML+='<li></li>';
                }

                var aLi=oDiv1.getElementsByTagName('li');
                var oLi=oDiv1.getElementsByTagName('li')[0];
                oDiv1.onmouseover=function(){
                    clearInterval(timer);
                }
                oDiv1.onmouseout=function(){
                    timer=setInterval(start,5000);
                }

                for(i in aLi){
                    aLi[i].index=i;
                    aLi[i].onclick=function(){
                        for(var i=0;i<aLi.length;i++){
                            aLi[i].style.background='#fff';
                        }
                        num=Number(this.index);
                        gh(num);
                        this.style.backgroundColor='#FF0000'
                        oLi=this;
                    }

                }

                var num=0;
                var timer=null;
                oDiv1.style.backgroundSize='cover';
                gh(num);
                aLi[num].style.backgroundColor='#FF0000';

                timer=setInterval(start,5000);
                function start(){
                    num++;
                    if(num==arrImg.length){
                        num=0;
                    }
                    gh(num);
                    for(var i=0;i<aLi.length;i++){
                        aLi[i].style.backgroundColor='#fff';
                    }
                    aLi[num].style.backgroundColor='#FF0000';
                };

                //初始化
                function gh(num){
                    oDiv1.style.backgroundImage='url('+arrImg[num]+')';
                }

            }
            test('div1',arrImg);


            var oUl1 = document.getElementById('ul1');
            var aLi = oUl1.getElementsByTagName('li');
            var oDiv1 = document.getElementById('div8');
            for(var i = 0; i < aLi.length; i++){
                aLi[i].index = i;
                //当鼠标移动到某对象范围的上方时触发的事件
                aLi[i].onmouseover=function(){
                    var categoryId = this.getElementsByTagName('input')[0].value;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/genre/selectGenresByCategoryId',
                        type: 'post',
                        data: {categoryId: categoryId},
                        dataType: 'json',
                        success: function (data) {
                            // 此处data为js对象
                            var html = template('template1', data);
                            $('#div8').html(html);
                        },
                        error: function (error) {
                            console.log(error)
                        },
                        async: true
                    })
                    oDiv1.style.display = 'block';
                }
                // 当鼠标离开某对象范围时触发的事件
                aLi[i].onmouseout=function () {
                    oDiv1.style.display = 'none';
                }
            }
            oDiv1.onmouseover=function(){
                oDiv1.style.display = 'block';
            }
            oDiv1.onmouseout=function(){
                oDiv1.style.display = 'none';
            }

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
        }

    </script>
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
<body style="height: 2000px;">
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
                <img id="img1" src="<%=request.getContextPath()%>/upload/${login_user.image}" />
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
<div id="div2">
    <div id="category">
        <div id="div8">
            <script type="text/html" id="template1">
                <ul>
                    {{ each genres as value i }}
                        <a href="${pageContext.request.contextPath}/index/${city.code}/{{value.id}}"><li>{{value.genre}}</li></a><br/>
                    {{ /each}}
                </ul>
            </script>
        </div>
        <ul id="ul1">
            <ol>分类</ol>
            <c:forEach items="${maps}" var="map">
                <li>${map.category}<input type="hidden" value="${map.id}"/><span>></span></li>
            </c:forEach>
        </ul>
    </div>
    <div id="carousel">
        <div id="div1" class="div1">
            <div class="top"></div>
            <div class="bottom"></div>
            <ul></ul>
        </div>
    </div>
</div>
<div id="div4">
    <div id="div5"><span>附近专业人士</span></div>
    <div id="quality-area ">
        <c:if test="${worker != null}">
            <c:forEach items="${worker}" var="worker">
                <div class="show_worker"  >
                    <div id="showImg" style="width: 40%;float: left;">
                        <a href="${pageContext.request.contextPath}/index/showDetail/${worker.workerId}">
                            <img style="width: 137px;height: 115px;" src="<%=request.getContextPath()%>/upload/${worker.image}">
                        </a>
                    </div>
                    <div id="showMessage" style="width: 50%;float: left;">
                        <span style="font-size: 20px;width: 120px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" >昵称：${worker.nickName}</span><br>
                        <span>名字：${worker.name}</span><br>
                        <span>职业：${worker.genre}</span><br>
                        <span>城市：${worker.cityName}</span><br>
                        <span>好评率：${worker.total_score}</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <table border="0" cellspacing="0" cellpadding="0"  width="900px" align="center">
            <tr>
                <td align="right">
                    <span>第${pageBean1.currPage}/${pageBean1.totalPage}页</span>&nbsp;&nbsp;
                    <span>总记录数 ：${pageBean1.totalCount}条&nbsp;&nbsp;每页显示：${pageBean1.pageSize}条</span>
                    <span>
                        <c:if test="${pageBean1.currPage != 1}">
                            <a href="${pageContext.request.contextPath}/index/${city.code}?currPage=1">[首页]</a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/index/${city.code}?currPage=${pageBean1.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                        </c:if>
                        <c:if test="${pageBean1.currPage != pageBean1.totalPage}">
                            <a href="${pageContext.request.contextPath}/index/${city.code}?currPage=${pageBean1.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/index/${city.code}?currPage=${pageBean1.totalPage}">[尾页]</a>&nbsp;&nbsp;
                        </c:if>
                    </span>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="div6">
    <div id="div7"><span id="span1">附近的任务</span><a id="a2" href="${pageContext.request.contextPath}/user1/createRequest">我有需求?</a></div>
    <table id="table1">
        <tr id="tr1">
            <th>悬赏发布人</th>
            <th>任务明细</th>
            <th>预算范围</th>
            <th>状态</th>
            <th>预期完成时间</th>
            <th>类别</th>
            <th>接取任务</th>
        </tr>
        <c:if test="${tasks != null}">
            <c:forEach items="${tasks}" var="task">
                <tr class="tr1">
                    <td class="td1"><img class="img1" src="img/hua.png"></td>
                    <td>${task.desc}</td>
                    <td>${task.bonus}元-${task.maxbonus}元</td>
                    <td><span class="span1">待接取</span></td>
                    <td>${task.finishTime}</td>
                    <td>${task.category}</td>
                    <td><a id="a4" href="${pageContext.request.contextPath}/user1/${task.id}/receivetask">接取任务</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    <table border="0" cellspacing="0" cellpadding="0"  width="900px" align="center">
        <tr>
            <td align="right">
                <span>第${pageBean.currPage}/${pageBean.totalPage}页</span>&nbsp;&nbsp;
                <span>总记录数 ：${pageBean.totalCount}条&nbsp;&nbsp;每页显示：${pageBean.pageSize}条</span>
                <span>
                <c:if test="${pageBean.currPage != 1}">
                    <a href="${pageContext.request.contextPath}/index/${city.code}?page=1">[首页]</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/index/${city.code}?page=${pageBean.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                </c:if>
                <c:if test="${pageBean.currPage != pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/index/${city.code}?page=${pageBean.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/index/${city.code}?page=${pageBean.totalPage}">[尾页]</a>&nbsp;&nbsp;
                </c:if>
            </span>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

