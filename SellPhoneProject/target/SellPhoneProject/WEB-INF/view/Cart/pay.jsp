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
				<c:forEach var="item" items="${ listItem }">
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
					</div>
				</c:forEach>

				<!-- tiền cần thanh toán -->
				<div class="row border-top mt-4">
					<div class="col-sm-8 mt-4">
						<small>Tổng tiền: </small><br> <strong><small>Cần
								thanh toán: </small></strong>
					</div>
					<div class="col-sm-4 mt-4 justify-content-end">
						<small><%=decimalFormat.format(request.getAttribute("sumMoney")) + " VNĐ"%></small><br>
						<strong><small><%=decimalFormat.format(request.getAttribute("sumMoney")) + " VNĐ"%></small></strong>
					</div>
				</div>
				<!-- <input type="radio" name="address" id="sieuthi" value="1">  Nhận hàng tại siêu thị 
				<input type="radio" name="address" id="giaohang" value="0">  Nhận hàng tại  
 -->
				<!-- form đặt hàng -->
				<div class="row mt-4  d-flex justify-content-center border-top">
					<form class="pl-3">
						<div class="form-group mt-4">
							<input type="radio" name="sex" value="1"> Anh <input
								type="radio" name="sex" value="0"> Chị
						</div>
						<div class="row form-group">
							<div class="col-sm-6">
								<input class="form-control" required="true" type="text"
									name="name" placeholder="Họ và tên" value="${ name }">
							</div>
							<div class="col-sm-6">
								<input class="form-control" required="true" type="text"
									name="phonenumber" placeholder="Số điện thoại">
							</div>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="other"
								placeholder="Thông tin khác (không bắt buộc)">
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="address"
								value="${ address }" placeholder="Địa chỉ nhận hàng">
						</div>
						<div class="d-flex justify-content-center">
							<input type="submit" class="btn btn-outline-danger"
								value="Đặt hàng">
						</div>
					</form>
				</div>
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