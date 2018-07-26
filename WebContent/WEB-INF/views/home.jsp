<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>中智软考科技学校内部学习系统</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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

<style>
.question-number {
	color: #5cb85c;
	font-weight: bolder;
	display: inline-block;
	width: 30px;
	text-align: center;
}

.question-number-2 {
	color: #5bc0de;
	font-weight: bolder;
	display: inline-block;
	width: 30px;
	text-align: center;
}

.question-number-3 {
	color: #d9534f;
	font-weight: bolder;
	display: inline-block;
	width: 30px;
	text-align: center;
}

a.join-practice-btn {
	margin: 0;
	margin-left: 20px;
}

.content ul.question-list-knowledge {
	padding: 8px 20px;
}

.knowledge-title {
	background-color: #EEE;
	padding: 2px 10px;
	margin-bottom: 20px;
	cursor: pointer;
	border: 1px solid #FFF;
	border-radius: 4px;
}

.knowledge-title-name {
	margin-left: 8px;
}

.point-name {
	width: 200px;
	display: inline-block;
}

.col-xs-3 {
	width: 22%;
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
					<li class="active"><a href="home"><i class="fa fa-home"></i>主页</a>
					</li>
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

	<!-- Slider starts -->

	<div class="full-slider">
		<!-- Slider (Flex Slider) -->

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="flexslider">
						<div class="flex-caption">
							<!-- Left column -->
							<div class="col-l">
								<p style="text-indent: 2em;">
									中智软件科技学校考试系统是基于JAVA与MYSQL开发的网络考试系统。本套系统只专供中智软件科技学校内部学员使用,开发此系统为了提高学员的理论知识水平,提高对java的应用水平.本系统不用于商业使用
									
								</p>
								<p style="text-indent: 2em;">中智软件科技学校提供技术支持</p>
							</div>
							<!-- Right column -->
							<div class="col-r">

								<!-- Use the class "flex-back" to add background inside flex slider -->

								<!-- <img alt="" src="../resources/images/ad.png"> -->
								<p>如果您使用考试中有任何问题请联系辅导员：QQ:1119047192</p>

								<!-- Button -->
								<a class="btn btn-default btn-cta" href="user-register"><i
									class="fa fa-arrow-circle-down"></i> 马上注册学习吧</a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content" style="padding: 30px 0 0 0;">
		<div class="container">
			<div class="row">
				<a class="select-test col-xs-4 home-link-anchor"
					href="student/practice-list">
					<div class="select-test-icon">
						<i class="fa fa-book"></i>

					</div>
					<h3>试题练习</h3>
					<p>您可以免费获取对应专业的培训视频或者文档资料，通过在线练习可以考察您的知识掌握程度。</p>
				</a> <a class="select-test col-xs-4 home-link-anchor" href="exam-list">
					<div class="select-test-icon">
						<i class="fa fa-trophy"></i>
					</div>
					<h3>在线考试</h3>
					<p>参加正式或者模拟考试，您的教师可以发布正式的考试，您也可以主动申请这些考试</p>
				</a>
				<div class="select-test col-xs-4">
					<div>
						<h3>快速考试入口</h3>
						<p>通过已有的准考证快速参加考试，具体的准考证请从相关教师处获取，或者在个人中心的考试信息中查找</p>

					</div>
					<div style="text-align: center; margin-top: 20px;">
						<a class="btn btn-info quick-start-btn" href="quick-start">快速考试入口
							<i class="fa fa-arrow-circle-o-right"></i>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content"
		style="padding: 30px 0 100px 0; background-color: rgb(246, 249, 250);">
		<div class="container">
			<div style="margin-bottom: 10px;">
				<h3 >中智考试系统</h3>
				<p>中智软件科技学校提供多种专业课程供你学习</p>
			</div>
			<div class="row">
				<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #E97051;">
						<div class="field-category-inner">
							<i class="fa fa-coffee"></i>
						</div>
						<div class="field-category-text ">
							<p>JAVA基础考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">JAVA基础</p>
						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">412</span>

							名学员
						</div>

					</div>
				</a> 
				
				
				
				<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #E97051;">
						<div class="field-category-inner">
							<i class="fa fa-html5"></i>
						</div>
						<div class="field-category-text ">
							<p>HTML前端设计考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">HTML前端设计</p>
						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">412</span>

							名学员
						</div>

					</div>
				</a> 
				
				<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #E97051;">
						<div class="field-category-inner">
							<i class="fa fa-database"></i>
						</div>
						<div class="field-category-text ">
							<p>Oracle考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">Oracle数据库</p>
						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">412</span>

							名学员
						</div>

					</div>
				</a> 
				<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #5C78B9;">
						<div class="field-category-inner">
							<i class="fa fa-trophy"></i>
						</div>
						<div class="field-category-text ">
							<p>动态网页Jsp及AJAX考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">动态网页Jsp及AJAX</p>

						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">2143</span>
							名学员
						</div>

					</div>
				</a> 
				<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #5BA276;">
						<div class="field-category-inner">
							<i class="fa fa-android"></i>
						</div>
						<div class="field-category-text ">
							<p>Hibernate考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">Hibernate</p>

						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">1213</span>
							名学员
						</div>

					</div>
				</a>
					<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #5BA276;">
						<div class="field-category-inner">
							<i class="fa fa-android"></i>
						</div>
						<div class="field-category-text ">
							<p>Strust2考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">Strust2</p>

						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">1213</span>
							名学员
						</div>

					</div>
				</a>
					<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #5BA276;">
						<div class="field-category-inner">
							<i class="fa fa-android"></i>
						</div>
						<div class="field-category-text ">
							<p>MyBatis考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">MyBatis</p>

						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">1213</span>
							名学员
						</div>

					</div>
				</a>
					<a class="field-category-div col-xs-3 home-link-anchor">
					<div class="field-category-title"
						style="background-color: #5BA276;">
						<div class="field-category-inner">
							<i class="fa fa-android"></i>
						</div>
						<div class="field-category-text ">
							<p>Spring考试</p>
						</div>
					</div>
					<div class="field-category-footer">
						<div class="field-category-footer-sub">
							<p class="field-student-subtitle">Spring</p>

						</div>
						<div class="field-category-footer-sub">
							<i class="fa fa-users"></i> <span class="field-student-num">1213</span>
							名学员
						</div>

					</div>
				</a>

			</div>
		</div>
	</div>
	<div class="content" style="padding: 30px 0 100px 0;">
		<c:if test="${fn:length(newsList) > 0 }">
			<div class="container">
				<div>
					<h3>最新公告</h3>
				</div>
				<div style="margin-top: 20px;">
					<ul class="news-list">
						<c:choose>
							<c:when test="${fn:length(newsList) eq 1 }">
								<li class="news-list-item clearfix"><a
									class="home-link-anchor" href="news/${newsList[0].newsId }"
									target="_blank">
										<div class="news-list-thumbnail"></div>
										<div class="news-list-content">
											<div class="news-list-title">${newsList[0].title }</div>
											<div class="news-list-creater">
												<i class="fa fa-user"></i><span>${newsList[0].creator }</span>
												<i class="fa fa-clock-o"></i><span><fmt:formatDate
														value="${newsList[0].createTime }"
														pattern="yyyy-MM-dd HH:mm" /></span>
											</div>
										</div>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="news-list-item clearfix"><a
									class="home-link-anchor" href="news/${newsList[0].newsId }"
									target="_blank">
										<div class="news-list-thumbnail"></div>
										<div class="news-list-content">
											<div class="news-list-title"">${newsList[0].title }</div>
											<div class="news-list-creater">
												<i class="fa fa-user"></i><span>${newsList[0].creator }</span>
												<i class="fa fa-clock-o"></i><span><fmt:formatDate
														value="${newsList[0].createTime }"
														pattern="yyyy-MM-dd HH:mm" /></span>
											</div>
										</div>
								</a></li>
								<li class="news-list-item clearfix"><a
									class="home-link-anchor" href="news/${newsList[1].newsId }">
										<div class="news-list-thumbnail"></div>
										<div class="news-list-content">
											<div class="news-list-title">${newsList[1].title }</div>
											<div class="news-list-creater">
												<i class="fa fa-user"></i><span>${newsList[1].creator }</span>
												<i class="fa fa-clock-o"></i><span><fmt:formatDate
														value="${newsList[1].createTime }"
														pattern="yyyy-MM-dd HH:mm" /></span>
											</div>
										</div>
								</a></li>
							</c:otherwise>
						</c:choose>


					</ul>
				</div>
			</div>
		</c:if>

	</div>
		<jsp:include page="common/footer.jsp"></jsp:include>


	<!-- Slider Ends -->

	<!-- Javascript files -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			bindQuestionKnowledage();
			var result = checkBrowser();
			if (!result) {
				alert("请至少更新浏览器版本至IE8或以上版本");
			}
		});

		function checkBrowser() {
			var browser = navigator.appName;
			var b_version = navigator.appVersion;
			var version = b_version.split(";");
			var trim_Version = version[1].replace(/[ ]/g, "");
			if (browser == "Microsoft Internet Explorer"
					&& trim_Version == "MSIE7.0") {
				return false;
			} else if (browser == "Microsoft Internet Explorer"
					&& trim_Version == "MSIE6.0") {
				return false;
			} else
				return true;
		}

		function bindQuestionKnowledage() {
			$(".knowledge-title").click(function() {
				var ul = $(this).parent().find(".question-list-knowledge");

				if (ul.is(":visible")) {
					$(this).find(".fa-chevron-down").hide();
					$(this).find(".fa-chevron-up").show();

					$(".question-list-knowledge").slideUp();

				} else {
					$(".fa-chevron-down").hide();
					$(".fa-chevron-up").show();

					$(this).find(".fa-chevron-up").hide();
					$(this).find(".fa-chevron-down").show();

					$(".question-list-knowledge").slideUp();
					ul.slideDown();

				}

			});
		}
	</script>
</body>
</html>
