<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <link href="http://localhost:8000/resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <base href="http://localhost:8000/"/>
    <script src="resources/js/utils.js"></script>
</head>

<body style="background:#f2f2f2;">
<!-- Navigation & Header -->
<header>
    <div class="container-fluid bg-white">
        <div class="row text-center border-bottom">
            <div class="col-2 text-right">
                <a href="#"><img src="images/ptitLogo.jpg" height="70" class="logo" width="270"
                                 style="width: 50%;"></a>
            </div>

            <div class="col-7">
                <a href="#"><i class="fa fa-search"></i></a>
                <input class="header-search" size="40" type="text" placeholder="Tìm kiếm bài viết, tác giả,..."
                       aria-label="Search">
            </div>
            <div class="col align-self-center" id="login" style="display: none;">
                    <a href="register" class="text-header"> Đăng ký </a> <a href="login"
                                                                            class="ml-5 text-header"> Đăng nhập</a>
            </div>

            <div id="account" style="position: relative; z-index: 1030; display: none;">
        <span><button type="button" class="btn btn-primary write" style="border-radius: 12px;"
                      onclick="window.location.href='/post'">Đăng bài</button></span>
                <span>
                    <div class="btn-group">
                        <button type="button" class="icon-button" data-toggle="dropdown">
                             <i class="fas fa-bell"></i>
                            <span class="icon-button__badge">
                                ${notification.stream().filter(notification -> !notification.isReaded()).count()}
                            </span>
                        </button>
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach items="${notification}" var="item">
                                <li style="${!item.isReaded() ? 'background: steelblue' : ''}">
                                    <a class="dropdown-item" href="/pageContent/${item.idPost}/${item.idNotification}">${item.message}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </span>
                <span>
                    <button type="text" class="dropdown" data-toggle="dropdown"
                            style="width: auto; height: auto; z-index: 999;">
                        <a href="#">
                            <a href="#" style="color: black; text-decoration: none;">${user.username}</a>
                        </a>
                    </button>
                    <div class="dropdown-menu">
                        <div id="admin"><a class="dropdown-item" href="/admin/table/1">Quản lý website</a></div>
                        <a class="dropdown-item" href="/manage-post-user">Quản lý bài viết</a>
                        <a class="dropdown-item" href="/setting">Cài đặt</a>
                        <a class="dropdown-item" href="/logout" onclick="logOut()">Đăng xuất</a>
                    </div>
                </span>
            </div>
        </div>

</header>
<nav class="navbar navbar-expand-sm navbar-dark sticky-top bg-white header p-auto">
    <div class="container">
        <ul class="nav col-md-12 nav-bar text-header" style="color: black;">
            <li class="nav-item"><a class="nav-link py-0" href="/topic/1/1">Hoạt
                động</a></li>
            <li class="nav-item"><a class="nav-link py-0" href="/topic/2/1">Học
                tập</a></li>
            <li class="nav-item"><a class="nav-link py-0" href="/topic/3/1">Đội
                - Nhóm</a></li>
            <li class="nav-item"><a class="nav-link py-0" href="/topic/4/1">Chuyện
                trò - tâm sự</a></li>
            <li class="nav-item"><a class="nav-link py-0" href="/topic/5/1">Chia
                sẻ kinh nghiệm</a></li>
            <li class="nav-item"><a class="nav-link py-0" href="/topic/6/1">Khác</a></li>
        </ul>
    </div>
    </div>
</nav>
<!--Start: Banner-->
<div class="container ">
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
                <img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg" alt="Los Angeles"
                     width="1100" height="300">
                <div class="carousel-caption">
                    <h3>Los Angeles</h3>
                    <p>We had such a great time in LA!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg" alt="Chicago"
                     width="1100"
                     height="500">
                <div class="carousel-caption">
                    <h3>Los Angeles</h3>
                    <p>We had such a great time in LA!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://spiderum.com/assets/images/banner/cover-spiderum-not-login.jpg" alt="New York"
                     width="1100"
                     height="500">
                <div class="carousel-caption">
                    <h3>Los Angeles</h3>
                    <p>We had such a great time in LA!</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>
