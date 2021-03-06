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
<title>사용자 공지사항 글 목록</title>
<link href="/resources/include/css/clientNotice.css" rel="stylesheet">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		/* 제목 클릭시 상세페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var nt_number = $(this).parents("tr").attr("data-num");
			$("#nt_number").val(nt_number);
			console.log("글번호 : " + nt_number);

			//상세 페이지로 이동하기 위해 form 추가하기 (id : noticeDetailForm)
			$("#noticeDetailForm").attr({

				"method" : "get",
				"action" : "/notice/noticeDetail"

			});

			$("#noticeDetailForm").submit();

		});

		// 한페이지에 보여줄 레코드 수가 변경될 때마다 처리 이벤터 
		$("#pageSize").change(function() {
			goPage(1);
		});
	});
	//이거고쳐
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실직적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#notice_search").attr({
			"method" : "get",
			"action" : "/notice/noticeList"
		});
		$("#notice_search").submit();
	}
</script>

</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>공지사항</h3>
		</div>
		<%--============================ 상세 페이지 이동을 위한 FORM ============================== --%>

		<form name="noticeDetailForm" id="noticeDetailForm">
			<input type="hidden" name="nt_number" id="nt_number"> <input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">

		</form>



		<%--============================ 리스트 시작 ============================== --%>
		<div id="noticeList">

			<form id="notice_search" name="notice_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
			</form>
			<table summary="공지사항 리스트" id="noticeListTable">
				<colgroup>
					<col width="10%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th data-value="nt_number" class="order">글 번 호</th>
						<th>글 제 목</th>
						<th data-value="nt_regdate" class="order">작 성 일</th>
						<th class="borcle">작 성 자</th>
					</tr>
				</thead>

				<%--- 데이터를 출력합니다. --%>
				<tbody id="notice_datalist">

					<c:choose>
						<c:when test="${not empty noticeList }">

							<c:forEach var="notice" items="${noticeList}" varStatus="status">

								<tr class="tac" data-num="${notice.nt_number}">

									<td>${notice.nt_number}</td>
									<td class="goDetail tal" id="noticeTit">${notice.nt_title }</td>
									<td id="nt_regdate_1">${notice.nt_regdate }</td>
									<td class="writer">${notice.nt_writer }</td>
								</tr>
							</c:forEach>
						</c:when>

						<c:otherwise>

							<tr>

								<td colspan="5" class="tac">등록된 게시물이 없습니다. 관리자님 게시물을 등록해주세요</td>

							</tr>

						</c:otherwise>

					</c:choose>

				</tbody>

			</table>
		</div>
		<%-- ================= 페이지 네비게이션 시작 ==================== --%>
		<div id="noticePage">
			<tag:paging page="${param.page}" total="${total}" list_size="10"></tag:paging>
		</div>
		<%-- ================= 페이지 네비게이션 종료 ==================== --%>
	</div>

</body>
</html>