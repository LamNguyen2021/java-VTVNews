<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Edit Profile</title>
	
	<link rel="shortcut icon" href="./assets/images/iconmini.png" type="image/png">
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display|Courgette|Dancing+Script|Lobster&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="./assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="./assets/images/apple-touch-icon.png">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LoginForm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	<base href="${pageContext.servletContext.contextPath }/">
</head>
<body>
	<div id="logreg-form" style="width: 1000px; margin: auto; margin-top: 50px; 
	background-color: #f3f3f3; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); 
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1); padding: 20px;">
		<form:form style="width:1000px;" modelAttribute="TKLogin" enctype="multipart/form-data">
			<div>
				<p style="text-align: center; color: #b70002; font-family: 'Dancing Script', cursive; 
				font-weight: bold; letter-spacing: 10; font-size: 40px; padding: 10px;">
					THÔNG TIN CÁ NHÂN
				</p>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="row" >
						<img style="width: 300px;height:300px; border-radius: 50%; margin-bottom: 20px;"
							alt="" src="./assets/images/${TKLogin.getAnh() }">
					</div>
					<div class="row" style="margin: auto;">
						<span>Chọn ảnh đại diện:</span>
						<div style="margin-bottom: 10px; border: none;" class="form-control">
							<input  type="file" name="anhEdit"/>
							<form:input value="${TKLogin.anh}" path="anh" style="display:none;" class="form-control" type="text"/>
							<form:input value="${TKLogin.vaitro}" path="vaitro" style="display:none;" class="form-control" type="text"/>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div style="margin-bottom: 20px; margin-top: 50px;">
						<form:input value="${TKLogin.hoten}" path="hoten" class="form-control" type="text" placeholder="Họ tên"/>
						<form:errors path="hoten" style="color:red;" />
					</div>
					<div style="margin-bottom: 20px;">
						<form:input value="${TKLogin.sdt}" path="sdt" type="text" class="form-control" placeholder="Số diện thoại"/>
						<form:errors path="sdt" style="color:red;" />
					</div>
					<div style="margin-bottom: 20px;">
						<form:input value="${TKLogin.username}" path="username" type="email" class="form-control" placeholder="Email" readonly="true"/>
						<form:errors path="username" style="color:red;" />
					</div>
					<div style="margin-bottom: 20px;">
						<form:input value="${TKLogin.password}" path="password" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu"/>
						<form:errors path="password" style="color:red;" />
					</div>
					<form:select value="${TKLogin.gioitinh}" path="gioitinh" style="margin-bottom:10px;">
						<form:option value="Nữ">Nữ</form:option>
						<form:option value="Nam">Nam</form:option>
					</form:select>
				</div>
			</div>
			<div style="margin-bottom: 5px; width: 20%; margin-left: 350px;">
				<button class="btn  btn-block" type="submit"
					style="padding: 10px; font-size: 20px; background-color: #b70002; color: white;">
					Cập nhật
				</button>
			</div>
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