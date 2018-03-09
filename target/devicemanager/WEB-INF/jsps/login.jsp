<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>- 登录</title>
<meta name="keywords" content="">
<meta name="description" content="">

<!-- 引入样式 -->
<link rel="shortcut icon" href="${ctx}/static/favicon.ico">
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="${ctx}/static/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
<!--[if lt IE 9]>
<meta http-equiv="refresh" content="0;ie.html" />
<![endif]-->

<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>


</head>
<body class="gray-bg">


	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h1 class="logo-name">众</h1>
			</div>
			<h3>欢迎使用人员设备管理系统</h3>

			<form class="m-t" role="form" method="post" id="signupForm">
				<!-- 错误信息 -->
				<div id="loginError"></div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="用户名"
						required="" minlength="5" name="username" id="name">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码"
						required="" minlength="6" name="userpassword" id="pwd" errorPwd="">
				</div>
				<div class="form-group">
					<div class="col-sm-8 ">
						<div class="checkbox-custom checkbox-default">
							<input type="checkbox" id="RememberMe"> <label
								for="RememberMe">Remember Me</label>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">登
					录</button>

			</form>
		</div>
	</div>


	<!-- 全局js -->
	<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/jquery.validate.js"></script>
</body>

<script type="text/javascript">
	$(function() {
		$("#signupForm")
				.validate(
						{
							onsubmit : true,// 是否在提交是验证
							submitHandler : function() {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/user/login",
											method : "post",
											data : $('#signupForm').serialize(),
											dataType : 'json',
											success : function(res) {

												if (res.message == '登录完成') {
													$("#loginError").html(
															"登录成功！");
													var href = '${pageContext.request.contextPath}/user/toIndex';
													window.top.location.href = href;
												} else if (res.message == '账号密码不正确') {
													$("#loginError").html(
															"账号密码不正确");
												} else if (res.message == '用户名或密码错误！') {
													$("#loginError").html(
															"用户名或密码错误！");
												}
											}
										});
							}
						})
	});
</script>
</html>

