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
<title>포토후기 리스트</title>
<link href="/resources/include/css/reviewList.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 버튼을 클릭하면 작성페이지로 이동 */
		$("#reviewInsertBtn").click(function() {
			location.href = "/review/reviewWrite";
		});

	})
</script>
</head>
<body>

	<div class="contentsTit">
		<h3>포토후기</h3>
		<button id="reviewInsertBtn">포토후기 작성</button>
		<hr>
	</div>
	<%--================== 상세 페이지 이동을 위한 FORM ===================== --%>
	<form name="reivewDetailForm" id="reivewDetailForm">
		<input type="hidden" name="page" value="${data.page}"> <input
			type="hidden" name="pageSize" value="${data.pageSize}">
	</form>
	<%--============================ 리스트 시작 ============================== --%>
	<div id="reviewList">
		<div id="selectList1">
			<input type="hidden" id="order_by" name="order_by"
				value="revt_regdate"> <a
				href="/review/reviewList?order_by=revt_regdate&page=1">최신순 |</a> <a
				href="/review/reviewList?order_by=revt_readcnt&page=1">조회순 </a>
		</div>
		<!-- 데이터 출력 -->
		<c:choose>
			<c:when test="${not empty reviewList}">
				<c:forEach var="review" items="${reviewList}" varStatus="status">
					<article class="review_article">
						<div class="review_tumbnail">
							<a href="reviewDetail?revt_number=${review.revt_number}"> <img
								class="review_thumbnail"
								src="/uploadStorage/revt_thumbnail/${review.revt_thumbnail}">
							</a>
							<div class="review_content">
								<p id="revt_title">${review.revt_title}</p>
							</div>
						</div>
					</article>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td id="tdTag" colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="reviewPaging">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>
</body>
</html>