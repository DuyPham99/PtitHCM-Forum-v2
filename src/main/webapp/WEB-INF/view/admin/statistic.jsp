<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description"
          content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <title>Thống kê</title>
    <!-- Favicon -->
    <link rel="icon"
          href="http://localhost:8000/resources/assets/img/brand/favicon.png"
          type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet"
          href="http://localhost:8000/resources/assets/vendor/nucleo/css/nucleo.css"
          type="text/css">
    <link rel="stylesheet"
          href="http://localhost:8000/resources/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
          type="text/css">
    <!-- Argon CSS -->
    <link rel="stylesheet"
          href="http://localhost:8000/resources/assets/css/argon.css?v=1.2.0"
          type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"
            integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://localhost:8000/resources/js/utils.js"></script>
</head>

<body>
<!-- Sidenav -->
<nav
        class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white"
        id="sidenav-main">
    <div class="scrollbar-inner">
        <!-- Brand -->
        <div class="sidenav-header  align-items-center">
            <a class="navbar-brand" href="javascript:void(0)">
                ${sessionScope.username}
            </a>
        </div>
        <div class="navbar-inner">
            <!-- Collapse -->
            <jsp:include page="nav.jsp"></jsp:include>
        </div>
    </div>
</nav>
<!-- Main content -->
<div class="main-content mt-6" id="panel">
    <!-- Page content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4" style="background-color:lavender;">
                <label>Thống kê bài viết của các danh mục</label>
                <canvas id="myChart1" width="100%" height="100%"></canvas>
            </div>
            <div class="col-sm-4" style="background-color:lavenderblush;">
                <label>Thống kê người viết tích cực</label>
                <canvas id="myChart2" width="100%" height="100%"></canvas>
            </div>
            <div class="col-sm-4" style="background-color:lavender;">
                <label>Thống kê bài viết qua các tháng trong năm</label>
                <canvas id="myChart3" width="100%" height="100%"></canvas>
            </div>
        </div>
    </div>
</div>
<!-- Argon Scripts -->
<!-- Core -->
<script src="../assets/vendor/jquery/dist/jquery.min.js"></script>
<script
        src="../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/js-cookie/js.cookie.js"></script>
<script src="../assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script
        src="../assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Argon JS -->
<script src="../assets/js/argon.js?v=1.2.0"></script>
</body>
<script>
    const ctx = document.getElementById('myChart1').getContext('2d');

    const myChart1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Hoạt động', 'Học tập', 'Đội - Nhóm', 'Chuyện trò - Tâm sự', 'Chia sẻ - Kinh nghiệm', 'Khác'],
            datasets: [{
                label: 'Bài viết từng danh mục',
                data: [${postEachCategories.get("Hoạt động")}, ${postEachCategories.get("Học tập")}, ${postEachCategories.get("Đội - Nhóm")}, ${postEachCategories.get("Chuyện trò- Tâm sự")}, ${postEachCategories.get("Chia sẻ - Kinh nghiệm")}, ${postEachCategories.get("Khác")}],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>

<script>
    const ctx1 = document.getElementById('myChart2').getContext('2d');
    const data = {
        labels: [
            <c:forEach items="${topUserCreatePostKey}" var="item">
                '${item}',
           </c:forEach>
        ],
        datasets: [{
            label: 'Người viết tích cực',
            data: [
                <c:forEach items="${topUserCreatePostValue}" var="item">
                ${item},
                </c:forEach>
            ],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
            ],
            hoverOffset: 4
        }]
    };
    const myChart2 = new Chart(ctx1, {
        type: 'doughnut',
        data: data,
    });
</script>

<script type="module">
    const ctx2 = document.getElementById('myChart3').getContext('2d');
    const labels = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
    ];
    const data1 = {
        labels: labels,
        datasets: [{
            label: 'Bài viết',
            data: [${postPerMonth.get("1")}, ${postPerMonth.get("2")}, ${postPerMonth.get("3")}, ${postPerMonth.get("4")},
                ${postPerMonth.get("5")}, ${postPerMonth.get("6")}, ${postPerMonth.get("7")}, ${postPerMonth.get("8")},
                ${postPerMonth.get("9")}, ${postPerMonth.get("10")}, ${postPerMonth.get("11")}, ${postPerMonth.get("12")}],
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        }]
    };
    const myChart3 = new Chart(ctx2, {
        type: 'line',
        data: data1,
    });
</script>
</html>