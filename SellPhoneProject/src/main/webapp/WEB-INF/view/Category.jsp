<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm ${ category }</title>
</head>
<body>
<div class="container">
    <section id="san-pham-moi">
        <h2 class="title">Sản phẩm ${ category }</h2>
        <div class="row">
            <c:forEach var="product" items="${ product }">
                <div class="col-md-4">
                    <div class="item text-center">
                        <a href="${category.toLowerCase()}/${ product.getCode()}-${ product.id}"><img
                                src="${ product.getImage() }" width="270px" height="150px"
                                alt="ảnh điện thoại"></a>
                        <p class="ten-san-pham">
                            <b><a href="${category.toLowerCase()}/${ product.getCode()}-${ product.id}">${ product.getName() }</a></b>
                        </p>
                        <p>
                            Giá: <span class="price">${ product.getFormatDiscount() }</span>
                        </p>
                        <c:if test="${product.getDiscount() > 0}">
                            <c:set var="sale" value="${ (product.discount * 100)/product.getPrice()}"/>
                            <div class="sale">-${ Math.round(sale) }%</div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
    <div class="btn-group mb-2" role="group">
        <c:if test="${ page > 1 }">
            <c:forEach var="page" begin="1" end="${ page }">
                <a class="btn btn-secondary" id="page" href="${ category }-page-${ page }">${ page }</a>
            </c:forEach>
        </c:if>
    </div>
    <c:if test="${pageID == null}">
        ${ pageID = 1}
    </c:if>
    <script>
        $(function () {
            $("#page:nth-child(${pageID})").addClass("active-page");
        });
    </script>
</div>
</body>
</html>