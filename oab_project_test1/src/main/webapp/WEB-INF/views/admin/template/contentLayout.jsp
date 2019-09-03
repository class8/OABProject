<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/content.css" />
</head>
<body>
	<div class="wrapper">
		<header class="header" id="headertop">
			<tiles:insertAttribute name="header" />
		</header>
		<div class="content">
			<div class="asider" id="left">
				<tiles:insertAttribute name="left" />
			</div>
			<div class="main_content" id="main">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
</body>
</html>