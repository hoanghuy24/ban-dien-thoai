<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 5/4/2019
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Title</title>
</head>
<body>
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
							Giá: <span id="price-${ item.product.id }">${ item.product.price }</span>
						</p>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<!-- chỗ vào có -id thì thay bằng id của sản phẩm-->
							<button id="add-${ item.product.id }" class="btn form-control">+</button>
							<input id="count-${ item.product.id }" class="form-control" type="text" value="1"
								readonly="true">
							<button id="remove-${ item.product.id }" class="btn form-control">-</button>
						</div>
					</div>
					<script type="text/javascript">
						$(function() {
							var sum = 0;
							var price = $("#price-${ item.product.id }").text();
							var count = $("#count-${ item.product.id }").val();
							sum = price * count;
							$("#sum-${ item.product.id }").text(sum);
							$("#add-${ item.product.id }").click(function() {
								var sum = 0;
								var price = $("#price-${ item.product.id }").text();
								var count = $("#count-${ item.product.id }").val();
								count++;
								$("#count-${ item.product.id }").val(count);
								sum = price * count;
								$("#sum-${ item.product.id }").text(sum);
							});
							$("#remove-${ item.product.id }").click(function() {
								var sum = 0;
								var price = $("#price-${ item.product.id }").text();
								var count = $("#count-${ item.product.id }").val();
								if (count > 0) {
									count--;
								}
								$("#count-${ item.product.id }").val(count);
								sum = price * count;
								$('#sum-${ item.product.id }').text(sum);
							})
						});
					</script>
				</div>
				<div class="row border-top">
					<p class="mt-4 mb-4">
						Tổng tiền: <span id="sum-${ item.product.id }"></span>
					</p>
				</div>
			</div>

			<div class="col-sm-3"></div>
		</div>
	<div class="d-flex justify-content-center">
		<a href="#" class="btn btn-primary align-content-center mb-4">Đặt hàng</a>
	</div>
</body>
</html>
