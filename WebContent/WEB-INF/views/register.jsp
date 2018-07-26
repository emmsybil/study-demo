<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="keywords" content="">
<link rel="shortcut icon"
	href="<%=basePath%>resources/images/favicon.ico" />
<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<!-- Javascript files -->
<style type="text/css">
.form-group {
	/**/
	margin-bottom: 5px;
	height: 59px;
}

.datainp {
	width: 200px;
	height: 30px;
	border: 1px #ccc solid;
}

.datep {
	margin-bottom: 40px;
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
					<li><a href="student/usercenter"><i
							class="fa fa-dashboard"></i>会员中心</a></li>
					<li><a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- Navigation bar ends -->

	<div class="content" style="margin-bottom: 100px;">

		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div class="lrform">
						<h5>注册账号</h5>
						<span class="form-message"></span>
						<div class="form">
							<!-- Register form (not working)-->
							<form class="form-horizontal" id="form-create-account">
								<div class="form-line form-username" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>用户名：</span>
									<input type="text" class="df-input-narrow" id="name-add"
										maxlength="20" onblur="checkUserName()"> <span
										class="form-message">设置后不能修改</span> <br>
								</div>
								<div class="form-line form-password" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>密码：</span>
									<input type="password" class="df-input-narrow"
										id="password-add" maxlength="20" onblur="checkPassword()">
									<span class="form-message"></span> <br>
								</div>
								<div class="form-line form-password-confirm"
									style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>确认密码：</span>
									<input type="password" class="df-input-narrow"
										id="password-add" maxlength="20"
										onblur="checkConfirmPassword()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-truename" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>真实姓名：</span>
									<input type="text" class="df-input-narrow" id="truename-add"
										maxlength="20" onblur="checkTrueName()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-national-id" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>身份证号：</span>
									<input type="text" class="df-input-narrow" id="national-id-add"
										maxlength="18" onblur="checkNationalId()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-phone" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>手机：</span>
									<input type="text" class="df-input-narrow" id="phone-add"
										maxlength="18" onblur="checkPhoneNum()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-email" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>邮箱：</span>
									<input type="text" class="df-input-narrow" id="email-add"
										maxlength="60" onblur="checkEmail()"> <span
										class="form-message"></span> <br>
								</div>


								<!-- <div class="form-line form-company" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>单位：</span>
									<input type="text" class="df-input-narrow" id="company-add"
										maxlength="60"> <span class="form-message"></span> <br>
								</div> -->
								<div class="form-line form-department" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>班级：</span>
									<select id="department-input-select" class="df-input-narrow"
										onblur="checkDepartment()">
										<option value="-1">--请选择--</option>
										<c:forEach items="${groupList}" var="item">
											<option value="${item.groupId}">${item.groupName}</option>
										</c:forEach>
									</select> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-kindred" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>家属关系：</span>
									<select id="kindred-input-select" class="df-input-narrow"
										onblur="checKindred()">
										<option value="-1">--请选择--</option>
										<option value="父亲">父亲</option>
										<option value="母亲">母亲</option>
										<option value="哥哥">哥哥</option>
										<option value="姐姐">姐姐</option>
										<option value="其他">其他</option>
									</select> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-gender" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>性别：</span>
									<select id="gender-input-select" class="df-input-narrow"
										onblur="checkGender()">
										<option value="-1">--请选择--</option>
										<option value="男">男</option>
										<option value="女">女</option>
									</select> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-address" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>家庭住址：</span>
									<input type="text" class="df-input-narrow" id="address-add"
										maxlength="60" onblur="checkAddress()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-emergencyCall"
									style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>紧急号码：</span>
									<input type="text" class="df-input-narrow"
										id="emergencyCall-add" maxlength="60"
										onblur="checkEmergencyCall()"> <span
										class="form-message"></span> <br>
								</div>
								<div class="form-line form-birthday" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>生日：</span>
									<input type="text" class="sang_Calender" id="birthday-add"
										maxlength="60" readonly="readonly">
									<span class="form-message"></span> <br>
								</div>
								<div class="form-line form-education" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>学历：</span>
									<select id="education-input-select" class="df-input-narrow"
										onblur="checkEducation()">
										<option value="-1">--请选择--</option>
										<option value="小学">小学</option>
										<option value="初中">初中</option>
										<option value="高中">高中</option>
										<option value="中专">中专</option>
										<option value="大专">大专</option>
										<option value="大学">大学</option>
									</select> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-enrolledTime" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>入学时间：</span>
									<input type="text" class="sang_Calender" id="enrolledTime-add"
										maxlength="60" readonly="readonly"><span
										class="form-message"></span>
								</div>
								<!-- Checkbox -->
								<div class="form-group form-confirm">
									<div class="col-md-9 col-md-offset-3">
										<label class="checkbox-inline"> <input type="checkbox"
											id="inlineCheckbox1" value="agree"> <a>
												同意中智软件科技学校条款</a>
										</label> <span class="form-message"></span>
									</div>

								</div>

								<!-- Buttons -->
								<div class="form-group">
									<!-- Buttons -->
									<div class="col-md-9 col-md-offset-3">
										<button type="button" class="btn" id="btn-reg"
											onclick="bindSubmitForm()">注册账号</button>
										<button type="reset" class="btn">重置</button>
									</div>
									已有账号? <a href="user-login-page">直接登录</a>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>
	<!-- Slider Ends -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script type="text/javascript"
		src="<%=path%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/all.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/register.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/datetime.js"></script>
</body>
</html>