<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 4/24/2019
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
    <title>${ profile.firstName} ${profile.lastName} - User Profile</title>
</head>
<body>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Edit Profile</h4>
                    </div>
                    <div class="content">
                        <form:form modelAttribute="profile" action="update-profile" method="post">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Company (disabled)</label>
                                        <input type="text" class="form-control" disabled placeholder="Company"
                                               value="Creative Code Inc.">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>USERNAME</label>
                                        <form:input type="text" class="form-control" placeholder="Username"
                                               readonly = "true"
                                               path="user_id.username"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Email address</label>
                                        <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <form:input type="text" class="form-control" path="firstName" placeholder="First Name"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <form:input type="text" class="form-control" path="lastName" placeholder="Last Name"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <form:input type="text" class="form-control" placeholder="Home Address"
                                               path="address"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>City</label>
                                        <form:input type="text" class="form-control" placeholder="City" path="city"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Country</label>
                                        <form:input type="text" class="form-control" placeholder="Country" path="country"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Zip Code</label>
                                        <form:input type="number" class="form-control" path="zipCode" placeholder="ZIP Code"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>About Me</label>
                                        <form:textarea rows="5" class="form-control"
                                                  placeholder="Here can be your description" path="aboutMe"/>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                            <div class="clearfix"></div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400"
                             alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray" src=
                                <c:url value="/resources/avatar/${ profile.avatar}"/> alt="..."/>

                                <h4 class="title">${ profile.firstName } ${ profile.lastName} <br/>
                                    <small>@${ profile.user_id.username}</small>
                                </h4>
                            </a>
                        </div>
                        <p class="description text-center">${profile.aboutMe}
                        </p>
                    </div>
                    <hr>
                    <div class="text-center">
                        <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
