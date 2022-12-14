<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<title>PTIT-HCM: Diễn đàn trao đổi học tập!!</title>
				<!-- Import Boostrap css, js, font awesome here -->
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
				<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
				<link href="custom.css" rel="stylesheet">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
				</script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
				</script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
				<link href="resources/css/style.css" rel="stylesheet">
				<script src="resources/js/utils.js"></script>
			</head>

			<body>

				<!-- Navigation & Header -->
				<header>
					<div class="container bg-white">
						<div class="row text-center border-bottom">
							<div class="col text-right">
								<a href="/"><img src="images/ptitLogo.jpg" height="70" class="logo" width="270"
										style="width: 50%;"></a>

							</div>
							<div class="col-6">
								<a href="#"><i class="fa fa-search"></i></a> <input class="header-search" size="40"
									type="text" placeholder="Tìm kiếm bài viết, tác giả,..." aria-label="Search">
							</div>
							<div class="col align-self-center">
								<div id="login" style="display: none;">
									<a href="register" class="text-header"> Đăng ký </a> <a href="login"
										class="ml-5 text-header"> Đăng nhập</a>
								</div>
							</div>

							<div id="account" style="position: relative; z-index: 1030; display: none;">
								<span><button type="button" class="btn btn-primary write" style="border-radius: 12px;"
										onclick="window.location.href='/post'">Đăng bài</button></span>
								<button type="text" class="dropdown" data-toggle="dropdown"
									style="width: auto; height: auto; z-index: 999;">
									<a href="#"> <img
											src="data:image/png;base64,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"
											alt="Icon Account"
											style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
										<a href="#" style="color: black; text-decoration: none;">${username}</a>
									</a>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="">Cài đặt</a>
									<a class="dropdown-item" href="" onclick="logOut()">Đăng xuất</a>
								</div>
							</div>
						</div>
					</div>

				</header>
				<nav class="navbar navbar-expand-sm navbar-dark sticky-top bg-white header">
					<div class="container">
						<ul class="nav col-md-12 nav-bar text-header" style="color: black;">
							<li class="nav-item "><a class="nav-link py-0" href="#">Trang
									chủ</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Hoạt
									động</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Học
									tập</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Đội
									- Nhóm</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Chuyện
									trò - tâm sự</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Chia
									sẻ kinh nghiệm</a></li>
							<li class="nav-item"><a class="nav-link py-0" href="#">Truyện
									cười</a></li>
						</ul>
					</div>
					</div>
				</nav>

				<!--Start: Banner-->
				<div class="container">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg"
									alt="Los Angeles" width="1100" height="500">
								<div class="carousel-caption">
									<h3>Los Angeles</h3>
									<p>We had such a great time in LA!</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg"
									alt="Chicago" width="1100" height="500">
								<div class="carousel-caption">
									<h3>Los Angeles</h3>
									<p>We had such a great time in LA!</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg"
									alt="New York" width="1100" height="500">
								<div class="carousel-caption">
									<h3>Los Angeles</h3>
									<p>We had such a great time in LA!</p>
								</div>
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<!--End: Banner-->
				<!-- Start: Content -->
				<div class="container">
					<p class="topic border-bottom">
						Hoạt động <span class=""></span><a href="#" class="more"> Xem
							thêm >></a> </span></a>
					</p>
					<div class="row row-cols-2">
						<div class="col-md-6">
							<!--Start: Block-post-->
							<!--Start: Thumb-->
							<div class="thumb">
								<a href="#"> <img
										src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
										width="552" height="270">
								</a>
							</div>
							<!--End: Thumb-->
							<!--Start:Text-->
							<div class="text border">
								<!--Start:Title-->
								<h5 class="title">
									<a href="#"> Chủ nghĩa cộng sản </a>
								</h5>
								<!--End:Title-->
								<a href="" class="body">
									<h6>Bài viết gốc đã được đăng tải vào 8/9/20 tại Đây . Hãy
										like page Ăn sách nếu có thể để thể hiện sự ủng hộ cho tác giả,
										cám ơn các bạn. Sự tôn thờ thanh xuân và tuổi trẻ ở Việt Nam...</h6>
								</a>
								<!--Start:author-->
								<a href="# "> <img
										src="data:image/png;base64,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"
										alt="Icon Account"
										style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
									<a href="#">Phạm Đức Duy</a>
								</a>
								<!--End : Author-->
							</div>
							<!--Start:Text-->
							<!--End: Block-post-->
						</div>
						<div class="col-md-6">
							<div class="row row-cols-2">
								<div class="col-md-6">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
								<div class="col-md-6">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
							</div>
							<div class="row row-cols-2">
								<div class="col-md-6 mt-2">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
								<div class="col-md-6 mt-2">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
							</div>
						</div>

					</div>
				</div>
				</div>
				<!-- End: Content -->
				<!-- Start: Content -->
				<div class="container">
					<p class="topic border-bottom">
						Học tập <span class=""></span><a href="#" class="more"> Xem thêm
							>></a> </span></a>
					</p>
					<div class="row row-cols-2">
						<div class="col-md-6">
							<!--Start: Block-post-->
							<!--Start: Thumb-->
							<div class="thumb">
								<a href="#"> <img
										src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
										width="552" height="270">
								</a>
							</div>
							<!--End: Thumb-->
							<!--Start:Text-->
							<div class="text border">
								<!--Start:Title-->
								<h5 class="title">
									<a href="#"> Chủ nghĩa cộng sản </a>
								</h5>
								<!--End:Title-->
								<a href="" class="body">
									<h6>Bài viết gốc đã được đăng tải vào 8/9/20 tại Đây . Hãy
										like page Ăn sách nếu có thể để thể hiện sự ủng hộ cho tác giả,
										cám ơn các bạn. Sự tôn thờ thanh xuân và tuổi trẻ ở Việt Nam...</h6>
								</a>
								<!--Start:author-->
								<a href="#"> <img
										src="data:image/png;base64,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"
										alt="Icon Account"
										style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
									<a href="#">Phạm Đức Duy</a>
								</a>
								<!--End : Author-->
							</div>
							<!--Start:Text-->
							<!--End: Block-post-->
						</div>
						<div class="col-md-6">
							<div class="row row-cols-2">
								<div class="col-md-6">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
								<div class="col-md-6">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
							</div>
							<div class="row row-cols-2">
								<div class="col-md-6 mt-2">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>
								<div class="col-md-6 mt-2">
									<!--Start: Block-post-->
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="245" height="130">
										</a>
									</div>
									<div class="text border">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
									<!--End: Block-post-->
								</div>

							</div>
						</div>

					</div>
				</div>
				</div>
				<!-- End: Content -->
				<!-- Start: Content -->
				<div class="container">
					<p class="topic border-bottom">
						Đội - Nhóm <span class=""></span><a href="#" class="more"> Xem
							thêm >></a> </span></a>
					</p>
					<!--Start: Large -->
					<div class="row border study">
						<div class="col-md-6 blockpost">
							<img style=""
								src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
								width="910" height="270">
						</div>
						<div class="col-md-6 blockpost">
							<div class="text">
								<h5 class="title">
									<a href="">Các vấn đề của xã hội ngày nay</a>
								</h5>
								<a class="body" href="#">
									<h6>Không có vấn đề gì đang sợ cả nha....</h6>
								</a>
								<div class="author">
									<a href="#"> <img
											src="data:image/png;base64,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"
											alt="Icon Account"
											style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
									</a> <a href="#" style="">Phạm Đức Duy</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End: Large -->
					<div class="row mt-3">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAkFBMVEXMAAD/1gD/2ADJAAD/2gD/3AD/3gD/1QDNAAD/0wD7xgD+zwD8yQD5vwD6wgD9zAD4vADWPwDrkADxpADyqQDmfwDQHQDcWQD3uAD2tADUNwDslADngwDZRgD1sADkdwDvnQDpigDgZwDaTgDTLgDhbgDXRQDcVQDeXwDQGwDjcgDtmQDUMgDtnwDkegDgagAzzXnpAAAN4UlEQVR4nO2daXeyOhCAZSaJuFRFrXtdqq9La9v//+8uYheFTCAL4PU4H3sqyQPZZk2l8pCHPOQhD3nIQx7yEG3xN1h2F/KWl+nQv29InIzqswneNaT/Lqrz/V1/SHytcfG0GNwxIwZPHESze8+rjt/nALzaeym7I/kJdjl4wHj/fhnxlYHneSFjUHZX8hIMGsz7ZrzT+YiHDvfOjL3jvTL2zogeY9M73R9xxiFCBN54K7sz+QgO2RnRA9Fa3+VnxON5vYkY+/d5zPFH4hsxnI6fd4lY+RDw+xk7k3tk/F1vop1jVXZ38hDcwy8i8PrLHX5G3P6uNyfG6T0iTlr8F9HjT/c4Gwdz8YfIYHFbiIeDA7uLv7xABH5Te+Ng1JgvthXrHq3+ltRwpLb3N4M46PBQla3W3183dp8SP9kFIrBb2Tc2Zx0IQsp253nnW1DiqwdXI/VwA58RvwHPfQLO6v2vwHjA4vAS0eOtbemIuHm6WOXPg0vUnqbDjRkl7q4QWe21ZEQ8PjEvIeGnFO3x59ZkhcU1XCIC6+bQbY3uTGSA313jvNX/mmir7vhSvULkfT+XvmfrzKRFAf4MWOgsdQcsvlwNVI+PSjMcpwGeB2w4Lcerl4EGJb5cDVSP1Utab3BSTwX8GbCi2V9MMo82XLNrxNqwDMTMgL+UrcymXxxyuP71W/GIOGlqAJ56Ca8aT/+KIfJV0Yg4aWsC1nY6fcTn2DbL34tFxElDD5C1NS33uIoj9opExElNE7ClrQvhMo7YLw4xBAQ5CSG8Y7BrY780RDx6eoBibta1TmygFIWIE6YJuDTs2KEda0gUMhf1AWfGulQAccQCrHAY6AGC+LLRiOONmb+uzG3qAjKrA1diz/DEv3wR44fiNGE1W49ZfEEFkesZNaaepgM2rS27g/jpF1iObkZc620TvGNv80y2CY2jC5hsjaUAzl1o5ziLT0X2lJPWj+uqHmDPUcPj+AmRzx09+VpwpwUIfOqq5eQZMRfnlC4ge3bWCVzEx6nH3e8ZuoBgsc8nZR4fp+C5XlBxqAXo2rByTIxTVh+4bEAbsOn4DeObiLfB+04b0APkLfce3FFC4+YOA1N0AUc5+DbXCUKoOrOiagJCLlb4hE0jnAsmhgPps4daJxmo5mOD3yRfM+86aUkTMESsb1y0m+jHKrHYALhY0HCop014p5U0F0Q/btJwc0D9C47UQ8zjULVIfEQHpzfcGQCezL+5BDU3E30Jx6ndI3HHTQBDxEYOiJJtP1xP7R65E2aAOSFWGsnucJsDvgXg6WTqHjHhrfGizcn8eTaAp6bdH918yarAjO3gOEyOek1E53kiOE1+RI+ZLjao6QAtBHEgeeusY9qKr+PEJhBdB/tiQhUOhRsr27eIuJd8RKgbP85PDyY5v0RyRYKqa1VYdoa0MNocsiACe6anLHha3vt0wqUsyKxp/sAMiMA+L9JeckfcyVZ4G8vbIA0R2AyVXm8Ap0YplGnjULdoIg3xrIVioEJ0Gc2M77L+cIsmcKNE/DFsxwIKrxGZS8ShZNO32BMrKYh8+ftvL7QpAJjLMFipRi5sconxSCJe+l5wRxsDXCJiX9YbZhXCQIboXce2qswBwJwZ+SVOjOgjWtkzCEQ+vn5qMqzgEtGZK2Ugfd3cLoIBAwkiHx3i//alQnQVP4ktWSPQsns8BoljC+vEAU8jSIXoKJMJu/JhOrF8bByRtWS+H3wuAHEvHabM1uyGwVU8KSPMvjhTIDrypfjSfQkats/9qfFwBiTNhbhSaBpWZqO/Jp6kLQhLw+IVImvQNphkFJNrRKIF9mEf2RJ8W/OgpjIyESvBN6KLsLRX6UQEz4GJfxudrwHU9hecKmxYLiLvJG6o6NHWw/T0FcM3BTzNwITvKkT7oHuUWIZDYS5i3U+RiSLdgpYzovxo6rGR5XPPDw94FssLLlWIto5Nme07enDyDGIiGadzT4VouznLlxpPFJs43Fcg2maHJMNrzsO02KQTf05vGraIPrHUOA2xySBKRNPw/UiwLiW0MA2byWGcFyJ+EBPRbSRYuhxGKkQLu0MyqPabsPDqdoOOCtH8HIlvBKHTgMhMMiAToe2+IrFdODn1akoi0v7qlRuHSW/lJ1MH6oW+bFSOVmPEDbFduIos1+uMKtdUGO5gkvioiDCfCPcUQeJ9/yCaKXUE4dhx57MJEmcsm6+IBOGonPILOFHFpwqTtBOCEFxFnGr3J1Ah8rm+0iO3CoeEOfQ+W4cUjikjRBzJCVt59D5bj5Q5b3ysiyiNOgkJn3LpfbYuKQNxky6QtMclUqHOhCWtNOc+7dWIeloBdm5pt/jp1D9VMC7vaCESK005O/5fr96UiE86iJgMF44Ii1by4936VCJKnVnUo4gdv9DSGbJ+PauCqrVytQhCK9uIC8GZKmZVA5E4eZehH8YkBbGZFXEgP82Lsou7VaSZL9eI2bpIhGC58M1YC3aViO1suShD+XwWuSTr6IoLRCKmBsCN48JaVO5FjzUyIBJO2PJUi7iofG+ZclEwmVEa/bTkDf9CVL63FB/6WQhDVOnb4Z982CESGjW/oerKvsq9mIpILDR2IZjOJV525hpRnVEkDWf3nPmAHYmvckylpNsQkQol2jCkonRMqXNRtvL9vhyLt0IOKseUBx6JSEVdFV88Mk3UyRx0ug3hAb6xhSaSgzKxikQM5IBQLbj7WeSgzACEqjTdRpqE6NmkWuYpA2URVKjK0m18woB+A+qvRNSOKWm6DbXd34jqlBDcKOuEShCpdcY2lD03SSmFChAzTOAr8Qlv9+YWtWMqUXCKsJSWEWmSWVRJYV48FwX/EUd2aNzqJ6xU0qpNXuWiEEfSWx6kJ0mpNwl/eh+1FxawktpdXphSQuUPcUKplfCU8yf02w2r6gK4T0E8ZzEQLifPbeEvqXQYZIqOJkWV9+b9ZDHQFnNgzlDk3Tsp7CDsEJXuxQgR16TpI+d15ju/AphVAQW1e/F0dQDhcDpJvoGl+Pz9asEukhw/lQWNAGhdKy+1Av1I/lIDLNOa1O5FTxGwwvM5z+BrI5KLvczyWj8q9DdNmGFR+7TuvFYhkuu3aVVSUO17owlzMV+cAGWtWd5caIKYzyykq0WyhlUdDKXvTSoAjj8hRrJW1cHo2oxUpe9NJo73Qly1Rh/T1UxlfAA+sjnCKR1Tktbajm35TcYY5yml+FjN5o5tpWMqIa4dTkG21oHPLRYcpWMq/jKdJB3+CZWOI2nZ5qp0Vd5b7FVWHS8zh+zFTIGPzWejKinsSlwbSaUqNgnNoGt8yabS93bRhOMxWgkkY5TVSdM88Pqb4X2dvjwWId5AzfEYlTXLx/6W3jpAtN4MDRzywgmxxh2vo7JTI1ueDEmK3RFEfaHPiP4nYdq+AnQcbIlfyblxDuj8rkRAMjZWWvMRK4NVI0NlUWi5jeqW1oFi47OFSJltEM5H1ttlnJCI/utcZCru6zhASG6Z/omzwq266Dcw0ViuK2lXy4Z4+x6IrHuu0ztYCQcK1L8PhaqSdL+Q1d7igATl6e/Bas6ETvFp09Q3WftEYfa/5Ro36RciRveR9lane61j4h+/piMuuG5tbWcXztAWFDH8/adDpkstT5RCNOfLbnd1ku70Y94BEcIZFUvljjIs3qUrWzjuBL9w7/nNzGYWiBSUSEJdRbuu/SWig1MNDqSxPcC95S62040tiyubCLfOBMKddIJJD53Kqi15iTViVzr7eUuqOOCnVQ1wM7GqPI/HjnSNEUviveHesy2vbIJo/BVxIb0yFvgz/ZOgVfxINb3nAg996QcEddlef2p4oULhiBjIV3/gKZkpuG+bWeetEA2SiT+JGZVeXgM38o+fK2JLF5EYoSFgJn+yfALni6iXo3lsUdFj2Qp1YTB2/RlZytCnilXK+zekPoGGWv3WdskIrJfiXtRBpJM9mYZajZv3qquhCry+x1T3IqtnvRdlRr0sqGnF5WDQN9MY4s2y6vvpiJjqXsx6de2KOnnpF63G3ciaERj0v4+I6ry3E2I7CyL9FIN7zrAyDBkt5mPIN/8LY1GW1TwjphrafyMrJL82OuEiDvtV0zUHeK13FaaTqr2wtOAsRdlxqJleNIyTbk3bQBGpyc1ZPBsRP9KWm4Y6rEcRd21Tcxz9t05VCzLEq37sJbZkVGZMealXv8hrhpzEstQh4mYx9jJCQvh//S/CVJ4BkY4/U01C+4v4EA9vyxpLoQTOWWMafj26lxaIdLkj80kYg8Tgednk7GSBum4LIusUY0/TxTHNcpzmXgS2Jdrvkb80v1NJRukHb6v3cUOIH4MbF8Jr9aez14lPmYyvJMW9CA2iBD2dGGBdNVaCGZL4g2Ow3q8nx8GPkTjr75WpfeSVJVR53hxcrdbiKxEFcQ8DdoiFFBq3l3DjK2pOQoNYNAZEsgYwt5dsuxHFJUZkmZoJsdu7KKOeg2zIiFryvsC13L8klkX2W0Oospq051TuAnTmwHIuOJF6u8AjAzSk85BpVagqVuSIikklq6ehVbypcPm9j+IS8EPx/8lgCy37VQmSjC5QF0RN7DGadeJKEFxfIYLoKRWEeECJMKi7WbTg7mIHYDBL+/d/F3Yj4N1C+mgpvzUnQ91knJ61g8O6iBIMAES72LsUjCVKCgPgXj9TpS88LDrtKhfV+ixjYbHyBb+YqHVm26z9xcpmO9xv7VImixX8twiyK17/S7lzvIc85CEPechDHpIu/wH5zcLtZyhmGAAAAABJRU5ErkJggg=="
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End: Content -->
				<!-- Start: Content -->
				<div class="container">
					<p class="topic border-bottom">
						Chuyện trò - tâm sự <span class=""></span><a href="#" class="more">
							Xem thêm >></a> </span></a>
					</p>
					<div class="row justify-content-center mt-3">
						<div class="col-md-3 col-md-offset-1">
							<div class="background">
								<div class="text">
									<div style="position: absolute; bottom: 40px; margin-top: 0">
										<h5 class="title">
											<a href="" style="color: aliceblue;">Các vấn đề của xã hội
												ngày nay</a>
										</h5>
									</div>

									<div class="author">
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
										</a> <a href="#" style="color: aliceblue;">Phạm Đức Duy</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="background">
								<div class="text">
									<div style="position: absolute; bottom: 40px; margin-top: 0">
										<h5 class="title">
											<a href="" style="color: aliceblue;">Các vấn đề của xã hội
												ngày nay</a>
										</h5>
									</div>

									<div class="author">
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
										</a> <a href="#" style="color: aliceblue;">Phạm Đức Duy</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="background">
								<div class="text">
									<div style="position: absolute; bottom: 40px; margin-top: 0">
										<h5 class="title">
											<a href="" style="color: aliceblue;">Các vấn đề của xã hội
												ngày nay</a>
										</h5>
									</div>

									<div class="author">
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
										</a> <a href="#" style="color: aliceblue;">Phạm Đức Duy</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<a href="#">
								<div class="background">
									<div class="text">
										<div style="position: absolute; bottom: 40px; margin-top: 0">
											<h5 class="title">
												<a href="" style="color: aliceblue;">Các vấn đề của xã hội
													ngày nay</a>
											</h5>
										</div>

										<div class="author">
											<a href="#"> <img
													src="data:image/png;base64,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"
													alt="Icon Account"
													style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											</a> <a href="#" style="color: aliceblue;">Phạm Đức Duy</a>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!--End: Content-->
				<!--Start: Kinh nghiệm-->
				<div class="container">
					<p class="topic border-bottom">
						Chia sẻ kinh nghiệm <span class=""></span><a href="#" class="more">
							Xem thêm >></a> </span></a>
					</p>
					<div class="row mt-3">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="img-thumbnail">
										<a href="#"> <img
												src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
												width="100" height="200">
										</a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text">
										<h5 class="title">
											<a href="#"> Chủ nghĩa cộng sản </a>
										</h5>
										<!--Start:author-->
										<a href="#"> <img
												src="data:image/png;base64,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"
												alt="Icon Account"
												style="float: left; width: 20px; height: 20px; margin-top: 5px; margin-right: 5px; margin-left: 3px;">
											<a href="#">Phạm Đức Duy</a>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End: Chia sẻ kn-->
				<!-- Start: Truyện cười-->
				<div class="container">
					<p class="topic border-bottom">
						Truyện cười <span class=""></span><a href="#" class="more"> Xem
							thêm >></a> </span></a>
					</p>
					<div class="row">
						<div class="col-4">
							<nav id="myScrollspy">
								<ul class="nav nav-pills flex-column">
									<li class="nav-item"><a class="nav-link" href="#content-javascript">Javascript</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#content-css">CSS</a></li>
									<li class="nav-item"><a class="nav-link" href="#content-bootstrap">Bootstrap</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class="col-8">
							<div data-spy="scroll" data-target="#myScrollspy" data-offset="10"
								style="height: 200px; overflow-y: scroll; padding: 5px; border: 1px solid #ccc;">
								<h4 id="content-javascript">Javascript</h4>
								<p>JavaScript is a cross-platform, object-oriented scripting
									language used to make webpages interactive (e.x. having complex
									animations, clickable buttons, popup menus, etc.)...</p>
								<h4 id="content-css">CSS</h4>
								<p>CSS is the language for describing the presentation of Web
									pages, including colors, layout, and fonts. It allows one to adapt
									the presentation to different types of devices, such as large
									screens, small screens, or printers...</p>
								<h4 id="content-bootstrap">Bootstrap</h4>
								<p>CSS is the language for describing the presentation of Web
									pages, including colors, layout, and fonts. It allows one to adapt
									the presentation to different types of devices, such as large
									screens, small screens, or printers. CSS is independent of HTML
									and can be used with any XML-based markup language...</p>
							</div>
						</div>
					</div>
				</div>
				<!-- End: Truyện cười-->
				<hr>
				<div class="container" style="font-size: 10px;">
					<p>Học viện Công nghệ Bưu chính - TP.HCM</p>
					<p>Địa chỉ 1: Quận 1</p>
					<p>Địa chỉ 2: 97 Man Thiện, phường Tăng Nhơn Phú A, quận 9, TP.Hồ
						Chí Minh</p>
				</div>
			</body>


			<script>
				$(document).ready(function () {
					if (typeof getCookie("Authorization") == "undefined" || "${user.username}" == "") {
						$("#login").show();
					} else {
						$("#account").show();
					}
				})
			</script>

			<!-- Log out -->
			<script>
				function logOut() {
					clearCookies();
					window.location.href = "/logout";
				}
			</script>

			<!--Click Post-->
			<!-- <script>
				$("#btnShowPost").click(function (e) {
					e.preventDefault();
					$.ajax({
						contentType: "application/json; charset=utf-8",
						url: '/create/post',
						headers: { "Authorization": getCookie("Authorization") },
						type: 'GET',
						dataType: 'json',
						data: "",
						success: function (data, response) {
							alert("success");
						},
						error: function (xhr, ajaxOptions, thrownError) {
							alert("error");
						}
					});
				});
			</script> -->

			</html>