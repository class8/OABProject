<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항목록</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		// 검색 후 검색 대상과 검색 단어 출력 
		var word = "<c:out value='${data.keyword}'/>";

		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value = '${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() != 'nt_content') {
				if ($("#search").val() == 'nt_title') {
					value = "#list tr td.goDetail";
				} else if ($("#search").val() == 'nt_content') {
					value = "#list tr td.title";
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

		// 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정!
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value = '${data.pageSize}'/>");
		}

		// 검색 대상이 변경될 때마다 처리하는 이벤트 
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터를 조회 합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		// 검색 버튼 클릭 시 처리 이벤트 
		$("#searchData").click(function() {
			goPage(1);
		});
		/* $(".order").click(function() {
			var order_by = $(this).attr("data-value");
			console.log("선택값 : " + order_by);
			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC') {
				$("#order_sc").val('ASC');
			} else {
				$("#order_sc").val('DESC');
			}
			goPage(1);
		}); */

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

		// 한 페이지에 보여줄 레코드 수 가 변경될 때마다 처리하는 이벤트 
		$("#pageSize").change(function() {
			goPage(1);
		});

		// 글쓰기 버튼 클릭 시 처리 이벤트 
		$("#insertFormBtn").click(function() {
			location.href = "/admin/notice/writeForm";
		});

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 
		$(".goDetail").click(function() {
			var nt_number = $(this).parents("tr").attr("data-num");
			// 상세페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#nt_number").val(nt_number);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/notice/noticeDetail"
			});
			$("#detailForm").submit();
		});

	});

	// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}

		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/notice/noticeList"
		});
		$("#f_search").submit();
	}
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/notice.css" />
</head>
<body>
	<div class="main_content">

		<div class="contentTit">
			<h2>공 지 사 항</h2>
		</div>

		<!-- 상세페이지 이동을 위한 Form -->
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="nt_number" id="nt_number"> <input
				type="hidden" name="page" value="${data.page }" /> <input
				type="hidden" name="pageSize" value="${data.pageSize }" />
		</form>
		<!-- 공지사항 리스트 시작  -->
		<div id="noticeList" class="contentTB">
			<table summary="공지사항 리스트" id="nt_list">
				<colgroup>
					<col width="100px" />
					<col width="600px" />
					<col width="200px" />
					<col width="100px" />
				</colgroup>

				<thead>
					<tr id="list_th">
						<th>번호</th>
						<th>제 목</th>
						<!-- <th class="borcle">작성자</th> -->
						<th data-value="nt_regdate" class="order">작성일 <c:choose>
								<c:when test="${ data.order_sc=='ASC'}">▲</c:when>
								<c:when test="${ data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>조회수</th>
					</tr>
				</thead>

				<!-- 데이터 출력  -->
				<tbody>
					<c:choose>
						<c:when test="${not empty noticeList }">
							<c:forEach var="notice" items="${noticeList }" varStatus="status">

								<tr id="list_td" class="tac" data-num="${notice.nt_number }">
									<td class="goDetail tal">${notice.nt_number }</td>
									<td id="title" class="goDetail tal">${notice.nt_title }</td>
									<%-- <td class="goDetail tal">${notice.nt_writer }</td> --%>
									<td class="goDetail tal">${notice.nt_regdate}</td>
									<td class="goDetail tal">${notice.nt_readcnt}</td>
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

		<!-- 페이지 네비게이션  -->
		<div id="noticePage">
			<tag:paging page="${param.page }" total="${total }"
				list_size="${data.pageSize}" />
		</div>

		<!-- <div class="contentBtn">
			<input type="button" value="글 쓰 기" id="insertFormBtn">
		</div>
 -->

		<!-- 검색 기능 시작 -->
		<div class="noticeSearch">
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
						<td><select id="search" name="search">
								<option value="all" id="search_text">전체</option>
								<option value="nt_title" id="search_text">제목</option>
								<option value="nt_content" id="search_text">내용</option>
						</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
							<input type="button" id="searchData" value="검색" /></td>
					</tr>
				</table>
			</form>

			<div class="contentBtn">
				<input type="button" value="글 쓰 기" id="insertFormBtn">
			</div>

		</div>
	</div>
</body>
</html>