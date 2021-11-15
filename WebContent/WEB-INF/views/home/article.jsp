<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
													<h4
														style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
														${TKLogin.getHoten()}</h4>
													<img class="dropdown-toggle" data-toggle="dropdown"
														style="width: 30px; height: 30px; border-radius: 50%; background: transparent; margin-right: 14px; margin-left: 5px;"
														src="assets/images/${TKLogin.getAnh()}" />
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
													<h4
														style="margin: 0px 5px; font-size: 17px; padding-top: 10px; color: white;">Xin chào, 
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
							<li><a style="padding:20px 3px;" 
								href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
							<c:forEach var="u" items="${DM }">
								<c:choose>
									<c:when test="${danhMuc.equals(u.madanhmuc) }">
										<li class="active"><a style="padding:20px 3px;"  href="${pageContext.request.contextPath }/danh-muc/${u.madanhmuc}">${u.tendanhmuc }</a></li>
									</c:when>
									<c:otherwise>
										<li><a style="padding:20px 3px;"  href="${pageContext.request.contextPath }/danh-muc/${u.madanhmuc}">${u.tendanhmuc }</a></li>
									</c:otherwise>
								</c:choose>
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
	<div style="margin-top: 160px;">
		<div class="container ">
			<div class="row content">
			
				<!--MainContent -->
				<div class="col-sm-9 ">
					<div class="detail_left border_right adm-leftsection" style="background-color: white; width: 100%;">
						<div class="">
						
							<!-- LEFT ARTICLLE  -->
							<div style="width: 800px; margin: auto;">
								<div>
									<p style="padding-top: 10px;">
										<a
											style="border-bottom: 4px solid #d6090a; text-transform: uppercase; padding-bottom: 10px; font-size: 17px; font-weight: bold;"
											href="${pageContext.request.contextPath }/danh-muc/${BaiViet.bb.danhmuc.madanhmuc}" title="">${BaiViet.bb.danhmuc.tendanhmuc }</a>
										<a class="sprite"></a>
									</p>
								</div>
								<h1 class="title_detail" data-field="title">${BaiViet.bb.tieude }</h1>
								<p class="author">
									<i class="glyphicon glyphicon-user"></i>
									${BaiViet.bb.taikhoan.hoten }
									<span class="time" style="padding: 0 5px 0;">
										<i class="glyphicon glyphicon-time" style="padding-left: 5px;"></i>
										${BaiViet.time }
									</span>
								</p>

								<img class="news-avatar" data-field="firstphoto" alt="${BaiViet.bb.tieude }"
									src="./assets/images/${BaiViet.bb.hinhanh1 }" width="100%">
								<div class="avatar-desc">(nguồn sưu tầm)</div>


								<div data-field="body" class="ta-justify" id="entry-body">
									<p class="text-justify" style="padding: 10px 0px;">${BaiViet.bb.noidung1 }</p>

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
										<c:choose>
											<c:when test="${TKLogin.username == null}">
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
													<c:forEach var="u" items="${listTimeBL }">
														<div style="display: flex; align-items: center; padding: 10px;">
															<img
																style="width: 40px;height:40px; border-radius: 50%; margin-right: 10px;"
																src="./assets/images/${u.bl.taikhoan.anh}">
															<p>
																<span
																	style="padding-right: 5px; font-size: 15px; font-weight: bold; color: #3475c7;">${u.bl.taikhoan.hoten}:</span>
																${u.bl.noidung}
															</p>
															<div style="margin-left: auto;display:flex;">
																<p style="padding-right:10px;color:#69d0cb;">${u.time }</p>
															</div>
														</div>
													</c:forEach>
												</div>
											</c:when>
											<c:when test="${TKLogin.username != null && TKLogin.vaitro == 0}">
												<h4 style="padding: 10px 10px; font-weight: bold;">BÌNH LUẬN</h4>
												<form:form action="binh-luan/${BaiViet.bb.idbb}" modelAttribute="binhluan" method="post" style="padding: 0 10px;">
													<form:input path="baibao.idbb" value="${BaiViet.bb.getIdbb()}" type="hidden" />
													<form:input path="taikhoan.username" value="${TKLogin.username}" type="hidden" />
													<form:textarea path="noidung" rows="3" style="width: 100%; resize: none; padding: 10px" placeholder="Nhập bình luận của bạn vào đây"/>
													<button name="${btnStatus}" type="submit" style="background: #3475c7; padding: 5px; margin-top: 10px; color: white; font-weight: bold; border: none; border-radius: 3px;">
														Gửi bình luận
													</button>
												</form:form>
												<hr>
												<div style="margin-top: 20px;">
													<c:forEach var="u" items="${listTimeBL }">
														<c:choose>
															<c:when test="${TKLogin.getUsername().compareTo(u.bl.taikhoan.username)==0 }">
																<div style="display: flex; align-items: center; padding: 10px;">
																	<img
																		style="width: 40px;height:40px; border-radius: 50%; margin-right: 10px;"
																		src="./assets/images/${u.bl.taikhoan.anh}">
																	<p>
																		<span
																			style="padding-right: 5px; font-size: 15px; font-weight: bold; color: #3475c7;">${u.bl.taikhoan.hoten}:</span>
																		${u.bl.noidung}
																	</p>
																	<div style="margin-left: auto;display:flex;">
																		<p style="padding-right:10px;color:#69d0cb;">${u.time }</p>
																		<a style="color:#3475c7; padding: 0 5px" href="chinh-sua-binh-luan/${u.bl.idbl }/${BaiViet.bb.idbb}" title="Chỉnh sửa bình luận"> 
																			<i style="font-size: 15px" class="glyphicon glyphicon-pencil"></i>
																		</a>
																		<a style="color:#d6090a; padding: 0 5px" href="xoa-binh-luan/${u.bl.idbl }/${BaiViet.bb.idbb}" title="Xóa bình luận"> 
																			<i style="font-size: 15px" class="glyphicon glyphicon-trash"></i>
																		</a>
																	</div>
																</div>
															</c:when>
															<c:otherwise>
																<div style="display: flex; align-items: center; padding: 10px;">
																	<img
																		style="width: 40px;height:40px; border-radius: 50%; margin-right: 10px;"
																		src="./assets/images/${u.bl.taikhoan.anh}">
																	<p>
																		<span style="padding-right: 5px; font-size: 15px; font-weight: bold; color: #3475c7;">${u.bl.taikhoan.hoten}:</span>
																		${u.bl.noidung}
																	</p>
																	<div style="margin-left: auto;display:flex;">
																		<p style="padding-right:10px;color:#69d0cb;">${u.time}</p>
																	</div>
																</div>
															</c:otherwise>
														</c:choose>
														
													</c:forEach>
												</div>
											</c:when>
										</c:choose>
									</div>
								</div>


								<div class="clearfix"></div>
								<div class="tinlienquan clearfix">
									<h3 style="padding-top: 20px;">TIN LIÊN QUAN</h3>
									<ul>
										<c:forEach var="u" items="${tinLienQuan }">
											<li style="padding-bottom: 10px;">
												<i class="glyphicon glyphicon-tags" style="padding-right: 10px;"></i> 
													<a style="font-size: 16px; color: #105cbb" 
														href="${pageContext.request.contextPath }/bai-viet/${u.idbb}" data-nocheck="1">
														${u.tieude }
													</a>
											</li>
										</c:forEach>
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
						<a href="${pageContext.request.contextPath }/bai-viet/${thuocLa.idbb}"> <img src="./assets/images/phongchongThuocLa.png" alt=""></a>
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

			<div style="margin: auto; margin: 30px;" class="row content">
				<div class="border_bottom_box"></div>
			</div>
			
			<div class="row content marginBottom">
				<div class="col-sm-4  category_box5">
					<h2><a href="${pageContext.request.contextPath}/danh-muc/3CN">CÔNG NGHỆ</a></h2>
					<a href="${pageContext.request.contextPath}/danh-muc/3CN"> 
						<img style="height: 270px; width: 100%;" src="./assets/images/ipad.jpg" alt="">
					</a>
				</div>
				<div class="col-sm-4  category_box5" style="margin: 0px 5px;">
					<h2><a href="${pageContext.request.contextPath}/danh-muc/4GD">GIÁO DỤC</a></h2>
					<a href="${pageContext.request.contextPath}/danh-muc/4GD">
						<img style="height: 270px; width: 100%;" src="./assets/images/startup.png" alt="">
					</a>
				</div>
				<div class="col-sm-4  category_box5">
					<h2><a href="${pageContext.request.contextPath}/danh-muc/GT">GIẢI TRÍ</a></h2>
					<a href="${pageContext.request.contextPath}/danh-muc/GT">
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






