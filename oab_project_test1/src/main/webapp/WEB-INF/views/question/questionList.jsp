<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 목록을 불러오는 곳</title>
<link href="/resources/include/css/question.css" rel="stylesheet">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		/* 제목 클릭시 상세페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var qt_number = $(this).parents("tr").attr("data-num");
			$("#qt_number").val(qt_number);
			console.log("글번호 : " + qt_number);

			//상세 페이지로 이동하기 위해 form 추가하기 (id : noticeDetailForm)
			$("#questionDetailForm").attr({

				"method" : "get",
				"action" : "/question/questionDetail"

			});

			$("#questionDetailForm").submit();

		});

		// 한페이지에 보여줄 레코드 수가 변경될 때마다 처리 이벤터 
		$("#pageSize").change(function() {
			goPage(1);
		});
	});
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실직적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#question_search").attr({
			"method" : "get",
			"action" : "/question/questionList"
		});
		$("#notice_search").submit();
	}
</script>

</head>
<body>
	<c:if test="${login.mt_id != null }">
		<label>${login.mt_id} 님이 작성하신 문의게시글 목록입니다. </label>
		<div class="contentContainer">
			<div class="contentsTit">
				<h3>내 문의 리스트</h3>
				<br>
				<hr>
			</div>
			<%--============================ 상세 페이지 이동을 위한 FORM ============================== --%>

			<form name="questionDetailForm" id="questionDetailForm">
				<input type="hidden" name="qt_number" id="qt_number"> <input
					type="hidden" name="page" value="${data.page}"> <input
					type="hidden" name="pageSize" value="${data.pageSize}">
			</form>



			<%--============================ 리스트 시작 ============================== --%>
			<div id="questionList">
				<form id="question_search" name="question_search">
					<input type="hidden" id="page" name="page" value="${data.page}">
				</form>
				<table summary="문의사항 리스트" id="questionListTable">
					<colgroup>
						<col width="10%" />
						<col width="60%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th data-value="qt_number" class="order">글 번 호</th>
							<th data-value="qt_title" class="order">글 제 목</th>
							<th data-value="qt_regdate" class="order">작 성 일</th>
							<th class="qt_writer">작 성 자</th>
							<th class="qt_status">답변 여부</th>
						</tr>
					</thead>

					<%--- 데이터를 출력합니다. --%>
					<tbody id="question_datalist">
						<c:choose>
							<c:when test="${not empty questionList }">

								<c:forEach var="question" items="${questionList}"
									varStatus="status">

									<tr class="tac" data-num="${question.qt_number}">

										<td>${question.qt_number}</td>
										<td class="goDetail tal" id="qt_title">${question.qt_title }</td>
										<td id="nt_regdate_1">${question.qt_regdate }</td>
										<td class="writer">${question.qt_writer }</td>
										<td class="qt_status">${question.qt_status }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="tac"> 등록된 문의 사항이 존재하지 않습니다. <br>
										<a href="/question/questionWrite" display="none">문의 사항 등록하기</a> : 감사합니다 !
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<%-- ================= 페이지 네비게이션 시작 ==================== --%>
			<div id="questionPage">
				<tag:paging page="${param.page}" total="${total}" list_size="10"></tag:paging>
			</div>
			<%-- ================= 페이지 네비게이션 종료 ==================== --%>
		</div>
	</c:if>
	<c:if test="${empty login.mt_id}">
		<!-- 회원이 아닐 경우에! 로그인 하세요.  -->
		<div class="contentsTit">
			<h3>1:1 문의 리스트</h3>
			<hr>
		</div>
		<div id="pleaseLogin">
			<p>
				로그인 한 회원만 이용이 가능합니다<br> <a href="/login/login"><span><strong
						id="textlogin">로그인</strong>을 클릭하시면 이동합니다.</span></a>
			</p>
		</div>
	</c:if>

</body>
</html>