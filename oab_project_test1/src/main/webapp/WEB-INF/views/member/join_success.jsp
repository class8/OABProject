<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- <meta http-equiv="refresh" content="10; url=/login/login"> -->
<title>회원가입 완료 화면</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<style type="text/css">
.content article {
	margin-left: 400px;
	margin-bottom: 20px;
	font-weight: bold;
	float: center;
}

#join {
	margin-left: 400px;
	margin-bottom: 20px;
}

#login {
	margin-left: 500px;
	margin-bottom: 20px;
}

.buttons {
	margin-left: 100px;
}

.return_login {
	width: 230px;
	height: 34px;
	text-align: center;
	margin-top: 10px;
	margin-right: 20px;
	background-color: #deefef;
	border: none;
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

.error_container {
	margin-left: 400px;
	margin-bottom: 20px;
	font-weight: bold;
	float: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".return_login").click(function() {
			location.replace("/login/login");
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
			<img id="login" src="/resources/images/login_img.png">
			<article id="join">
				OAB 한강 텐트 사이트에 회원 가입해 주셔서 감사합니다.<br />
				<div class="buttons">
					<button class="return_login">로그인 페이지로</button>
					<br>
					<button class="return_main">메인페이지로</button>
					<br>
					<button class="return_back">이전으로</button>
				</div>
			</article>
		</div>
	</c:if>
	<c:if test="${code!=1}">
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