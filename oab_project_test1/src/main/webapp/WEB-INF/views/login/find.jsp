<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find id</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/find.js"></script>
<script type="text/javascript">
	
</script>
<link type="text/css" rel="stylesheet"
	href="/resources/include/css/find.css">
</head>
<body>
	<div id="content"><p id="name">ID/PASSWORD SEARCH</p>
	<hr>
		<div class="WD-sub-titleArea">
			
			<p>회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.</p>
		</div>
		<form id="idform" name="form1" method="post"
			action="/member/memberIdselect">
			<div id="find_id" class="find_idpw">



				<div class="find-info">
					<table>
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tr>
							<th><div class="user-name">이메일</div></th>

							<td><div>
									<input type="text" id="mt_email" name="mt_email"
										class="MS_input_txt" value="" maxlength="80" title="이메일 주소"
										placeholder="">
								</div></td>
							<td><div>
									<p class="form-control-static error"></p>
								</div></td>
						</tr>

						<tr>
							<th><div id="find_id_email_wrap">이&nbsp;&nbsp;름</div></th>

							<td><div>
									<input type="text" id="mt_name" name="mt_name"
										class="MS_input_txt" value="" maxlength="30" title="이름"
										placeholder="" onfocus="idcheck()">
								</div></td>
							<td><div>
									<p class="form-control-static error"></p>
								</div></td>
						</tr>
					</table>

					<div class="btn-area">
						<button type="submit" class="btn join" id="mt_idemail">이메일
							전송</button>

					</div>
				</div>
			</div>
			<!--/#find_id/-->
		</form>

		<form id="" name="form1" method="post" action="/member/memberPwUpdate">

			<div id="find_pw" class="find_idpw">

				<p class="sub-tit">
					가입하신 아이디 + 이메일를 입력, 이메일로<br />임시 비밀번호를 보내드립니다. 확인 후 로그인하셔서 반드시
					비밀번호를 변경하시기 바랍니다.
				</p>

				<div id="find_pw_input_wrap">
					<div class="find-info">
						<table border="0" summary="이름, 이메일">
							<caption id="caption">임시 비밀번호 발급 폼</caption>
							<colgroup>
								<col width="135" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><div class="user-name">아이디</div></th>
									<td>
										<div>
											<input type="text" name="mt_id" id="mt_id" value=""
												class="MS_input_txt1" size="10" maxlength="20" />
											<!-- <input type="button" id="idCheckBtn" value="아이디 체크"
												class="form-control btn-primary" /> -->
										</div>

									</td>
									<td><div class="iderror">
											<p class="error"></p>
										</div></td>
								</tr>
								<tr>
									<th scope="row"><div id="find_pw_email_wrap">이메일</div></th>
									<td>
										<div>
											<input type="text" id="mt_emailpw" name="mt_email"
												class="MS_input_txt" value="" maxlength="80" title="이메일 주소"
												placeholder="" onfocus="check()">
										</div>
									</td>
									<td><div>
											<p class="form-control-static error"></p>
										</div></td>
								</tr>
							</tbody>
						</table>
						<div class="btn-area">
							<button type="submit" class="btn join" id="mt_pwemail">임시
								비밀번호 발급</button>

						</div>
					</div>
				</div>
			</div>
			<!--/#find_pw/-->
		</form>
	</div>
	<!-- #content -->


</body>
</html>