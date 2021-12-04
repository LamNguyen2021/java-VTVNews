<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Thêm danh mục</title>
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display|Courgette|Dancing+Script|Lobster&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="./assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="./assets/images/apple-touch-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<script type="text/javascript" src="<c:url value='/assets/ckeditor/ckeditor.js' />"></script>
	<script type="text/javascript" src="<c:url value='/assets/ckfinder/ckfinder.js' />"></script>

	<base href="${pageContext.servletContext.contextPath }/">
	
	
	
</head>
<body>
	<div style="margin-left: 260px;">
		<img style="width: 60px; height: 60px; border-radius: 50%;" class="rounded-circle" src="./assets/images/${TKLogin.anh }">
		<span>Xin chào, ${TKLogin.hoten }</span>
	</div>
	<div id="logreg-form"
		style="width: 600px; margin: auto; margin-top: 50px; background-color: #f3f3f3; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); transition: all 0.3s cubic-bezier(.25, .8, .25, 1); padding: 20px;">
		<form:form action="${pageContext.request.contextPath }/admin/themDanhMuc" method="post" modelAttribute="danhmuc" style="width:100%; margin:auto;">
			<div>
				<p style="text-align: center; color: #b70002; font-family: 'Dancing Script', cursive; font-weight: bold; letter-spacing: 10; font-size: 40px; padding: 10px;">
					THÊM DANH MỤC
				</p>
			</div>
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Tên danh mục</h4>
				<form:input path="tendanhmuc" type="text" class="form-control" placeholder="Nhập tên danh mục"/>
			</div>
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Mã danh mục</h4>
				<form:input path="madanhmuc" type="text" class="form-control" placeholder="Nhập mã danh mục"/>
			</div>
			<div style="margin: 20px auto; width: 25%">
				<button class="btn btn-block" type="submit" style="padding: 5px; font-size: 20px; background-color: #b70002; color: white;">
					 Thêm
				</button>
			</div>
			<a href="${pageContext.request.contextPath }/admin" id="cancel_signup" style="font-size: 16px; margin: 10px; color: #000;">
				<i class="fa fa-arrow-circle-left"></i> Trở về trang chủ
			</a>
		</form:form>

		<br>

	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/LoginForm.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
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