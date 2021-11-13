<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
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
	
	<style type="text/css">
		.custom-file-input::-webkit-file-upload-button {
			visibility: hidden;
		}
		.custom-file-input::before {
			content: 'Lựa chọn tệp hình ảnh';
			display: inline-block;
			
			border: 1px solid #b70002;
			background-color: #b70002;
			
			border-radius: 3px;
			padding: 10px 23px;
			outline: none;
			color: white;
			white-space: nowrap;
			-webkit-user-select: none;
			cursor: pointer;
		}
		.custom-file-input:hover::before {
			border-color: black;
		}
		.custom-file-input:active::before {
			background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
		}
	</style>
</head>
<body>
	<div id="logreg-form" style="width: 412px; margin: 10vh auto; background-color: #f3f3f3; 
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); 
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1); padding: 20px;">
	
		<form:form action="register" class="form-signup" id="signup" 
		method="post" modelAttribute="taikhoan" enctype="multipart/form-data">
			<div>
				<h1 class="h3 mb-3 font-weight-bold " style="text-align: center;color: #b70002;">
					Đăng kí tài khoản
				</h1>
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="hoten" type="text" class="form-control" placeholder="Họ tên" />
				<form:errors path="hoten" style="color:red;" />
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="sdt" type="number" class="form-control" placeholder="Số diện thoại" />
				<form:errors path="sdt" style="color:red;" />
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="username" type="email" class="form-control" placeholder="Email" />
				<form:errors path="username" style="color:red;" />
			</div>
			<div style="margin-bottom: 10px;">
				<form:input path="password" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" />
				<form:errors path="password" style="color:red;" />
			</div>

			<form:select path="gioitinh" style="margin-bottom:10px;">
				<form:option value="Nữ">Nữ</form:option>
				<form:option value="Nam">Nam</form:option>
			</form:select>
			<br>
			
			<span>Chọn ảnh đại diện:</span>
			<div style="margin-bottom: 10px; border:none; background:#f3f3f3;"  >								
				<input type="file" name="anh" class="custom-file-input" style="margin-bottom: 20px;padding: 10px 23px;"/>									
			</div>
			
			<div style="margin-bottom: 10px;">
				<button style="background-color: #b70002;color:white;" class="btn  btn-block" type="submit">
					Đăng kí
				</button>
			</div>
			
			<a href="${pageContext.request.contextPath}/login" id="cancel_signup" style="font-size:18px;"> <i
				class="glyphicon glyphicon-backward"></i> Trở về</a>

		</form:form>
		<br>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/LoginForm.js"></script>


	<script>
		$('#btn-signup').on('click', function() {
			$('#signin').css('display', 'none');
			$('#signup').css('display', 'block');
		})
		$('#forgot_pswd').on('click', function() {
			$('#signin').css('display', 'none');
			$('#forgotPass').css('display', 'block');
		})
	</script>
</body>
</html>