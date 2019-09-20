<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link href="/resources/include/css/reset.css" rel="stylesheet">
<link href="/resources/include/css/mainLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<header class="header">
			<tiles:insertAttribute name="header" />
		</header>
		<div class="main_content">
			<article class="main_image">
				<h2>메인이미지</h2>
				<img class="main_img" src="/resources/images/main_img.png">
			</article>
			<div class="main_items">
				<h2>추천상품리스트</h2>
				<div class="main_items_title">신상품 리스트</div>
				<!--  -->
				<c:if test="${not empty setList}">
					<c:forEach var="product" items="${setList}" varStatus="status">
						<article class="main_item">
							<p>${product.pt_name}</p>
							<a href="/product/productList"> <img
								class="product_thumbnail"
								src="/uploadStorage/thumb/${product.pt_thumb}">
							</a>
						</article>
					</c:forEach>
				</c:if>
				<!--  -->
			</div>
		</div>
		<footer class="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>