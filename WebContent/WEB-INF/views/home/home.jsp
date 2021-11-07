<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- <div id="loader">
		<div id="status"></div>
	</div> -->
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
							<a class="navbar-brand js-scroll-trigger logo-header" href="#"
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
										<a href="${pageContext.request.contextPath}/login" data-toggle="tooltip" title="Đăng nhập"> 
											<img
											style="width: 30px; border-radius: 50%; background: transparent;"
											src="./assets/images/user1.png"
											alt="Chua co hinh">
										</a>
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
							<li class="active"><a style="padding:20px 3px;" 
								href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
							<li ><a style="padding:20px 3px;"  href="#">Tin tức</a></li>
							<li ><a style="padding:20px 3px;"  href="#">Giáo dục</a></li>
							<li ><a style="padding:20px 3px;"  href="#">Văn hóa</a></li>
							<li ><a style="padding:20px 3px;"  href="#">Đời sống</a></li>
							<li ><a style="padding:20px 3px;"  href="#">Thể thao</a></li>
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
									<div class="row ">
										<a href="#">
											<img style="width: 100%;" src="./assets/images/1572925980139ts1.jpg" alt="">
											<p style="text-align: justify; padding-top: 10px;" class="summary">Công nghệ thay đổi ngành điện TP HCM và Hà Nội</p>
										</a>
										<a href="#">
											<img style="width: 100%;" src="./assets/images/1573116426090ts1.jpg" alt="">
											<p style="text-align: justify; padding-top: 10px;" class="summary">Xem xét kiến nghị của cư dân phố cà phê đường tàu ở Hà Nội</p>
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-8 topNewsMain ">
								<div style="width: 95%; margin: auto;">
									<!-- ${TOPNEW.getIdbb()} -->
									<a href="#">
										<img style="width: 100%;" src="./assets/images/172460780.jpg" alt="">
										<div class="title" style="padding: 10px;">
											<a title="Top news">Vận động từ thiện phải mở tài khoản riêng</a>
										</div>
										<div class="colorDark text-justify" style="padding: 0px 10px;">
											<a>
												<p>VTV.vn - Cá nhân kêu gọi không được tiếp nhận thêm các khoản đóng góp tự nguyện sau khi kết thúc thời gian tiếp nhận đã cam kết</p>
											</a>
										</div>

									</a>
								</div>
							</div>
							<div class="col-sm-2 topNewRight">
								<div style="width: 95%; margin: auto;">
									<div class="row colorDark text-justify">
										<a href="#">
											<p>Hội nghị cấp cao ASEAN 35 ghi nhận nhiều kết quả hợp tác tích cực trong năm 2019</p>
										</a>
										<hr>
										<a href="#">
											<p>Nắng nóng kỷ lục kéo dài tại Australia</p>
										</a>
										<hr>
										<a href="#">
											<p>Nhật Bản chế tạo thiết bị thông minh sử dụng điện tạo ra từ mồ hôi</p>
										</a>
										<hr>
										<a href="#">
											<p>Giáo dục bảo tồn động vật hoang dã cho học sinh tiểu học</p>
										</a>
										<hr>
									</div>
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
							<div class="col-sm-4">
								<div style="width: 100%;">
									<div class="row">
										<a
											href="#">
											<img src="./assets/images/1572925980139ts1.jpg" alt="Ha Giang">

										</a>
									</div>
									<div class="row" style="margin-top: 10px; padding: 0 10px;">
										<a href="" class="summary text-justify">
											<p>Cẩm nang du lịch Hà Giang từ A đến Z</p>
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div style="width: 100%;">
									<div class="row">
										<a
											href="#">
											<img src="./assets/images/1572925980139ts1.jpg" alt="">

										</a>
									</div>
									<div class="row" style="margin-top: 10px; padding: 0 10px;">
										<a href="" class="summary text-justify">
											<p>Australia đóng cửa di sản thế giới Uluru</p>
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div style="width: 100%;">
									<div class="row">
										<a
											href="#">
											<img src="./assets/images/1572925980139ts1.jpg" alt="">

										</a>
									</div>
									<div class="row" style="margin-top: 10px; padding: 0 10px;">
										<a href="" class="summary text-justify">
											<p>Ứng dụng trong hệ thống tính cước thời gian thực của Viettel được cấp bằng bảo hộ độc quyền tại Mỹ</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--END SECOND NEWS  -->
				</div>
				<!--End MainContent -->

				<!--RightContent -->
				<div class="col-sm-3 sidenav RightContent">
					<div style="width: 97%; margin: auto; padding-left: 10px;">
						<a href="#"> <img src="./assets/images/phongchongThuocLa.png" alt=""></a>
						<a href="https://zingmp3.vn/zing-chart/index.html" target="_blank"> 
							<img style="padding: 10px 0px;" src="./assets/images/songvn2x.jpg" alt="">
						</a> 
						<a href="#">
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
					
						<div class="row colorDark text-justify" >
							<div class="col-sm-4">
								<a href="#">
									<img style="width: 100%; padding-right: 10px;"
									src="./assets/images/1572925980139ts1.jpg" alt="">
								</a>
							</div>
							<div class="col-sm-8">
								<a href="#"
									style="text-align: justify; padding-top: 0px;" class="title2">
									<p>GLTT: Dạy xác xuất thống kê từ lớp 2 có cần thiết?</p>
								</a>
								<p style="text-transform: uppercase;">GIÁO DỤC - 07/11/2019</p>
								<p class="text-justify;">VTV.vn - Chương trình tọa đàm với chủ đề "Dạy xác xuất thống kê từ lớp 2 có cần thiết?" sẽ lên sóng vào 20h ngày 6/11.</p>
							</div>
						</div>
						<hr>
						<div class="row colorDark text-justify" >
							<div class="col-sm-4">
								<a href="#">
									<img style="width: 100%; padding-right: 10px;"
									src="./assets/images/1572925980139ts1.jpg" alt="">
								</a>
							</div>
							<div class="col-sm-8">
								<a href="#"
									style="text-align: justify; padding-top: 0px;" class="title2">
									<p>GLTT: Dạy xác xuất thống kê từ lớp 2 có cần thiết?</p>
								</a>
								<p style="text-transform: uppercase;">GIÁO DỤC - 07/11/2019</p>
								<p class="text-justify;">VTV.vn - Chương trình tọa đàm với chủ đề "Dạy xác xuất thống kê từ lớp 2 có cần thiết?" sẽ lên sóng vào 20h ngày 6/11.</p>
							</div>
						</div>
						<hr>
						
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
								tiết 7g</a> <br> <a href="https://vtv.vn/du-bao-thoi-tiet.htm"  target="_blank"
								title="Dự báo thời tiết" class="boxweatherright_titlebox"
								style="line-height: 1.2">Bản tin thời tiết 7g
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
					<a href="#"> 
						<a class="dungbololeft" href="#" title="[INFOGRAPHIC]  Cách bảo vệ sức khỏe trước ô nhiễm không khí tại Hà Nội">
							<img src="./assets/images/onhiemkk.jpg" alt="">
						</a>
						<div class="dungboloright">
							<div class="title_box " style="display: flex;">
								<a style="color: black;" href="#" rel="nofollow">ĐỪNG BỎ LỠ</a> <span class="line"></span>
							</div>
							<div class="dungboloinfo">
								<h3>
									<a style="color: white;" href="#"
										title="[INFOGRAPHIC]  Cách bảo vệ sức khỏe trước ô nhiễm không khí tại Hà Nội">[INFOGRAPHIC]
										Cách bảo vệ sức khỏe trước ô nhiễm không khí tại Hà Nội</a>
								</h3>
							</div>
						</div>
					</a> 
					<span class="clearfix"></span> <span class="border sprite"></span>
				</div>
				<div class="col-sm-3 sidenav RightContent">
					<a href="#"> <img src="./assets/images/tuyendung.png" alt=""></a>
				</div>
			</div>

			<div style="margin: auto; padding-bottom: 20px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>
			
			<div class="row content marginBottom">
				<div class="col-sm-4  category_box5">
					<h2>
						<a href="#">CÔNG NGHỆ</a>
					</h2>
					<a href="#"> <img style="height: 270px;width:100%;"
						src="./assets/images/ipad.jpg" alt="">
					</a> 
				</div>
				<div class="col-sm-4  category_box5" style="margin:0px 5px;">
					<h2>
						<a href="#">GIÁO DỤC</a>
					</h2>
					<a href="#"> <img style="height: 270px;width:100%;"
						src="./assets/images/startup.png" alt="">
					</a> 
				</div>
				<div class="col-sm-4  category_box5">
					<h2>
						<a href="#">GIẢI TRÍ</a>
					</h2>
					<a href="#"> <img style="height: 270px;width:100%;"
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






























