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
    <link href="resources/css/style.css" rel="stylesheet">
    <script src="resources/js/utils.js"></script>
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

<body>

<!-- Navigation & Header -->
<header>
    <div class="container-fuid bg-white">
        <div class="row text-center border-bottom">
            <div class="col-2 text-right">
                <a href="/"><img src="images/ptitLogo.jpg" height="70" class="logo" width="270"
                                 style="width: 50%;"></a>

            </div>
            <div class="col-7">
                <a href="#"><i class="fa fa-search"></i></a> <input class="header-search" size="40"
                                                                    type="text"
                                                                    placeholder="Tìm kiếm bài viết, tác giả,..."
                                                                    aria-label="Search">
            </div>
            <div class="col align-self-center" id="login" style="display: none;">
                <div>
                    <a href="register" class="text-header"> Đăng ký </a> <a href="login"
                                                                            class="ml-5 text-header"> Đăng nhập</a>
                </div>
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
                                    <a class="dropdown-item"
                                       href="/pageContent/${item.idPost}/${item.idNotification}">${item.message}</a></li>
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
                    <a class="dropdown-item" href="/manage-post-user">Quản lý bài viết</a>
                    <a class="dropdown-item" href="/setting">Cài đặt</a>
                    <a class="dropdown-item" href="/logout" onclick="logOut()">Đăng xuất</a>
                </div>
                    </span>
            </div>
        </div>
    </div>

</header>
<nav class="navbar navbar-expand-sm navbar-dark sticky-top bg-white header">
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
</body>

<script>
    $(document).ready(function () {
        if (typeof getCookie("Authorization") == "undefined") {
            $("#login").show();
        } else {
            $("#account").show();
            if ("${user.role}" === "USER") document.getElementById("admin").style.display = "none";
        }
    })
</script>

<!-- Log out -->
<script>
    function logOut() {
        clearCookies();
        window.location.href = "/logout";
        alert("123")
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