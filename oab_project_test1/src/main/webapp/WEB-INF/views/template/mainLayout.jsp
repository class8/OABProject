<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="Matthew Howell" />
<meta name="description" content="fullPage continuous scrolling demo." />
<meta name="keywords"
	content="fullpage,jquery,demo,scroll,loop,continuous" />
<meta name="Resource-type" content="Document" />
<title><tiles:getAsString name="title" /></title>
<link href="/resources/include/css/reset.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
<link href="/resources/include/css/mainLayout.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/favicon.ico">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/mainLayout.js"></script>
</head>
<body>
	<div class="wrapper">

		<div class="main_content">
			<header class="header">
				<tiles:insertAttribute name="header" />
			</header>
			<!--  -->
			<div class="container">
				<section class="background">
					<div class="content-wrapper">
						<p class="content-title"></p>
					</div>
				</section>
				<section class="background">
					<div class="content-wrapper">
						<p class="content-title"></p>
					</div>
				</section>
				<section class="background">
					<div class="content-wrapper">
						<p class="content-title"></p>
					</div>
				</section>
			</div>
			<!--  -->
		</div>
	</div>
</body>
</html>