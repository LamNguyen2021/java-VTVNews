<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Danh sách bài viết</title>
	<link rel="shortcut icon" href="d./assets/images/iconmini.png" type="image/png">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/styleAdmin.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/apple-touch-icon.png">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/sb-admin-2.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/adminPage/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />
	<link href="${pageContext.request.contextPath}/assets/adminPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<base href="${pageContext.servletContext.contextPath }/">
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>	
</head>
<body>
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
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

			<div class="container-fluid">
				<div>
					<a href="${pageContext.request.contextPath }/admin" id="cancel_signup" style="font-size: 16px;">
						<i class="fa fa-arrow-circle-left"></i> Trở về
					</a>
				</div>
				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0" style="text-transform: uppercase; color: #000">
						DANH SÁCH BÀI VIẾT THUỘC DANH MỤC ${TenDanhMuc }</h1>
					<a href="${pageContext.request.contextPath }/admin/themBaiBao" class="d-none d-sm-inline-block btn btn-sm shadow-sm" style="color: white; background-color: #b70002; font-size: 16px; text-decoration: none;">
						Thêm bài viết
					</a>
				</div>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-bordered dataTable no-footer"
											id="dataTable" width="100%" cellspacing="0" role="grid"
											aria-describedby="dataTable_info" style="width: 100%; color: #000">
											<thead>
												<tr role="row">
													<th>Tên bài viết</th>
													<th>Tóm tắt</th>
													<th>Hình ảnh</th>
													<!-- <th>Nội dung</th> -->
													<th>Ngày đăng</th>
													<th>Người đăng</th>
													<th>Sửa</th>
													<th>Xóa</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="u" items="${DanhSachBaiBao }">
													<tr style="height: 200px;">
														<td>${u.tieude }</td>
														<td>${u.tomtat }</td>
														<td><img style="width: 150px; height: 100px;" src="${pageContext.servletContext.contextPath }/assets/images/${u.hinhanh1}"></td>
														<%-- <td>${u.noidung1 }</td> --%>
														<td>${u.ngaydang }</td>
														<td>${u.taikhoan.username }</td>
														<td>
															<c:choose>
																<c:when test="${u.getTaikhoan().getUsername().equals(TKLogin.getUsername())}">
																	<a href="${pageContext.request.contextPath }/admin/suaBaiBao/${u.idbb}">
																		<button class="btn btn-primary btn-xs">
																			<span class="glyphicon glyphicon-pencil"></span>
																		</button>
																	</a>
																</c:when>
																<c:otherwise>
																	<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" style="opacity: 0.3">
																		<span class="glyphicon glyphicon-pencil"></span>
																	</button>
																</c:otherwise>
															</c:choose>
															
														</td>	
														<td>
															<c:choose>
																<c:when test="${u.getTaikhoan().getUsername().equals(TKLogin.getUsername())}">
																	<a href="#">
																		<button class="btn btn-danger btn-xs">
																			<span class="glyphicon glyphicon-trash"></span>
																		</button>
																	</a>
																</c:when>
																<c:otherwise>
																	<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" style="opacity: 0.3">
																		<span class="glyphicon glyphicon-trash"></span>
																	</button>
																</c:otherwise>
															</c:choose>
															
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
		</div>
		<!-- End Main Content -->

	</div>
	<!-- End Content Wrapper -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất?</h5>
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
	
	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Bạn không thể chỉnh sửa bài viết này</h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> 
						Chỉ tác giả mới được chỉnh sửa bài viết
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-share-alt"
							style="padding-right: 10px;"></span>Quay lại
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">
						Bạn không thể xóa bài viết này</h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> 
						Chỉ tác giả mới được xóa bài viết
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-share-alt" style="padding-right: 10px;"></span>
						Quay lại
					</button>
				</div>
			</div>
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