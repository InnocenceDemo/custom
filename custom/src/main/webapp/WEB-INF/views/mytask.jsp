<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>我发布的任务</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/paging.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
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
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/template-web.js"></script>
	<script type="text/javascript">//显示所有技能
    $(function() {
        $("#prov").change(function() {
            //获取获取被选中的id
            var idVal = $("#prov option:selected").val();
            //清空select的值
            $("#commodityId").empty();
            $.ajax({
                url: "${base}/back/wxmember/amyskyWxMemberCommodityDetail/getCommodity.jhtml",
                type: "POST",
                data: "id=" + idVal,
                success: function(ajaxJson) {
                    if(ajaxJson.success) {
                        //添加select第一个option
                        $("#commodityId").append("<option selected value=''>---请选择---</option>");
                        for(var i = 0; i < ajaxJson.obj.length; i++) {
                            //添加option元素
                            $("#commodityId").append("<option value='" + ajaxJson.obj[i].id + "'>" + ajaxJson.obj[i].commodityName + "</option>");
                        }
                    } else {
                        alert(ajaxJson.msg);
                    }
                }
            })
        })
    })

	</script>
</head>
<body>
	<div id="div3">
	    <div id="title">
	        <a id="a1" href="${pageContext.request.contextPath}/index/${code}"><b>生活服务平台</b></a>
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
	<div class="model">
		<div class="model_head">
			<h3>我发布的任务</h3>
		</div>
		<div class="model_option" id="model_option">
			&nbsp;&nbsp;&nbsp;&nbsp;筛选：&nbsp;&nbsp;
			<!-- 从数据库导入职位 -->
			<select id="prov">
				<option>All</option>
				<option>外卖</option>
				<option>月嫂</option>
				<option>小时工</option>
			</select>
		</div>
		<div class="model_body">
			<table>
				<tr class="th">
					<th>悬赏发布人</th>
					<th>任务明细</th>
					<th>状态</th>
					<th>预期完成时间</th>
					<th>类别</th>
				</tr>
			</table>
		</div>
		<!-- 跳转页码 -->
		<div id="pageToolbar"></div>
		<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
		<script type="text/javascript" src="js/query.js"></script>
		<script type="text/javascript" src="js/paging.js"></script>
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
		$('#pageTool').Paging({pagesize:10,count:100,callback:function(page,size,count){
			console.log(arguments)
			alert('当前第 ' +page +'页,每页 '+size+'条,总页数：'+count+'页')
			}});
		// count设置信息数量，pagesize为每页显示信息数量。下面这个为100条信息，每页10条信息，共10页
		$('#pageToolbar').Paging({pagesize:10,count:100,toolbar:true});
		</script>
	</div>
</body>
</html>