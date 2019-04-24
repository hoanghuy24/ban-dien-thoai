<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <c:url var="style" value="/resources/css/style.css"></c:url>
    <c:url var="bootstrap" value="/resources/css/bootstrap.css"></c:url>
    <link rel="stylesheet" href="${ bootstrap }">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="${ style }">
    <c:url var="jquery" value="/resources/js/jquery-3.3.1.js"></c:url>
    <script src="${ jquery }"></script>
    <c:url var="bootstrap" value="/resources/js/bootstrap.js"></c:url>
    <script src="${ bootstrap }"></script>

    <!-- Manager -->

    <!-- Bootstrap core CSS     -->
    <link href="<c:url value="/resources/assets/css/bootstrap.min.css"/>" rel="stylesheet"/>

    <!-- Animation library for notifications   -->
    <link href="<c:url value="/resources/assets/css/animate.min.css"/>" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="<c:url value="/resources/assets/css/light-bootstrap-dashboard.css?v=1.4.0"/>" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<c:url value="/resources/assets/css/demo.css" />" rel="stylesheet"/>


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="<c:url value="/resources/assets/css/pe-icon-7-stroke.css"/>" rel="stylesheet"/>
</head>
<body>
</head>
<header>
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <a href="/SellPhoneProject_war">
                        <i class="fas fa-home"
                           style="color: white; font-size: 30px;text-align: center;line-height: 100%;"></i>
                    </a>
                </div>
                <div class="col-md-6">
                    <form class="form-inline form-tim-kiem" action="result" method="get">
                        <input type="text" placeholder="Tìm kiếm" name="search">
                        <button>Tìm kiếm</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- nút bấm menu mobile-->
    <button class="navbar-toggler navbar-light bg-light" type="button"
            data-toggle="collapse" data-target="#main-menu">
        <span class="navbar-toggler-icon"></span>
    </button>
    </div>
    <div class="container">
        <!--menu-->
        <div class="row">
            <nav class="collapse navbar-collapse" id="main-menu">
                <ul>
                    <li><a href="iphone">Iphone</a></li>
                    <li><a href="samsung">Samsung</a></li>
                    <li><a href="htc">HTC</a></li>
                    <li><a href="nokia">Nokia</a></li>
                    <li><a href="sony">Sony</a></li>
                    <li><a href="blackberry">Blackberry</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<jsp:include page="${ param.view }"></jsp:include>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div id="logo-footer">
                    LOGO
                </div>
                <p>hihi</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Địa chỉ</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Dịch vụ</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Hotline</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500</p>
            </div>
        </div>
    </div>
    <div class="copy">
        <div class="container">2019 &copy;</div>
    </div>
</footer>
<script src="<c:url value="/resources/assets/js/jquery.3.2.1.min.js"/>"></script>
<script src=
                "<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
<!--  Charts Plugin -->
<script src=
                "<c:url value="/resources/assets/js/chartist.min.js"/>"></script>

<!--  Notifications Plugin    -->
<script src="<c:url value="/resources/assets/js/bootstrap-notify.js/"/>"></script>

<%--<!--  Google Maps Plugin    -->--%>
<%--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>--%>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="<c:url value="/resources/assets/js/light-bootstrap-dashboard.js?v=1.4.0"/>"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src=
                "<c:url value="/resources/assets/js/demo.js"/>"></script>
</body>
</html>