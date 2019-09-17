<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
</head>
<c:if test="${adminLogin.adminID != null}">
	<body>

		<div class="main_content">
			<div class="user_main">
				<div class="reservation">
					<h2>예약승인 대기 리스트</h2>
					<p>이곳에 예약승인대기 중인 5명의 예약정보가 리스트 형식으로 보여집니다.</p>
				</div>

				<div class="rental">
					<h2>대여리스트</h2>
					<p>이곳에 대여중인 5명의 대여자 정보가 리스트 형식으로 보여집니다.</p>
				</div>

				<div class="question">
					<h2>1:1 문의 답변 대기리 스트</h2>
					<p>이곳에 관리자의 답변을 기다리는 5개의 1:1문의 정보가 리스트 형식으로 보여집니다.</p>
				</div>

			</div>
		</div>

	</body>
</c:if>
</html>