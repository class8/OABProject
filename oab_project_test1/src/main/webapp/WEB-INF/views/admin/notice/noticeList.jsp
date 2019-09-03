<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항목록</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resource/admin/include/js/common.js"></script>
<script type="text/javascript">
	// 글쓰기 버튼 클릭 시 처리 이벤트 
	$(function() {

		$("#insertFormBtn").click(function() {
			location.href = "/admin/notice/writeForm";
		});

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 
		$(".goDetail").click(function() {
			var nt_number = $(this).parents("tr").attr("data-num");
			$("#nt_number").val(nt_number);
			// 상세페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/notice/noticeDetail"
			});
			$("#detailForm").submit();
		});

	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
</head>
<body>
	<div class="main_content">

		<div class="contentTit">
			<h3>공지사항 리스트</h3>
		</div>

		<!-- 상세페이지 이동을 위한 Form -->
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="nt_number" id="nt_nubmer">
		</form>

		<!-- 공지사항 리스트 시작  -->
		<div id="noticeList">
			<table summary="공지사항 리스트" id="n_list" border="1">
				<colgroup>
					<col width="80px" />
					<col width="400px" />
					<col width="220px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>

				<thead>
					<tr>
						<th class="order">글 번호</th>
						<th>글 제목</th>
						<th class="borcle">작성자</th>
						<th class="order" data-value="nt_regdate">작성일</th>
						<th>조회수</th>
					</tr>
				</thead>

				<!-- 데이터 출력  -->
				<tbody>
					<c:choose>
						<c:when test="${not empty noticeList }">
							<c:forEach var="notice" items="${noticeList }" varStatus="status">

								<tr class="tac" data-num="${notice.nt_number }">
									<td>${notice.nt_number }</td>
									<td class="goDetail tal">${notice.nt_title }</td>
									<td class="writer">${notice.nt_writer }</td>
									<td>${notice.nt_regdate}</td>
									<td>${notice.nt_readcnt}</td>
								</tr>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>

					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="contentBtn">
			<input type="button" value="공지사항 등록" id="insertFormBtn">
		</div>

	</div>
</body>
</html>