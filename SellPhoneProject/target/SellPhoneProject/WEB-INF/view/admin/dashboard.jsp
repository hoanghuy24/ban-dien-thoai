<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 4/25/2019
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h1>this is dashboard</h1>
<script>
    $(function () {
        $(".sidebar .nav li:first-child").addClass("active");
        $(".sidebar .nav li:nth-child(2)").removeClass("active");
        $(".sidebar .nav li:nth-child(3)").removeClass("active");
        $(".sidebar .nav li:nth-child(4)").removeClass("active");
        $(".sidebar .nav li:nth-child(5)").removeClass("active");
        $(".sidebar .nav li:nth-child(6)").removeClass("active");
        $(".sidebar .nav li:nth-child(7)").removeClass("active");
    })
</script>
</body>
</html>
