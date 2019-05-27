<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="Post">
		<select name="category_param" id="cate">
			<option value="-1">Select Category</option>
			<c:forEach var="category" items="${ category }">
				<option value="${ category.id }">${ category.category }</option>
			</c:forEach>
		</select>
		<button>OK</button>
	</form>
</body>
</html>