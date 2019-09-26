<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
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
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실직적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/product/productAddList"
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
			<%-- 			<input type="hidden" id="order_by" name="order_by"
				value="${data.order_by}" /> <input type="hidden" id="order_sc"
				name="order_sc" value="${data.order_sc}" /> --%>
			<table summary="검색">
				<colgroup>
					<col width="70" />
					<col width="30" />
				</colgroup>
				<tr>
					<td id="btd1"><label>검색조건</label> <select id="search"
						name="search">
							<option value="pt_name">상품명</option>
					</select> <input type="text" name="keyword" id="keyword"
						placeholder="검색어를 입력하세요" /> <input type="button" value="검색"
						id="searchData"></td>
				</tr>
			</table>
		</form>
	</div>
	<%--============================ 검색기능 종료 ============================== --%>
	<%--============================ 리스트 시작 ============================== --%>
	<div id="productList">
		<div>
			<input type="hidden" id="select_type" name="select_type" value="추가상품">
			<a href="/product/productSetList">세트상품</a> <a
				href="/product/productAddList">추가상품</a>
		</div>
		<!-- 데이터 출력 -->
		<c:choose>
			<c:when test="${not empty addList}">
				<c:forEach var="product" items="${addList}" varStatus="status">
					<div class="product_article">
						<div class="product_thumb">
							<a data-lightbox="roadtrip"
								href="/uploadStorage/thumb/${product.pt_thumb}"> <img
								class="product_thumbnail"
								src="/uploadStorage/thumb/${product.pt_thumb}">
							</a>
							<div class="product_images">
								<c:if
									test="${product.pt_image1 != null && product.pt_image1 != ''}">
									<a data-lightbox="roadtrip"
										href="/uploadStorage/image1/${product.pt_image1}"> <img
										src="/uploadStorage/image1/${product.pt_image1}">
									</a>
								</c:if>
								<c:if
									test="${product.pt_image2 != null && product.pt_image2 != ''}">
									<a data-lightbox="roadtrip"
										href="/uploadStorage/image2/${product.pt_image2}"> <img
										src="/uploadStorage/image2/${product.pt_image2}">
									</a>
								</c:if>
								<c:if
									test="${product.pt_image3 != null && product.pt_image3 != ''}">
									<a data-lightbox="roadtrip"
										href="/uploadStorage/image3/${product.pt_image3}"> <img
										src="/uploadStorage/image3/${product.pt_image3}">
									</a>
								</c:if>
							</div>
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
	<div id="productPaging">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>
	<%-- ================= 페이지 네비게이션 종료 ==================== --%>
</body>
</html>