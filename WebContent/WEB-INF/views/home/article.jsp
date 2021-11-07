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
	<div style="margin-top: 160px;">
		<div class="container ">
			<div class="row content">
			
				<!--MainContent -->
				<div class="col-sm-9 ">
					<div class="detail_left border_right adm-leftsection" style="background-color: white; width: 100%;">
						<div class="">
						
							<!-- LEFT ARTICLLE  -->
							<div class="" style="width: 800px; margin: auto;">
								<div class="">
									<p class="" style="padding-top: 10px;">
										<a
											style="border-bottom: 4px solid #d6090a; text-transform: uppercase; padding-bottom: 10px; font-size: 17px; font-weight: bold;"
											href="#" title="">THẾ GIỚI</a>
										<a class="sprite"></a>
									</p>
								</div>
								<h1 class="title_detail" data-field="title">Australia đóng cửa di sản thế giới Uluru</h1>
								<p class="author">
									<i class="glyphicon glyphicon-user"></i>
									Nguyễn Ngân
									<span class="time"
										style="padding: 0 5px 0;">-<i
										class="glyphicon glyphicon-time" style="padding-left: 5px;"></i>2019-11-11
									</span>
								</p>

								<img class="news-avatar" data-field="firstphoto" alt=""
									src="./assets/images/1572925980139ts1.jpg" width="100%">
								<div class="avatar-desc">(nguồn sưu tầm)</div>


								<div data-field="body" class="ta-justify" id="entry-body">
									<p class="text-justify" style="padding: 10px 0px;">
										Uluru là một ngọn núi sa thạch lớn với chiều dài 349m, còn được biết đến với tên gọi là 
										Ayers Rock nằm ở trung tâm công viên quốc gia Uluru-Kata Tjuta thuộc lãnh thổ phía bắc 
										Australia. Đây là một địa điểm thu hút khách du lịch hàng đầu ở Australia nhờ khả năng 
										tự đổi màu vào các thời điểm khác nhau trong ngày của khối đá khổng lồ.
									</p>

									<%-- <c:choose>
										<c:when test='${BaiViet.getHinhanh2()!=null}'>
											<div class="VCSortableInPreviewMode" type="Photo" style="">
												<div>
													<img src="./assets/images/${BaiViet.getHinhanh2()}"
														style="">
												</div>
												<div class="PhotoCMS_Caption">
													<p data-placeholder="[nhập chú thích]" class="">( nguồn
														sưu tầm)</p>
												</div>
											</div>
											<p class="text-justify" style="padding: 10px 0px;">
												${BaiViet.getNoidung2()}</p>
										</c:when>
										<c:otherwise>
											<p class="text-justify" style="padding-bottom: 20px;">${BaiViet.getNoidung2()}</p>
										</c:otherwise>
									</c:choose> --%>
									
								</div>

								<div class="clearfix"></div>
								<div class="clearfix chiase bottom-social" style="margin-top: 20px;">
									<ul class="bottom-sharing fl" style="display: flex;">
										<li style="font-size: 15px; padding: 0px 15px;">
											<button
												style="background: #3475c7; padding: 5px; color: white; font-weight: bold; border: none; border-radius: 3px;">
												<i class="glyphicon glyphicon-thumbs-up"></i> Thích
											</button>
										</li>
										<li class="fanpage">
											<button
												style="background: #3475c7; padding: 5px; color: white; font-weight: bold; border: none; border-radius: 3px;">
												<i class="glyphicon glyphicon-share-alt"></i> Chia sẻ
											</button>
										</li>
									</ul>
									<div style="width: 100%; margin: auto; padding: 15px; background: #f3f9ff; margin-top: 10px;">
										<div style="display: flex;">
											<h4 style="padding: 10px 10px; font-weight: bold;">BÌNH LUẬN</h4>
											<div style="margin-left: auto; color: #6b7177;">
												<a style="padding: 10px; color: #6b7177;"
													href="${pageContext.request.contextPath}/login"> <i
													class="glyphicon glyphicon-user"></i> Đăng nhập
												</a> <a style="padding: 10px; color: #6b7177;"
													href="${pageContext.request.contextPath}/register"> <i
													class="glyphicon glyphicon-plus"></i> Đăng ký
												</a>
											</div>
										</div>
										<hr>
										<div style="margin-top: 20px;">
											<div style="display: flex; align-items: center; padding: 10px;">
												<img
													style="width: 50px;height:50px; border-radius: 50%; margin-right: 10px;"
													src="./assets/images/${u.bl.taikhoan.anh}">
												<p>
													<span
														style="padding-right: 5px; font-size: 15px; font-weight: bold; color: #3475c7;">Thu Kara:</span>
													chưa đi đã đóng cửa huhu
												</p>
												<div style="margin-left: auto;display:flex;">
													<p style="padding-right:10px;color:#69d0cb;">18/09/2019</p>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="clearfix"></div>
								<div class="tinlienquan clearfix">
									<h3 style="padding-top: 20px;">TIN LIÊN QUAN</h3>
									<ul>
										<li style="padding-bottom: 10px;">
											<i class="glyphicon glyphicon-tags" style="padding-right: 10px;"></i> 
												<a style="font-size: 16px; color: #105cbb" title=""
													href="#"
													data-nocheck="1">Nắng nóng kỷ lục kéo dài tại Australia
												</a>
										</li>
									</ul>
								</div>
							</div>
							<!-- END LEFT ARTICLLE  -->

							<div class="clearfix"></div>
							<div class="ads-sponsor type-2 adm-hidden">
								<div id="admsection5"></div>
							</div>


							<div class="clear"></div>
							<script type="text/javascript">
								function resizeIframe(event) {
									var iframe = document
											.getElementById('sComment');
									if (event.origin !== 'https://vtvapi3.cnnd.vn')
										return;
									if (isNaN(event.data))
										return;
									var height = parseInt(event.data);
									iframe.height = height + "px";
								}
								if (window.addEventListener) {
									window.addEventListener('message',
											resizeIframe, false);
								} else if (window.attachEvent) {
									window.attachEvent('onmessage',
											resizeIframe);
								}
							</script>
							<div class="clearfix"></div>
						</div>

						<script type="text/javascript">
							(runinit = window.runinit || []).push(function() {
								loadJsAsync('https:', function() {
									SearchByDate.Init('the-gioi');
								});
							});
						</script>
					</div>


				</div>
				<!--End MainContent -->

				<!--RightContent -->
				<div class="col-sm-3 sidenav RightContent" id="Img100">
					<div style="width: 97%; margin: auto; padding-left: 10px; margin-top: 60px;">
						<a href="#"> <img src="./assets/images/phongchongThuocLa.png" alt=""></a>
						<a href="https://zingmp3.vn/zing-chart/index.html" target="_blank"> 
							<img style="padding: 10px 0px; width: 95%" src="./assets/images/songvn2x.jpg" alt="">
						</a> 
						<a href="#"> 
							<img style="height: 100%;" src="./assets/images/carRight.png" alt="">
						</a>
					</div>
				</div>
				<!--End RightContent -->

			</div>

			<div style="margin: auto; margin: 30px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>
			
			<div class="row content marginBottom">
				<div class="col-sm-4  category_box5">
					<h2><a href="#">CÔNG NGHỆ</a></h2>
					<a href="#"> 
						<img style="height: 270px; width: 100%;" src="./assets/images/ipad.jpg" alt="">
					</a>
				</div>
				<div class="col-sm-4  category_box5" style="margin: 0px 5px;">
					<h2><a href="#">GIÁO DỤC</a></h2>
					<a href="#">
						<img style="height: 270px; width: 100%;" src="./assets/images/startup.png" alt="">
					</a>
				</div>
				<div class="col-sm-4  category_box5">
					<h2><a href="#">GIẢI TRÍ</a></h2>
					<a href="#">
						<img style="height: 270px; width: 100%;" src="./assets/images/abominable1.jpg" alt="">
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






