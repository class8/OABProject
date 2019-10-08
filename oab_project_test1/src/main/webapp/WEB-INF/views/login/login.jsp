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

<title>Login</title>

<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script type="text/javascript">
if("${logincheck}"){
	   alert("${logincheck}");
	   location.href="/login/login";
	}
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				swal ('오류' , '아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.','error');
				break;
			case 3:
				swal ('오류' , '회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요','error');
				break;
			case 6:
				swal ('오류' , '5번이상 로그인 시도로 30분동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요.','error');
				break;
			}
		}
	}
	function enterkey() {
		if (window.event.keyCode == 13) {
			//엔터키가 눌렀을때 실행할 내용
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/login/login"
			});
			$("#loginForm").submit();
		}

	}
</script>
<link type="text/css" rel="stylesheet"
	href="/resources/include/css/login.css">
</head>
<body>
	<div class="contentContainer">

		<div class="well">
			<c:if test="${login.mt_id == null or login.mt_id == ''}">
				<form id="loginForm" class="form-horizontal">
					<div>
						<img id="login_img" src="/resources/images/login_img.png">
					</div>
					<div class="form-group">
						<label for="mt_id" class="col-sm-2 control-label">아 이 디 </label>
						<div class="col-sm-4">
							<input type="text" id="mt_id" name="mt_id" class="form-control"
								placeholder="ID">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<label for="mt_pw" class="col-sm-2 control-label">비밀번호 </label>
						<div class="col-sm-4">
							<input onkeyup="enterkey();" type="password" id="mt_pw"
								name="mt_pw" class="form-control" placeholder="Password">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input type="button" value="로그인" id="loginBtn"
								class="btn btn-default" /> <input type="button" value="회원가입"
								id="joinBtn" class="btn btn-default" />
						</div>
					</div>

					<p>
						<a id="find" href="/login/find">아이디/비밀번호 찾기</a>
					</p>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>