<!--End: Banner-->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 mt-3">
            <div class="container sticky">
                <!--navigation-->
                <ul class="nav flex-column nav-pills" style="float: right;">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#"><i class="fab fa-hotjar" style="margin-right: 2px;"> </i>
                            Nổi
                            bật</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link disabled" href="#"><i class="far fa-newspaper"
                                                                 style="margin-right: 4px;"> </i>Mới
                            nhất</a>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link active" href="#"><i class="fas fa-heartbeat" style="margin-right: 6px;"> </i>Sôi
                            nổi</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link disabled" href="#"><i class="fas fa-crown" style="margin-right: 3px;"> </i>Thịnh
                            hành</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-6 p-0">
            <c:forEach var="post" items="${list}">
                <!--Start: new feed-->
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <div class="container">
                            <div class="position-relative border new-feed">
                                <div class="author-feed">
                                    <div class="account">
                                        <img
                                                src="${post.user.profile.avatar}"
                                                alt="Icon Account"
                                                style="float:left;width:40px;height:40px;margin-top: 2px; margin-right: 5px; margin-left: 3px;"
                                                class="rounded-circle">
                                        <a href="#" style="float:left;"><b>${post.user.username}</b>&nbsp</a>
                                        <p style="display: inline; color: #99A3AD;">trong</p>
                                        <a href="#" class="topic-title" style="color:#2C3E50;">${category}</a>
                                        <p style="margin-bottom: 0px; color: #828b94;">${post.timeCreate}</p>
                                    </div>
                                </div>
                                <div class="img-thumbnail ">
                                    <a href="#">
                                        <img style="width: 100%; margin-top: 15px;"
                                             src="${post.thumb}"
                                             width="674" height="280">
                                    </a>
                                </div>
                                <div class="content">
                                    <div class="text">
                                        <!--Start:Title-->
                                        <h5 class="title">
                                            <a href="/pageContent/${post.idPost}" style="color: #2C3E50;"
                                               class="show-large"> ${post.title} </a>
                                        </h5>
                                        <!--End:Title-->
                                        <a href="" class="body">
                                            <h6 style="color: #293847;"></h6>
                                        </a>
                                        <!--Start:author-->
                                        <a href="#">
                                        </a>
                                        <!--End : Author-->
                                    </div>
                                </div>
                                <div class="toolbar">
                                    <div class="" style="float: left;">
                                        <a href="" style="color: #293847;"><i onclick="myFunction(this)"
                                                                              class="fas fa-heart"></i></a>

                                    </div>
                                    <div class="" style="float: right;">
                                        <a href=""><i class="fas fa-comments" style="color: #293847;"></i> </a>

                                        <a href="#"><i class="fas fa-eye" style="color: #293847;"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--End: new feed-->
            </c:forEach>


        </div>
        <div class="col-md-3">

        </div>
    </div>
    <div class="d-flex justify-content-center mr-6" style="margin-right: 151px;">
        <div class="pagination ">
            <a href="#">&laquo;</a>
            <c:forEach begin="1" end="${amountOfPage}" varStatus="loop">
                <a href="/topic/${list.get(0).getCategory().getIdCategory()}/${loop.count}">${loop.count}</a>
            </c:forEach>
            <a href="#">&raquo;</a>
        </div>
        <!-- End: Pagination-->
    </div>
    <div class="container" style="font-size: 10px;">
        <hr>
        <p>Học viện Công nghệ Bưu chính - TP.HCM</p>
        <p>Địa chỉ 1: Quận 1</p>
        <p>Địa chỉ 2: 97 Man Thiện, phường Tăng Nhơn Phú A, quận 9, TP.Hồ Chí Minh</p>
    </div>
</body>
<script>
    function myFunction(x) {
        x.classList.toggle("fa-heart-pink");
    }
</script>
<script>
    $(document).ready(function () {
        if (typeof getCookie("Authorization") == "undefined" ) {
            $("#login").show();

        } else {
            $("#account").show();
            if ("${user.role}" == "USER") document.getElementById("admin").style.display = "none";
        }
    })
</script>

<!-- Log out -->
<script>
    function logOut() {
        clearCookies();
    }
</script>

</html>