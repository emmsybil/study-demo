<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>请假</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="keywords" content="">
<link rel="shortcut icon"
	href="<%=basePath%>resources/images/favicon.ico" />
<link href="resources/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

<link href="resources/css/exam.css" rel="stylesheet">
<link href="resources/chart/morris.css" rel="stylesheet">
<style>
a.btn {
	margin-top: 0px;
}

.section-navi-item {
	display: inline-block;
	height: 24px;
	background: rgb(239, 237, 237);
	padding: 0 10px;
	margin: 3px;
	font-family: arial;
	text-align: center;
	line-height: 24px;
	color: #428bca;
	font-size: 12px;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="row">
				<div class="col-xs-5">
					<div class="logo">
						<h1>
							<a href="#"><img alt="" src="resources/images/logo.png"></a>
						</h1>
					</div>
				</div>
				<div class="col-xs-7" id="login-info">
					<c:choose>
						<c:when
							test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
							<div id="login-info-user">
								<a
									href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
									id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
								<span>|</span> <a href="j_spring_security_logout"><i
									class="fa fa-sign-out"></i> 退出</a>
							</div>
						</c:when>
						<c:otherwise>
							<a class="btn btn-primary" href="user-register">用户注册</a>
							<a class="btn btn-success" href="user-login-page">登录</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</header>
	<!-- Navigation bar starts -->

	<div class="navbar bs-docs-nav" role="banner">
		<div class="container">
			<nav class="collapse navbar-collapse bs-navbar-collapse"
				role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="home"><i class="fa fa-home"></i>主页</a></li>
					<li><a href="student/practice-list"><i class="fa fa-edit"></i>试题练习</a>
					</li>
					<li><a href="exam-list"><i class="fa  fa-paper-plane-o"></i>在线考试</a>
					</li>
					<li><a href="training-list"><i class="fa fa-book"></i>培训资料</a>
					</li>
					<li class="active"><a href="student/usercenter"><i
							class="fa fa-dashboard"></i>会员中心</a></li>
					<li><a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Navigation bar ends -->

	<!-- Slider starts -->
	<div>
		<!-- Slider (Flex Slider) -->
		<div class="container" style="min-height: 500px;">
			<div class="row">
				<div class="col-xs-2">
					<ul class="nav default-sidenav">
						<li><a href="student/usercenter"> <i
								class="fa fa-dashboard"></i> 用户中心
						</a></li>
						<li><a href="student/analysis"> <i
								class="fa fa-bar-chart-o"></i> 统计分析
						</a></li>
						<li><a href="student/exam-history"> <i
								class="fa fa-history"></i> 考试历史
						</a></li>
						<li><a href="student/training-history"> <i
								class="fa fa-book"></i> 培训历史
						</a></li>
						<li><a href="student/dictationCase/1/1"
							class="fa fa fa-file-text-o"> 单词听写</a></li>
						<li class="active"><a
							href="student/ask-for-leave/filter-1-0-0-0.html"><i
								class="glyphicon glyphicon-list-alt"></i> 请假 </a></li>
						<li><a href="student/score"><i class="fa fa-trophy"></i> 成绩 </a></li>
					</ul>
				</div>

				<div class="col-xs-10" id="right-content">
					<div class="page-header">
						<h1>
							<i class="fa fa-list-ul"></i> 请假
						</h1>
					</div>
					<div class="input-group search-form"
						style="float: left; width: 300px; padding: 10px 0px;">
						<span class="input-group-btn">
							<button class="btn btn-sm btn-success" type="button"
								id="btn-ask-for-leave" data-id="0">
								<i class="fa fa-plus-square"></i> 申请请假
							</button>
						</span>
					</div>

					<div class="page-content">
						<div id="product-filter">
							<table class="table-striped table">
								<thead>
									<tr>
										<!-- <td>编号</td> -->
										<td>时间段</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- <td><input type="text" class="form-control"
											placeholder="编号" onchange="util.checkNumber(this,'请输入数字')"
											value="" id="id"></td> -->
										<td><input type="text" id="start"
											<c:if test="${!(start eq '0')}">value="${start}"</c:if>
											class="plugin-start-time" placeholder="开始时间" readonly>
											- <input type="text" id="end"
											<c:if test="${!(end eq '0')}">value="${end}"</c:if>
											class="plugin-end-time" placeholder="结束时间" readonly>
											<button class="btn btn-sm btn-default resetBtn" type="reset" data-id="0">
												<i class="fa fa-refresh"></i>重置时间
											</button></td>
										<td><button class="btn btn-sm btn-default" type="button"
												id="btn-leave-search" data-id="0">
												<i class="fa fa-search"></i>查找
											</button></td>
									</tr>
								</tbody>
								<tfoot></tfoot>
							</table>
						</div>

						<div id="product-list">
							<table class="table-striped table">
								<thead>
									<tr>
										<td>审批人</td>
										<td>申请时间</td>
										<td>请假时长</td>
										<td>请假类型</td>
										<td>状态</td>
										<td>操作</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${askForLeaveList}" var="item">
										<tr>
											<td>${item.role_name}</td>
											<td>${item.create_time}</td>
											<td><c:if test="${item.hour<24}">${item.hour}小时</c:if> <c:if
													test="${item.hour>=24}">${item.day}天</c:if></td>
											<td><c:choose>
													<c:when test="${item.type==1}">
												病假
												</c:when>
													<c:when test="${item.type==2}">
												事假
												</c:when>
													<c:when test="${item.type==3}">
												其他
												</c:when>
												</c:choose></td>
											<td><c:if test="${item.status==0}">未审批</c:if> <c:if
													test="${item.status==1}">已审批</c:if></td>
											<td><a class="btn-sm btn-primary" data-id="${item.id}"
												onclick="leave.leaveParticulars('${item.id}')" title="详情">
													<i class="ace-iconfafa-userbigger-120"> </i>详情
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot></tfoot>
							</table>

							<div class="page-link-content" style="text-align: center;">
								<ul class="pagination pagination-sm" id="pagination">
									<%-- <li class="disabled"><span style="color: #428bca;">总共${total}条</span></li> --%>
									${pageStr}
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 请假申请modal -->
	<div class="modal fade" id="ask-for-leave-modal" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h6 class="modal-title" id="myModalLabel">请假申请</h6>
				</div>
				<div class="modal-body">
					<form id="ask-for-leave-application">
						<input type="hidden" id="btn-token" value="${token}">
						<div class="form-line form-type">
							<span class="form-label"><span class="warning-label">*</span>请假类型：</span>
							<select id="type" name="leave-type" size="1">
								<option value="0">请选择</option>
								<option value="1">病假</option>
								<option value="2">事假</option>
								<option value="3">其他</option>
							</select> <span class="form-message"></span>
						</div>

						<div class="form-line form-time">
							<span class="form-label"><span class="warning-label">*</span>请假时间：</span>
							<input type="text" id="start_time" class="plugin-start-time"
								placeholder="请假开始时间" readonly>-<input type="text"
								id="end_Time" class="plugin-end-time" placeholder="请假结束时间"
								readonly>
							<button class="btn btn-sm btn-default resetBtn" type="reset" data-id="0">
								<i class="fa fa-refresh"></i>重置时间
							</button>
							<span class="form-message form-time-start"></span> <span
								class="form-message form-time-end"></span>
						</div>

						<div class="form-line form-reason">
							<span class="form-label"><span class="warning-label">*</span>请假原因：</span>
							<textarea class="form-control" rows="5" id="reason" name="reason"></textarea>
							<span class="form-message"></span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="leave.emptyForm('ask-for-leave-application')"
						data-dismiss="modal">关闭窗口</button>
					<button id="btn-add-application" type="button"
						class="btn btn-primary">确定提交</button>
				</div>
			</div>
		</div>
	</div>

		<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- Slider Ends -->

	<!-- Javascript files -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
	<script type="text/javascript" src="resources/chart/morris.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="resources/js/all.js"></script>
	<script type="text/javascript" src="resources/js/ask-for-leave.js"></script>
	<script type="text/javascript">
		$(".plugin-start-time").datetimepicker({
			format : 'yyyy:mm:dd hh:ii',
			language : 'zh-CN',
			autoclose : true,
			todayBtn : true,
			forceParse : true,
			showMeridian : false,
			maxView : 'decade',
			todayHighlight : 1
		}).on("changeDate",function(e) {
			var startTime = e.date;
			$(".plugin-end-time").datetimepicker("setStartDate",startTime);
			/* $(this).datetimepicker("setEndDate", $(".plugin-end-time").val());
			$("#start").datetimepicker("setEndDate", $("#end").val());
			$("#ask-for-leave-modal #start_time").datetimepicker("setEndDate", $("#ask-for-leave-modal #end_time").val()); */
		});
		$(".plugin-end-time").datetimepicker({
			format : 'yyyy:mm:dd hh:ii',
			language : 'zh-CN',
			autoclose : true,
			todayBtn : true,
			forceParse : true,
			showMeridian : false,
			maxView : 'decade',
			todayHighlight : 1
		}).on("changeDate",function(e) {
			var endTime = e.date;
			$(".plugin-start-time").datetimepicker("setEndtDate",endTime);
			/* $(this).datetimepicker("setStartDate", $(".plugin-start-time").val());
			$("#end").datetimepicker("setStartDate", $("#start").val())
			$("#ask-for-leave-modal #end_time").datetimepicker("setStartDate", $("#ask-for-leave-modal #start_time").val()) */
		});
		//重置时间
		$(".resetBtn").off().on("click", function() {
			$(".plugin-start-time").val("");
			$(".plugin-end-time").val("");
		});
		//请假申请模态框
		$("#btn-ask-for-leave").click(function() {
			$("#ask-for-leave-application .form-message").empty();
			$("#ask-for-leave-application input").removeClass("has-error");
			$("#ask-for-leave-application select").removeClass("has-error");
			$("#ask-for-leave-application textarea").removeClass("has-error");
			$("#ask-for-leave-modal").modal({
				backdrop : true,
				keyboard : true
			});
		});
	</script>
</body>
</html>