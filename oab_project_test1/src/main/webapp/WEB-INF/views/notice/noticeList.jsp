<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항 글 목록</title>
<link href="/resources/include/css/reset.css" rel="stylesheet">
<link href="/resources/include/css/contentLayout.css" rel="stylesheet">
<link href="/resources/include/css/header.css" rel="stylesheet">
<link href="/resources/include/css/footer.css" rel="stylesheet">
<link href="/resources/include/css/clientNotice.css" rel="stylesheet">

</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>공지사항</h3>
			<hr>
		</div>

		<%--================== 상세 페이지 이동을 위한 FORM ===================== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="b_num" id="b_num"> <input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">
		</form>
		<%--============================ 리스트 시작 ============================== --%>
		<div id="noticeList">
			<table summary="공지사항 리스트" id="noticeListTable">
				<colgroup>
					<col width="10%" />
					<col width="62%" />
					<col width="15%" />
					<col width="13%" />
				</colgroup>
				<thead>
					<tr>
						<th data-value="b_num" class="order">글번호 <c:choose>
								<c:when
									test="${data.order_by=='nt_number' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='nt_number' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>글제목</th>
						<th data-value="nt_regdate" class="order">작성일 <c:choose>
								<c:when
									test="${data.order_by=='nt_regdate' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='nt_regdate' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th class="nt_writer">작성자</th>
					</tr>
				</thead>
				<tbody id="list">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="board" items="${noticeList}" varStatus="status">
								<tr class="tac" data-num="${notice.nt_number}">
									<!-- 수정 -->
									<td>${count - status.index}</td>
									<td class="goDetail tal">${notice.nt_title}</td>
									<td>${notice.nt_regdate}</td>
									<td class="name">${notice.nt_writer}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 공지사항 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ====================== 리스트 종료 ========================= --%>

		<%-- ================= 페이지 네비게이션 시작 ==================== --%>
		<div id="noticePage">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
		<%-- ================= 페이지 네비게이션 종료 ==================== --%>
	</div>

</body>
</html>