<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<img src="/resources/images/main_image.png">
			</article>
			<section class="main_items">
				<h2>추천상품리스트</h2>
				<div class="main_items_title">추천상품리스트</div>
				<article class="main_item">
					<h2>추천상품1</h2>
				</article>
				<article class="main_item">
					<h2>추천상품1</h2>
				</article>
				<article class="main_item">
					<h2>추천상품1</h2>
				</article>
			</section>
		</div>
		<footer class="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>