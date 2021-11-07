<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="logreg-forms">
		<form>
			<h1 class="h3 mb-3 font-weight-bold " style="text-align: center;">Đăng nhập</h1>
			<div style="margin-bottom: 10px;">
				<input type="email" class="form-control" placeholder="Email" />
			</div>
			<div style="margin-bottom: 10px;">
				<input type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" />
			</div>
			
			<button class="btn btn-success btn-block" type="submit" style="font-size: 15px;">
				<i class="fas fa-sign-in-alt"></i>ĐĂNG NHẬP
			</button>
			
			<a id="forgot_pswd" href="#">Quên mật khẩu?</a>
			<hr>
			
			<!-- <p>Don't have an account!</p>  -->
			<a href="#">
				<button class="btn btn-primary btn-block" type="button" style="font-size: 15px;">
					<i class="fas fa-user-plus"></i>Đăng kí tài khoản mới
				</button>
			</a>
			<a href="#">Quay về trang chủ</a>
		</form>
		<br>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/LoginForm.js"></script>
	
</body>
</html>