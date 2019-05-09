<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dec"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><dec:title default="SellPhone"/></title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link href="<c:url value="/resources/img/logo.jpg"/>" rel="icon" type="image/x-icon"/>
</head>
<body>
<header>
    <c:set var="home" value="${ pageContext.request.contextPath }"
           scope="application">
    </c:set>
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <a href="${ home }"> <i class="fas fa-home"
                                            style="color: white; font-size: 30px; text-align: center; line-height: 100%;"></i>
                    </a>
                </div>
                <div class="col-md-6">
                    <form class="form-inline form-tim-kiem" action="${ home }/result"
                          method="get">
                        <input type="text" placeholder="Tìm kiếm" name="search">
                        <button>Tìm kiếm</button>
                    </form>
                </div>

                <%--                Cart--%>
                <c:if test="${ sessionScope.user_id != null && sessionScope.user != null }">

                    <div class="col-md-3 card-bar">
                        <div class="arrow-card"></div>
                        <a class="cart-icon" href="${ home}/cart" id="cart"><small>Giỏ hàng - ${ sessionScope.user.username }
                            <i class="fas fa-shopping-cart"></i></small>
                        </a>
                        <div class="drop shadow-sm p-3 mb-5 bg-white rounded">
                            <a href="${ home }/ordered"><small>Sản phẩm đã đặt</small></a><br>
                            <a href="${ home}/logout"><small>Đăng xuất</small></a>
                        </div>
                    </div>

                </c:if>
                <c:if test="${ sessionScope.user_id == null || sessionScope.user == null }">
                    <a class="cart-icon" href="${ home}/login" id="cart"><small>Đăng nhập<i
                            class="fas fa-shopping-cart"></i></small></a>
                </c:if>
                <%--                end cart--%>

            </div>
        </div>
    </div>
    <!-- button menu mobile-->
    <button class="navbar-toggler navbar-light bg-light" type="button"
            data-toggle="collapse" data-target="#main-menu">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container">
        <%-- end button menu mobile--%>
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

<%--body--%>
<dec:body/>
<%--end body--%>

<%--footer--%>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div id="logo-footer">LOGO</div>
                <p>hihi</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Địa chỉ</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and
                    typesetting industry. Lorem Ipsum has been the industry's standard
                    dummy text ever since the 1500</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Dịch vụ</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and
                    typesetting industry. Lorem Ipsum has been the industry's standard
                    dummy text ever since the 1500</p>
            </div>
            <div class="col-md-3">
                <h3 class="title-footer">Hotline</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and
                    typesetting industry. Lorem Ipsum has been the industry's standard
                    dummy text ever since the 1500</p>
            </div>
        </div>
    </div>
    <div class="copy">
        <div class="container">2019 &copy;</div>
    </div>
</footer>
<%--end footer--%>

<%--button up--%>
<div class="btn btn-danger btn-up"><i class='fas fa-chevron-up'></i></div>
<script>
    $(".btn-up").hide();
    $(function () {
        $(window).scroll(function () {
            var p = $(window).scrollTop();
            if (p > 100) {
                $(".btn-up").show(500);
            } else {
                $(".btn-up").hide(500);
            }
        });
        $(".btn-up").click(function () {
            $("html, body").animate({scrollTop: 0}, 500);
        });
    });
</script>
<%--end button up--%>
</body>
</html>