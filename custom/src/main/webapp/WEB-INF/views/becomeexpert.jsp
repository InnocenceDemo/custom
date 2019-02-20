<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>生活服务平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
	<script type="text/javascript">
        //这个 请选择 选项 加的很好。
        var jiaArr = ["请选择","外卖", "生活服务", "便利店","打车/运输","房产"];
        var exampleArr = [
                ["请选择"],
                ["外卖"],
                ["月嫂", "金小时工", "保姆","干洗"],
                ["便利店", "大型超市"],
                ["打车","搬家","快递","维修"],
                ["旅拍"]
        ];
        window.onload = function () {
             
            var selJia = document.getElementById("jia");
            //申请空间
            selJia.length = jiaArr.length;
            //添加元素
            for (var i = 0; i < jiaArr.length; i++) {
                selJia.options[i].text = jiaArr[i];
                selJia.options[i].value = jiaArr[i];
            }
        }
 
        function ChangeExampleSelect(index)
        {
            var selExa = document.getElementById("example");
 
            selExa.length = exampleArr[index].length;
 
            for (var i = 0; i < exampleArr[index].length; i++)
            {
                selExa.options[i].text = exampleArr[index][i];
                selExa.options[i].value = exampleArr[index][i];
            }
        }
    </script>
    <!-- <script type="text/javascript" src="http://res.42du.cn/vendor/jquery/jquery.min.js"></script> -->
    <!-- 城市选择多级联动js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/city-picker.js"></script>
	<script type="text/javascript">
	    function callback0(data) {
	        init($("#prov"),data.prov);
	        init($("#city"),data.city);
	        init($("#county"),data.county);
	        init($("#town"),data.town);
	        init($("#village"),data.village);
	    }
	    function callback1(data) {
	        init($("#city"),data.city);
	        init($("#county"),data.county);
	        init($("#town"),data.town);
	        init($("#village"),data.village);
	    }
	    function callback2(data) {
	        init($("#county"),data.county);
	        init($("#town"),data.town);
	        init($("#village"),data.village);
	    }
	    function callback3(data) {
	        init($("#town"),data.town);
	        init($("#village"),data.village);
	    }
	    function callback4(data) {
	        init($("#village"),data);
	    }
	    function init(sel,data) {
	        sel.html("");
	        $(data).each(function(i,item){
	            sel.append("<option value='"+item.re_code+"'>"+item.re_name+"</option>");
	        });
	    }
	    $(document).ready(function () {
	        $.ajax({
	            type:"get",
	            dataType:"jsonp",
	            url:"http://res.42du.cn/region/init",
	            jsonpCallback:"callback0"
	        });
	        $("#prov").change(function () {
	            var v = $(this).val();
	            $.ajax({
	                type:"get",
	                dataType:"jsonp",
	                url:"http://res.42du.cn/region/prov/"+v,
	                jsonpCallback:"callback1"
	            });
	        });
	        $("#city").change(function () {
	            var v = $(this).val();
	            $.ajax({
	                type:"get",
	                dataType:"jsonp",
	                url:"http://res.42du.cn/region/city/"+v,
	                jsonpCallback:"callback2"
	            });
	        });
	        $("#county").change(function () {
	            var v = $(this).val();
	            $.ajax({
	                type:"get",
	                dataType:"jsonp",
	                url:"http://res.42du.cn/region/county/"+v,
	                jsonpCallback:"callback3"
	            });
	        });
	        $("#town").change(function () {
	            var v = $(this).val();
	            $.ajax({
	                type:"get",
	                dataType:"jsonp",
	                url:"http://res.42du.cn/region/"+v,
	                jsonpCallback:"callback4"
	            });
	        });
	    });
	</script>
	<style>
		*{padding: 0;margin: 0;}
        ul,li{list-style: none;}
        a{text-decoration: none;}
        body{background: #eee;}
		#div3{height: 86px;background: #fff;}
        #title{width: 1300px;height: 86px;background: #fff;margin: 0 auto;}
        #a1{font-size: 24px;color: #000;line-height: 86px;}
		.a2{background: #f5f5f5;color: #333333}
		#div9{width: 150px;height: 200px;float: right;}
		#img1{width: 50px;height: 50px;margin-top: 18px;margin-left: 20px;}
		#information{width: 130px;height: 150px;background: red;margin-left: 20px;position: relative;z-index: 99;display: none;}
	</style>
</head>
<body>
	<!-- 悬赏专家 -->
	<div id="div3">
	    <div id="title">
	        <a id="a1" href="index.html"><b>生活服务平台</b></a>
			<a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
	        <span>北京市</span>
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
		<div class="model">
			<div class="model_head">
				<h3>新增技能</h3>
			</div>
			<div id="model_body">
				<form id="inputForm">
					<div  class="control_group">
						职业分类&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="jia" onchange="ChangeExampleSelect(this.selectedIndex)">
			 
					    </select>
					    <select id="example">
					 
					    </select><br><br>
					</div>
					<div  class="control_group">
					    技能等级&nbsp;&nbsp;&nbsp;&nbsp;
					    <select id="example">
					 		<option>小白</option>
					 		<option>新手</option>
					 		<option>熟练</option>
					 		<option>专业</option>
					    </select><br><br>
				    </div>
				    <div  class="control_group">
					    
							审核文件&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='file' name='textfield' id='textfield' placeholder="可不填" pass="true"/>
						<br><br>
				    </div>
				    <div  class="control_group" id="control_group_last">
				    	发布地址&nbsp;&nbsp;&nbsp;&nbsp;
					    <select id="prov"></select>
					    <select id="city"></select>
					    <select id="county"></select>
					    <select id="town"></select>
					    <!-- <select id="village"></select> -->
					</div>
					<div  class="control_group" id="control_group_last">
						<input type="button" name="" class="btn" value="完善技能信息">
					</div>
				</form>
			</div>
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