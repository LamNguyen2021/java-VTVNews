<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Login</title>
	
	<link rel="shortcut icon" href="./assets/images/iconmini.png" type="image/png">
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display|Courgette|Dancing+Script|Lobster&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="./assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="./assets/images/apple-touch-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LoginForm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	
	<base href="${pageContext.servletContext.contextPath }/">
</head>
<body>
	${message }
	<div id="logreg-forms">
		<form:form action="${pageContext.request.contextPath }/checkLogin" modelAttribute="TaiKhoan">
			<h3 class="h3 mb-3 font-weight-bold " style="text-align: center;font-size: 35px;font-weight: 700;color: #b70002;margin-top: 10px;margin-bottom: 20px;">Đăng nhập</h3>
			<div style="margin-bottom: 10px;">
				<form:input path="username" type="email" class="form-control" placeholder="Email" />
				<form:errors path="username" style="color: red; font-size: 12px"/>
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="password" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" />
				<form:errors path="password" style="color: red; font-size: 12px"/>
			</div>
			<div class="g-recaptcha" data-sitekey="6LdNo-QcAAAAANQTnVSc-RrtyU6VNRZiGKFRFmfZ"></div>
			<span style="color: red; font-size: 12px">${recaptcha}</span>
			
			<button class="btn btn-success btn-block" type="submit" style="font-size: 15px; background-color: #b70002; border-color: #b70002">
				ĐĂNG NHẬP
			</button>
			
			<a id="forgot_pswd" href="${pageContext.request.contextPath }/forgot-password" style="color: #000">Quên mật khẩu?</a>
			<hr>
			
			<!-- <p>Don't have an account!</p>  -->
			<a href="${pageContext.request.contextPath }/register">
				<button class="btn btn-primary btn-block" type="button" style="font-size: 15px;">
					Đăng kí tài khoản mới
				</button>
			</a>
			<a href="${pageContext.request.contextPath }/home" id="cancel_signup" style="font-size: 14px; margin: 10px; color: #000;">
				<i class="fa fa-arrow-circle-left"></i> Trở về trang chủ
			</a>
		</form:form>
		<br>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/LoginForm.js"></script>
	
</body>
</html>