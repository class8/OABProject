﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/product.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/lightbox.css" />
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 검색후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");

			if ($("#search").val() != 'b_content') {
				// :contains()는 특정 텍스트를 포함한 요소 반환
				if ($("#search").val() == 'b_title') {
					value = "#list tr td.goDetail";
				} else if ($("#search").val() == 'pt_name') {
					value = "#list tr td.name";
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

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});

		$(".order").click(function() {
			var order_by = $(this).attr("data-value");
			console.log("선택값 : " + order_by);
			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC') {
				$("#order_sc").val('ASC');
			} else {
				$("#order_sc").val('DESC');
			}
			goPage(1);
		});

		// 한페이지에 보여줄 레코드 수가 변경될 때마다 처리 이벤터 
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {
			/* 
			var b_num = $(this).parents("tr").attr("data-num");
			$("#b_num").val(b_num);
			console.log("글번호 : " + b_num);
			//상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
			  "method" : "get",
			  "action" : "/product/productDetail.do"
			});
			$("#detailForm").submit(); */
		});
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실직적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/product/productList"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<div class="productTitle">
		<h3>상품소개</h3>
	</div>
	<%--================== 상세 페이지 이동을 위한 FORM ===================== --%>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="pt_number" id="pt_number"> <input
			type="hidden" name="page" value="${data.page}"> <input
			type="hidden" name="pageSize" value="${data.pageSize}">
	</form>
	<%--============================ 검색기능 시작 ============================== --%>
	<div id="productSearch">
		<form id="f_search" name="f_search">
			<!--    추가부분 -->
			<input type="hidden" id="page" name="page" value="${data.page }">
			<input type="hidden" id="order_by" name="order_by"
				value="${data.order_by}" /> <input type="hidden" id="order_sc"
				name="order_sc" value="${data.order_sc}" />
			<table summary="검색">
				<colgroup>
					<col width="70" />
					<col width="30" />
				</colgroup>
				<tr>
					<td id="btd1"><label>검색조건</label> <select id="search"
						name="search">
							<option value="pt_name">상품명</option>
					</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
						<input type="button" value="검색" id="searchData"></td>
				</tr>
			</table>
		</form>
	</div>
	<%--============================ 검색기능 종료 ============================== --%>
	<%--============================ 리스트 시작 ============================== --%>
	<div id="productList">
		<!-- 데이터 출력 -->
		<c:choose>
			<c:when test="${not empty productList}">
				<c:forEach var="product" items="${productList}" varStatus="status">
					<div class="product_article">
						<div class="product_images">
								<a data-lightbox="roadtrip" href="/uploadStorage/product/${product.pt_thumb}">
								<img class="product_thumbnail" src="/uploadStorage/product/${product.pt_thumb}">
								</a> 
								<a data-lightbox="roadtrip"	href="/uploadStorage/product/${product.pt_image1}">
								<img
								src="/uploadStorage/product/${product.pt_image1}"> 
								</a>
								<a data-lightbox="roadtrip"	href="/uploadStorage/product/${product.pt_image2}">
								<img
								src="/uploadStorage/product/${product.pt_image2}"> 
								</a>
								<a data-lightbox="roadtrip"	href="/uploadStorage/product/${product.pt_image3}">
								<img
								src="/uploadStorage/product/${product.pt_image3}">
								</a>
						</div>
						<div class="product_content">
							<p>${product.pt_name}</p>
							<p>${product.pt_price}원</p>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</div>
	<%-- ====================== 리스트 종료 ========================= --%>
	<!-- 추가 부분 -->
	<%-- ================= 페이지 네비게이션 시작 ==================== --%>
<%-- 	<div id="productPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div> --%>
	<%-- ================= 페이지 네비게이션 종료 ==================== --%>
</body>
</html>