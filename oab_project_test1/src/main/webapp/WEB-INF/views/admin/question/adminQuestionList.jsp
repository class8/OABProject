<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 목록</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
<script type="text/javascript">
	$(function() {

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 
		$(".goDetail").click(function() {
			var qt_number = $(this).parents("tr").attr("data-num");
			// 상세페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#qt_number").val(qt_number);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/question/questionDetail"
			});
			$("#detailForm").submit();
		});

	});
</script>
</head>
<body>
	<div class="main_content">

		<div class="contentTit">
			<h3>1:1 문의 리스트</h3>
		</div>

		<!-- 상세페이지 이동을 위한 Form -->
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="qt_number" id="qt_number">
		</form>

		<!-- 검색 기능 시작 -->
		<%-- <div class="questionSearch">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page }" />
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by }" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc }" />
				<table summary="검색" id="search_tbl">
					<colgroup>
						<col width="70%"></col>
						<col width="30%"></col>
					</colgroup>

					<tr id="search_deco">
						<td><label>검색조건</label><select id="search" name="search"><option
									value="all" id="search_text">전체</option>
								<option value="qt_title" id="search_text">제목</option>
								<option value="qt_content" id="search_text">내용</option></select> <input
							type="text" name="keyword" id="keyword" value="검색어를 입력하세요" /> <input
							type="button" value="검색" id="searchData" /></td>
						<td>한페이지에<select id="pageSize" name="pageSize">
								<option value="1">1줄</option>
								<option value="2">2줄</option>
								<option value="3">3줄</option>
								<option value="5">5줄</option>
								<option value="7">7줄</option>
								<option value="10">10줄</option>
						</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
 --%>
		<!-- 공지사항 리스트 시작  -->
		<div id="noticeList" class="contentTB">
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
						<th data-value="qt_number" class="order">글 번호</th>
						<th>회원아이디</th>
						<th>제 목</th>
						<th>카테고리</th>
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
						<c:when test="${not empty questionList }">
							<c:forEach var="adminQuestion" items="${questionList }"
								varStatus="status">

								<tr id="list_td" class="tac"
									data-num="${adminQuestion.qt_number }">
									<td>${adminQuestion.qt_number }</td>
									<td>${adminQuestion.mt_id }</td>
									<td class="goDetail tal">${adminQuestion.qt_title }</td>
									<td>${adminQuestion.qt_status }</td>
									<td>${adminQuestion.qt_regdate }</td>
									<td>${adminQuestion.qt_writer }</td>
									<td>${adminQuestion.qt_file }</td>
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
</html>