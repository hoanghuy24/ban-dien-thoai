<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ SellPhone</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/form-add.css'></c:url>"/>
</head>
<body>
	<div class="container-form-add">
		<form class="form-add" action="" method="POST"
			enctype="multipart/form-data">
			<div class="information">
				<br>Name:<br> <input type="text" name="name">
				<div class="price-discount">
					<div id="name">
						<p>Price:</p>
						<input type="number" id="name" name="name">
					</div>
					<div id="discount">
						<p>Discount:</p>
						<input type="number" id="discount" name="discount">
					</div>
				</div>
				<div class="ram-memory">
					<div class="ram">
						<p>RAM:</p>
						<input type="text" name="name">
					</div>
					<div class="memory">
						<p>Memory:</p>
						<input type="text" name="name">
					</div>
					<div class="camera">
						<p>Camera:</p>
						<input type="text" name="name">
					</div>

				</div>

				<p>Description:</p>
				<textarea id="description" name="description"></textarea>
				<p>Number Of Product:</p>
				<input type="number" id="numberOfProduct" name="name"><br>
				<div class="category">
					<p>Category:</p>
					<select>
						<option>Category1</option>
						<option>Category1</option>
						<option>Category1</option>
						<option>Category1</option>
						<option>Category1</option>
						<option>Category1</option>
						<option>Category1</option>
					</select>
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
					<textarea></textarea>
				</div>
				<div class="add">
					<button>Thêm sản phẩm</button>
				</div>
			</div>
		</form>
	</div>
	<script lang="javascript"
		src="<c:url value='/resources/js/form-add.js'/>"></script>
</body>
</html>