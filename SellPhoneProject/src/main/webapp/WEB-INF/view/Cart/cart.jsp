<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>this is buy ${ users.username }</h1>
<div align="center">
	
	<c:forEach items="${ users.listCart }" var="cart">
		<c:forEach var="item" items="${ cart.listItem }">
			<div><h4>Sản phẩm: ${ item.product.name }</h4></div>
			<div><h4>Số lượng: ${ item.numberOfProduct }</h4></div>
			<img src="${ item.product.image }">
			<br>
			<br>
		</c:forEach>
	</c:forEach>
	</div>
</body>
</html>