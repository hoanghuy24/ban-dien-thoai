<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 5/9/2019
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng ký</title>

</head>
<body>
<div class="container">
    <form:form modelAttribute="newUser" method="POST">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="form-group">
                    <form:label path="username">Tên tài khoản (*): </form:label>
                    <div class="notifi">
                        <form:input type="text" id="user" class="form-control" autocomplete="off"
                                    path="username"/>
                        <p class="error" id="error-user"></p>
                        <form:errors cssClass="show-error-server us" path="username"/>

                    </div>

                </div>

                <div class="form-group">
                    <form:label path="password">Mật khẩu (*): </form:label>
                    <div class="notifi">
                        <form:input class="form-control" id="password" autocomplete="off"
                                    type="password"
                                    path="password"/>
                        <p class="error error-pass"></p>
                        <form:errors cssClass="show-error-server pa" path="password"/>

                    </div>

                </div>

                <div class="form-group">
                    <label>Nhập lại mật khẩu (*): </label>
                    <div class="notifi">
                        <input class="form-control" id="rpassword" autocomplete="off" type="password"/>
                        <p class="error error-pass"></p>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="userProfile.email">Email (*): </form:label>
                    <div class="notifi">
                        <form:input id="email" type="email" class="form-control" autocomplete="false" path="userProfile.email"/>
                        <p class="error error-email"></p>
                        <form:errors cssClass="show-error-server em" path="userProfile.email"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center mb-4">
                    <input type="submit" class="btn btn-danger" id="ok" value="Đăng ký">
                </div>

            </div>

            <div class="col-sm-4">
                <h1>${ msg}</h1>
<%--                <br>--%>
<%--                <form:errors cssClass="show-error-server" path="username"/>--%>
<%--                <br>--%>
<%--                <form:errors cssClass="show-error-server" path="password"/>--%>
<%--                <br>--%>
<%--                <form:errors cssClass="show-error-server" path="userProfile.email"/>--%>
            </div>
        </div>
    </form:form>
</div>
<script src="<c:url value="/resources/js/register.js"/>"></script>
</body>
</html>
