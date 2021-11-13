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
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	<base href="${pageContext.servletContext.contextPath }/">
</head>
<body>
	${message }
	<div id="logreg-forms">
		<form:form action="${pageContext.request.contextPath }/checkLogin" modelAttribute="TaiKhoan">
			<h1 class="h3 mb-3 font-weight-bold " style="text-align: center;">Đăng nhập</h1>
			<div style="margin-bottom: 10px;">
				<form:input path="username" type="email" class="form-control" placeholder="Email" />
				<form:errors path="username" style="color: red;"/>
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="password" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" />
				<form:errors path="password" style="color: red;"/>
			</div>
			
			<button class="btn btn-success btn-block" type="submit" style="font-size: 15px;">
				ĐĂNG NHẬP
			</button>
			
			<a id="forgot_pswd" href="${pageContext.request.contextPath }/forgot-password">Quên mật khẩu?</a>
			<hr>
			
			<!-- <p>Don't have an account!</p>  -->
			<a href="${pageContext.request.contextPath }/register">
				<button class="btn btn-primary btn-block" type="button" style="font-size: 15px;">
					Đăng kí tài khoản mới
				</button>
			</a>
			<a href="${pageContext.request.contextPath }/home">Quay về trang chủ</a>
		</form:form>
		<br>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/LoginForm.js"></script>
	
</body>
</html>