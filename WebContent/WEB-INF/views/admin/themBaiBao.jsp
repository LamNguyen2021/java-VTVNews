<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Thêm bài báo</title>
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
	
	<style type="text/css">
		.custom-file-input::-webkit-file-upload-button {
			visibility: hidden;
		}
		
		.custom-file-input::before {
			content: 'Lựa chọn tệp hình ảnh';
			display: inline-block;
			background: linear-gradient(top, #f9f9f9, #e3e3e3);
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
	<div style="margin-left: 260px;">
		<img style="width: 60px; height: 60px; border-radius: 50%;" class="rounded-circle" src="./assets/images/${TKLogin.anh }">
		<span>Xin chào, ${TKLogin.hoten }</span>
	</div>
	<div id="logreg-form"
		style="width: 1000px; margin: auto; margin-top: 50px; background-color: #f3f3f3; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); transition: all 0.3s cubic-bezier(.25, .8, .25, 1); padding: 20px;">
		<form:form action="${pageContext.request.contextPath }/admin/themBaiBao" method="post" modelAttribute="baibao" enctype="multipart/form-data" style="width:95%; margin:auto;">
			<div>
				<p style="text-align: center; color: #b70002; font-family: 'Dancing Script', cursive; font-weight: bold; letter-spacing: 10; font-size: 40px; padding: 10px;">
					THÊM BÀI BÁO
				</p>
			</div>
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Danh mục bài báo</h4>
				<form:select path="danhmuc.madanhmuc" 
					items="${DanhMuc }" itemValue="madanhmuc" 
					itemLabel="tendanhmuc" style="padding: 5px; 
					text-transform: uppercase; border-radius: 4px;">
				</form:select>
			</div>
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Tiêu đề bài báo</h4>
				<form:input path="tieude" type="text" class="form-control" placeholder="Nhập tiêu đề bài báo"/>
				<form:errors path="tieude" style="color:red; font-size: 12px" />
			</div>
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Nội dung tóm tắt</h4>
				<form:textarea path="tomtat" class="form-control" rows="5" style="resize: none" placeholder="Nhập khoảng 30 - 150 từ tóm tắt nội dung bài báo"></form:textarea>
				<form:errors path="tomtat" style="color:red; font-size: 12px" />
			</div>	
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Hình ảnh</h4>
				<input class="form-control custom-file-input" type="file" name="anh" style="height: 44px; padding: 0;"/>	
			</div>	
			<div style="padding: 10px;">
				<h4 style="color: #b70002; font-weight: bold;">Nội dung</h4>
				<!-- <textarea path="noidung1" name="ckeditorNoiDung" class="form-control" rows="5" id="comment"></textarea> -->
				<form:textarea path="noidung1" id="ckeditorNoiDung" class="form-control" rows="5"/>
				<form:errors path="noidung1" style="color:red; font-size: 12px" />
			</div>
			<div style="margin: 20px auto; width: 20%">
				<button class="btn  btn-block" type="submit" style="padding: 5px; font-size: 20px; background-color: #b70002; color: white;">
					 Thêm bài báo
				</button>
			</div>
			<a href="${pageContext.request.contextPath}/admin" id="cancel_signup" style="font-size: 16px; margin: 10px; color: #000;">
				<i class="fa fa-arrow-circle-left"></i> Trở về trang chủ
			</a>
		</form:form>

		<br>

	</div>
	<script>
		initSample();
		initSample1();
	</script>
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
	<script>
		var ckeditor = CKEDITOR.replace('ckeditorNoiDung');
		CKFinder.setupCKEditor(ckeditor, '${pageContext.request.contextPath}/assets/ckfinder/');
	</script>
</body>
</html>