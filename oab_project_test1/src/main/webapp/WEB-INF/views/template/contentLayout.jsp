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
<link href="/resources/include/css/contentLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<header class="header">
			<tiles:insertAttribute name="header" />
		</header>
		<div class="main_content">
			<div class="main_aside">
				<tiles:insertAttribute name="main_aside" />
			</div>
			<div class="main_body">
				<tiles:insertAttribute name="main_body" />
			</div>
		</div>
		<footer class="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>