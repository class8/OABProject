<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find id</title>
<script type="text/javascript">

$("#loginBtn").click(function() {
	location.href = "/login/login";
});

</script>
</head>
<body>
	<div id="content">


		<div class="WD-sub-titleArea">ID/PASSWORD SEARCH</div>


		<form id="" name="form1" method="post" action="/member/memberIdselect.do">



			<div id="find_id" class="find_idpw">

				<p class="sub-tit">회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수
					있습니다.</p>
				
				<div class="find-info">
					<table>
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tr class="user-name" height="38"
							style="border-bottom: 1px solid;">
							<th><div>이&nbsp;&nbsp;름</div></th>
							<td><div>
									<input type="text" id="mt_name" name="mt_name" class="MS_input_txt"
										value="" maxlength="30" title="이름" placeholder="">
								</div></td>

						</tr>


						<tr height="38" id="find_id_email_wrap">
							<th><div>이메일</div></th>
							<td><div>
									<input type="text" id="mt_email" name="mt_email"
										class="MS_input_txt" value="" maxlength="80" title="이메일 주소"
										placeholder="">
								</div></td>
						</tr>
					</table>

					<div class="btn-area">
						<button type="submit" class="btn join">
							<i class="fa fa-envelope"></i> 이메일 전송
						</button>
						<input type="button" value="로그인" id="loginBtn"
							class="btn btn-default" />
					</div>
				</div>
			</div>
			<!--/#find_id/-->
		</form>


		<form id="" name="form1" method="post" action="/member/memberPwUpdate.do">

			<div id="find_pw" class="find_idpw">

				<p class="sub-tit">
					가입하신 아이디 + 이메일를 입력, 이메일로<br />임시
					비밀번호를 보내드립니다. 확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다.
				</p>
				
				<div id="find_pw_input_wrap">
					<div class="find-info">
						<table border="0" summary="이름, 이메일">
							<caption>임시 비밀번호 발급 폼</caption>
							<colgroup>
								<col width="135" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr class="user-name">
									<th scope="row"><div>아이디</div></th>
									<td>
										<div>
											<input type="text" name="mt_id" id="mt_id" value=""
												class="MS_input_txt" size="10" maxlength="12" />
										</div>
									</td>
								</tr>
								<tr id="find_pw_email_wrap">
									<th scope="row"><div>이메일</div></th>
									<td>
										<div>
											<input type="text" id="mt_email" name="mt_email"
												class="MS_input_txt" value="" maxlength="80" title="이메일 주소"
												placeholder="" onfocus="document.form1.focus_ok.value='yes'">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn-area">
						<input type="submit" value="임시 비밀번호 발급">
							<a href="/login/login" class="btn_login_pw">로그인</a>
						</div>
					</div>
				</div>
			</div>
			<!--/#find_pw/-->
		</form>
	</div>
	<!-- #content -->

	<hr />

</body>
</html>