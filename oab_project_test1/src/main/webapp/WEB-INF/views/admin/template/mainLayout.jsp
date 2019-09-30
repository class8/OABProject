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
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/content.css" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>
<c:if test="${adminLogin.adminID != null}">
	<body>
		<div class="main_content">

			<div class="reservation" id="reservation">
				<h3>예약승인 대기 현황</h3>
				<table summary="공지사항 리스트" id="nt_list">
					<colgroup>
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="200px" />
						<col width="200px" />
					</colgroup>

					<thead>
						<tr id="list">
							<th>예약상태</th>
							<th>아이디</th>
							<th>예약자명</th>
							<th>상품가격</th>
							<th>예약 지점</th>
							<th>예약일</th>
							<th>작성일</th>
						</tr>
					</thead>

					<!-- 데이터 출력  -->
					<tbody>
						<c:choose>
							<c:when test="${not empty mainReservationList }">
								<c:forEach var="reserv" items="${mainReservationList }"
									varStatus="status" begin="0" end="4">

									<tr id="list" class="tac" data-num="${reserv.rest_number }">
										<td>${reserv.rest_status }</td>
										<td>${reserv.mt_id }</td>
										<td>${reserv.rest_name }</td>
										<td>${reserv.rest_total }</td>
										<td>${reserv.rest_bname }</td>
										<td>${reserv.rest_exprent }</td>
										<td>${reserv.rest_regdate }</td>
									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr id="list">
									<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="rental">
				<h3>대여 현황</h3>
				<table summary="공지사항 리스트">
					<colgroup>
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="140px" />
						<col width="200px" />
						<col width="200px" />
					</colgroup>

					<thead>
						<tr id="list">
							<th>대여상태</th>
							<th>아이디</th>
							<th>대여자명</th>
							<th>상품가격</th>
							<th>대여 지점</th>
							<th>대여일</th>
							<th>반납일</th>
						</tr>
					</thead>

					<!-- 데이터 출력  -->
					<tbody>
						<c:choose>
							<c:when test="${not empty asd}">
								<c:forEach var="reserv" items="${List }" varStatus="status"
									begin="0" end="4">

									<tr id="list" class="tac" data-num="${umber }">
										<td>${reserv.rest_status }</td>
										<td>${reserv.mt_id }</td>
										<td>${reserv.rest_name }</td>
										<td>${reserv.rest_total }</td>
										<td>${reserv.rest_bname }</td>
										<td>${reserv.rest_exprent }</td>
										<td>${reserv.rest_regdate }</td>
									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr id="list">
									<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="question" id="list">
				<h3>1:1 문의 현황</h3>
				<table summary="공지사항 리스트">
					<colgroup>
						<col width="60px" />
						<col width="80px" />
						<col width="100px" />
						<col width="360px" />
						<col width="200px" />
						<col width="100px" />
						<col width="200px" />
					</colgroup>

					<thead>
						<tr id="list_th">
							<th data-value="qt_number" class="order">번호</th>
							<th>카테고리</th>
							<th>아이디</th>
							<th>제 목</th>
							<th data-value="qt_regdate" class="order">작성일</th>
							<th>작성자</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					<!-- 데이터 출력  -->
					<tbody>
						<c:choose>
							<c:when test="${not empty mainQuestionList }">
								<c:forEach var="question" items="${mainQuestionList }"
									varStatus="status" begin="0" end="4">

									<tr id="list_td" class="tac" data-num="${question.qt_number }">
										<td>${question.qt_number }</td>
										<td>${question.qt_status }</td>
										<td>${question.mt_id }</td>
										<td>${question.qt_title }</td>
										<td>${question.qt_regdate }</td>
										<td>${question.qt_writer }</td>
										<td>${question.qt_file }</td>
									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr>
									<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</c:if>
</html>