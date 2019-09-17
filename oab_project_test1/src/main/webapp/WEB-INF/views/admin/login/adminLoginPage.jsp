<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/login.css" />
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/adminLogin.js"></script>
</head>
<body>
	<c:if test="${adminLogin.adminID == null}">
		<div class="main_content">

			<form id="loginForm">

				<div id="login_wrapper">

					<div class="login">

						<nav id="image">
							<img src="/resources/admin/images/login.PNG" width="330px"
								height="300px">
						</nav>
						<table>
							<tr>
								<td colspan="3">관리자 로그인</td>
							</tr>
							<tr>
								<th><input type="text" id="adminID" name="adminID"
									size="40" placeholder="관리자 아이디 입력"></th>
							</tr>
							<tr>
								<th><input type="password" id="adminPW" name="adminPW"
									size="40" placeholder="관리자 비밀번호 입력"></th>
							</tr>
							<tr>
								<td colspan="3"><input type="button" id="loginBtn"
									value="LOGIN"></td>
							</tr>
						</table>
					</div>

				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${adminLogin.adminID != null}">
		<script type="text/javascript">
			location.href = "/admin/main";
		</script>
	</c:if>

</body>
</html>