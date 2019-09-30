<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pageSize").change(function() {
			goPage(1);
		});
	});
	function goPage(page) {
		$("#page").val(page);
		$("#repagemoveform").attr({
			"method" : "get",
			"action" : "/member/info/memberRentalInfo"
		});
		$("#repagemoveform").submit();
	}
</script>
<link type="text/css" rel="stylesheet"
	href="/resources/include/css/memberRentalInfo.css">
</head>
<body>
	<input type="hidden" id="rest_number" name="rest_number"
		value="${Reninfo.rest_number}" />
	<div id="rental">
		<p class="sub-header">내 대여 /반납리스트</p>
		<div id="link">
			<a class="style1" href="/member/info/memberUserInfo">이용 리스트</a> <a
				class="style2" href="/member/info/memberRentalInfo">대여/반납 리스트</a>
		</div>

		<form id="repagemoveform">
			<input type="hidden" id="page" name="page" value="${data.page}">
			<input type="hidden" id="pageSize" name="pageSize"
				value="${data.pageSize}">
		</form>
		<div class="rentaltable">
			<table class="rental">
				<thead>
					<tr>
						<th class="tac" data-value="rent_number">대여번호</th>
						<th class="tac" data-value="rest_status">이용상태</th>
						<th class="tac" data-value="rent_overtime">추가 시간</th>
						<th class="tac" data-value="rent_addcost">추가 비용</th>
						<th class="tac" data-value="rent_actrent">실제대여일시</th>
						<th class="tac" data-value="rent_expretrun">반납예정일시</th>
						<th class="tac" data-value="rent_actretrun">실제반납일시</th>
						<th class="tac" data-value="rent_status">대여/반납 상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty RentalInfo}">
							<c:forEach var="Reninfo" items="${RentalInfo}" varStatus="status">
								<tr class="tac" data-num="${Reninfo.rent_number}">
									<td>${Reninfo.rent_number}</td>
									<td>${Reninfo.rest_status}</td>
									<td>${Reninfo.rent_overtime}</td>
									<td>${Reninfo.rent_addcost}</td>
									<td>${Reninfo.rent_actrent}</td>
									<td>${Reninfo.rent_expretrun}</td>
									<td>${Reninfo.rent_actretrun}</td>
									<td>${Reninfo.rent_status}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<%-- ============= 페이지 네비게이션 시작 ============ --%>
			<div id="memberReInfoPaging">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>
		</div>
	</div>
</body>
</html>