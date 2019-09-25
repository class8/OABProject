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
.error_container article {
	margin: 20% 20% 20% 20%;
	font-weight: bold;
}
.buttons{
	margin: 10% 10% 10% 10%;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".return_main").click(function() {
			location.replace("/");
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
			요청하신 페이지는 현재 접속이 불가능 하오니, 관리자에게 문의해주시기 바랍니다.
			<div class="buttons">
				<input type="button" class="return_main" value="메인페이지로">
				<input type="button" class="return_back" value="이전으로">
			</div>
		</article>
	</div>
</body>
</html>