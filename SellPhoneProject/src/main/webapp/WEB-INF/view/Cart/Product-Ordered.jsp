<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
	%>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 shadow-lg p-3 mb-5 bg-white rounded">
				<!-- show sản phẩm -->
				<c:forEach var="item" items="${ listProducOrdered }">
					<div class="row">
						<div class="col-sm-8">
							<div class="row">
								<div class="col-sm-4">
									<img src="${ item.product.image }" width="55px">
								</div>
								<div class="col-sm-8">
									<strong>${ item.product.name }</strong><br> <small>Mô
										tả: ${ item.product.description } </small> <br> <small>Số
										lượng: ${ item.numberOfProduct } </small>
								</div>
							</div>
						</div>
						<div class="col-sm-4 mb-4 d-flex justify-content-end">
						<c:set var="price" value="${ item.product.price * item.numberOfProduct }"></c:set>
							<small><%= 
							decimalFormat.format(pageContext.getAttribute("price")) + " VNĐ"%></small>
						</div>
						<a href="${ home }/destroy-order-${ item.product.id }">Hủy đơn hàng</a>
					</div>
				</c:forEach>

				<!-- form đặt hàng -->
				
				<!-- nhận hàng trực tiếp -->
				<!-- <div class="row">
					Nhận hàng tại cửa hàng
				</div> -->
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>