<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 5/4/2019
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 border-top">
        <div class="row mt-4 mb-4">
            <div class="col-sm-3">
                <img src="https://images.fpt.shop/unsafe/fit-in/465x465/filters:quality(90):fill(white)/cdn.fptshop.com.vn/Uploads/Originals/2017/12/8/636483223586180190_3.jpg"
                     width="100%">
            </div>
            <div class="col-sm-6">

                <h6>Tên sản phẩm</h6>
                <p>Giá: <span id="price-id">1000</span></p>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <!-- chỗ vào có -id thì thay bằng id của sản phẩm-->
                    <button id="add-id" class="btn form-control"> +</button>
                    <input id="count-id" class="form-control" type="text" value="1" readonly="true">
                    <button id="remove-id" class="btn form-control"> -</button>
                </div>
            </div>
            <script>
                $(function () {
                    var sum = 0;
                    var price = $("#price-id").text();
                    var count = $("#count-id").val();
                    sum = price * count;
                    $("#sum-id").text(sum);
                    $("#add-id").click(function () {
                        var sum = 0;
                        var price = $("#price-id").text();
                        var count = $("#count-id").val();
                        count++;
                        $("#count-id").val(count);
                        sum = price * count;
                        $("#sum-id").text(sum);
                        //////
                        var sum_id = $("#sum-id").text();
                        var sum_1 = $("#sum-1").text();
                        var sum_2 = $("#sum-1").text();
                        $("#sumAll").text(sum_id + sum_1 + sum_2);
                    });
                    $("#remove-id").click(function () {
                        var sum = 0;
                        var price = $("#price-id").text();
                        var count = $("#count-id").val();
                        if (count > 0) {
                            count--;
                        }
                        $("#count-id").val(count);
                        sum = price * count;
                        $("#sum-id").text(sum);
                        //////////
                        var sum_id = $("#sum-id").text();
                        var sum_1 = $("#sum-1").text();
                        var sum_2 = $("#sum-2").text();
                        $("#sumAll").text(sum_id + sum_1 + sum_2);
                    });
                });
            </script>

        </div>
        <div class="row border-top">
            <p class="mt-4 mb-4">Tổng tiền: <span id="sum-id"></span></p>
        </div>

    </div>
    <div class="col-sm-3">
    </div>
</div>
    <div class="d-flex justify-content-center">
    <a href="#" class="btn btn-primary align-content-center mb-4">Tiến hành thanh toán</a>
    </div>
</body>
</html>
