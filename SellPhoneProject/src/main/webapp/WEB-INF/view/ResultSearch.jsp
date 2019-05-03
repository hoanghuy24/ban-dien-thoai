<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm cho ${ keyword }</title>
</head>
<body>
<div class="container">
    <section id="san-pham-moi">
        <h2 class="title">${ notResult }</h2>
        <h2 class="title">${ result }</h2>
        <div class="row">
            <c:forEach var="product" items="${ listResult }">
                <c:if test="${ product.getCategory().getId() == 1 }">
                    <c:set var="type" value="htc"></c:set>
                </c:if>
                <c:if test="${ product.getCategory().getId() == 2 }">
                    <c:set var="type" value="iphone"></c:set>
                </c:if>
                <c:if test="${ product.getCategory().getId() == 3 }">
                    <c:set var="type" value="nokia"></c:set>
                </c:if>
                <c:if test="${ product.getCategory().getId() == 4 }">
                    <c:set var="type" value="sony"></c:set>
                </c:if>
                <c:if test="${ product.getCategory().getId() == 5 }">
                    <c:set var="type" value="bleckberry"></c:set>
                </c:if>
                <c:if test="${ product.getCategory().getId() == 6 }">
                    <c:set var="type" value="samsung"></c:set>
                </c:if>
                <div class="col-md-4">
                    <div class="item text-center">
                        <a href="${type}/${ product.getCode()}-${ product.id}"><img
                                src="${ product.getImage() }" width="270px" height="150px"
                                alt="ảnh điện thoại"></a>
                        <p class="ten-san-pham">
                            <b><a href="">${ product.getName() }</a></b>
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
                <form action="result-page-${ page }">
                    <input type="hidden" value="${ keyword }" name="keyword">
                    <input class="btn btn-secondary" id="page" type="submit" value="${ page }">
                </form>
            </c:forEach>
        </c:if>
    </div>
    <script>
        $(function () {
            $("#page:nth-child(${pageID})").addClass("active-page");
        });
    </script>
</div>
</body>
</html>