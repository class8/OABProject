<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<style type="text/css">
.content article {
	margin: 20% 20% 20% 20%;
	font-weight: bold;
}

.buttons {
	margin: 10% 10% 10% 10%;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".return_UserInfo").click(function() {
			location.replace("/member/info/memberUserInfo");
		});
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
<c:if test="${code==1}">
	<div class="content">
		<article>
			<p>예약성공</p>
			<div class="buttons">
				<button class="return_UserInfo">내 이용정보 페이지로</button>
				<br>
				<br>
				<button class="return_main">메인페이지로</button>
				<button class="return_back">이전으로</button>
			</div>
		</article>
	</div>
</c:if>
<c:if test="${code==2}">
	<div class="content">
		<article>
			<p>예약실패</p>
			<div class="buttons">
				<button class="return_UserInfo">내 이용정보 페이지로</button>
				<br>
				<br>
				<button class="return_main">메인페이지로</button>
				<button class="return_back">이전으로</button>
			</div>
		</article>
	</div>
</c:if>
<c:if test="${code!=1 && code !=2}">
<div class="error_container">
		<article>
			<div class="error_img">
				<img src="/resources/images/error_img.png">
			</div>
			요청하신 페이지는 현재 접속이 불가능 하오니, 관리자에게 문의해주시기 바랍니다.
			<div class="buttons">
				<button class="return_main">메인페이지로</button>
				<button class="return_back">이전으로</button>
			</div>
		</article>
	</div>
</c:if>
</body>
</html>