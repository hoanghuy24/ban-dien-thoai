<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ SellPhone</title>
</head>
<body>
	<div class="container-form-add">
		<div class="information">
			<form:form class="form-add" action="test-12" method="post"
				modelAttribute="product">
				<br>Name:<br>
				<form:input path="name" />
				<div class="price-discount">
					<div id="name">
						<p>Price:</p>
						<input name="price" id="price" />
						<p class="validate-data" id="errorPrice"></p>
					</div>
					<div id="discount">
						<p>Discount:</p>
						<input id="discount-1" type="number" name="discount" />
						<p class="validate-data" id="errorDiscount"></p>
					</div>
				</div>
				<div class="ram-memory">
					<div class="ram">
						<p>RAM:</p>
						<form:input path="ram" />
					</div>
					<div class="memory">
						<p>Memory:</p>
						<form:input path="memory" />
					</div>
					<div class="camera">
						<p>Camera:</p>
						<form:input path="camera" />
					</div>
				</div>

				<p>Description:</p>
				<form:textarea id="description" path="description"></form:textarea>
				<p>Number Of Product:</p>
				<input id="numberOfProduct" type="number" name="numberOfProduct" />
				<p class="validate-data" id="errorNumber"></p>
				<br>
				
				
				<div class="category">
					<p>Category:</p>
					<select name="category" id="cate">
						<option value="-1">Select Category</option>
						<c:forEach var="c" items="${ category }">
							<option value="${ c.id }">${ c.category }</option>
						</c:forEach>
					</select>
					<div class="validate-data" id="error"></div>
				</div>
				
				
				<div class="list-image">
					<p>Avatar:</p>
					<input type="file" id="avatar" name="avatar">

					<p>Description Image:</p>
					<div>
						<input type="file" id="file-1" name="">
						<button id="file-del-1">
							<img
								src="https://cdn2.iconfinder.com/data/icons/e-business-helper/240/627249-delete3-512.png">
						</button>
					</div>
					<div>
						<input type="file" id="file-2" name="">
						<button id="file-del-2">
							<img
								src="https://cdn2.iconfinder.com/data/icons/e-business-helper/240/627249-delete3-512.png">
						</button>
					</div>
					<div>
						<input type="file" id="file-3" name="">
						<button id="file-del-3">
							<img
								src="https://cdn2.iconfinder.com/data/icons/e-business-helper/240/627249-delete3-512.png">
						</button>
					</div>
					<div>
						<input type="file" id="file-4" name="">
						<button id="file-del-4">
							<img
								src="https://cdn2.iconfinder.com/data/icons/e-business-helper/240/627249-delete3-512.png">
						</button>
					</div>
					<button id="button">Thêm ảnh minh họa</button>
				</div>
				<div class="long-description">
					<p>Long Description:</p>
					<form:textarea path="longDescription"></form:textarea>
				</div>
				<div class="add">
					<button id="add-product">ADD PRODUCT</button>
				</div>
			</form:form>

		</div>
	</div>
	<script lang="javascript"
		src="<c:url value='/resources/js/form-add.js'/>"></script>
</body>
</html>