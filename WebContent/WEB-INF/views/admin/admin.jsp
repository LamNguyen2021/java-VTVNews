<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin</title>
	<link rel="shortcut icon" href="./assets/images/iconmini.png" type="image/png">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.icon" type="image/x-icon" />
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/apple-touch-icon.png">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/sb-admin-2.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/styleAdmin.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<link href="${pageContext.request.contextPath}/assets/adminPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	<base href="${pageContext.servletContext.contextPath }/">
	
</head>
<body>
	<!-- Sidebar -->
	<div>
		<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #b70002">

			<!-- Sidebar-IconSmile  -->
			<li style="padding: 7px 0;">
				<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-laugh-wink"></i>
					</div>
					<div class="sidebar-brand-text mx-3">Admin</div>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item" style="padding: 5px 0">
				<a class="nav-link" href="${pageContext.request.contextPath }/admin">
					<i class="fa fa-user" style="font-size: 16px"></i>
					<span style="font-size: 16px">Tài khoản</span>
				</a>
			</li>

			<!-- Divider -->
			<!-- <hr class="sidebar-divider"> -->

			<!-- Heading -->
			<!-- <li class="nav-item active">
				<a class="nav-link" href="#">
					<i class="fas fa-fw fa-tachometer-alt"></i> 
					<span>Nội dung</span>
				</a>
			</li> -->

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item" style="padding: 5px 0">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fa fa-file-signature" style="font-size: 16px"></i>
					<span style="font-size: 16px">Bài viết</span>
				</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Lựa chọn danh mục</h6>
						<a style="padding: 20px 10px;" href="#">
							<button style="font-size: 12px;">
								<span class="glyphicon glyphicon-plus-sign"></span> 
								Thêm danh muc
							</button>
						</a>
						<c:forEach var="u" items="${DM }">
							<div style="display: flex; border-bottom: 1px solid red;">
								<a class="collapse-item" href="${pageContext.request.contextPath }/admin/danhmuc/${u.madanhmuc}" 
									style="text-transform: uppercase;">${u.tendanhmuc }
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</li>
				
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Sidebar Toggler (Sidebar) -->
			<li style="margin: 10px;">
				<a href="${pageContext.request.contextPath }/home" id="cancel_signup" style="font-size: 16px; margin: 10px; color: #fff;">
					<i class="fa fa-arrow-circle-left"></i> Trở về trang chủ
				</a>
			</li>
			<!-- <div class="text-center d-none d-md-inline" style="padding-top: 20px;">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div> -->

		</ul>
	</div>
	<!-- End of Sidebar -->
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">
					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" 
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">Xin chào, ${TKLogin.hoten }</span> 
							<img style="width: 40px; height: 40px;" class="img-profile rounded-circle" src="./assets/images/${TKLogin.anh }">
						</a> 
						
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="${pageContext.request.contextPath }/update-profile">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Hồ sơ
							</a>
							<div class="dropdown-divider"></div>
							<a href="${pageContext.request.contextPath}/logout" class="dropdown-item">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Đăng xuất
							</a>
						</div>
					</li>
				</ul>
			</nav>
			<!-- End of Topbar -->


			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">DANH SÁCH TÀI KHOẢN</h1>
					<form class="d-none d-sm-inline-block btn btn-sm shadow-sm" style="background-color:#b70002;">
						<a href="${pageContext.request.contextPath }/register" style="color: white; text-decoration: none; font-size: 16px">
							Thêm tài khoản 
						</a>
					</form>
				</div>


				<!-- Content Row -->
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-bordered dataTable no-footer"
											id="dataTable" width="100%" cellspacing="0" role="grid"
											aria-describedby="dataTable_info" style="width: 100%; color: black;">
											<thead>
												<tr role="row">
													<th>Ảnh đại diện</th>
													<th>Họ tên</th>
													<th>Email</th>
													<th>Mật khẩu</th>
													<th>Số điện thoại</th>
													<th>Giới tính</th>
													<th>Vai trò</th>
													<th>Xóa</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="u" items="${taikhoan }">
													<tr>
														<td>
															<img src="./assets/images/${u.anh}"
															style="width: 50px; heigth: 70px !important;">
														</td>
														<td>${u.hoten}</td>
														<td>${u.username}</td>
														<td>${u.password}</td>
														<td>${u.sdt}</td>
														<td>${u.gioitinh}</td>
														<td>
															<c:choose>
																<c:when test="${u.vaitro == 0}">
																	<select name="vaitro">
																		<option selected="selected" label="Member">
																		<option label="Admin">
																	</select>
																	<a href="setAdmin/${u.username}">Update</a>
																</c:when>
																<c:otherwise>
																	<p>Admin</p>
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<button class="btn btn-danger btn-xs" data-title="Delete">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Page Content -->

		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		<!-- End of Footer -->
	</div>
	<!-- End of Content Wrapper -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng
						xuất?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Lựa chọn 'ĐĂNG XUẤT' bên dưới nếu bạn
					chắc chắn đăng xuất</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">HỦY</button>
					<a class="btn btn-primary" href="login.html">ĐĂNG XUẤT</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Delete Modal-->
	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="delete" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Xóa tài
						khoản</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Tai khoan khong the xoa
						
					</div>

				</div>
				<div class="modal-footer ">

					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-share-alt"></span>Quay lại
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	
	<div class="modal fade" id="deleteSsc" tabindex="-1" role="dialog"
		aria-labelledby="deleteSsc" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Xóa tài
						khoản</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Đây là tài
						khoản Admin
						<p>Bạn không thể xóa</p>
					</div>

				</div>
				<div class="modal-footer ">

					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-share-alt"></span>Quay lại
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#mytable #checkall").click(function() {
				if ($("#mytable #checkall").is(':checked')) {
					$("#mytable input[type=checkbox]").each(function() {
						$(this).prop("checked", true);
					});

				} else {
					$("#mytable input[type=checkbox]").each(function() {
						$(this).prop("checked", false);
					});
				}
			});

			$("[data-toggle=tooltip]").tooltip();
		});
	</script>
	
	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/assets/adminPage/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/adminPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/assets/adminPage/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/assets/adminPage/js/sb-admin-2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/adminPage/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/assets/adminPage/js/demo/chart-area-demo.js"></script>
	<script src="${pageContext.request.contextPath}/assets/adminPage/js/demo/chart-pie-demo.js"></script>

	<!-- ALL JS FILES -->
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="./assets/js/custom.js"></script>
</body>
</html>