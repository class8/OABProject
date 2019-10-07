<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <c:set var="mt_email" value="${fn:split(member.mt_email,'@')}" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Update Member!</title>

<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->

<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/member.css" /> -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/js/memberModify.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';

		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				swal ('오류' , '기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요.','error');
				break;
			case 2:
				swal ('오류' , '회원정보 수정에 오류가 발생하였습니다. \n잠시 후 다시 진행해 주세요.','error');
				break;
			}
		}
	}

	/* 	loginmt_id = "${member.mt_id}";
	 function emailCheck() {
	 var mt_email = "${mt_email[1]}";
	 $("#mt_email").val(mt_email).prop("selected", "true");
	 } */
</script>
<link type="text/css" rel="stylesheet"
	href="/resources/include/css/memberModify.css">
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" id="mt_id" name="mt_id" value="${member.mt_id}">
				<div class="form-group form-group-sm">
					<label for="mt_id" class="col-sm-2 control-label">사용자 ID</label>
					<div class="col-sm-3">${member.mt_id}</div>
					</div>
		
		<div class="form-group form-group-sm">
			<label for="oldmt_pw" class="col-sm-2 control-label">기존 비밀 번호</label>
			<div class="col-sm-3">
				<input type="password" id="oldmt_pw" name="oldmt_pw" maxlength="20"
					class="form-control" placeholder="기존 비밀번호 입력">
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label for="mt_pw" class="col-sm-2 control-label">변경할 비밀 번호</label>
			<div class="col-sm-3">
				<input type="password" id="mt_pw" name="mt_pw" maxlength="20"
					class="form-control" placeholder="변경할 비밀번호 입력">
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label for="mt_pwCheck" class="col-sm-2 control-label">변경
				비밀번호확인</label>
			<div class="col-sm-3">
				<input type="password" id="mt_pwCheck" name="mt_pwCheck"
					maxlength="20" class="form-control" placeholder="변경할 비밀번호 입력 확인">
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="mt_phone" class="userPhone">핸드폰 번호</label>
			<div>
				<input type="text" id="mt_phone" name="mt_phone" maxlength="11"
					class="form-control" placeholder="Phone Number"
					value="${member.mt_phone }" />
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>

		<div class="form-group">
			<label for="mt_email" class="userEmail">이메일</label>
			<div>
				<input type="text" id="mt_email" name="mt_email" maxlength="60"
					class="form-control" placeholder="@ 포함 영문/숫자 10~50자 입력"
					required="required" value="${member.mt_email}" />
			</div>

			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>

		<div class="form-group">
			<label for="mt_birth" class="userBirth">생년월일</label>
			<div>
				<input type="text" id="mt_birth" name="mt_birth" maxlength="6"
					class="form-control" placeholder="주민등록번호 앞 6자리"
					value="${member.mt_birth}" />
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="mt_name" class="userName">회원이름</label>
			<div>
				<input type="text" id="mt_name" name="mt_name" maxlength="10"
					class="form-control" placeholder="Name" value="${member.mt_name}" />
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>

		<div class="form-group">
			<label for="mt_gender" class="userGender">성별</label>
			<div>
				<input type="radio" name="mt_gender" value="Female">여성 <input
					type="radio" name="mt_gender" value="male">남 성 <input
					type="radio" name="mt_gender" value="neutral" checked="checked">선택안함
			</div>
			<div class="col-sm-5">
				<p class="error"></p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<input type="button" value="확인" id="modify" class="btn btn-default" />
				<br>
				<input type="button" value="재작성" id="modifyReset"
					class="btn btn-default" />
			</div>
		</div>
		</form>
	</div>
	</div>
</body>
</html>