<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>memberSecede</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<!-- <script type="text/javascript"
	src="/resources/include/js/memberSecede.js"></script> -->
<script type="text/javascript">
	$(document).on("click", "#memberSecede", function() {

		// 입력값 체크
		if (!formCheck($('#mt_id'), $('.error:eq(0)'), "아이디를"))
			return;

		else if (!formCheck($('#mt_pw'), $('.error:eq(1)'), "비밀번호를"))
			return;

		else {
			var check = document.deleteform.check.checked;
			var num = 0;

			if (check == true) {
				num = 1;
			}
			if (num == 1) {
				//document.deleteform.submit();
			} else {
				alert("회원 탈퇴 이용약관에 동의하셔야 합니다.");
				return true;

			}
			if (confirm("정말 탈퇴하시겠습니까?")) {
				var mt_id = $("#mt_id").val();

				$.ajax({
					url : "/member/memberSecede/" + mt_id,
					type : "put",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "put"
					},
					data : JSON.stringify({
						mt_id : mt_id
					}),
					dataType : "text",
					success : function(result) {
						console.log("result:" + result);
						if (result == 'SUCCESS') {
							alert("고객님의 회원 탈퇴 처리가 완료되었습니다.");

							$("#delete").attr({
								"method" : "POST",
								"action" : "/login/logout"
							});
							$("#delete").submit();
						}
					}

				});
			}

		}

	});
	$(function() {
		$("#SecedeReset").click(function() {
			location.href = "/";
		});
	});
</script>
<link type="text/css" rel="stylesheet"
	href="/resources/include/css/memberSecede.css">
</head>
<body>
	<form name="deleteform" id="delete">
		<table width="1400" height="200">
			<tr>
				<td width="100%" height="10%"><span style="padding-left: 160px"></span>&nbsp;
					<br>
					<hr></td>
			</tr>
			<tr>
				<td width="100%" height="20%" align="center">
					<p align="left">
						<span style="padding-left: 160px"> <b> OAB 텐트 회원 탈퇴</b></span>
					</p>
					<h4>유의사항 확인 후 탈퇴 신청을 해주세요</h4> <br> <textarea rows="7"
						cols="130" readonly="readonly">
					- 회원탈퇴를 하시면 OAB TENT 로 가입된 모든 서비스를 사용할 수 없습니다.
					- 또한 OAB TENT 아이디로 서비스를 가입/사용 하면서 축적된 정보 및 기록은 
					    모두 삭제 되며,복구가 불가능합니다.
					- 대여서비를 이용하고 계신 고객님은 탈퇴가 불가능하오니, 반납후 탈퇴 진행이 가능합니다.
   </textarea> <br> <br> <label style="width: 700px"><input
						type="checkbox" name="check" class="check" id="check"><span>위
							내용을 모두 확인 하였으며, 탈퇴시 모든 정보가 복구 불가능함에 동의합니다. </span></label>

					<hr>
				</td>
			</tr>
		</table>

		<div>
			<div class="form-group">
				<label for="mt_id" id="mt_id" class="col-sm-2 control-label">아 이 디 </label>
				<div class="col-sm-4">
					<input type="text" id="mt_id" name="mt_id" class="form-control"
						placeholder="ID">
				</div>
				<p class="form-control-static error"></p>
			</div>
			<div class="form-group">
				<label for="mt_pw" id="mt_pw" class="col-sm-2 control-label">비밀번호 </label>
				<div class="col-sm-4">
					<input type="password" id="mt_pw" name="mt_pw" class="form-control"
						placeholder="Password">
				</div>
				<p class="form-control-static error"></p>
			</div>
			<br> <input type="button" value="탈 &nbsp;&nbsp;퇴" id="memberSecede" /> <br><input
				type="button" value="취 &nbsp;&nbsp;소" id="SecedeReset">
		</div>
	</form>


</body>
</html>