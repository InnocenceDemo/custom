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
						<li><a href="${pageContext.request.contextPath}/${login_user.id}/myinformation">我的信息</a></li><br>
						<li><a href="${pageContext.request.contextPath}/updateinfo">更新信息</a></li><br>
						<li><a href="${pageContext.request.contextPath}/${login_user.id}/mytask">我的任务</a></li><br>
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
				<c:if test="${mytasks!=null}">
					<c:forEach items="${mytasks}" var="mytasks">
						<tr>
							<td>${mytasks.realName}</td>
							<td>${mytasks.desc}</td>
							<c:if test="${mytasks.status==0}"><td>待接取</td></c:if>
							<c:if test="${mytasks.status==1}"><td>待完成</td></c:if>
							<c:if test="${mytasks.status==2}"><td>已完成</td></c:if>
							<c:if test="${mytasks.status==null}"><td>状态未知</td></c:if>
							<td>${mytasks.finishTime}</td>
							<td>${mytasks.category}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${mytasks==null}">
						<tr><td colspan="5">当前无任务记录</td></tr>
				</c:if>
			</table>
			<table border="0" cellspacing="0" cellpadding="0"  width="900px" align="center">
				<tr>
					<td align="right">
						<span>第${pageBean_mytask.currPage}/${pageBean_mytask.totalPage}页</span>&nbsp;&nbsp;
						<span>总记录数 ：${pageBean_mytask.totalCount}条&nbsp;&nbsp;每页显示：${pageBean_mytask.pageSize}条</span>
						<span>
                <c:if test="${pageBean_mytask.currPage != 1}">
					<a href="${pageContext.request.contextPath}/${login_user.id}/mytask?page=1">[首页]</a>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/${login_user.id}/mytask?page=${pageBean_mytask.currPage-1}">[上一页]</a>&nbsp;&nbsp;
				</c:if>
                <c:if test="${pageBean_mytask.currPage != pageBean_mytask.totalPage}">
					<a href="${pageContext.request.contextPath}/${login_user.id}/mytask?page=${pageBean_mytask.currPage+1}">[下一页]</a>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/${login_user.id}/mytask?page=${pageBean_mytask.totalPage}">[尾页]</a>&nbsp;&nbsp;
				</c:if>
            </span>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>