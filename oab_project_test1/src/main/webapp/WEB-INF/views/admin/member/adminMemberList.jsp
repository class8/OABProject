<%@page import="com.oab.client.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/admin/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/admin/include/js/member/adminMemberList.js"></script>
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

		//수정중
		$(".adminMemberDisabledUpdate").click(function() {
			var mt_number = $(this).parents("tr").attr("data-num");
			$("#mt_number").val(mt_number);

			if ($(".disabled").val() == 'able') {
				if (confirm("탈퇴처리 하시겠습니까?")) {
					$("#mt_disabled").val('disabled');
					$("#f_test").attr({
						"method" : "post",
						"action" : "/admin/member/adminMemberDisabledUpdate"
					});
					$("#f_test").submit();
				}
			} else if ($(".disabled").val() == 'disabled') {
				if (confirm("탈퇴처리를 취소 하시겠습니까?")) {
					$("#mt_disabled").val('able');
					$("#f_test").attr({
						"method" : "post",
						"action" : "/admin/member/adminMemberDisabledUpdate"
					});
					$("#f_test").submit();
				}
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/admin/include/css/member.css" />
</head>
<body>
	<div class="main_content">
		<div class="contentTit">
			<h2>회원 정보</h2>
		</div>
		<form id="f_test" name="f_test">
			<input type="hidden" id="mt_number" name="mt_number" /> <input
				type="hidden" id="mt_disabled" name="mt_disabled" />
		</form>


		<!-- 멤버리스트 시작 -->
		<div id="memberList" class="contentTB">
			<table>
				<colgroup>
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr id="list_th">
						<th data-value="mt_number" class="order">번호 <c:choose>
								<c:when
									test="${data.order_by=='mt_number' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='mt_number' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th data-value="mt_gender" class="order">성별 <c:choose>
								<c:when
									test="${data.order_by=='mt_gender' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='mt_gender' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						<th>이메일</th>
						<th>연락처</th>
						<th data-value="mt_regdate" class="order">등록일 <c:choose>
								<c:when
									test="${data.order_by=='mt_regdate' and data.order_sc=='ASC'}">▲</c:when>
								<c:when
									test="${data.order_by=='mt_regdate' and data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>비활성화유무</th>
					</tr>
				</thead>
				<tbody id="list">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty adminMemberList}">
							<c:forEach var="memberList" items="${adminMemberList}"
								varStatus="status">
								<tr class="tac" data-num="${memberList.mt_number}" id="list_th">
									<c:choose>
										<c:when
											test="${data.order_by=='mt_number' and data.order_sc=='ASC' }">
											<td>${status.count + (param.page-1) * data.pageSize}</td>
										</c:when>
										<c:when
											test="${data.order_by=='mt_number' and data.order_sc=='DESC' }">
											<td>${count - status.index}</td>
										</c:when>
										<c:otherwise>
											<td>${status.count + (param.page-1) * data.pageSize}</td>
										</c:otherwise>
									</c:choose>
									<td>${memberList.mt_id}</td>
									<td>${memberList.mt_name}</td>
									<td>${memberList.mt_birth}</td>
									<td>${memberList.mt_gender}</td>
									<td>${memberList.mt_email}</td>
									<td>${memberList.mt_phone}</td>
									<td>${memberList.mt_regdate}</td>
									<td>${memberList.mt_disabled}<input type="hidden"
										class="disabled" value="${memberList.mt_disabled}"> <c:if
											test="${memberList.mt_disabled == 'able'}">
											<input type="button" class="adminMemberDisabledUpdate"
												name="adminMemberDisabledUpdate" value="비활성화">
										</c:if> <c:if test="${memberList.mt_disabled == 'disabled'}">
											<input type="button" class="adminMemberDisabledUpdate"
												name="adminMemberDisabledUpdate" value="활성화">
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr id="list_td">
								<td colspan="9" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ====================== 리스트 종료 ========================= --%>

		<%-- ================= 페이지 네비게이션 시작 ==================== --%>
		<div id="adminMemberPage">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>
		<%-- ================= 페이지 네비게이션 종료 ==================== --%>

		<!-- 검색 기능 시작 -->
		<div class="memberSearch">
			<form id="f_search" name="f_search">
				<!--    추가부분 -->
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by}" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc}" />
				<table summary="검색" id="search_tbl">
					<colgroup>
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="150px" />
						<col width="100px" />
						<col width="100px" />
						<col width="150px" />
					</colgroup>
					<tr id="search_deco">
						<td><select id="search" name="search">
								<option value="all">전체</option>
								<option value="mt_name">이름</option>
								<option value="mt_id">아이디</option>
								<option value="mt_disabled">비활성화</option>
						</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
							<input type="button" value="검색" id="searchData"></td>
					</tr>
				</table>
			</form>
		</div>


	</div>
</body>
</html>