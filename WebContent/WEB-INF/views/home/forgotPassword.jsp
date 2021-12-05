<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Forgot password</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display|Courgette|Dancing+Script|Lobster&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="./assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="./assets/images/apple-touch-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LoginForm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	<base href="${pageContext.servletContext.contextPath }/">
</head>
<body>
	<div id="logreg-forms">
		<form:form action="${pageContext.request.contextPath }/reset-password" modelAttribute="emailUser">
			<div>
				<form:input path="username" type="email" id="email" class="form-control" placeholder="Email" />
			</div>
			<form:errors path="username" style="color:red; padding:10px; font-size:12px" />
			<p style="padding:10px; color: #1ea29b;font-size:16px;">Ấn nút Gửi và kiểm tra email của bạn</p>
			<div>
				<button class="btn btn-primary btn-block" type="submit" style="font-size: 16px">Gửi</button>
			</div>
			<a href="${pageContext.request.contextPath }/home" id="cancel_signup" style="font-size: 14px; margin: 10px; color: #000;">
				<i class="fa fa-arrow-circle-left"></i> Trở về trang chủ
			</a>
		</form:form>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	
	<script type="text/javascript">
		function sendEmail() {
			
			$.post(
				'${pageContext.request.contextPath}/forgotPassword',
				{},
				function(res) {
					console.log(res);
					
					/* if(res.err != 0) {
						$('#error').html(res.message);
					} else {
						windown.location.replace('${pageContext.request.contextPath}/login');
						
					} */
				}
			);
		}
	</script>
</body>
</html>