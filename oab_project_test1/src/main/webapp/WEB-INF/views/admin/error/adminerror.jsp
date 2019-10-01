<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<link href="/resources/include/css/reset.css" rel="stylesheet">
<link href="/resources/include/css/contentLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
<link href="/resources/include/css/policy.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<style type="text/css">
.error_container {
	margin-left: 300px;
	margin-bottom: 20px;
	margin-top:100px;
	font-weight: bold;
	float: center;
}
.buttons {
	margin-left: 100px;
	margin-top: 30px;
}
.return_main {
	width: 230px;
	height: 34px;
	text-align: center;
	margin-top: 10px;
	margin-right: 20px;
	background-color: #deefef;
	border: none;
}

.return_back {
	width: 230px;
	height: 34px;
	text-align: center;
	margin-top: 10px;
	margin-right: 20px;
	background-color: #deefef;
	border: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".return_main").click(function() {
			location.replace("/admin/login");
		});
		$(".return_back").click(function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<div class="error_container">
		<article>
			<div class="error_img">
				<img src="/resources/images/error_img.png">
			</div>
			요청하신 페이지는 관리자만 들어올 수 있는 페이지입니다.
			<div class="buttons">
				<input type="button" class="return_main" value="관리자로그인페이지">
				<br>
				<input type="button" class="return_back" value="이전으로">
			</div>
		</article>
	</div>
</body>
</html>