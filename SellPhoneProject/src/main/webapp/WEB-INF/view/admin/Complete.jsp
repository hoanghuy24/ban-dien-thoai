<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Add complete</h1>
	<h3>Please wait ${ s }s, page redirect</h3>
	<c:set var="product" value="${ product }" scope="page"></c:set>
</body>
</html>