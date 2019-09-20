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
</head>
<c:if test="${adminLogin.adminID != null}">
	<body>
		<div class="main_content">

			<div class="reservation" id="list">
				<h4>예약승인 대기 리스트</h4>
				<table summary="공지사항 리스트" id="nt_list" border="1">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>

					<thead>
						<tr id="list_th">
							<th>예약상태</th>
							<th>회원 아이디</th>
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
									varStatus="status">

									<tr id="list_td" class="tac" data-num="${reserv.rest_number }">
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
								<tr>
									<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="rental" id="list">
				<h4>대여리스트</h4>
				<table summary="공지사항 리스트" id="nt_list" border="1">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>

					<thead>
						<tr id="list_th">
							<th>예약상태</th>
							<th>회원 아이디</th>
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
							<c:when test="${not empty asd}">
								<c:forEach var="reserv" items="${List }" varStatus="status">

									<tr id="list_td" class="tac" data-num="${umber }">
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
								<tr>
									<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="question" id="list">
				<h4>1:1 문의 답변 대기리 스트</h4>
				<table summary="공지사항 리스트" id="nt_list" border="1">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>

					<thead>
						<tr id="list_th">
							<th>카테고리</th>
							<th data-value="qt_number" class="order">글 번호</th>
							<th>회원아이디</th>
							<th>제 목</th>
							<th data-value="qt_regdate" class="order">작성일<c:choose>
									<c:when test="${ data.order_sc=='ASC'}">▲</c:when>
									<c:when test="${ data.order_sc=='DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose></th>
							<th>작성자</th>
							<th>첨부파일</th>
						</tr>
					</thead>

					<!-- 데이터 출력  -->
					<tbody>
						<c:choose>
							<c:when test="${not empty mainQuestionList }">
								<c:forEach var="question" items="${mainQuestionList }"
									varStatus="status">

									<tr id="list_td" class="tac" data-num="${question.qt_number }">
										<td>${question.qt_status }</td>
										<td>${question.qt_number }</td>
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