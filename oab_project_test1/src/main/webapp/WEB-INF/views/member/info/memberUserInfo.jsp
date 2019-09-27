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
<!-- <script type="text/javascript"
   src="/resources/include/js/lectureList.js"></script> -->
<script type="text/javascript">
	$(function() {
		var rest_number = 0;
		var rest_status = "";
		$(".check").click(function() {
			var index = $(".check").index($(".check:checked")); //선택상품 인덱스값
			var test = $(".rest_status:eq(" + index + ")").text(); //선택상품의 상태값
			if (test != '예약취소' && test != '환불요청') {
				rest_number = $(this).parents("tr").attr("data-num");
				$("#rest_number").val(rest_number);
				//alert($("#rest_number").val());
			} else {
				$("#rest_number").val(-1);
			}
		});

		$(document).on(
				"click",
				"#refund",
				function() {
					if ($("#rest_number").val() != -2
							&& $("#rest_number").val() != -1) {
						if (confirm("체크하신 예약건을 취소/환불요청하시겠습니까?")) {
							$.ajax({
								url : "/member/UserInfoUpdate/" + rest_number,
								type : "put",
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "PUT"
								},
								data : JSON.stringify({
									rest_number : rest_number
								}),
								dataType : "text",
								success : function(result) {
									console.log("result:" + result);
									if (result == 'SUCCESS') {
										location.reload();
										alert("취소/환불신청을 완료 하였습니다.");
									}
								}
							});
						}
					} else if ($("#rest_number").val() == -1) {
						alert("선택하신 예약번호는 이미 취소/환불 요청중입니다.");
					} else if ($("#rest_number").val() == -2) {
						alert("취소/환불을 원하는 내역을 선택해주세요.");
					}
				});

		$("#pageSize").change(function() {
			goPage(1);
		});
	});
	function goPage(page) {
		$("#page").val(page);
		$("#pagemoveform").attr({
			"method" : "get",
			"action" : "/member/info/memberUserInfo"
		});
		$("#pagemoveform").submit();
	}
</script>
</head>
<body>
	<!-- <form id="test"> -->
	<input type="hidden" id="rest_number" name="rest_number" value="-2">
	<!-- 예약번호 저장 공간  -->
	<input type="hidden" id="rest_payoption" name="rest_payoption">
	<!-- 예약상태 저장 공간  -->
	<!-- </form> -->

	<!-- <div class="well">
      <form class="form-inline" id="f_search" name="f_search"> -->
	<form id="pagemoveform">
		<input type="hidden" id="page" name="page" value="${data.page}">
		<input type="hidden" id="pageSize" name="pageSize"
			value="${data.pageSize}">

	</form>

	<div id="listHeader">
		<p>내 이용 리스트</p>
		<button type="button" class="btntest" id="refund">취소/환불요청</button>
		<p>예약 목록(전체 예약 건:${total})</p>
		<a href="/member/info/memberUserInfo">이용 리스트</a> <a
			href="/member/info/memberRentalInfo">대여/반납 리스트</a>
	</div>

	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th class="tac" data-value="rest_number">예약번호</th>
					<th class="tac" data-value="pt_name">상품명</th>
					<th class="tac" data-value="rest_count">결제수량</th>
					<th class="tac" data-value="rest_payoption">결제 방법</th>
					<th class="tac" data-value="rest_total">금액</th>
					<th class="tac" data-value="rest_regdate">예약 등록일</th>
					<th class="tac" data-value="rest_status">예약 상태</th>

				</tr>
				<c:choose>
					<c:when test="${not empty UserInfo}">
						<c:set var="sum" value="0" />
						<c:forEach var="info" items="${UserInfo}" varStatus="status">
							<c:set var="i" value="${status.index}" />
							<c:set var="max" value="${count-1}" />
							<c:set var="pid" value="${info.rest_bnumber}" />
							<c:if test="${i>=max }">
								<c:set var="nid" value="0" />
							</c:if>
							<c:if test="${i<max}">
								<c:set var="nid" value="${UserInfo.get(i+1).rest_bnumber }" />
							</c:if>

							<tr class="tac" data-num="${info.rest_number}">
								<%-- <td>${status.index}</td>
								<td>pid${pid }</td>
								<td>nid${nid}</td>
								<td>size${data.pageSize }</td>
								<td>count${count}</td>
								<td>total${total}</td> --%>
								<td><input type="radio" name="check" class="check"></td>
								<td>${info.rest_bnumber}</td>
								<td>${info.pt_name}</td>
								<td>${info.rest_count}</td>
								<td>${info.rest_payoption}</td>
								<td><fmt:formatNumber value="${info.rest_total}"
										type="number" pattern="#,##0" />원</td>
								<td>${info.rest_regdate}</td>
								<td><p class="rest_status">${info.rest_status}</p></td>
								<td>${info.rent_status}</td>
								<c:set var="sum" value="${sum+info.rest_total }" />
							</tr>
							<c:if test="${pid != nid }">
								<tr>
									<td colspan="8" class="b">주문금액: ${sum}</td>
								</tr>
								<c:set var="sum" value="0" />
								<c:set var="pid" value="${nid}" />
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
		</table>
		<%-- ============= 페이지 네비게이션 시작 ============ --%>
		<div id="memberUserInfoPaging">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
	</div>

</body>
</html>