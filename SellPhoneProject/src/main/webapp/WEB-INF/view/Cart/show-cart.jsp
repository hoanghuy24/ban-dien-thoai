<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 5/4/2019
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.DecimalFormat" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
%>
<c:forEach var="item" items="${ users.cart.listItem }">

    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6 border-top">
            <div class="row mt-4 mb-4">
                <div class="col-sm-3">
                    <img src="${ item.product.image }" width="100%">
                </div>

                <div class="col-sm-6">


                    <h6>Tên sản phẩm: ${ item.product.name }</h6>
                    <p>
                        <c:set var="price" value="${ item.product.price }"/>

                        Giá: <span
                            id="price-${ item.product.id }"><%=decimalFormat.format(pageContext.getAttribute("price")) + " VNĐ"%></span>
                    </p>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <!-- chỗ vào có -id thì thay bằng id của sản phẩm-->
                        <form action="update-${ item.product.id }">
                            <button id="add-${ item.product.id }" class="btn form-control">+</button>
                            <input id="count-${ item.product.id }" class="form-control"
                                   type="text" value="${ item.numberOfProduct }" readonly="true"
                                   name="quentity">
                            <button id="remove-${ item.product.id }"
                                    class="btn form-control">-
                            </button>
                        </form>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        var sum = 0;
                        var price = ${ item.product.price };
                        var count = $("#count-${ item.product.id }").val();
                        sum = price * count;
                        $("#sum-${ item.product.id }").text(sum);
                        $("#add-${ item.product.id }").click(
                            function () {
                                var sum = 0;
                                var price = ${ item.product.price };
                                var count = $(
                                    "#count-${ item.product.id }")
                                    .val();
                                count++;
                                $("#count-${ item.product.id }").val(
                                    count);
                                sum = price * count;
                                $("#sum-${ item.product.id }")
                                    .text(sum);
                            });
                        $("#remove-${ item.product.id }").click(
                            function () {
                                var sum = 0;
                                var price = ${ item.product.price };

                                var count = $(
                                    "#count-${ item.product.id }")
                                    .val();
                                if (count > 0) {
                                    count--;
                                }
                                $("#count-${ item.product.id }").val(
                                    count);
                                sum = price * count;
                                $('#sum-${ item.product.id }')
                                    .text(sum);
                            });
                    });
                </script>
                <a href="delete-${ item.product.id }" class="mt-4">
                    <small>Xóa khỏi giỏ hàng</small>
                </a>
            </div>
            <div class="row border-top">
                <p class="mt-4 mb-4">
                    Tổng tiền: <span id="sum-${ item.product.id }"></span>

                </p>
            </div>
        </div>

        <div class="col-sm-3"></div>
    </div>
</c:forEach>

<div class="d-flex justify-content-center">

    <a href="pay" class="btn btn-primary align-content-center mb-4 mr-3">
        <small>Thanh
            Toán Khi Nhận Hàng
        </small>
    </a>

    <a href="pay" id="payLive"
       class="btn btn-primary align-content-center mb-4">
        <small>Thanh Toán Trực
            Tuyến
        </small>
    </a>
</div>
<c:if test='${ pay == "pay" }'>
    <p>Tổng tiền: ${ sumMoney }</p>
</c:if>
<script type="text/javascript">
    var payLive = document.getElementById("payLive");
    payLive.onclick = function () {
        alert("Chức năng đang trong quá trình phát triển");
        return false;
    }
</script>
</body>
</html>
