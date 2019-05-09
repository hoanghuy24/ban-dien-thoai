<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<c:form action="testValid" modelAttribute="user" method="POSt">
		<c:input path="username"></c:input><c:errors path="username"></c:errors><br>
		<c:input path="password"/><c:errors path="password"></c:errors>
		<input type="submit" value="Test">
		<p id="messages"></p>
	</c:form>
	<script>
		function load_ajax() {
			$.ajax({
				url : "xuly",
				dataType : "text",

			});
		}
	</script>
</body>
</html>