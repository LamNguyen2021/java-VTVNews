<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Báo điện tử VTV News</title>
	<link rel="shortcut icon" href="./assets/images/iconmini.png" type="image/png">
	<link rel="apple-touch-icon" href="./assets/images/apple-touch-icon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
	<link id="changeable-colors" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/colors/orange.css" />

	<!-- Modernizer -->
	<script src="${pageContext.request.contextPath}/assets/js/modernizer.js"></script>
	<base href="${pageContext.servletContext.contextPath }/">

	<style type="text/css">
		.abc {
			background-image: url(./assets/images/banner.png) !important;
			background-repeat: no-repeat;
			background-size: cover;
			color: #d2cbcb !important;
		}
		.dropdown-menu a {
			font-size: 10px !important;
		}
	</style>


</head>
<body>
	<div id="loader">
		<div id="status"></div>
	</div>
	<header id="header" class="header-block-top backgroungRed">
		<div class="container">

			<div class="main-menu" style="padding-top:4px;">

				<!-- navbar -->
				<nav class="navbar navbar-default ">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div class="logo">
							<a class="navbar-brand js-scroll-trigger logo-header" href="${pageContext.request.contextPath}/home"
								data-toggle="tooltip" title="Báo điện tử VTV News"> <img
								src="./assets/images/logoNews.png" alt="">
							</a>
						</div>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav-top">
							<li class="nav-top">
								<div class="login">
									<div style="display: flex; align-items: center; justify-content: space-between;">
										<c:choose>
											<c:when test="${TKLogin.getAnh()!=null && TKLogin.getVaitro()==0}">
												<h4 style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
													${TKLogin.getHoten()}
												</h4>
												<img class="dropdown-toggle" data-toggle="dropdown"
													style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
													src="assets/images/${TKLogin.getAnh()}" />
												<ul class="dropdown-menu" style="color: black; margin-left: 900px; top: 50px;">
													<li style="display: flex;">
														<span class="glyphicon glyphicon-cog" style="color: #d1d3e2; background-color: white;"></span>
														<a style="color: black; background-color: white;" href="${pageContext.request.contextPath }/update-profile"> Hồ Sơ</a>
													</li>
													<li style="display: flex;">
														<span class="glyphicon glyphicon-off" style="color: #d1d3e2; background-color: white;"></span>
														<a style="color: black;" href="${pageContext.request.contextPath}/logout">Đăng Xuất</a>
													</li>
												</ul>
											</c:when>
											<c:when test="${TKLogin.getAnh()==null && TKLogin.getVaiTro()==0 && TKLogin.getGioitinh().equals('Nam')}">
													<h4
														style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
														${TKLogin.getHoten()}</h4>
													<img class="dropdown-toggle" data-toggle="dropdown"
														style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
														src='<c:url value="./assets/images/nam.png"></c:url>' />
													<ul class="dropdown-menu"
														style="color: black; margin-left: 900px; top: 50px;">
														<li style="display: flex;"><span
															class="glyphicon glyphicon-cog"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black; background-color: white;"
															href="${pageContext.request.contextPath }/update-profile"> Hồ Sơ</a></li>
														<li style="display: flex;"><span
															class="glyphicon glyphicon-off"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;"
															href="${pageContext.request.contextPath}/logout">Đăng
																Xuất</a></li>
													</ul>
											</c:when>
											<c:when test="${TKLogin.getAnh()==null && TKLogin.getVaiTro()==0 && TKLogin.getGioitinh().equals('Nữ')}">
													<h4 style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
														${TKLogin.getHoten()}</h4>
													<button class="dropdown-toggle" data-toggle="dropdown" type="button">
														<img
														style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
														src='<c:url value="./assets/images/nu.png"></c:url>' />			
													</button>
													<ul class="dropdown-menu" style="color: black; margin-left: 900px; top: 50px;">
														<li class="dropdown-item" style="display: flex;"><span class="glyphicon glyphicon-cog" style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black; background-color: white;" href="${pageContext.request.contextPath }/update-profile">Hồ Sơ</a>
														</li>
														<li class="dropdown-item" style="display: flex;"><span
															class="glyphicon glyphicon-off"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;"
															href="${pageContext.request.contextPath}/logout">Đăng
																Xuất</a></li>
													</ul>
											</c:when>
											<c:when test="${TKLogin.getAnh()!=null && TKLogin.getVaitro()==1}">
												<h4 style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
													${TKLogin.getHoten()}
												</h4>
												<img class="dropdown-toggle" data-toggle="dropdown"
													style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
													src="assets/images/${TKLogin.getAnh()}" />
												<ul class="dropdown-menu" style="color: black; margin-left: 900px; top: 50px;">
													<li style="display: flex;">
														<span class="glyphicon glyphicon-cog" style="color: #d1d3e2; background-color: white;"></span>
														<a style="color: black; background-color: white;" href="${pageContext.request.contextPath }/update-profile"> Hồ Sơ</a>
													</li>
													<li style="display: flex;">
														<span class="glyphicon glyphicon-user" style="color: #d1d3e2; background-color: white;"></span>
														<a style="color: black;" href="${pageContext.request.contextPath}/admin">
															Đăng Nhập Admin
														</a>
													</li>
													<li style="display: flex;">
														<span class="glyphicon glyphicon-off" style="color: #d1d3e2; background-color: white;"></span>
														<a style="color: black;" href="${pageContext.request.contextPath}/logout">Đăng Xuất</a>
													</li>
												</ul>
											</c:when>
											<c:when test="${TKLogin.getAnh()==null && TKLogin.getVaiTro()==1 && TKLogin.getGioitinh().equals('Nam')}">
													<h4
														style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
														${TKLogin.getHoten()}</h4>
													<img class="dropdown-toggle" data-toggle="dropdown"
														style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
														src='<c:url value="./assets/images/nam.png"></c:url>' />
													<ul class="dropdown-menu"
														style="color: black; margin-left: 900px; top: 50px;">
														<li style="display: flex;"><span
															class="glyphicon glyphicon-cog"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black; background-color: white;"
															href="${pageContext.request.contextPath }/update-profile"> Hồ Sơ</a></li>
														<li style="display: flex;">
															<span class="glyphicon glyphicon-user" style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;" href="${pageContext.request.contextPath}/admin">
																Đăng Nhập Admin
															</a>
														</li>
														<li style="display: flex;"><span
															class="glyphicon glyphicon-off"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;"
															href="${pageContext.request.contextPath}/logout">Đăng
																Xuất</a></li>
													</ul>
											</c:when>
											<c:when test="${TKLogin.getAnh()==null && TKLogin.getVaiTro()==1 && TKLogin.getGioitinh().equals('Nữ')}">
													<h4
														style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
														${TKLogin.getHoten()}</h4>
													<img class="dropdown-toggle" data-toggle="dropdown"
														style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
														src='<c:url value="./assets/images/nam.png"></c:url>' />
													<ul class="dropdown-menu"
														style="color: black; margin-left: 900px; top: 50px;">
														<li style="display: flex;"><span
															class="glyphicon glyphicon-cog"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black; background-color: white;"
															href="${pageContext.request.contextPath }/update-profile"> Hồ Sơ</a></li>
														<li style="display: flex;">
															<span class="glyphicon glyphicon-user" style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;" href="${pageContext.request.contextPath}/admin">
																Đăng Nhập Admin
															</a>
														</li>
														<li style="display: flex;"><span
															class="glyphicon glyphicon-off"
															style="color: #d1d3e2; background-color: white;"></span>
															<a style="color: black;"
															href="${pageContext.request.contextPath}/logout">Đăng
																Xuất</a></li>
													</ul>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/login" data-toggle="tooltip" title="Đăng nhập"> 
													<img
													style="width: 30px; height: 30px; border-radius: 50%; background: transparent;"
													src="./assets/images/user1.png"
													alt="Chua co hinh">
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="search">
									<form class="example" action="/action_page.php"
										style="margin: auto; max-width: 300px">
										<input type="text" placeholder="Tìm kiếm ..." name="search2">
										<button type="submit">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</div>

							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right menuBottom">
							<li class="active">
								<a style="padding:20px 3px;" href="${pageContext.request.contextPath}/home">Trang chủ</a>
							</li>
							<c:forEach var="u" items="${DM}">
								<li >
									<a style="padding:20px 3px;"  href="${pageContext.request.contextPath}/danh-muc/${u.madanhmuc}">${u.tendanhmuc}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end nav-collapse -->
				</nav>
				<!-- end navbar -->
			</div>

		</div>
		<!-- end container -->
	</header>

	<!-- Home Content -->
	<div id="HomeContent">
		<div class="container ">
			<div class="row content">
			
				<!--MainContent -->
				<div class="col-sm-9 MainContent ">

					<!--TOP NEWS -->
					<div class="row ">
						<div class="topNews ">
							<div class="col-sm-2 topNewsLeft">
								<div style="width: 97%; margin: auto;">
									<c:forEach var="u" items="${BB45}">
										<div class="row ">
											<a href="${pageContext.request.contextPath}/bai-viet/${u.idbb}">
												<img style="width: 100%;" src="./assets/images/${u.hinhanh1 }" alt="${u.tieude }">
												<p style="text-align: justify; padding-top: 10px;" class="summary">${u.tieude }</p>
											</a>
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-8 topNewsMain ">
								<div style="width: 95%; margin: auto;">
									<!-- ${TOPNEW.getIdbb()} -->
									<a href="${pageContext.request.contextPath}/bai-viet/${TOPNEW.getIdbb()}">
										<img style="width: 100%;" src="./assets/images/${TOPNEW.getHinhanh1() }" alt="${TOPNEW.getTieude() }">
										<div class="title" style="padding: 10px;">
											<a title="Top news">${TOPNEW.getTieude() }</a>
										</div>
										<div class="colorDark text-justify" style="padding: 0px 10px;">
											<a>
												<p>${TOPNEW.getTomtat() }</p>
											</a>
										</div>

									</a>
								</div>
							</div>
							<div class="col-sm-2 topNewRight">
								<div style="width: 95%; margin: auto;">
									<c:forEach var="u" items="${listRight }">
										<div class="row colorDark text-justify">
											<a href="${pageContext.request.contextPath}/bai-viet/${u.idbb}">
												<p>${u.tieude }</p>
											</a>
											<hr>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div style="margin: auto; padding-bottom: 20px;"
						class="row content">
						<div class="border_bottom_box"></div>
					</div>
					<!--End TOP NEWS -->

					<!--SECOND NEWS -->
					<div class="row marginBottom">
						<div class="secondNews text-justify">
							<c:forEach var="u" items="${TOP3 }">
								<div class="col-sm-4">
									<div style="width: 100%;">
										<div class="row">
											<a
												href="${pageContext.request.contextPath}/bai-viet/${u.idbb}">
												<img src="./assets/images/${u.hinhanh1 }" alt="${u.tieude }">
	
											</a>
										</div>
										<div class="row" style="margin-top: 10px; padding: 0 10px;">
											<a href="${pageContext.request.contextPath}/bai-viet/${u.idbb}" class="summary text-justify">
												<p>${u.tieude }</p>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!--END SECOND NEWS  -->
				</div>
				<!--End MainContent -->

				<!--RightContent -->
				<div class="col-sm-3 sidenav RightContent">
					<div style="width: 97%; margin: auto; padding-left: 10px;">
						<a href="${pageContext.request.contextPath}/bai-viet/${thuocLa.idbb}"> <img src="./assets/images/phongchongThuocLa.png" alt="${thuocLa.tieude }"></a>
						<a href="https://zingmp3.vn/zing-chart/index.html" target="_blank"> 
							<img style="padding: 10px 0px; width: 95%" src="./assets/images/songvn2x.jpg" alt="">
						</a> 
						<a href="https://mazdamotors.vn/" target="_blank">
						 	<img style="height: 100%;" src="./assets/images/carRight.png" alt="">
						</a>
					</div>
				</div>
				<!--End RightContent -->
			</div>

			<div style="margin: auto; padding-bottom: 20px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>
			
			<div class="row content ">
				<div class="col-sm-9 MainContent " style="padding-top: 20px;">
					<div class="row marginBottom">
						<c:forEach var="u" items="${timeBBFormat }">
							<div class="row colorDark text-justify" >
								<div class="col-sm-4">
									<a href="${pageContext.request.contextPath}/bai-viet/${u.bb.idbb}">
										<img style="width: 100%; padding-right: 10px;"
										src="./assets/images/${u.bb.hinhanh1 }" alt="${u.bb.tieude }">
									</a>
								</div>
								<div class="col-sm-8">
									<a href="${pageContext.request.contextPath}/bai-viet/${u.bb.idbb}"
										style="text-align: justify; padding-top: 0px;" class="title2">
										<p>${u.bb.tieude }</p>
									</a>
									<p style="text-transform: uppercase;">${u.bb.danhmuc.tendanhmuc } - ${u.time }</p>
									<p class="text-justify;">${u.bb.tomtat }</p>
								</div>
							</div>
						<hr>
						</c:forEach>						
					</div>
				</div>

				<div class="col-sm-3 sidenav RightContent">
					<div class="boxweatherright">
						<div class="flex .weather-title">
							<a href="https://vtv.vn/du-bao-thoi-tiet.htm"  target="_blank" style="font-size: 20px; font-weight: bold;">
								<div class="imgWeather">
									<img src="./assets/images/home_thoitiet.gif">
								</div> THỜI TIẾT HÀNG NGÀY
							</a>
						</div>
						<a href="https://vtv.vn/du-bao-thoi-tiet.htm"  target="_blank" title="Bản tin thời tiết"
							alt="Bản tin thời tiết "> <img
							src="./assets/images/thoitiet.jpg">
						</a>
						<div class="boxweatherright_content">
							<a href="https://vtv.vn/du-bao-thoi-tiet.htm"  target="_blank" class="boxweatherright_title"
								style="font-size: 15px; font-weight: bold;">Bản tin thời
								tiết ${date }</a> <br> <a href="https://vtv.vn/du-bao-thoi-tiet.htm"  target="_blank"
								title="Dự báo thời tiết" class="boxweatherright_titlebox"
								style="line-height: 1.2">Bản tin thời tiết ${date }
								với nội dung: Diễn biến thời tiết các vùng biển...</a>
						</div>
						<div class="temp">
							<span class="title">Thời tiết</span>
							<ul id="weathertempright">

							</ul>
						</div>
					</div>

					<a href=""> <img style="height: 500px; padding-bottom: 20px;width: 100%;"
						src="./assets/images/imgRight.jpg" alt="">
					</a>
				</div>
			</div>

			<div style="margin: auto; padding-bottom: 20px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>

			<div class="row content tlitem dungbolo " id="timelineItem2" style="padding-bottom: 40px;">
				<div class="col-sm-9 MainContent ">
					<div> 
						<a class="dungbololeft" href="${pageContext.request.contextPath}/bai-viet/${oNhiemMT.getIdbb()}">
							<img src="./assets/images/onhiemkk.jpg" alt="">
						</a>
						<div class="dungboloright">
							<div class="title_box " style="display: flex;">
								<a style="color: black;" href="${pageContext.request.contextPath}/bai-viet/${oNhiemMT.getIdbb()}" rel="nofollow">ĐỪNG BỎ LỠ</a> <span class="line"></span>
							</div>
							<div class="dungboloinfo">
								<h3>
									<a style="color: white;" href="${pageContext.request.contextPath}/bai-viet/${oNhiemMT.getIdbb()}">${oNhiemMT.tieude }</a>
								</h3>
							</div>
						</div>
					</div> 
					<span class="clearfix"></span> <span class="border sprite"></span>
				</div>
				<div class="col-sm-3 sidenav RightContent">
					<a href="${pageContext.request.contextPath}/bai-viet/${tuyenDung.getIdbb()}"> <img src="./assets/images/tuyendung.png" alt="${tuyenDung.tieude }"></a>
				</div>
			</div>

			<div style="margin: auto; padding-bottom: 20px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>
			
			<div class="row content marginBottom">
				<div class="col-sm-4  category_box5">
					<h2>
						<a href="${pageContext.request.contextPath}/danh-muc/3CN">CÔNG NGHỆ</a>
					</h2>
					<a href="${pageContext.request.contextPath}/danh-muc/3CN"> <img style="height: 270px;width:100%;"
						src="./assets/images/ipad.jpg" alt="">
					</a> 
				</div>
				<div class="col-sm-4  category_box5" style="margin:0px 5px;">
					<h2>
						<a href="${pageContext.request.contextPath}/danh-muc/4GD">GIÁO DỤC</a>
					</h2>
					<a href="${pageContext.request.contextPath}/danh-muc/4GD"> <img style="height: 270px;width:100%;"
						src="./assets/images/startup.png" alt="">
					</a> 
				</div>
				<div class="col-sm-4  category_box5">
					<h2>
						<a href="${pageContext.request.contextPath}/danh-muc/GT">GIẢI TRÍ</a>
					</h2>
					<a href="${pageContext.request.contextPath}/danh-muc/GT"> <img style="height: 270px;width:100%;"
						src="./assets/images/abominable1.jpg" alt="">
					</a>
				</div>
			</div>
			
		</div>
	</div>
	<!-- end Home Content  -->
	
	<footer id="footer" class="abc">
		<div class="Footer">
			<div class="container ">
				<div class="row " style="margin-bottom: 20px;">
					<div class="col-sm-4 ">
						<div class="footer-box-c ">
							<h3>GIỚI THIỆU</h3>
							<ul>
								<li><span>MSSV: N16DCCN082</span></li>
								<br>
								<li><span>LỚP: D16CQIS01-N</span></li>
								<br>
								<li><span>HỌ & TÊN: NGUYỄN NGỌC LÂM</span></li>

							</ul>
						</div>
					</div>

					<div class="col-sm-4 ">
						<div class="footer-box-c ">
							<h3>LIÊN HỆ</h3>
							<ul>
								<li><i style="padding-right: 20px;" class="fa fa-mobile"
									aria-hidden="true"></i> <span>SĐT: 0932768810</span></li>
								<li><i class="fa fa-envelope" aria-hidden="true"></i> <span>EMAIL:
										9.4ngoclam@gmail.com</span></li>
								<li><i class="fa fa-map-signs" aria-hidden="true"></i> <span>ĐỊA
										CHỈ: 52/8, ấp 1, xã Xuân Thới Sơn, Hóc Môn, TpHCM</span></li>

							</ul>
						</div>

					</div>
					<div class="col-sm-4 ">
						<div class="footer-box-c ">
							<h3>QUẢNG CÁO</h3>
							<ul>
								<li><span>NTN's New Page cung cấp nhiều hình thức
										cho phép doanh nghiệp tiếp cận đến bạn đọc một cách hiệu quả
										nhất. Để tìm hiểu, vui lòng liên hệ:</span></li>
								<li><i style="padding-right: 20px;" class="fa fa-mobile"
									aria-hidden="true"></i> <span>SĐT: 0932768810</span></li>

							</ul>
						</div>

					</div>

				</div>

				<div class="row copyright-main">
					<p class="copy-title">Copyright © 2021 is powered
						by NGUYEN NGOC LAM</p>
				</div>
			</div>
		</div>
	</footer>
	
	<a href="#" class="scrollup" style="display: none;">Scroll</a>
	<!-- ALL JS FILES -->
	<script src="./assets/js/all.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="./assets/js/custom.js"></script>
</body>
</html>






























