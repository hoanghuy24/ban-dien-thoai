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
    <style>

        :root {
            --input-padding-x: 1.5rem;
            --input-padding-y: .75rem;
        }

        body {
            background: #007bff;
            background: linear-gradient(to right, #0062E6, #33AEFF);
        }

        .card-signin {
            border: 0;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
        }

        .card-signin .card-title {
            margin-bottom: 2rem;
            font-weight: 300;
            font-size: 1.5rem;
        }

        .card-signin .card-body {
            padding: 2rem;
        }

        .form-signin {
            width: 100%;
        }

        .form-signin .btn {
            font-size: 80%;
            border-radius: 5rem;
            letter-spacing: .1rem;
            font-weight: bold;
            padding: 1rem;
            transition: all 0.2s;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

        .form-label-group input {
            height: auto;
            border-radius: 2rem;
        }

        .form-label-group > input,
        .form-label-group > label {
            padding: var(--input-padding-y) var(--input-padding-x);
        }

        .form-label-group > label {
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            width: 100%;
            margin-bottom: 0;
            /* Override default `<label>` margin */
            line-height: 1.5;
            color: #495057;
            border: 1px solid transparent;
            border-radius: .25rem;
            transition: all .1s ease-in-out;
        }

        .form-label-group input::-webkit-input-placeholder {
            color: transparent;
        }

        .form-label-group input:-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-moz-placeholder {
            color: transparent;
        }

        .form-label-group input::placeholder {
            color: transparent;
        }

        .form-label-group input:not(:placeholder-shown) {
            padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
            padding-bottom: calc(var(--input-padding-y) / 3);
        }

        .form-label-group input:not(:placeholder-shown) ~ label {
            padding-top: calc(var(--input-padding-y) / 3);
            padding-bottom: calc(var(--input-padding-y) / 3);
            font-size: 12px;
            color: #777;
        }

        .btn-google {
            color: white;
            background-color: #ea4335;
        }

        .btn-facebook {
            color: white;
            background-color: #3b5998;
        }
    </style>
</head>


<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Đăng nhập</h5>
                    <form class="form-signin" action="login" method="post">
                        <div class="form-label-group">
                            <label >Tên tài khoản</label>
                            <input type="text"  name="username" class="form-control" required autofocus>
                        </div>

                        <div class="form-label-group">
                            <label>Mật khẩu</label>
                            <input type="password"  name="password" class="form-control">
                        </div>
                        <div class="mt-2"/>
                        <button class="btn btn-primary btn-block text-uppercase" type="submit">Đăng nhập</button>
                        <hr class="my-4">
                    </form>
                    <center><h5 style="color: red">${ msg}</h5></center>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<%--<body>--%>
<%--<div class="container">--%>
<%--    <form method="post" action="admin-login">--%>
<%--        <div class="form-group">--%>
<%--            <label for="user-name-label">Tên tài khoản: </label>--%>
<%--            <input type="text" class="form-control" id="user-name-label" name="username">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="password-label">Mật khẩu</label>--%>
<%--            <input type="password" name="password" class="form-control" id="password-label">--%>
<%--        </div>--%>
<%--        <div class="form-check">--%>
<%--            <input type="checkbox" class="form-check-input" id="password-always-checkbox">--%>
<%--            <label class="form-check-label" for="password-always-checkbox">Check me out</label>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--    </form>--%>
<%--    <h5 style="color: red">${ msg}</h5>--%>
<%--</div>--%>
<%--</body>--%>
</html>
