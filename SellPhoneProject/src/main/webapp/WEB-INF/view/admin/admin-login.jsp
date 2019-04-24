<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 4/24/2019
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <form method="post" action="admin-login">
        <div class="form-group">
            <label for="user-name-label">Tên tài khoản: </label>
            <input type="text" class="form-control" id="user-name-label" name="username">
        </div>
        <div class="form-group">
            <label for="password-label">Mật khẩu</label>
            <input type="password" name="password" class="form-control" id="password-label">
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="password-always-checkbox">
            <label class="form-check-label" for="password-always-checkbox">Check me out</label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <h5 style="color: red">${ msg}</h5>
</div>
</body>
</html>
