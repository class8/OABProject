<!-- 개발자 : 최대근 -->
<%@page import="com.oab.client.product.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/product/adminProductList.js"></script>
<script type="text/javascript">
	$(function() {

		/* 검색후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");

			if ($("#search").val() != 'all') {
				// :contains()는 특정 텍스트를 포함한 요소 반환
				if ($("#search").val() == 'pt_name') {
					value = "#list tr td.goDetail";
				}

				$(value + ":contains('" + word + "')").each(
						function() {
							var regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).text().replace(
											regex,
											"<span class='required'>" + word
													+ "</span>"));
						});
			}
		}
		// 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정 
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/product.css" />
</head>
<body>
	<div class="main_content">
		<div class="contentTit">
			<h2>상 품</h2>
			<input type="button" value="상품등록" id="productWrite">
		</div>

		<%--================== 상세 페이지 이동을 위한 FORM ===================== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="pt_number" id="pt_number"> <input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">
		</form>
		<%--============================ 리스트 시작 ============================== --%>
		<div id="adminProductList" class="contentTB">
			<table summary="게시판 리스트">
				<colgroup>
					<col width="6%" />
					<col width="9%" />
					<col width="12%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr id="list_th">
						<th>번호</th>
						<th>상품명</th>
						<th data-value="pt_type" class="order">분류 <c:choose>
								<c:when
									test="${data.order_by=='pt_type' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='pt_type' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>가격</th>
						<!-- <th>상세설명</th> -->
						<th>등록일자</th>
						<th>상품상태</th>
						<th>상품썸네일</th>
						<th>이미지1</th>
						<th>이미지2</th>
						<th>이미지3</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty adminProductList}">
							<c:forEach var="product" items="${adminProductList}"
								varStatus="status">
								<tr data-num="${product.pt_number}" id="list_th">
									<td>${status.count + (param.page-1) * data.pageSize}</td>
									<td class="goDetail tal">${product.pt_name}</td>
									<c:choose>
										<c:when
											test="${data.order_by=='pt_type' and data.order_sc=='ASC' }">
											<td class="goDetail tal">${product.pt_type}</td>
										</c:when>
										<c:when
											test="${data.order_by=='pt_type' and data.order_sc=='DESC' }">
											<td class="goDetail tal">${product.pt_type}</td>
										</c:when>
										<c:otherwise>
											<td class="goDetail tal">${product.pt_type}</td>
										</c:otherwise>
									</c:choose>
									<td class="goDetail tal">${product.pt_price}</td>
									<%-- <td class="goDetail tal">${product.pt_explain}</td> --%>
									<td class="goDetail tal">${product.pt_regdate}</td>
									<td class="goDetail tal">${product.pt_status}</td>
									<td class="goDetail tal">${product.pt_thumb}</td>
									<td class="goDetail tal">${product.pt_image1}</td>
									<td class="goDetail tal">${product.pt_image2}</td>
									<td class="goDetail tal">${product.pt_image3}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr id="list_th">
								<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ====================== 리스트 종료 ========================= --%>

		<!-- 추가 부분 -->
		<%-- ================= 페이지 네비게이션 시작 ==================== --%>
		<div id="productPaging">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>
		<%-- ================= 페이지 네비게이션 종료 ==================== --%>

		<%--============================ 검색기능 시작 ============================== --%>
		<div class="productSearch">
			<form id="f_search" name="f_search">
				<!--    추가부분 -->
				<input type="hidden" id="page" name="page" value="${data.page }">
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by}" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc}" />
				<table summary="검색" id="search_tbl">
					<tr id="search_deco">
						<td><select id="search" name="search">
								<option value="all">전체</option>
								<option value="pt_name">상품명</option>
						</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
							<input type="button" value="검색" id="searchData"></td>
					</tr>
				</table>
			</form>

		</div>
		<%--============================ 검색기능 종료 ============================== --%>
	</div>
</body>
</html>