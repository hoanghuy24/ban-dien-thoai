<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 4/23/2019
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin sản phẩm ${ product.getName() }</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${ product != null}">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a
                            href="${ pageContext.request.contextPath }">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a
                            href="${ product.getCategory().getCategory().toLowerCase()}">${ product.getCategory().getCategory()}</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">${ product.getName()}</li>
                </ol>
            </nav>

            <h3 class="title">
                <span>${ product.getName()}</span> <span class="share-button"><i
                    class="fas fa-share"></i></span>
            </h3>
            <div class="row show-info">

                <div class="col-sm-4">
                    <div class="img-thumbnail main-img">
                        <img src="${ product.getImage()}" width="100%" height="100%">
                    </div>

                    <!-- Slide -->
                    <c:if test="${ product.getListImage().size() > 0}">
                        <div id="carouselExampleControls" class="carousel slide mt-4"
                             data-ride="carousel">
                            <div class="carousel-inner">
                                <c:set var="i" value="1"/>
                                <c:forEach var="img" items="${product.getListImage()}">
                                    <c:choose>
                                        <c:when test="${ i == 1}">
                                            <div class="carousel-item active">
                                                <img class="d-block w-100" src="${ img.getImage()  }">
                                            </div>
                                            <c:set var="i" value="0"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="${ img.getImage()  }">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls"
                               role="button" data-slide="prev"> <span
                                    class="fas fa-chevron-left next-prev" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a> <a class="carousel-control-next "
                                    href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="fas fa-chevron-right next-prev" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                        </div>
                    </c:if>
                </div>

                <div class="col-sm-4">
                    <c:choose>
                        <c:when test="${ product.getDiscount() > 0}">
                            <c:set var="discount" value="${ product.getFormatDiscount() }"/>
                            <h6>
                                <label>Giá: </label> <span class="price"> ${discount}</span> <br>
                                <small>Giá niêm yết:<span class="discount">
                                    ${product.getFormatPrice()} </span></small>
                            </h6>
                        </c:when>
                        <c:otherwise>
                            <h6>
                                <label>Giá: </label> <span class="price"> ${ product.getFormatDiscount() }</span>
                            </h6>
                        </c:otherwise>
                    </c:choose>
                    <label>Mô tả: </label><span> ${ product.getDescription()}</span> <br>
                    <form action="check-${ product.id }">
                        <div class="row">
                            <div class="col-sm-3">
                                <input type="button" class="form-control" id="rm" value="-" width="10px"
                                       onclick="return false">
                            </div>
                            <div class="col-sm-6">
                                <input class="form-control" type="number" id="quentity" name="quentity" value="">
                            </div>
                            <div class="col-sm-3">
                                <input class="form-control" type="button" id="add" value="+" width="10px"
                                       onclick="return false">
                            </div>
                        </div>
                        <br>
                        <button class="btn btn-outline-primary buynow">Order</button>
                        <input type="hidden" name="idProduct" value="${ product.id }">
                        <c:if test='${ error == "Please Login" }'>
                            ${ error }
                            <a
                                    href="${ pageContext.request.contextPath }/login-buy-${ product.id}">Đăng
                                nhập tại đây</a>
                        </c:if>
                    </form>
                </div>

                <div class="col-sm-4">
                    <table class="table">
                        <tr class="table-dark">
                            <th scope="col">Thông số kỹ thuật</th>
                        </tr>
                        <tr>
                            <td scope="row">RAM: ${ product.getRam()}</td>
                        </tr>
                        <tr>
                            <td scope="row">Bộ nhớ trong: ${ product.getMemory()}</td>
                        </tr>
                        <tr>
                            <td scope="row">Chip: ${ product.getChip()}</td>
                        </tr>
                        <tr>
                            <td scope="row">Camera: ${ product.getCamera()}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row show-info">
                <div class="col-sm-8">${ product.getLongDescription()}</div>
            </div>
        </c:when>
        <c:otherwise>
            <h1>Not Found</h1>
        </c:otherwise>
    </c:choose>
</div>
<script type="text/javascript">
    var quentity = 1;
    $("#quentity").val(quentity);
    var add = document.getElementById("add");
    var remove = document.getElementById('rm');

    add.onclick = function () {
        ++quentity;
        $("#quentity").val(quentity);
    }

    remove.onclick = function () {
        --quentity;
        if (quentity < 1) {
            quentity = 1;
        }
        $("#quentity").val(quentity);
    }

    function check() {
        if (quentity > 1000) {
            quentity = document.getElementById('quentity').value;
            alert(quentity);
            return false;
        }

        return true;
    }
</script>
</body>
</html>
