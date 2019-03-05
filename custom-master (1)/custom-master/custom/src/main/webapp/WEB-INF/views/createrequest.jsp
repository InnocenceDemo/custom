<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8" />
	<title>我的需求</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
	<script type="text/javascript">
        //这个 请选择 选项 加的很好。
        var jiaArr = ["---请选择---","外卖", "生活服务", "便利店"];
        var exampleArr = [
                ["---请选择---"],
                ["---请选择---","阳光烤肉饭", "便当", "面条"],
                ["---请选择---","维修", "搬家", "保姆"],
                ["---请选择---","生活用品", "小吃", "果蔬"],
        ];
        window.onload = function () {
             
            var selJia = document.getElementById("need");
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
    <!-- 城市选择 -->
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
	</style>
<body>
	<div id="div3">
	    <div id="title">
	        <a id="a1" href="index.html"><b>生活服务平台</b></a>
			<a class="a2" href="${pageContext.request.contextPath}/changecity">切换城市</a>
	        <span>北京市</span>
	        <span>登录</span>
	    </div>
	</div>
	<div class="model">
		<div class="model_head">
			<h3>创建需求</h3>
		</div>
		<div class="model_body">
			<div class="control_group ">
				<label class="">预计完成时间</label>
				<input type="date" name="" value="" class="formText">
			</div>
			<div class="control_group ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="">类别</label>
				<select id="need" class="formText" onchange="ChangeExampleSelect(this.selectedIndex)">

				</select>
				<select id="control_group" class="formText">
						<option>----请选择----</option>
					 </select>
			</div>
			<div class="control_group ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="">预算</label>
				<input type="text" name="" value="" class="formText">
			</div>
			<div class="control_group ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="">最大预算</label>
				<input type="text" name="" value="" class="formText">
			</div>
			<div class="control_group ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="">详细要求</label>
				<textarea cols="40" rows="4" class="formText"></textarea>
			</div>
			<div class="control_group ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="">发布地址</label>
				<select id="prov" class="formText"></select>
			    <select id="city" class="formText"></select>
			    <select id="county" class="formText"></select>
			    <select id="town" class="formText"></select>
			</div>
			<div class="control_group ">
				<input type="submit" value="发布悬赏任务" class="formText" id="formLast">
			</div>
		</div>
	</div>
</body>
</head>
</html>